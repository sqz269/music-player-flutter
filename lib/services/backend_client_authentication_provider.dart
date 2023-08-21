import 'package:get/get.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:BackendClientApi/api.dart';
import 'package:tlmc_player_flutter/services/oidc_authenticator_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

class BackendClientAuthenticationProvider extends Authentication {
  var isAuthenticated = false.obs;
  Rx<UserInfo?> userInfo = Rx<UserInfo?>(null);

  late OidcAuthenticatorService oidcAuthService;
  late SharedPreferences pref;

  BackendClientAuthenticationProvider(
      {required String ssoDiscoveryEndpoint, required String clientId}) {
    oidcAuthService = OidcAuthenticatorService(
        oidcDiscoveryEndpoint: ssoDiscoveryEndpoint, clientId: clientId);
  }

  Future<void> init() async {
    pref = await SharedPreferences.getInstance();
    await oidcAuthService.init();

    if (pref.containsKey("auth_offline_token")) {
      print("Found offline token");
      var offlineToken = pref.getString("auth_offline_token")!;
      await oidcAuthService.restoreSession(offlineToken);
      userInfo.value = await oidcAuthService.credential!.getUserInfo();
      isAuthenticated.value = true;
    } else {
      print("No offline token found");
    }
  }

  Future<Credential?> authenticate() async {
    var credential = await oidcAuthService.authenticate();
    if (credential != null) {
      pref.setString("auth_offline_token", credential.refreshToken!);
      userInfo.value = await credential.getUserInfo();
      isAuthenticated.value = true;
    }
    return credential;
  }

  @override
  Future<void> applyToParams(
      List<QueryParam> queryParams, Map<String, String> headerParams) async {
    if (isAuthenticated.value) {
      var token = await oidcAuthService.credential!.getTokenResponse();
      queryParams
          .add(QueryParam("Authorization", "Bearer ${token.accessToken}"));
    }
  }
}
