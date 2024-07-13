CERTIFICATE_PATH=$RUNNER_TEMP/build_certificate.p12
PP_PATH=$RUNNER_TEMP/build_pp.mobileprovision
KEYCHAIN_PATH=$RUNNER_TEMP/app-signing.keychain-db

# import certificate and provisioning profile from secrets
echo -n "$DEVELOPER_CERTIFICATE_BASE64" | base64 --decode -o $CERTIFICATE_PATH
echo -n "$PROVISIONING_PROFILE_BASE64" | base64 --decode -o $PP_PATH

# Printout the sha256 hash of the certificate and provisioning profile
echo "[Debug] Developer Certificate SHA256 hash:"
shasum -a 256 $CERTIFICATE_PATH
echo "[Debug] Provisioning Profile SHA256 hash:"
shasum -a 256 $PP_PATH

# create temporary keychain
security create-keychain -p "$KEYCHAIN_PASSWORD" $KEYCHAIN_PATH
security set-keychain-settings -lut 21600 $KEYCHAIN_PATH
security unlock-keychain -p "$KEYCHAIN_PASSWORD" $KEYCHAIN_PATH

# import certificate to keychain
security import $CERTIFICATE_PATH -P "$P12_PASSWORD" -A -t cert -f pkcs12 -k $KEYCHAIN_PATH
security set-key-partition-list -S apple-tool:,apple: -k "$KEYCHAIN_PASSWORD" $KEYCHAIN_PATH
security list-keychain -d user -s $DEVELOPER_CERTIFICATE_PASSWORD

# apply provisioning profile
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp $PP_PATH ~/Library/MobileDevice/Provisioning\ Profiles