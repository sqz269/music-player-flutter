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
    _logger.i(
        "Initializing OIDC authentication service: ${oidcConfiguration.toString()}");

    try {
      _logger.i("Discovering OIDC issuer");
      issuer = await Issuer.discover(
        Uri.parse(oidcConfiguration.oidcRealmUrl),
      );
      client = Client(issuer!, oidcConfiguration.clientId);
      _logger.i("Discovered OIDC issuer: ${issuer!.metadata.issuer}");
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

    _logger.i("OIDC authentication service initialized");

    await restoreSessionIfAvailable();
  }

  Future<void> restoreSessionIfAvailable() async {
    _logger.i("Attempting to restore OIDC session from offline token");
    var pref = await SharedPreferences.getInstance();
    if (pref.containsKey("auth_offlineToken")) {
      _logger.i("Restoring OIDC session from offline token");
      var offlineToken = pref.getString("auth_offlineToken");
      if (offlineToken != null) {
        await restoreFromOfflineToken(offlineToken);

        try {
          var token = await getToken();
          _logger.i("OIDC session restored successfully");
          isAuthenticated.value = true;
        } catch (e, s) {
          _logger.e("Failed to restore OIDC session", error: e, stackTrace: s);
        }
      }
    } else {
      _logger.i("No offline token found");
    }
  }

  Future<void> restoreFromOfflineToken(String offlineToken) async {
    credential = client?.createCredential(refreshToken: offlineToken);
  }

  Future<void> authenticate() async {
    _logger.i("Authenticating with OIDC provider");
    credential = await authenticator!.authorize();
    isAuthenticated.value = true;
    _logger.i("OIDC authentication successful");

    var pref = await SharedPreferences.getInstance();
    await pref.setString("auth_offlineToken", credential!.refreshToken!);
    _logger.i("Stored offline token in shared preferences");

    try {
      closeInAppWebView();
    } catch (e, s) {
      _logger.e("Failed to close in-app web view", error: e, stackTrace: s);
    }
  }

  Future<void> logout() async {
    if (isAuthenticated.value == false) {
      _logger.w("Logout called when not authenticated");
      return;
    }

    _logger.i("Logging out from OIDC provider");
    var pref = await SharedPreferences.getInstance();
    await pref.remove("auth_offlineToken");
    _logger.i("Removed offline token from shared preferences");

    if (credential != null) {
      try {
        await credential!.revoke();
        _logger.i("Revoked OIDC token");
      } catch (e, s) {
        _logger.e("Failed to revoke OIDC token", error: e, stackTrace: s);
      }
    }

    isAuthenticated.value = false;
    _logger.i("OIDC logout successful");
  }

  Future<TokenResponse> getToken() async {
    if (credential == null) {
      throw 'Not authenticated';
    }
    var token = await credential!.getTokenResponse();
    return token;
  }
}
