//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;


class HlsPlaylistType {
  /// Instantiate a new enum with the provided [value].
  const HlsPlaylistType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const master = HlsPlaylistType._(r'Master');
  static const media = HlsPlaylistType._(r'Media');

  /// List of all possible values in this [enum][HlsPlaylistType].
  static const values = <HlsPlaylistType>[
    master,
    media,
  ];

  static HlsPlaylistType? fromJson(dynamic value) => HlsPlaylistTypeTypeTransformer().decode(value);

  static List<HlsPlaylistType> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <HlsPlaylistType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = HlsPlaylistType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [HlsPlaylistType] to String,
/// and [decode] dynamic data back to [HlsPlaylistType].
class HlsPlaylistTypeTypeTransformer {
  factory HlsPlaylistTypeTypeTransformer() => _instance ??= const HlsPlaylistTypeTypeTransformer._();

  const HlsPlaylistTypeTypeTransformer._();

  String encode(HlsPlaylistType data) => data.value;

  /// Decodes a [dynamic value][data] to a HlsPlaylistType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  HlsPlaylistType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Master': return HlsPlaylistType.master;
        case r'Media': return HlsPlaylistType.media;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [HlsPlaylistTypeTypeTransformer] instance.
  static HlsPlaylistTypeTypeTransformer? _instance;
}

