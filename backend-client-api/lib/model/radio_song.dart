//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class RadioSong {
  /// Returns a new [RadioSong] instance.
  RadioSong({
    this.trackId,
    this.track,
    this.duration,
    this.startTime,
    this.elapsedTime,
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
  TrackReadDto1? track;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  TimeSpan? duration;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? startTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  TimeSpan? elapsedTime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RadioSong &&
     other.trackId == trackId &&
     other.track == track &&
     other.duration == duration &&
     other.startTime == startTime &&
     other.elapsedTime == elapsedTime;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (trackId == null ? 0 : trackId!.hashCode) +
    (track == null ? 0 : track!.hashCode) +
    (duration == null ? 0 : duration!.hashCode) +
    (startTime == null ? 0 : startTime!.hashCode) +
    (elapsedTime == null ? 0 : elapsedTime!.hashCode);

  @override
  String toString() => 'RadioSong[trackId=$trackId, track=$track, duration=$duration, startTime=$startTime, elapsedTime=$elapsedTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.trackId != null) {
      json[r'trackId'] = this.trackId;
    } else {
      json[r'trackId'] = null;
    }
    if (this.track != null) {
      json[r'track'] = this.track;
    } else {
      json[r'track'] = null;
    }
    if (this.duration != null) {
      json[r'duration'] = this.duration;
    } else {
      json[r'duration'] = null;
    }
    if (this.startTime != null) {
      json[r'startTime'] = this.startTime!.toUtc().toIso8601String();
    } else {
      json[r'startTime'] = null;
    }
    if (this.elapsedTime != null) {
      json[r'elapsedTime'] = this.elapsedTime;
    } else {
      json[r'elapsedTime'] = null;
    }
    return json;
  }

  /// Returns a new [RadioSong] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RadioSong? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RadioSong[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RadioSong[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RadioSong(
        trackId: mapValueOfType<String>(json, r'trackId'),
        track: TrackReadDto1.fromJson(json[r'track']),
        duration: TimeSpan.fromJson(json[r'duration']),
        startTime: mapDateTime(json, r'startTime', ''),
        elapsedTime: TimeSpan.fromJson(json[r'elapsedTime']),
      );
    }
    return null;
  }

  static List<RadioSong> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RadioSong>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RadioSong.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RadioSong> mapFromJson(dynamic json) {
    final map = <String, RadioSong>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RadioSong.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RadioSong-objects as value to a dart map
  static Map<String, List<RadioSong>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RadioSong>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RadioSong.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

