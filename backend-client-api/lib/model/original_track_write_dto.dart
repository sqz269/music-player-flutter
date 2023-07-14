//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class OriginalTrackWriteDto {
  /// Returns a new [OriginalTrackWriteDto] instance.
  OriginalTrackWriteDto({
    required this.id,
    required this.title,
    this.externalReference,
  });

  String id;

  LocalizedField title;

  String? externalReference;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OriginalTrackWriteDto &&
     other.id == id &&
     other.title == title &&
     other.externalReference == externalReference;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (title.hashCode) +
    (externalReference == null ? 0 : externalReference!.hashCode);

  @override
  String toString() => 'OriginalTrackWriteDto[id=$id, title=$title, externalReference=$externalReference]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'title'] = this.title;
    if (this.externalReference != null) {
      json[r'externalReference'] = this.externalReference;
    } else {
      json[r'externalReference'] = null;
    }
    return json;
  }

  /// Returns a new [OriginalTrackWriteDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OriginalTrackWriteDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OriginalTrackWriteDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OriginalTrackWriteDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OriginalTrackWriteDto(
        id: mapValueOfType<String>(json, r'id')!,
        title: LocalizedField.fromJson(json[r'title'])!,
        externalReference: mapValueOfType<String>(json, r'externalReference'),
      );
    }
    return null;
  }

  static List<OriginalTrackWriteDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OriginalTrackWriteDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OriginalTrackWriteDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OriginalTrackWriteDto> mapFromJson(dynamic json) {
    final map = <String, OriginalTrackWriteDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OriginalTrackWriteDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OriginalTrackWriteDto-objects as value to a dart map
  static Map<String, List<OriginalTrackWriteDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OriginalTrackWriteDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OriginalTrackWriteDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'title',
  };
}

