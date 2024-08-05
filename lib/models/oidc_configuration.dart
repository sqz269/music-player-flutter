class OidcConfiguration {
  final String oidcRealmUrl;
  final String clientId;

  OidcConfiguration({
    required this.oidcRealmUrl,
    required this.clientId,
  });

  @override
  String toString() {
    return 'OidcConfiguration{oidcRealmUrl: $oidcRealmUrl, clientId: $clientId}';
  }
}
