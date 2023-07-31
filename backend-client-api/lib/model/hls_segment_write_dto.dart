//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class HlsSegmentWriteDto {
  /// Returns a new [HlsSegmentWriteDto] instance.
  HlsSegmentWriteDto({
    this.id,
    this.index,
    this.name,
    this.hlsSegmentPath,
    this.hlsPlaylistId,
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
  int? index;

  String? name;

  String? hlsSegmentPath;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hlsPlaylistId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is HlsSegmentWriteDto &&
     other.id == id &&
     other.index == index &&
     other.name == name &&
     other.hlsSegmentPath == hlsSegmentPath &&
     other.hlsPlaylistId == hlsPlaylistId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (index == null ? 0 : index!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (hlsSegmentPath == null ? 0 : hlsSegmentPath!.hashCode) +
    (hlsPlaylistId == null ? 0 : hlsPlaylistId!.hashCode);

  @override
  String toString() => 'HlsSegmentWriteDto[id=$id, index=$index, name=$name, hlsSegmentPath=$hlsSegmentPath, hlsPlaylistId=$hlsPlaylistId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.index != null) {
      json[r'index'] = this.index;
    } else {
      json[r'index'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.hlsSegmentPath != null) {
      json[r'hlsSegmentPath'] = this.hlsSegmentPath;
    } else {
      json[r'hlsSegmentPath'] = null;
    }
    if (this.hlsPlaylistId != null) {
      json[r'hlsPlaylistId'] = this.hlsPlaylistId;
    } else {
      json[r'hlsPlaylistId'] = null;
    }
    return json;
  }

  /// Returns a new [HlsSegmentWriteDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static HlsSegmentWriteDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "HlsSegmentWriteDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "HlsSegmentWriteDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return HlsSegmentWriteDto(
        id: mapValueOfType<String>(json, r'id'),
        index: mapValueOfType<int>(json, r'index'),
        name: mapValueOfType<String>(json, r'name'),
        hlsSegmentPath: mapValueOfType<String>(json, r'hlsSegmentPath'),
        hlsPlaylistId: mapValueOfType<String>(json, r'hlsPlaylistId'),
      );
    }
    return null;
  }

  static List<HlsSegmentWriteDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <HlsSegmentWriteDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = HlsSegmentWriteDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, HlsSegmentWriteDto> mapFromJson(dynamic json) {
    final map = <String, HlsSegmentWriteDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = HlsSegmentWriteDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of HlsSegmentWriteDto-objects as value to a dart map
  static Map<String, List<HlsSegmentWriteDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<HlsSegmentWriteDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = HlsSegmentWriteDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

