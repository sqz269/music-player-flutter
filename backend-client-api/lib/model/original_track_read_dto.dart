//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class OriginalTrackReadDto {
  /// Returns a new [OriginalTrackReadDto] instance.
  OriginalTrackReadDto({
    this.id,
    this.title,
    this.album,
  });

  String? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  LocalizedField1? title;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  OriginalAlbumReadDto? album;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OriginalTrackReadDto &&
     other.id == id &&
     other.title == title &&
     other.album == album;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (album == null ? 0 : album!.hashCode);

  @override
  String toString() => 'OriginalTrackReadDto[id=$id, title=$title, album=$album]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.album != null) {
      json[r'album'] = this.album;
    } else {
      json[r'album'] = null;
    }
    return json;
  }

  /// Returns a new [OriginalTrackReadDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OriginalTrackReadDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OriginalTrackReadDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OriginalTrackReadDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OriginalTrackReadDto(
        id: mapValueOfType<String>(json, r'id'),
        title: LocalizedField1.fromJson(json[r'title']),
        album: OriginalAlbumReadDto.fromJson(json[r'album']),
      );
    }
    return null;
  }

  static List<OriginalTrackReadDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OriginalTrackReadDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OriginalTrackReadDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OriginalTrackReadDto> mapFromJson(dynamic json) {
    final map = <String, OriginalTrackReadDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OriginalTrackReadDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OriginalTrackReadDto-objects as value to a dart map
  static Map<String, List<OriginalTrackReadDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OriginalTrackReadDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OriginalTrackReadDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

