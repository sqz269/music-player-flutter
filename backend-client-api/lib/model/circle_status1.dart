//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;


class CircleStatus1 {
  /// Instantiate a new enum with the provided [value].
  const CircleStatus1._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number1 = CircleStatus1._(1);
  static const number2 = CircleStatus1._(2);
  static const number3 = CircleStatus1._(3);
  static const number4 = CircleStatus1._(4);
  static const number5 = CircleStatus1._(5);
  static const number6 = CircleStatus1._(6);

  /// List of all possible values in this [enum][CircleStatus1].
  static const values = <CircleStatus1>[
    number1,
    number2,
    number3,
    number4,
    number5,
    number6,
  ];

  static CircleStatus1? fromJson(dynamic value) => CircleStatus1TypeTransformer().decode(value);

  static List<CircleStatus1> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CircleStatus1>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CircleStatus1.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CircleStatus1] to int,
/// and [decode] dynamic data back to [CircleStatus1].
class CircleStatus1TypeTransformer {
  factory CircleStatus1TypeTransformer() => _instance ??= const CircleStatus1TypeTransformer._();

  const CircleStatus1TypeTransformer._();

  int encode(CircleStatus1 data) => data.value;

  /// Decodes a [dynamic value][data] to a CircleStatus1.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CircleStatus1? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case 1: return CircleStatus1.number1;
        case 2: return CircleStatus1.number2;
        case 3: return CircleStatus1.number3;
        case 4: return CircleStatus1.number4;
        case 5: return CircleStatus1.number5;
        case 6: return CircleStatus1.number6;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CircleStatus1TypeTransformer] instance.
  static CircleStatus1TypeTransformer? _instance;
}

