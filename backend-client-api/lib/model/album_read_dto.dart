//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;

class AlbumReadDto {
  /// Returns a new [AlbumReadDto] instance.
  AlbumReadDto({
    this.id,
    this.albumName,
    this.releaseDate,
    this.releaseConvention,
    this.catalogNumber,
    this.numberOfDiscs,
    this.website = const [],
    this.albumArtist = const [],
    this.dataSource = const [],
    this.tracks = const [],
    this.thumbnail,
    this.otherFiles = const [],
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
  LocalizedField? albumName;

  DateTime? releaseDate;

  String? releaseConvention;

  String? catalogNumber;

  int? numberOfDiscs;

  List<String>? website;

  List<CircleReadDto>? albumArtist;

  List<String>? dataSource;

  List<TrackReadDto>? tracks;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ThumbnailReadDto? thumbnail;

  List<AssetReadDto>? otherFiles;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AlbumReadDto &&
     other.id == id &&
     other.albumName == albumName &&
     other.releaseDate == releaseDate &&
     other.releaseConvention == releaseConvention &&
     other.catalogNumber == catalogNumber &&
     other.numberOfDiscs == numberOfDiscs &&
     other.website == website &&
     other.albumArtist == albumArtist &&
     other.dataSource == dataSource &&
     other.tracks == tracks &&
     other.thumbnail == thumbnail &&
     other.otherFiles == otherFiles;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (albumName == null ? 0 : albumName!.hashCode) +
    (releaseDate == null ? 0 : releaseDate!.hashCode) +
    (releaseConvention == null ? 0 : releaseConvention!.hashCode) +
    (catalogNumber == null ? 0 : catalogNumber!.hashCode) +
    (numberOfDiscs == null ? 0 : numberOfDiscs!.hashCode) +
    (website == null ? 0 : website!.hashCode) +
    (albumArtist == null ? 0 : albumArtist!.hashCode) +
    (dataSource == null ? 0 : dataSource!.hashCode) +
    (tracks == null ? 0 : tracks!.hashCode) +
    (thumbnail == null ? 0 : thumbnail!.hashCode) +
    (otherFiles == null ? 0 : otherFiles!.hashCode);

  @override
  String toString() => 'AlbumReadDto[id=$id, albumName=$albumName, releaseDate=$releaseDate, releaseConvention=$releaseConvention, catalogNumber=$catalogNumber, numberOfDiscs=$numberOfDiscs, website=$website, albumArtist=$albumArtist, dataSource=$dataSource, tracks=$tracks, thumbnail=$thumbnail, otherFiles=$otherFiles]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.albumName != null) {
      json[r'albumName'] = this.albumName;
    } else {
      json[r'albumName'] = null;
    }
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
    if (this.dataSource != null) {
      json[r'dataSource'] = this.dataSource;
    } else {
      json[r'dataSource'] = null;
    }
    if (this.tracks != null) {
      json[r'tracks'] = this.tracks;
    } else {
      json[r'tracks'] = null;
    }
    if (this.thumbnail != null) {
      json[r'thumbnail'] = this.thumbnail;
    } else {
      json[r'thumbnail'] = null;
    }
    if (this.otherFiles != null) {
      json[r'otherFiles'] = this.otherFiles;
    } else {
      json[r'otherFiles'] = null;
    }
    return json;
  }

  /// Returns a new [AlbumReadDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AlbumReadDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AlbumReadDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AlbumReadDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AlbumReadDto(
        id: mapValueOfType<String>(json, r'id'),
        albumName: LocalizedField.fromJson(json[r'albumName']),
        releaseDate: mapDateTime(json, r'releaseDate', ''),
        releaseConvention: mapValueOfType<String>(json, r'releaseConvention'),
        catalogNumber: mapValueOfType<String>(json, r'catalogNumber'),
        numberOfDiscs: mapValueOfType<int>(json, r'numberOfDiscs'),
        website: json[r'website'] is List
            ? (json[r'website'] as List).cast<String>()
            : const [],
        albumArtist: CircleReadDto.listFromJson(json[r'albumArtist']),
        dataSource: json[r'dataSource'] is List
            ? (json[r'dataSource'] as List).cast<String>()
            : const [],
        tracks: TrackReadDto.listFromJson(json[r'tracks']),
        thumbnail: ThumbnailReadDto.fromJson(json[r'thumbnail']),
        otherFiles: AssetReadDto.listFromJson(json[r'otherFiles']),
      );
    }
    return null;
  }

  static List<AlbumReadDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AlbumReadDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AlbumReadDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AlbumReadDto> mapFromJson(dynamic json) {
    final map = <String, AlbumReadDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AlbumReadDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AlbumReadDto-objects as value to a dart map
  static Map<String, List<AlbumReadDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AlbumReadDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AlbumReadDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

