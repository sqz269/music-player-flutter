class OidcConfiguration {
  final String oidcDiscoveryEndpointUrl;
  final String clientId;

  OidcConfiguration({
    required this.oidcDiscoveryEndpointUrl,
    required this.clientId,
  });
}
