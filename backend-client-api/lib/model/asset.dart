//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class Asset {
  /// Returns a new [Asset] instance.
  Asset({
    required this.assetId,
    required this.assetName,
    required this.assetPath,
    this.assetMime,
    this.size,
  });

  String assetId;

  String assetName;

  String assetPath;

  String? assetMime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? size;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Asset &&
     other.assetId == assetId &&
     other.assetName == assetName &&
     other.assetPath == assetPath &&
     other.assetMime == assetMime &&
     other.size == size;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (assetId.hashCode) +
    (assetName.hashCode) +
    (assetPath.hashCode) +
    (assetMime == null ? 0 : assetMime!.hashCode) +
    (size == null ? 0 : size!.hashCode);

  @override
  String toString() => 'Asset[assetId=$assetId, assetName=$assetName, assetPath=$assetPath, assetMime=$assetMime, size=$size]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'assetId'] = this.assetId;
      json[r'assetName'] = this.assetName;
      json[r'assetPath'] = this.assetPath;
    if (this.assetMime != null) {
      json[r'assetMime'] = this.assetMime;
    } else {
      json[r'assetMime'] = null;
    }
    if (this.size != null) {
      json[r'size'] = this.size;
    } else {
      json[r'size'] = null;
    }
    return json;
  }

  /// Returns a new [Asset] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Asset? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Asset[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Asset[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Asset(
        assetId: mapValueOfType<String>(json, r'assetId')!,
        assetName: mapValueOfType<String>(json, r'assetName')!,
        assetPath: mapValueOfType<String>(json, r'assetPath')!,
        assetMime: mapValueOfType<String>(json, r'assetMime'),
        size: mapValueOfType<int>(json, r'size'),
      );
    }
    return null;
  }

  static List<Asset> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Asset>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Asset.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Asset> mapFromJson(dynamic json) {
    final map = <String, Asset>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Asset.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Asset-objects as value to a dart map
  static Map<String, List<Asset>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Asset>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Asset.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'assetId',
    'assetName',
    'assetPath',
  };
}

