//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;


class PlaylistType {
  /// Instantiate a new enum with the provided [value].
  const PlaylistType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const normal = PlaylistType._(r'Normal');
  static const favorite = PlaylistType._(r'Favorite');
  static const history = PlaylistType._(r'History');
  static const queue = PlaylistType._(r'Queue');

  /// List of all possible values in this [enum][PlaylistType].
  static const values = <PlaylistType>[
    normal,
    favorite,
    history,
    queue,
  ];

  static PlaylistType? fromJson(dynamic value) => PlaylistTypeTypeTransformer().decode(value);

  static List<PlaylistType> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PlaylistType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PlaylistType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PlaylistType] to String,
/// and [decode] dynamic data back to [PlaylistType].
class PlaylistTypeTypeTransformer {
  factory PlaylistTypeTypeTransformer() => _instance ??= const PlaylistTypeTypeTransformer._();

  const PlaylistTypeTypeTransformer._();

  String encode(PlaylistType data) => data.value;

  /// Decodes a [dynamic value][data] to a PlaylistType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PlaylistType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Normal': return PlaylistType.normal;
        case r'Favorite': return PlaylistType.favorite;
        case r'History': return PlaylistType.history;
        case r'Queue': return PlaylistType.queue;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PlaylistTypeTypeTransformer] instance.
  static PlaylistTypeTypeTransformer? _instance;
}

