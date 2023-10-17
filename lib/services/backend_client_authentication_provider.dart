import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:BackendClientApi/api.dart';
import 'package:tlmc_player_flutter/services/oidc_authenticator_service.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tlmc_player_flutter/states/root_context_provider.dart';

class BackendClientAuthenticationProvider extends Authentication {
  var initialized = false.obs;
  var isAuthenticated = false.obs;
  var readyAndAuthenticated = false.obs;
  Rx<UserInfo?> userInfo = Rx<UserInfo?>(null);

  late OidcAuthenticatorService oidcAuthService;
  late SharedPreferences pref;

  BackendClientAuthenticationProvider(
      {required String ssoDiscoveryEndpoint, required String clientId}) {
    oidcAuthService = OidcAuthenticatorService(
        oidcDiscoveryEndpoint: ssoDiscoveryEndpoint, clientId: clientId);
  }

  Future<void> init() async {
    print("Initializing auth provider");
    pref = await SharedPreferences.getInstance();
    try {
      await oidcAuthService.init();
    } catch (e) {
      ScaffoldMessenger.of(RootContextProvider.to.rootContext!)
          .showSnackBar(SnackBar(
        content: Text("Error initializing authentication provider: $e"),
      ));
      print("Error initializing auth provider: $e");
      return Future.error(e);
    }

    if (pref.containsKey("auth_offline_token")) {
      print("Found offline token");
      var offlineToken = pref.getString("auth_offline_token")!;
      await oidcAuthService.restoreSession(offlineToken);
      userInfo.value = await oidcAuthService.credential!.getUserInfo();
      isAuthenticated.value = true;
      readyAndAuthenticated.value = true;
    } else {
      print("No offline token found");
    }
    initialized.value = true;
    print("Initialized auth provider");
    print("Is authenticated: ${isAuthenticated.value}");
  }

  Future<Credential?> authenticate() async {
    var credential = await oidcAuthService.authenticate();
    if (credential != null) {
      pref.setString("auth_offline_token", credential.refreshToken!);
      userInfo.value = await credential.getUserInfo();
      isAuthenticated.value = true;
      readyAndAuthenticated.value = true;
    }
    return credential;
  }

  @override
  Future<void> applyToParams(
      List<QueryParam> queryParams, Map<String, String> headerParams) async {
    if (isAuthenticated.value) {
      var token = await oidcAuthService.credential!.getTokenResponse();
      headerParams["Authorization"] = "Bearer ${token.accessToken}";
    }
  }
}
