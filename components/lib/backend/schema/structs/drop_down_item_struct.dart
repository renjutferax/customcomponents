// ignore_for_file: unnecessary_getters_setters

import 'package:components/backend/schema/structs/serialization_util.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';

import '/backend/schema/util/schema_util.dart';

import 'index.dart';


class DropDownItemStruct extends BaseStruct {
  DropDownItemStruct({
    String? id,
    String? name,
  })  : _id = id,
        _name = name;

  // "Id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static DropDownItemStruct fromMap(Map<String, dynamic> data) =>
      DropDownItemStruct(
        id: data['Id'] as String?,
        name: data['Name'] as String?,
      );

  static DropDownItemStruct? maybeFromMap(dynamic data) => data is Map
      ? DropDownItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'Name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.String,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static DropDownItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      DropDownItemStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DropDownItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DropDownItemStruct && id == other.id && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

DropDownItemStruct createDropDownItemStruct({
  String? id,
  String? name,
}) =>
    DropDownItemStruct(
      id: id,
      name: name,
    );
