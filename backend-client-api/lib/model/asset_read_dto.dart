//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class AssetReadDto {
  /// Returns a new [AssetReadDto] instance.
  AssetReadDto({
    this.assetId,
    this.assetName,
    this.assetMime,
    this.large,
    this.url,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? assetId;

  String? assetName;

  String? assetMime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? large;

  String? url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AssetReadDto &&
     other.assetId == assetId &&
     other.assetName == assetName &&
     other.assetMime == assetMime &&
     other.large == large &&
     other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (assetId == null ? 0 : assetId!.hashCode) +
    (assetName == null ? 0 : assetName!.hashCode) +
    (assetMime == null ? 0 : assetMime!.hashCode) +
    (large == null ? 0 : large!.hashCode) +
    (url == null ? 0 : url!.hashCode);

  @override
  String toString() => 'AssetReadDto[assetId=$assetId, assetName=$assetName, assetMime=$assetMime, large=$large, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.assetId != null) {
      json[r'assetId'] = this.assetId;
    } else {
      json[r'assetId'] = null;
    }
    if (this.assetName != null) {
      json[r'assetName'] = this.assetName;
    } else {
      json[r'assetName'] = null;
    }
    if (this.assetMime != null) {
      json[r'assetMime'] = this.assetMime;
    } else {
      json[r'assetMime'] = null;
    }
    if (this.large != null) {
      json[r'large'] = this.large;
    } else {
      json[r'large'] = null;
    }
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    return json;
  }

  /// Returns a new [AssetReadDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AssetReadDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AssetReadDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AssetReadDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AssetReadDto(
        assetId: mapValueOfType<String>(json, r'assetId'),
        assetName: mapValueOfType<String>(json, r'assetName'),
        assetMime: mapValueOfType<String>(json, r'assetMime'),
        large: mapValueOfType<bool>(json, r'large'),
        url: mapValueOfType<String>(json, r'url'),
      );
    }
    return null;
  }

  static List<AssetReadDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AssetReadDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AssetReadDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AssetReadDto> mapFromJson(dynamic json) {
    final map = <String, AssetReadDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AssetReadDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AssetReadDto-objects as value to a dart map
  static Map<String, List<AssetReadDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AssetReadDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AssetReadDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

