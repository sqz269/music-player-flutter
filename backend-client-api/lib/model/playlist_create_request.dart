//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class PlaylistCreateRequest {
  /// Returns a new [PlaylistCreateRequest] instance.
  PlaylistCreateRequest({
    this.name,
    this.visibility,
  });

  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PlaylistVisibility? visibility;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlaylistCreateRequest &&
     other.name == name &&
     other.visibility == visibility;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode) +
    (visibility == null ? 0 : visibility!.hashCode);

  @override
  String toString() => 'PlaylistCreateRequest[name=$name, visibility=$visibility]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.visibility != null) {
      json[r'visibility'] = this.visibility;
    } else {
      json[r'visibility'] = null;
    }
    return json;
  }

  /// Returns a new [PlaylistCreateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PlaylistCreateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PlaylistCreateRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PlaylistCreateRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PlaylistCreateRequest(
        name: mapValueOfType<String>(json, r'name'),
        visibility: PlaylistVisibility.fromJson(json[r'visibility']),
      );
    }
    return null;
  }

  static List<PlaylistCreateRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PlaylistCreateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PlaylistCreateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PlaylistCreateRequest> mapFromJson(dynamic json) {
    final map = <String, PlaylistCreateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PlaylistCreateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PlaylistCreateRequest-objects as value to a dart map
  static Map<String, List<PlaylistCreateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PlaylistCreateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PlaylistCreateRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}
