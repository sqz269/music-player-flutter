//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class OriginalAlbumReadDto1 {
  /// Returns a new [OriginalAlbumReadDto1] instance.
  OriginalAlbumReadDto1({
    this.id,
    this.type,
    this.fullName,
    this.shortName,
  });

  String? id;

  String? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  LocalizedField1? fullName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  LocalizedField1? shortName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OriginalAlbumReadDto1 &&
     other.id == id &&
     other.type == type &&
     other.fullName == fullName &&
     other.shortName == shortName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (fullName == null ? 0 : fullName!.hashCode) +
    (shortName == null ? 0 : shortName!.hashCode);

  @override
  String toString() => 'OriginalAlbumReadDto1[id=$id, type=$type, fullName=$fullName, shortName=$shortName]';

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
    if (this.fullName != null) {
      json[r'fullName'] = this.fullName;
    } else {
      json[r'fullName'] = null;
    }
    if (this.shortName != null) {
      json[r'shortName'] = this.shortName;
    } else {
      json[r'shortName'] = null;
    }
    return json;
  }

  /// Returns a new [OriginalAlbumReadDto1] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OriginalAlbumReadDto1? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OriginalAlbumReadDto1[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OriginalAlbumReadDto1[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OriginalAlbumReadDto1(
        id: mapValueOfType<String>(json, r'id'),
        type: mapValueOfType<String>(json, r'type'),
        fullName: LocalizedField1.fromJson(json[r'fullName']),
        shortName: LocalizedField1.fromJson(json[r'shortName']),
      );
    }
    return null;
  }

  static List<OriginalAlbumReadDto1> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OriginalAlbumReadDto1>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OriginalAlbumReadDto1.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OriginalAlbumReadDto1> mapFromJson(dynamic json) {
    final map = <String, OriginalAlbumReadDto1>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OriginalAlbumReadDto1.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OriginalAlbumReadDto1-objects as value to a dart map
  static Map<String, List<OriginalAlbumReadDto1>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OriginalAlbumReadDto1>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OriginalAlbumReadDto1.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

