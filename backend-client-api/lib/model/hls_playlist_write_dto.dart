//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class HlsPlaylistWriteDto {
  /// Returns a new [HlsPlaylistWriteDto] instance.
  HlsPlaylistWriteDto({
    this.id,
    this.type,
    this.bitrate,
    this.hlsPlaylistPath,
    this.trackId,
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
  HlsPlaylistType? type;

  int? bitrate;

  String? hlsPlaylistPath;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? trackId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is HlsPlaylistWriteDto &&
     other.id == id &&
     other.type == type &&
     other.bitrate == bitrate &&
     other.hlsPlaylistPath == hlsPlaylistPath &&
     other.trackId == trackId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (bitrate == null ? 0 : bitrate!.hashCode) +
    (hlsPlaylistPath == null ? 0 : hlsPlaylistPath!.hashCode) +
    (trackId == null ? 0 : trackId!.hashCode);

  @override
  String toString() => 'HlsPlaylistWriteDto[id=$id, type=$type, bitrate=$bitrate, hlsPlaylistPath=$hlsPlaylistPath, trackId=$trackId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.bitrate != null) {
      json[r'bitrate'] = this.bitrate;
    } else {
      json[r'bitrate'] = null;
    }
    if (this.hlsPlaylistPath != null) {
      json[r'hlsPlaylistPath'] = this.hlsPlaylistPath;
    } else {
      json[r'hlsPlaylistPath'] = null;
    }
    if (this.trackId != null) {
      json[r'trackId'] = this.trackId;
    } else {
      json[r'trackId'] = null;
    }
    return json;
  }

  /// Returns a new [HlsPlaylistWriteDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static HlsPlaylistWriteDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "HlsPlaylistWriteDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "HlsPlaylistWriteDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return HlsPlaylistWriteDto(
        id: mapValueOfType<String>(json, r'id'),
        type: HlsPlaylistType.fromJson(json[r'type']),
        bitrate: mapValueOfType<int>(json, r'bitrate'),
        hlsPlaylistPath: mapValueOfType<String>(json, r'hlsPlaylistPath'),
        trackId: mapValueOfType<String>(json, r'trackId'),
      );
    }
    return null;
  }

  static List<HlsPlaylistWriteDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <HlsPlaylistWriteDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = HlsPlaylistWriteDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, HlsPlaylistWriteDto> mapFromJson(dynamic json) {
    final map = <String, HlsPlaylistWriteDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = HlsPlaylistWriteDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of HlsPlaylistWriteDto-objects as value to a dart map
  static Map<String, List<HlsPlaylistWriteDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<HlsPlaylistWriteDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = HlsPlaylistWriteDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

