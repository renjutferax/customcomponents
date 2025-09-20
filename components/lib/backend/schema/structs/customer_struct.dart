// ignore_for_file: unnecessary_getters_setters

import 'package:components/backend/schema/structs/serialization_util.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';

import '/backend/schema/util/schema_util.dart';

import 'index.dart';


class CustomerStruct extends BaseStruct {
  CustomerStruct({
    int? id,
    String? name,
  })  : _id = id,
        _name = name;

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static CustomerStruct fromMap(Map<String, dynamic> data) => CustomerStruct(
        id: castToType<int>(data['Id']),
        name: data['Name'] as String?,
      );

  static CustomerStruct? maybeFromMap(dynamic data) =>
      data is Map ? CustomerStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'Name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.int,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static CustomerStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustomerStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CustomerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomerStruct && id == other.id && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

CustomerStruct createCustomerStruct({
  int? id,
  String? name,
}) =>
    CustomerStruct(
      id: id,
      name: name,
    );
