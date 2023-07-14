//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class AuthToken {
  /// Returns a new [AuthToken] instance.
  AuthToken({
    this.iss,
    this.iat,
    this.exp,
    this.user,
    this.userId,
    this.roles = const [],
  });

  String? iss;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? iat;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? exp;

  String? user;

  String? userId;

  List<String>? roles;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuthToken &&
     other.iss == iss &&
     other.iat == iat &&
     other.exp == exp &&
     other.user == user &&
     other.userId == userId &&
     other.roles == roles;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (iss == null ? 0 : iss!.hashCode) +
    (iat == null ? 0 : iat!.hashCode) +
    (exp == null ? 0 : exp!.hashCode) +
    (user == null ? 0 : user!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (roles == null ? 0 : roles!.hashCode);

  @override
  String toString() => 'AuthToken[iss=$iss, iat=$iat, exp=$exp, user=$user, userId=$userId, roles=$roles]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.iss != null) {
      json[r'iss'] = this.iss;
    } else {
      json[r'iss'] = null;
    }
    if (this.iat != null) {
      json[r'iat'] = this.iat;
    } else {
      json[r'iat'] = null;
    }
    if (this.exp != null) {
      json[r'exp'] = this.exp;
    } else {
      json[r'exp'] = null;
    }
    if (this.user != null) {
      json[r'user'] = this.user;
    } else {
      json[r'user'] = null;
    }
    if (this.userId != null) {
      json[r'user_id'] = this.userId;
    } else {
      json[r'user_id'] = null;
    }
    if (this.roles != null) {
      json[r'roles'] = this.roles;
    } else {
      json[r'roles'] = null;
    }
    return json;
  }

  /// Returns a new [AuthToken] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AuthToken? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AuthToken[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AuthToken[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AuthToken(
        iss: mapValueOfType<String>(json, r'iss'),
        iat: mapValueOfType<int>(json, r'iat'),
        exp: mapValueOfType<int>(json, r'exp'),
        user: mapValueOfType<String>(json, r'user'),
        userId: mapValueOfType<String>(json, r'user_id'),
        roles: json[r'roles'] is List
            ? (json[r'roles'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<AuthToken> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuthToken>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuthToken.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AuthToken> mapFromJson(dynamic json) {
    final map = <String, AuthToken>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthToken.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AuthToken-objects as value to a dart map
  static Map<String, List<AuthToken>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AuthToken>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AuthToken.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

