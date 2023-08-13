//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;


class AlbumOrderOptions {
  /// Instantiate a new enum with the provided [value].
  const AlbumOrderOptions._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const id = AlbumOrderOptions._(r'Id');
  static const date = AlbumOrderOptions._(r'Date');
  static const title = AlbumOrderOptions._(r'Title');

  /// List of all possible values in this [enum][AlbumOrderOptions].
  static const values = <AlbumOrderOptions>[
    id,
    date,
    title,
  ];

  static AlbumOrderOptions? fromJson(dynamic value) => AlbumOrderOptionsTypeTransformer().decode(value);

  static List<AlbumOrderOptions> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AlbumOrderOptions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AlbumOrderOptions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AlbumOrderOptions] to String,
/// and [decode] dynamic data back to [AlbumOrderOptions].
class AlbumOrderOptionsTypeTransformer {
  factory AlbumOrderOptionsTypeTransformer() => _instance ??= const AlbumOrderOptionsTypeTransformer._();

  const AlbumOrderOptionsTypeTransformer._();

  String encode(AlbumOrderOptions data) => data.value;

  /// Decodes a [dynamic value][data] to a AlbumOrderOptions.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AlbumOrderOptions? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Id': return AlbumOrderOptions.id;
        case r'Date': return AlbumOrderOptions.date;
        case r'Title': return AlbumOrderOptions.title;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AlbumOrderOptionsTypeTransformer] instance.
  static AlbumOrderOptionsTypeTransformer? _instance;
}

