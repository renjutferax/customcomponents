import 'dart:async';
import 'package:components/backend/schema/structs/drop_down_item_struct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_drop_down.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:flutterflow_theme/flutter_flow/form_field_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_dropdown_simple_model.dart';
export 'f_t_dropdown_simple_model.dart';

class FTDropdownSimpleWidget extends StatefulWidget {
  const FTDropdownSimpleWidget({
    super.key,
    this.hintText,
    this.itemList,
    double? width,
    this.valueField,
    required this.onSelection,
  }) : this.width = width ?? 250.0;

  final String? hintText;
  final List<DropDownItemStruct>? itemList;
  final double width;
  final String? valueField;
  final Future Function(String selectedItem)? onSelection;

  @override
  State<FTDropdownSimpleWidget> createState() => _FTDropdownSimpleWidgetState();
}

class _FTDropdownSimpleWidgetState extends State<FTDropdownSimpleWidget> {
  late FTDropdownSimpleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTDropdownSimpleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: valueOrDefault<double>(widget!.width, 250.0),
      height: 40,
      decoration: BoxDecoration(),
      child: FlutterFlowDropDown<String>(
        controller:
            _model.dropDownValueController ??= FormFieldController<String>(
              _model.dropDownValue ??= '',
            ),
        options: List<String>.from(widget!.itemList!.map((e) => e.id).toList()),
        optionLabels: widget!.itemList!.map((e) => e.name).toList(),
        onChanged: (val) async {
          safeSetState(() => _model.dropDownValue = val);
          safeSetState(() {
            _model.dropDownValueController?.value = _model.dropDownValue!;
          });
          await widget.onSelection?.call(_model.dropDownValue!);
        },
        width: 200,
        height: 40,
        searchHintTextStyle: FlutterFlowTheme.of(context).labelSmall.override(
          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
          letterSpacing: 0.0,
          useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
        ),
        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
          letterSpacing: 0.0,
          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
        ),
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
          color: FlutterFlowTheme.of(context).secondaryText,
          fontSize: 14,
          letterSpacing: 0.0,
          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
        ),
        hintText: widget!.hintText,
        searchHintText: 'Search...',
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 24,
        ),
        elevation: 0,
        borderColor: Colors.transparent,
        borderWidth: 0,
        borderRadius: 0,
        margin: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
        hidesUnderline: true,
        isOverButton: false,
        isSearchable: true,
        isMultiSelect: false,
      ),
    );
  }
}
