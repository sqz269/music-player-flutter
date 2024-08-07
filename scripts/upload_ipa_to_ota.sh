# Assert to check if the required environment variables are set
if [ -z "$OTA_DISTRIBUTION_BASE_URL" ]; then
    echo "Please set the OTA_DISTRIBUTION_BASE_URL environment variable"
    exit 1
fi

if [ -z "$OTA_DISTRIBUTION_APP_NAME" ]; then
    echo "Please set the OTA_DISTRIBUTION_APP_NAME environment variable"
    exit 1
fi

# Find the IPA file
IPA_FILE=$(ls $PWD/build/IPA/*.ipa)
echo "IPA_FILE: $IPA_FILE"

# Assert to check if the IPA file exists
if [ ! -f "$IPA_FILE" ]; then
    echo "IPA file not found at $IPA_FILE"
    exit 1
fi

APP_BUNDLE_ID=$(cat ios/Runner.xcodeproj/project.pbxproj | grep -o "PRODUCT_BUNDLE_IDENTIFIER = [^;]*" | head -1 | cut -d ' ' -f 3)
echo "APP_BUNDLE_ID: $APP_BUNDLE_ID"

APP_BUNDLE_VERSION=$(cat ios/Runner/Info.plist | grep -o "CFBundleShortVersionString</key>[^<]*" | head -1 | cut -d '>' -f 2)
echo "APP_BUNDLE_VERSION: $APP_BUNDLE_VERSION"

# IF we can't extract the bundle version, default to 1.0.0
if [ -z "$APP_BUNDLE_VERSION" ]; then
    APP_BUNDLE_VERSION="1.0.0"
fi

API_URL="$OTA_DISTRIBUTION_BASE_URL/ipa/create?appName=$OTA_DISTRIBUTION_APP_NAME&bundleIdentifier=$APP_BUNDLE_ID&bundleVersion=$APP_BUNDLE_VERSION"

echo "Uploading the IPA file to OTA distribution server..."

RESPONSE=$(curl --location --silent \
  --request POST $API_URL \
  --form "file=@$IPA_FILE")

# Parse response to json
IS_ERROR=$(echo $RESPONSE | jq -r '.error')

if [ "$error" = "true" ]; then
    echo "Error: $(echo $RESPONSE | jq -r '.message')"
    exit 1
fi

# Grab the Direct OTA install url
OTA_INSTALL_URL=$(echo $RESPONSE | jq -r '.directOtaUrl')

echo "OTA Install URL: $OTA_INSTALL_URL"

# Create a QR code for the OTA install URL
qrencode -m 2 -t utf8 <<< $OTA_INSTALL_URL

echo "OTA distribution server upload successful!"
