import 'package:get/get.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:tlmc_player_app/services/impl/logging_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tlmc_player_app/models/oidc_configuration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OidcAuthenticationService extends GetxController {
  static const scope = ["openid", "profile", "email", "offline_access"];
  final _logger =
      Get.find<LoggingService>().getLogger("OidcAuthenticationService");

  final OidcConfiguration oidcConfiguration;

  RxBool isAuthenticated = false.obs;

  Issuer? issuer;
  Client? client;
  Authenticator? authenticator;
  Credential? credential;

  OidcAuthenticationService({required this.oidcConfiguration});

  @override
  void onInit() {
    super.onInit();

    initialize();
  }

  Future<void> initialize() async {
    _logger.i("Initializing OIDC authentication service");

    try {
      _logger.i("Discovering OIDC issuer");
      issuer = await Issuer.discover(
        Uri.parse(oidcConfiguration.oidcDiscoveryEndpointUrl),
      );
      client = Client(issuer!, oidcConfiguration.clientId);
    } catch (e, s) {
      _logger.e("Failed to discover OIDC issuer", error: e, stackTrace: s);
      throw e;
    }

    authenticator = Authenticator(
      client!,
      scopes: scope,
      port: 8901,
      urlLancher: (url) async {
        var uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          _logger.e("Failed to launch URL: $url. Please check your browser.");
          throw 'Could not launch $url';
        }
      },
    );

    await restoreSessionIfAvailable();
  }

  Future<void> restoreSessionIfAvailable() async {
    var pref = await SharedPreferences.getInstance();
    if (pref.containsKey("auth_offlineToken")) {
      var offlineToken = pref.getString("auth_offlineToken");
      if (offlineToken != null) {
        await restoreFromOfflineToken(offlineToken);
      }
    }
  }

  Future<void> restoreFromOfflineToken(String offlineToken) async {
    credential = client?.createCredential(refreshToken: offlineToken);
  }

  Future<void> authenticate() async {
    credential = await authenticator!.authorize();
    closeInAppWebView();
  }

  Future<TokenResponse> getToken() async {
    if (credential == null) {
      throw 'Not authenticated';
    }
    var token = await credential!.getTokenResponse();
    return token;
  }
}
