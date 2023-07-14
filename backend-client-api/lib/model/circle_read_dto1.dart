//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class CircleReadDto1 {
  /// Returns a new [CircleReadDto1] instance.
  CircleReadDto1({
    this.status,
    this.id,
    this.name,
    this.alias = const [],
    this.country,
    this.website = const [],
    this.established,
    this.dataSource = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CircleStatus1? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  String? name;

  List<String>? alias;

  String? country;

  List<CircleWebsiteReadDto>? website;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? established;

  List<String>? dataSource;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CircleReadDto1 &&
     other.status == status &&
     other.id == id &&
     other.name == name &&
     other.alias == alias &&
     other.country == country &&
     other.website == website &&
     other.established == established &&
     other.dataSource == dataSource;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (status == null ? 0 : status!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (alias == null ? 0 : alias!.hashCode) +
    (country == null ? 0 : country!.hashCode) +
    (website == null ? 0 : website!.hashCode) +
    (established == null ? 0 : established!.hashCode) +
    (dataSource == null ? 0 : dataSource!.hashCode);

  @override
  String toString() => 'CircleReadDto1[status=$status, id=$id, name=$name, alias=$alias, country=$country, website=$website, established=$established, dataSource=$dataSource]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
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
    if (this.alias != null) {
      json[r'alias'] = this.alias;
    } else {
      json[r'alias'] = null;
    }
    if (this.country != null) {
      json[r'country'] = this.country;
    } else {
      json[r'country'] = null;
    }
    if (this.website != null) {
      json[r'website'] = this.website;
    } else {
      json[r'website'] = null;
    }
    if (this.established != null) {
      json[r'established'] = this.established!.toUtc().toIso8601String();
    } else {
      json[r'established'] = null;
    }
    if (this.dataSource != null) {
      json[r'dataSource'] = this.dataSource;
    } else {
      json[r'dataSource'] = null;
    }
    return json;
  }

  /// Returns a new [CircleReadDto1] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CircleReadDto1? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CircleReadDto1[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CircleReadDto1[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CircleReadDto1(
        status: CircleStatus1.fromJson(json[r'status']),
        id: mapValueOfType<String>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        alias: json[r'alias'] is List
            ? (json[r'alias'] as List).cast<String>()
            : const [],
        country: mapValueOfType<String>(json, r'country'),
        website: CircleWebsiteReadDto.listFromJson(json[r'website']),
        established: mapDateTime(json, r'established', ''),
        dataSource: json[r'dataSource'] is List
            ? (json[r'dataSource'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<CircleReadDto1> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CircleReadDto1>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CircleReadDto1.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CircleReadDto1> mapFromJson(dynamic json) {
    final map = <String, CircleReadDto1>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CircleReadDto1.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CircleReadDto1-objects as value to a dart map
  static Map<String, List<CircleReadDto1>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CircleReadDto1>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CircleReadDto1.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

