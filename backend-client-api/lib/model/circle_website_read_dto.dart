//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class CircleWebsiteReadDto {
  /// Returns a new [CircleWebsiteReadDto] instance.
  CircleWebsiteReadDto({
    this.url,
    this.invalid,
  });

  String? url;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? invalid;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CircleWebsiteReadDto &&
     other.url == url &&
     other.invalid == invalid;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (url == null ? 0 : url!.hashCode) +
    (invalid == null ? 0 : invalid!.hashCode);

  @override
  String toString() => 'CircleWebsiteReadDto[url=$url, invalid=$invalid]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    if (this.invalid != null) {
      json[r'invalid'] = this.invalid;
    } else {
      json[r'invalid'] = null;
    }
    return json;
  }

  /// Returns a new [CircleWebsiteReadDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CircleWebsiteReadDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CircleWebsiteReadDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CircleWebsiteReadDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CircleWebsiteReadDto(
        url: mapValueOfType<String>(json, r'url'),
        invalid: mapValueOfType<bool>(json, r'invalid'),
      );
    }
    return null;
  }

  static List<CircleWebsiteReadDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CircleWebsiteReadDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CircleWebsiteReadDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CircleWebsiteReadDto> mapFromJson(dynamic json) {
    final map = <String, CircleWebsiteReadDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CircleWebsiteReadDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CircleWebsiteReadDto-objects as value to a dart map
  static Map<String, List<CircleWebsiteReadDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CircleWebsiteReadDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CircleWebsiteReadDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

