import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';

class OidcAuthenticatorService {
  static const scope = ["openid", "profile", "email", "offline_access"];

  final String oidcDiscoveryEndpoint;
  final String clientId;
  Issuer? issuer;
  Client? client;
  Authenticator? authenticator;

  Credential? credential;

  OidcAuthenticatorService(
      {required this.oidcDiscoveryEndpoint, required this.clientId});

  Future<void> init() async {
    issuer = await Issuer.discover(Uri.parse(oidcDiscoveryEndpoint));
    client = Client(issuer!, clientId);

    authenticator = Authenticator(
      client!,
      scopes: scope,
      port: 4000,
      urlLancher: (url) async {
        var uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          throw Exception("Could not launch $url");
        }
      },
    );
  }

  Future<Credential?> restoreSession(String offlineToken) async {
    var credential = client?.createCredential(refreshToken: offlineToken);
    this.credential = credential;
    return credential;
  }

  Future<Credential?> authenticate() async {
    credential = await authenticator!.authorize();
    closeInAppWebView();
    this.credential = credential;
    return credential;
  }

  Future<void> refresh() async {
    await credential?.getTokenResponse(true);
  }
}
