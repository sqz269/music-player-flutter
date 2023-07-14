//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class TrackReadDto1 {
  /// Returns a new [TrackReadDto1] instance.
  TrackReadDto1({
    this.id,
    this.name,
    this.index,
    this.disc,
    this.duration,
    this.genre = const [],
    this.staff = const [],
    this.arrangement = const [],
    this.vocalist = const [],
    this.lyricist = const [],
    this.original = const [],
    this.originalNonTouhou,
    this.album,
    this.trackFile,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  LocalizedField1? name;

  int? index;

  int? disc;

  String? duration;

  List<String>? genre;

  List<String>? staff;

  List<String>? arrangement;

  List<String>? vocalist;

  List<String>? lyricist;

  List<OriginalTrackReadDto>? original;

  bool? originalNonTouhou;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AlbumReadDto1? album;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AssetReadDto? trackFile;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TrackReadDto1 &&
     other.id == id &&
     other.name == name &&
     other.index == index &&
     other.disc == disc &&
     other.duration == duration &&
     other.genre == genre &&
     other.staff == staff &&
     other.arrangement == arrangement &&
     other.vocalist == vocalist &&
     other.lyricist == lyricist &&
     other.original == original &&
     other.originalNonTouhou == originalNonTouhou &&
     other.album == album &&
     other.trackFile == trackFile;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (index == null ? 0 : index!.hashCode) +
    (disc == null ? 0 : disc!.hashCode) +
    (duration == null ? 0 : duration!.hashCode) +
    (genre == null ? 0 : genre!.hashCode) +
    (staff == null ? 0 : staff!.hashCode) +
    (arrangement == null ? 0 : arrangement!.hashCode) +
    (vocalist == null ? 0 : vocalist!.hashCode) +
    (lyricist == null ? 0 : lyricist!.hashCode) +
    (original == null ? 0 : original!.hashCode) +
    (originalNonTouhou == null ? 0 : originalNonTouhou!.hashCode) +
    (album == null ? 0 : album!.hashCode) +
    (trackFile == null ? 0 : trackFile!.hashCode);

  @override
  String toString() => 'TrackReadDto1[id=$id, name=$name, index=$index, disc=$disc, duration=$duration, genre=$genre, staff=$staff, arrangement=$arrangement, vocalist=$vocalist, lyricist=$lyricist, original=$original, originalNonTouhou=$originalNonTouhou, album=$album, trackFile=$trackFile]';

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
    if (this.index != null) {
      json[r'index'] = this.index;
    } else {
      json[r'index'] = null;
    }
    if (this.disc != null) {
      json[r'disc'] = this.disc;
    } else {
      json[r'disc'] = null;
    }
    if (this.duration != null) {
      json[r'duration'] = this.duration;
    } else {
      json[r'duration'] = null;
    }
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
    if (this.album != null) {
      json[r'album'] = this.album;
    } else {
      json[r'album'] = null;
    }
    if (this.trackFile != null) {
      json[r'trackFile'] = this.trackFile;
    } else {
      json[r'trackFile'] = null;
    }
    return json;
  }

  /// Returns a new [TrackReadDto1] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TrackReadDto1? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TrackReadDto1[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TrackReadDto1[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TrackReadDto1(
        id: mapValueOfType<String>(json, r'id'),
        name: LocalizedField1.fromJson(json[r'name']),
        index: mapValueOfType<int>(json, r'index'),
        disc: mapValueOfType<int>(json, r'disc'),
        duration: mapValueOfType<String>(json, r'duration'),
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
        original: OriginalTrackReadDto.listFromJson(json[r'original']),
        originalNonTouhou: mapValueOfType<bool>(json, r'originalNonTouhou'),
        album: AlbumReadDto1.fromJson(json[r'album']),
        trackFile: AssetReadDto.fromJson(json[r'trackFile']),
      );
    }
    return null;
  }

  static List<TrackReadDto1> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TrackReadDto1>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TrackReadDto1.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TrackReadDto1> mapFromJson(dynamic json) {
    final map = <String, TrackReadDto1>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TrackReadDto1.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TrackReadDto1-objects as value to a dart map
  static Map<String, List<TrackReadDto1>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TrackReadDto1>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TrackReadDto1.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

