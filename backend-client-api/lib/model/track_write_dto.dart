//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class TrackWriteDto {
  /// Returns a new [TrackWriteDto] instance.
  TrackWriteDto({
    required this.name,
    required this.index,
    required this.disc,
    this.genre = const [],
    this.staff = const [],
    this.arrangement = const [],
    this.vocalist = const [],
    this.lyricist = const [],
    this.original = const [],
    this.originalNonTouhou,
    this.trackFile,
  });

  LocalizedField name;

  int index;

  int disc;

  List<String>? genre;

  List<String>? staff;

  List<String>? arrangement;

  List<String>? vocalist;

  List<String>? lyricist;

  List<String>? original;

  bool? originalNonTouhou;

  String? trackFile;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TrackWriteDto &&
     other.name == name &&
     other.index == index &&
     other.disc == disc &&
     other.genre == genre &&
     other.staff == staff &&
     other.arrangement == arrangement &&
     other.vocalist == vocalist &&
     other.lyricist == lyricist &&
     other.original == original &&
     other.originalNonTouhou == originalNonTouhou &&
     other.trackFile == trackFile;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (index.hashCode) +
    (disc.hashCode) +
    (genre == null ? 0 : genre!.hashCode) +
    (staff == null ? 0 : staff!.hashCode) +
    (arrangement == null ? 0 : arrangement!.hashCode) +
    (vocalist == null ? 0 : vocalist!.hashCode) +
    (lyricist == null ? 0 : lyricist!.hashCode) +
    (original == null ? 0 : original!.hashCode) +
    (originalNonTouhou == null ? 0 : originalNonTouhou!.hashCode) +
    (trackFile == null ? 0 : trackFile!.hashCode);

  @override
  String toString() => 'TrackWriteDto[name=$name, index=$index, disc=$disc, genre=$genre, staff=$staff, arrangement=$arrangement, vocalist=$vocalist, lyricist=$lyricist, original=$original, originalNonTouhou=$originalNonTouhou, trackFile=$trackFile]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'index'] = this.index;
      json[r'disc'] = this.disc;
    if (this.genre != null) {
      json[r'genre'] = this.genre;
    } else {
      json[r'genre'] = null;
    }
    if (this.staff != null) {
      json[r'staff'] = this.staff;
    } else {
      json[r'staff'] = null;
    }
    if (this.arrangement != null) {
      json[r'arrangement'] = this.arrangement;
    } else {
      json[r'arrangement'] = null;
    }
    if (this.vocalist != null) {
      json[r'vocalist'] = this.vocalist;
    } else {
      json[r'vocalist'] = null;
    }
    if (this.lyricist != null) {
      json[r'lyricist'] = this.lyricist;
    } else {
      json[r'lyricist'] = null;
    }
    if (this.original != null) {
      json[r'original'] = this.original;
    } else {
      json[r'original'] = null;
    }
    if (this.originalNonTouhou != null) {
      json[r'originalNonTouhou'] = this.originalNonTouhou;
    } else {
      json[r'originalNonTouhou'] = null;
    }
    if (this.trackFile != null) {
      json[r'trackFile'] = this.trackFile;
    } else {
      json[r'trackFile'] = null;
    }
    return json;
  }

  /// Returns a new [TrackWriteDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TrackWriteDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TrackWriteDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TrackWriteDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TrackWriteDto(
        name: LocalizedField.fromJson(json[r'name'])!,
        index: mapValueOfType<int>(json, r'index')!,
        disc: mapValueOfType<int>(json, r'disc')!,
        genre: json[r'genre'] is List
            ? (json[r'genre'] as List).cast<String>()
            : const [],
        staff: json[r'staff'] is List
            ? (json[r'staff'] as List).cast<String>()
            : const [],
        arrangement: json[r'arrangement'] is List
            ? (json[r'arrangement'] as List).cast<String>()
            : const [],
        vocalist: json[r'vocalist'] is List
            ? (json[r'vocalist'] as List).cast<String>()
            : const [],
        lyricist: json[r'lyricist'] is List
            ? (json[r'lyricist'] as List).cast<String>()
            : const [],
        original: json[r'original'] is List
            ? (json[r'original'] as List).cast<String>()
            : const [],
        originalNonTouhou: mapValueOfType<bool>(json, r'originalNonTouhou'),
        trackFile: mapValueOfType<String>(json, r'trackFile'),
      );
    }
    return null;
  }

  static List<TrackWriteDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TrackWriteDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TrackWriteDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TrackWriteDto> mapFromJson(dynamic json) {
    final map = <String, TrackWriteDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TrackWriteDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TrackWriteDto-objects as value to a dart map
  static Map<String, List<TrackWriteDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TrackWriteDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TrackWriteDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'index',
    'disc',
  };
}

