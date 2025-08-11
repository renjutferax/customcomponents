// ignore_for_file: unnecessary_getters_setters

import 'package:components/backend/schema/structs/serialization_util.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';

import '/backend/schema/util/schema_util.dart';

import 'index.dart';


class ProductCountStruct extends BaseStruct {
  ProductCountStruct({
    int? prodId,
    int? prodThno,
  })  : _prodId = prodId,
        _prodThno = prodThno;

  // "ProdId" field.
  int? _prodId;
  int get prodId => _prodId ?? 0;
  set prodId(int? val) => _prodId = val;

  void incrementProdId(int amount) => prodId = prodId + amount;

  bool hasProdId() => _prodId != null;

  // "ProdThno" field.
  int? _prodThno;
  int get prodThno => _prodThno ?? 0;
  set prodThno(int? val) => _prodThno = val;

  void incrementProdThno(int amount) => prodThno = prodThno + amount;

  bool hasProdThno() => _prodThno != null;

  static ProductCountStruct fromMap(Map<String, dynamic> data) =>
      ProductCountStruct(
        prodId: castToType<int>(data['ProdId']),
        prodThno: castToType<int>(data['ProdThno']),
      );

  static ProductCountStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductCountStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ProdId': _prodId,
        'ProdThno': _prodThno,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ProdId': serializeParam(
          _prodId,
          ParamType.int,
        ),
        'ProdThno': serializeParam(
          _prodThno,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProductCountStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductCountStruct(
        prodId: deserializeParam(
          data['ProdId'],
          ParamType.int,
          false,
        ),
        prodThno: deserializeParam(
          data['ProdThno'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProductCountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductCountStruct &&
        prodId == other.prodId &&
        prodThno == other.prodThno;
  }

  @override
  int get hashCode => const ListEquality().hash([prodId, prodThno]);
}

ProductCountStruct createProductCountStruct({
  int? prodId,
  int? prodThno,
}) =>
    ProductCountStruct(
      prodId: prodId,
      prodThno: prodThno,
    );
