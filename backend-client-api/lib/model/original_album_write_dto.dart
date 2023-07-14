//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class OriginalAlbumWriteDto {
  /// Returns a new [OriginalAlbumWriteDto] instance.
  OriginalAlbumWriteDto({
    required this.id,
    required this.type,
    required this.fullName,
    required this.shortName,
    this.externalReference,
  });

  String id;

  String type;

  LocalizedField fullName;

  LocalizedField shortName;

  String? externalReference;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OriginalAlbumWriteDto &&
     other.id == id &&
     other.type == type &&
     other.fullName == fullName &&
     other.shortName == shortName &&
     other.externalReference == externalReference;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (type.hashCode) +
    (fullName.hashCode) +
    (shortName.hashCode) +
    (externalReference == null ? 0 : externalReference!.hashCode);

  @override
  String toString() => 'OriginalAlbumWriteDto[id=$id, type=$type, fullName=$fullName, shortName=$shortName, externalReference=$externalReference]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'type'] = this.type;
      json[r'fullName'] = this.fullName;
      json[r'shortName'] = this.shortName;
    if (this.externalReference != null) {
      json[r'externalReference'] = this.externalReference;
    } else {
      json[r'externalReference'] = null;
    }
    return json;
  }

  /// Returns a new [OriginalAlbumWriteDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OriginalAlbumWriteDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OriginalAlbumWriteDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OriginalAlbumWriteDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OriginalAlbumWriteDto(
        id: mapValueOfType<String>(json, r'id')!,
        type: mapValueOfType<String>(json, r'type')!,
        fullName: LocalizedField.fromJson(json[r'fullName'])!,
        shortName: LocalizedField.fromJson(json[r'shortName'])!,
        externalReference: mapValueOfType<String>(json, r'externalReference'),
      );
    }
    return null;
  }

  static List<OriginalAlbumWriteDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OriginalAlbumWriteDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OriginalAlbumWriteDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OriginalAlbumWriteDto> mapFromJson(dynamic json) {
    final map = <String, OriginalAlbumWriteDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OriginalAlbumWriteDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OriginalAlbumWriteDto-objects as value to a dart map
  static Map<String, List<OriginalAlbumWriteDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OriginalAlbumWriteDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OriginalAlbumWriteDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'type',
    'fullName',
    'shortName',
  };
}

