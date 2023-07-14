//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class JwtKeyResponse {
  /// Returns a new [JwtKeyResponse] instance.
  JwtKeyResponse({
    this.publicKey,
  });

  String? publicKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JwtKeyResponse &&
     other.publicKey == publicKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (publicKey == null ? 0 : publicKey!.hashCode);

  @override
  String toString() => 'JwtKeyResponse[publicKey=$publicKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.publicKey != null) {
      json[r'publicKey'] = this.publicKey;
    } else {
      json[r'publicKey'] = null;
    }
    return json;
  }

  /// Returns a new [JwtKeyResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JwtKeyResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "JwtKeyResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "JwtKeyResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return JwtKeyResponse(
        publicKey: mapValueOfType<String>(json, r'publicKey'),
      );
    }
    return null;
  }

  static List<JwtKeyResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JwtKeyResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JwtKeyResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JwtKeyResponse> mapFromJson(dynamic json) {
    final map = <String, JwtKeyResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JwtKeyResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JwtKeyResponse-objects as value to a dart map
  static Map<String, List<JwtKeyResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JwtKeyResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JwtKeyResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

