//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class AlbumWriteDto {
  /// Returns a new [AlbumWriteDto] instance.
  AlbumWriteDto({
    required this.albumName,
    this.releaseDate,
    this.releaseConvention,
    this.catalogNumber,
    this.numberOfDiscs,
    this.discNumber,
    this.discName,
    this.website = const [],
    this.albumArtist = const [],
    this.genre = const [],
    this.dataSource = const [],
    this.albumImage,
    this.otherFiles = const [],
  });

  LocalizedField albumName;

  DateTime? releaseDate;

  String? releaseConvention;

  String? catalogNumber;

  int? numberOfDiscs;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? discNumber;

  String? discName;

  List<String>? website;

  List<String>? albumArtist;

  List<String>? genre;

  List<String>? dataSource;

  String? albumImage;

  List<String>? otherFiles;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AlbumWriteDto &&
     other.albumName == albumName &&
     other.releaseDate == releaseDate &&
     other.releaseConvention == releaseConvention &&
     other.catalogNumber == catalogNumber &&
     other.numberOfDiscs == numberOfDiscs &&
     other.discNumber == discNumber &&
     other.discName == discName &&
     other.website == website &&
     other.albumArtist == albumArtist &&
     other.genre == genre &&
     other.dataSource == dataSource &&
     other.albumImage == albumImage &&
     other.otherFiles == otherFiles;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (albumName.hashCode) +
    (releaseDate == null ? 0 : releaseDate!.hashCode) +
    (releaseConvention == null ? 0 : releaseConvention!.hashCode) +
    (catalogNumber == null ? 0 : catalogNumber!.hashCode) +
    (numberOfDiscs == null ? 0 : numberOfDiscs!.hashCode) +
    (discNumber == null ? 0 : discNumber!.hashCode) +
    (discName == null ? 0 : discName!.hashCode) +
    (website == null ? 0 : website!.hashCode) +
    (albumArtist == null ? 0 : albumArtist!.hashCode) +
    (genre == null ? 0 : genre!.hashCode) +
    (dataSource == null ? 0 : dataSource!.hashCode) +
    (albumImage == null ? 0 : albumImage!.hashCode) +
    (otherFiles == null ? 0 : otherFiles!.hashCode);

  @override
  String toString() => 'AlbumWriteDto[albumName=$albumName, releaseDate=$releaseDate, releaseConvention=$releaseConvention, catalogNumber=$catalogNumber, numberOfDiscs=$numberOfDiscs, discNumber=$discNumber, discName=$discName, website=$website, albumArtist=$albumArtist, genre=$genre, dataSource=$dataSource, albumImage=$albumImage, otherFiles=$otherFiles]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'albumName'] = this.albumName;
    if (this.releaseDate != null) {
      json[r'releaseDate'] = this.releaseDate!.toUtc().toIso8601String();
    } else {
      json[r'releaseDate'] = null;
    }
    if (this.releaseConvention != null) {
      json[r'releaseConvention'] = this.releaseConvention;
    } else {
      json[r'releaseConvention'] = null;
    }
    if (this.catalogNumber != null) {
      json[r'catalogNumber'] = this.catalogNumber;
    } else {
      json[r'catalogNumber'] = null;
    }
    if (this.numberOfDiscs != null) {
      json[r'numberOfDiscs'] = this.numberOfDiscs;
    } else {
      json[r'numberOfDiscs'] = null;
    }
    if (this.discNumber != null) {
      json[r'discNumber'] = this.discNumber;
    } else {
      json[r'discNumber'] = null;
    }
    if (this.discName != null) {
      json[r'discName'] = this.discName;
    } else {
      json[r'discName'] = null;
    }
    if (this.website != null) {
      json[r'website'] = this.website;
    } else {
      json[r'website'] = null;
    }
    if (this.albumArtist != null) {
      json[r'albumArtist'] = this.albumArtist;
    } else {
      json[r'albumArtist'] = null;
    }
    if (this.genre != null) {
      json[r'genre'] = this.genre;
    } else {
      json[r'genre'] = null;
    }
    if (this.dataSource != null) {
      json[r'dataSource'] = this.dataSource;
    } else {
      json[r'dataSource'] = null;
    }
    if (this.albumImage != null) {
      json[r'albumImage'] = this.albumImage;
    } else {
      json[r'albumImage'] = null;
    }
    if (this.otherFiles != null) {
      json[r'otherFiles'] = this.otherFiles;
    } else {
      json[r'otherFiles'] = null;
    }
    return json;
  }

  /// Returns a new [AlbumWriteDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AlbumWriteDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AlbumWriteDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AlbumWriteDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AlbumWriteDto(
        albumName: LocalizedField.fromJson(json[r'albumName'])!,
        releaseDate: mapDateTime(json, r'releaseDate', ''),
        releaseConvention: mapValueOfType<String>(json, r'releaseConvention'),
        catalogNumber: mapValueOfType<String>(json, r'catalogNumber'),
        numberOfDiscs: mapValueOfType<int>(json, r'numberOfDiscs'),
        discNumber: mapValueOfType<int>(json, r'discNumber'),
        discName: mapValueOfType<String>(json, r'discName'),
        website: json[r'website'] is List
            ? (json[r'website'] as List).cast<String>()
            : const [],
        albumArtist: json[r'albumArtist'] is List
            ? (json[r'albumArtist'] as List).cast<String>()
            : const [],
        genre: json[r'genre'] is List
            ? (json[r'genre'] as List).cast<String>()
            : const [],
        dataSource: json[r'dataSource'] is List
            ? (json[r'dataSource'] as List).cast<String>()
            : const [],
        albumImage: mapValueOfType<String>(json, r'albumImage'),
        otherFiles: json[r'otherFiles'] is List
            ? (json[r'otherFiles'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<AlbumWriteDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AlbumWriteDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AlbumWriteDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AlbumWriteDto> mapFromJson(dynamic json) {
    final map = <String, AlbumWriteDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AlbumWriteDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AlbumWriteDto-objects as value to a dart map
  static Map<String, List<AlbumWriteDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AlbumWriteDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AlbumWriteDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'albumName',
  };
}

