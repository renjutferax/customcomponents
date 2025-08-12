import '/backend/schema/structs/index.dart';

import 'package:flutterflow_theme/flutter_flow/flutter_flow_drop_down.dart';
import 'package:flutterflow_theme/flutterflow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_widgets.dart';

import 'package:flutterflow_theme/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_dropdown_simple_copy_model.dart';
export 'f_t_dropdown_simple_copy_model.dart';

class FTDropdownSimpleCopyWidget extends StatefulWidget {
  const FTDropdownSimpleCopyWidget({
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
  final Future Function(DropDownItemStruct selectedItem)? onSelection;

  @override
  State<FTDropdownSimpleCopyWidget> createState() =>
      _FTDropdownSimpleCopyWidgetState();
}

class _FTDropdownSimpleCopyWidgetState
    extends State<FTDropdownSimpleCopyWidget> {
  late FTDropdownSimpleCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTDropdownSimpleCopyModel());

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
      height: 40.0,
      decoration: BoxDecoration(),
      child: FlutterFlowDropDown<String>(
        controller:
            _model.dropDownValueController ??= FormFieldController<String>(
              null,
            ),
        options: widget!.itemList!.map((e) => e.name).toList(),
        onChanged: (val) async {
          safeSetState(() => _model.dropDownValue = val);
          await widget.onSelection?.call(DropDownItemStruct());
        },
        width: 200.0,
        height: 40.0,
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
          fontSize: 14.0,
          letterSpacing: 0.0,
          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
        ),
        hintText: widget!.hintText,
        searchHintText: 'Search...',
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 24.0,
        ),
        elevation: 0.0,
        borderColor: Colors.transparent,
        borderWidth: 0.0,
        borderRadius: 0.0,
        margin: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
        hidesUnderline: true,
        isOverButton: false,
        isSearchable: true,
        isMultiSelect: false,
      ),
    );
  }
}
