//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;


class CircleStatus {
  /// Instantiate a new enum with the provided [value].
  const CircleStatus._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const active = CircleStatus._(r'Active');
  static const inactive = CircleStatus._(r'Inactive');
  static const disbanded = CircleStatus._(r'Disbanded');
  static const transfer = CircleStatus._(r'Transfer');
  static const unknown = CircleStatus._(r'Unknown');
  static const unset = CircleStatus._(r'Unset');

  /// List of all possible values in this [enum][CircleStatus].
  static const values = <CircleStatus>[
    active,
    inactive,
    disbanded,
    transfer,
    unknown,
    unset,
  ];

  static CircleStatus? fromJson(dynamic value) => CircleStatusTypeTransformer().decode(value);

  static List<CircleStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CircleStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CircleStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CircleStatus] to String,
/// and [decode] dynamic data back to [CircleStatus].
class CircleStatusTypeTransformer {
  factory CircleStatusTypeTransformer() => _instance ??= const CircleStatusTypeTransformer._();

  const CircleStatusTypeTransformer._();

  String encode(CircleStatus data) => data.value;

  /// Decodes a [dynamic value][data] to a CircleStatus.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CircleStatus? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Active': return CircleStatus.active;
        case r'Inactive': return CircleStatus.inactive;
        case r'Disbanded': return CircleStatus.disbanded;
        case r'Transfer': return CircleStatus.transfer;
        case r'Unknown': return CircleStatus.unknown;
        case r'Unset': return CircleStatus.unset;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CircleStatusTypeTransformer] instance.
  static CircleStatusTypeTransformer? _instance;
}

