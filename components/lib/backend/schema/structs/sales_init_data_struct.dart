// ignore_for_file: unnecessary_getters_setters

import 'package:components/backend/schema/structs/serialization_util.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';

import '/backend/schema/util/schema_util.dart';

import 'index.dart';


class SalesInitDataStruct extends BaseStruct {
  SalesInitDataStruct({
    List<String>? salesTypeList,
    List<CustomerStruct>? customerList,
    List<String>? salesPriceTypeList,
    List<String>? workflowList,
  })  : _salesTypeList = salesTypeList,
        _customerList = customerList,
        _salesPriceTypeList = salesPriceTypeList,
        _workflowList = workflowList;

  // "SalesTypeList" field.
  List<String>? _salesTypeList;
  List<String> get salesTypeList => _salesTypeList ?? const [];
  set salesTypeList(List<String>? val) => _salesTypeList = val;

  void updateSalesTypeList(Function(List<String>) updateFn) {
    updateFn(_salesTypeList ??= []);
  }

  bool hasSalesTypeList() => _salesTypeList != null;

  // "CustomerList" field.
  List<CustomerStruct>? _customerList;
  List<CustomerStruct> get customerList => _customerList ?? const [];
  set customerList(List<CustomerStruct>? val) => _customerList = val;

  void updateCustomerList(Function(List<CustomerStruct>) updateFn) {
    updateFn(_customerList ??= []);
  }

  bool hasCustomerList() => _customerList != null;

  // "SalesPriceTypeList" field.
  List<String>? _salesPriceTypeList;
  List<String> get salesPriceTypeList => _salesPriceTypeList ?? const [];
  set salesPriceTypeList(List<String>? val) => _salesPriceTypeList = val;

  void updateSalesPriceTypeList(Function(List<String>) updateFn) {
    updateFn(_salesPriceTypeList ??= []);
  }

  bool hasSalesPriceTypeList() => _salesPriceTypeList != null;

  // "WorkflowList" field.
  List<String>? _workflowList;
  List<String> get workflowList => _workflowList ?? const [];
  set workflowList(List<String>? val) => _workflowList = val;

  void updateWorkflowList(Function(List<String>) updateFn) {
    updateFn(_workflowList ??= []);
  }

  bool hasWorkflowList() => _workflowList != null;

  static SalesInitDataStruct fromMap(Map<String, dynamic> data) =>
      SalesInitDataStruct(
        salesTypeList: getDataList(data['SalesTypeList']),
        customerList: getStructList(
          data['CustomerList'],
          CustomerStruct.fromMap,
        ),
        salesPriceTypeList: getDataList(data['SalesPriceTypeList']),
        workflowList: getDataList(data['WorkflowList']),
      );

  static SalesInitDataStruct? maybeFromMap(dynamic data) => data is Map
      ? SalesInitDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'SalesTypeList': _salesTypeList,
        'CustomerList': _customerList?.map((e) => e.toMap()).toList(),
        'SalesPriceTypeList': _salesPriceTypeList,
        'WorkflowList': _workflowList,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'SalesTypeList': serializeParam(
          _salesTypeList,
          ParamType.String,
          isList: true,
        ),
        'CustomerList': serializeParam(
          _customerList,
          ParamType.DataStruct,
          isList: true,
        ),
        'SalesPriceTypeList': serializeParam(
          _salesPriceTypeList,
          ParamType.String,
          isList: true,
        ),
        'WorkflowList': serializeParam(
          _workflowList,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static SalesInitDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      SalesInitDataStruct(
        salesTypeList: deserializeParam<String>(
          data['SalesTypeList'],
          ParamType.String,
          true,
        ),
        customerList: deserializeStructParam<CustomerStruct>(
          data['CustomerList'],
          ParamType.DataStruct,
          true,
          structBuilder: CustomerStruct.fromSerializableMap,
        ),
        salesPriceTypeList: deserializeParam<String>(
          data['SalesPriceTypeList'],
          ParamType.String,
          true,
        ),
        workflowList: deserializeParam<String>(
          data['WorkflowList'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'SalesInitDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SalesInitDataStruct &&
        listEquality.equals(salesTypeList, other.salesTypeList) &&
        listEquality.equals(customerList, other.customerList) &&
        listEquality.equals(salesPriceTypeList, other.salesPriceTypeList) &&
        listEquality.equals(workflowList, other.workflowList);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([salesTypeList, customerList, salesPriceTypeList, workflowList]);
}

SalesInitDataStruct createSalesInitDataStruct() => SalesInitDataStruct();
