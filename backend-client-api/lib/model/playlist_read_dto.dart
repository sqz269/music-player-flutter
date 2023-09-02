//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class PlaylistReadDto {
  /// Returns a new [PlaylistReadDto] instance.
  PlaylistReadDto({
    this.id,
    this.name,
    this.userId,
    this.username,
    this.visibility,
    this.type,
    this.lastModified,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? userId;

  String? username;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PlaylistVisibility? visibility;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PlaylistType? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastModified;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlaylistReadDto &&
     other.id == id &&
     other.name == name &&
     other.userId == userId &&
     other.username == username &&
     other.visibility == visibility &&
     other.type == type &&
     other.lastModified == lastModified;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (username == null ? 0 : username!.hashCode) +
    (visibility == null ? 0 : visibility!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (lastModified == null ? 0 : lastModified!.hashCode);

  @override
  String toString() => 'PlaylistReadDto[id=$id, name=$name, userId=$userId, username=$username, visibility=$visibility, type=$type, lastModified=$lastModified]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.userId != null) {
      json[r'userId'] = this.userId;
    } else {
      json[r'userId'] = null;
    }
    if (this.username != null) {
      json[r'username'] = this.username;
    } else {
      json[r'username'] = null;
    }
    if (this.visibility != null) {
      json[r'visibility'] = this.visibility;
    } else {
      json[r'visibility'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.lastModified != null) {
      json[r'lastModified'] = this.lastModified!.toUtc().toIso8601String();
    } else {
      json[r'lastModified'] = null;
    }
    return json;
  }

  /// Returns a new [PlaylistReadDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PlaylistReadDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PlaylistReadDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PlaylistReadDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PlaylistReadDto(
        id: mapValueOfType<String>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        userId: mapValueOfType<String>(json, r'userId'),
        username: mapValueOfType<String>(json, r'username'),
        visibility: PlaylistVisibility.fromJson(json[r'visibility']),
        type: PlaylistType.fromJson(json[r'type']),
        lastModified: mapDateTime(json, r'lastModified', ''),
      );
    }
    return null;
  }

  static List<PlaylistReadDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PlaylistReadDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PlaylistReadDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PlaylistReadDto> mapFromJson(dynamic json) {
    final map = <String, PlaylistReadDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PlaylistReadDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PlaylistReadDto-objects as value to a dart map
  static Map<String, List<PlaylistReadDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PlaylistReadDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PlaylistReadDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

