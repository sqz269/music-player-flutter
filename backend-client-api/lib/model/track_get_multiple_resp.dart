//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class TrackGetMultipleResp {
  /// Returns a new [TrackGetMultipleResp] instance.
  TrackGetMultipleResp({
    this.tracks = const [],
    this.notFound = const [],
  });

  List<TrackReadDto>? tracks;

  List<String>? notFound;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TrackGetMultipleResp &&
     other.tracks == tracks &&
     other.notFound == notFound;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (tracks == null ? 0 : tracks!.hashCode) +
    (notFound == null ? 0 : notFound!.hashCode);

  @override
  String toString() => 'TrackGetMultipleResp[tracks=$tracks, notFound=$notFound]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.tracks != null) {
      json[r'tracks'] = this.tracks;
    } else {
      json[r'tracks'] = null;
    }
    if (this.notFound != null) {
      json[r'notFound'] = this.notFound;
    } else {
      json[r'notFound'] = null;
    }
    return json;
  }

  /// Returns a new [TrackGetMultipleResp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TrackGetMultipleResp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TrackGetMultipleResp[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TrackGetMultipleResp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TrackGetMultipleResp(
        tracks: TrackReadDto.listFromJson(json[r'tracks']),
        notFound: json[r'notFound'] is List
            ? (json[r'notFound'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<TrackGetMultipleResp> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TrackGetMultipleResp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TrackGetMultipleResp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TrackGetMultipleResp> mapFromJson(dynamic json) {
    final map = <String, TrackGetMultipleResp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TrackGetMultipleResp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TrackGetMultipleResp-objects as value to a dart map
  static Map<String, List<TrackGetMultipleResp>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TrackGetMultipleResp>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TrackGetMultipleResp.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

