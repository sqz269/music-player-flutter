//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class PlaylistItemReadDto {
  /// Returns a new [PlaylistItemReadDto] instance.
  PlaylistItemReadDto({
    this.trackId,
    this.index,
    this.timesPlayed,
    this.dateAdded,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? trackId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? index;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? timesPlayed;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? dateAdded;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlaylistItemReadDto &&
     other.trackId == trackId &&
     other.index == index &&
     other.timesPlayed == timesPlayed &&
     other.dateAdded == dateAdded;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (trackId == null ? 0 : trackId!.hashCode) +
    (index == null ? 0 : index!.hashCode) +
    (timesPlayed == null ? 0 : timesPlayed!.hashCode) +
    (dateAdded == null ? 0 : dateAdded!.hashCode);

  @override
  String toString() => 'PlaylistItemReadDto[trackId=$trackId, index=$index, timesPlayed=$timesPlayed, dateAdded=$dateAdded]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.trackId != null) {
      json[r'trackId'] = this.trackId;
    } else {
      json[r'trackId'] = null;
    }
    if (this.index != null) {
      json[r'index'] = this.index;
    } else {
      json[r'index'] = null;
    }
    if (this.timesPlayed != null) {
      json[r'timesPlayed'] = this.timesPlayed;
    } else {
      json[r'timesPlayed'] = null;
    }
    if (this.dateAdded != null) {
      json[r'dateAdded'] = this.dateAdded!.toUtc().toIso8601String();
    } else {
      json[r'dateAdded'] = null;
    }
    return json;
  }

  /// Returns a new [PlaylistItemReadDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PlaylistItemReadDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PlaylistItemReadDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PlaylistItemReadDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PlaylistItemReadDto(
        trackId: mapValueOfType<String>(json, r'trackId'),
        index: mapValueOfType<int>(json, r'index'),
        timesPlayed: mapValueOfType<int>(json, r'timesPlayed'),
        dateAdded: mapDateTime(json, r'dateAdded', ''),
      );
    }
    return null;
  }

  static List<PlaylistItemReadDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PlaylistItemReadDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PlaylistItemReadDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PlaylistItemReadDto> mapFromJson(dynamic json) {
    final map = <String, PlaylistItemReadDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PlaylistItemReadDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PlaylistItemReadDto-objects as value to a dart map
  static Map<String, List<PlaylistItemReadDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PlaylistItemReadDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PlaylistItemReadDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

