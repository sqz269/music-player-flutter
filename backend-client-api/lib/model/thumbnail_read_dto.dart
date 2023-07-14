//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class ThumbnailReadDto {
  /// Returns a new [ThumbnailReadDto] instance.
  ThumbnailReadDto({
    this.original,
    this.large,
    this.medium,
    this.small,
    this.tiny,
    this.colors = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AssetReadDto? original;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AssetReadDto? large;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AssetReadDto? medium;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AssetReadDto? small;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AssetReadDto? tiny;

  List<String>? colors;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ThumbnailReadDto &&
     other.original == original &&
     other.large == large &&
     other.medium == medium &&
     other.small == small &&
     other.tiny == tiny &&
     other.colors == colors;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (original == null ? 0 : original!.hashCode) +
    (large == null ? 0 : large!.hashCode) +
    (medium == null ? 0 : medium!.hashCode) +
    (small == null ? 0 : small!.hashCode) +
    (tiny == null ? 0 : tiny!.hashCode) +
    (colors == null ? 0 : colors!.hashCode);

  @override
  String toString() => 'ThumbnailReadDto[original=$original, large=$large, medium=$medium, small=$small, tiny=$tiny, colors=$colors]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.original != null) {
      json[r'original'] = this.original;
    } else {
      json[r'original'] = null;
    }
    if (this.large != null) {
      json[r'large'] = this.large;
    } else {
      json[r'large'] = null;
    }
    if (this.medium != null) {
      json[r'medium'] = this.medium;
    } else {
      json[r'medium'] = null;
    }
    if (this.small != null) {
      json[r'small'] = this.small;
    } else {
      json[r'small'] = null;
    }
    if (this.tiny != null) {
      json[r'tiny'] = this.tiny;
    } else {
      json[r'tiny'] = null;
    }
    if (this.colors != null) {
      json[r'colors'] = this.colors;
    } else {
      json[r'colors'] = null;
    }
    return json;
  }

  /// Returns a new [ThumbnailReadDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ThumbnailReadDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ThumbnailReadDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ThumbnailReadDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ThumbnailReadDto(
        original: AssetReadDto.fromJson(json[r'original']),
        large: AssetReadDto.fromJson(json[r'large']),
        medium: AssetReadDto.fromJson(json[r'medium']),
        small: AssetReadDto.fromJson(json[r'small']),
        tiny: AssetReadDto.fromJson(json[r'tiny']),
        colors: json[r'colors'] is List
            ? (json[r'colors'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<ThumbnailReadDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ThumbnailReadDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ThumbnailReadDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ThumbnailReadDto> mapFromJson(dynamic json) {
    final map = <String, ThumbnailReadDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ThumbnailReadDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ThumbnailReadDto-objects as value to a dart map
  static Map<String, List<ThumbnailReadDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ThumbnailReadDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ThumbnailReadDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

