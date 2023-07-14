//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class LoginResult {
  /// Returns a new [LoginResult] instance.
  LoginResult({
    this.jwtToken,
    this.refreshToken,
    this.authInfo,
  });

  String? jwtToken;

  String? refreshToken;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AuthToken? authInfo;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LoginResult &&
     other.jwtToken == jwtToken &&
     other.refreshToken == refreshToken &&
     other.authInfo == authInfo;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (jwtToken == null ? 0 : jwtToken!.hashCode) +
    (refreshToken == null ? 0 : refreshToken!.hashCode) +
    (authInfo == null ? 0 : authInfo!.hashCode);

  @override
  String toString() => 'LoginResult[jwtToken=$jwtToken, refreshToken=$refreshToken, authInfo=$authInfo]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.jwtToken != null) {
      json[r'jwtToken'] = this.jwtToken;
    } else {
      json[r'jwtToken'] = null;
    }
    if (this.refreshToken != null) {
      json[r'refreshToken'] = this.refreshToken;
    } else {
      json[r'refreshToken'] = null;
    }
    if (this.authInfo != null) {
      json[r'authInfo'] = this.authInfo;
    } else {
      json[r'authInfo'] = null;
    }
    return json;
  }

  /// Returns a new [LoginResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LoginResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "LoginResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "LoginResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LoginResult(
        jwtToken: mapValueOfType<String>(json, r'jwtToken'),
        refreshToken: mapValueOfType<String>(json, r'refreshToken'),
        authInfo: AuthToken.fromJson(json[r'authInfo']),
      );
    }
    return null;
  }

  static List<LoginResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LoginResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LoginResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LoginResult> mapFromJson(dynamic json) {
    final map = <String, LoginResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LoginResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LoginResult-objects as value to a dart map
  static Map<String, List<LoginResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LoginResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LoginResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

