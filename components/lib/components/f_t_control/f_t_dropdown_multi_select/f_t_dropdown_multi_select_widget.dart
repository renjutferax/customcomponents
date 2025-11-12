import 'package:flutterflow_theme/flutter_flow/flutter_flow_drop_down.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:flutterflow_theme/flutter_flow/form_field_controller.dart';

import '/backend/schema/structs/index.dart';
import '/components/f_t_control/f_t_tooltip/f_t_tooltip_widget.dart';

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'f_t_dropdown_multi_select_model.dart';
export 'f_t_dropdown_multi_select_model.dart';

class FTDropdownMultiSelectWidget extends StatefulWidget {
  const FTDropdownMultiSelectWidget({
    super.key,
    this.hintText,
    this.tooltipText,
    this.labelText,
    this.itemList,
    double? width,
    this.onSelection,
    this.labelField,
    this.valueField,
    this.semanticsLabel,
  }) : this.width = width ?? 250.0;

  final String? hintText;
  final String? tooltipText;
  final String? labelText;
  final List<DropDownItemStruct>? itemList;
  final double width;
  final Future Function(String selectedItem)? onSelection;
  final String? labelField;
  final String? valueField;
  final String? semanticsLabel;

  @override
  State<FTDropdownMultiSelectWidget> createState() =>
      _FTDropdownMultiSelectWidgetState();
}

class _FTDropdownMultiSelectWidgetState
    extends State<FTDropdownMultiSelectWidget> {
  late FTDropdownMultiSelectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTDropdownMultiSelectModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
      child: Container(
        width: valueOrDefault<double>(
          widget!.width,
          250.0,
        ),
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  child: Text(
                    valueOrDefault<String>(
                      widget!.labelText,
                      'text',
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          color: FlutterFlowTheme.of(context).onSurface,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                        ),
                  ),
                ),
                wrapWithModel(
                  model: _model.fTTooltipModel,
                  updateCallback: () => safeSetState(() {}),
                  child: FTTooltipWidget(
                    tooltipText: widget!.tooltipText,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Semantics(
                    label: widget!.semanticsLabel!,
                    child: FlutterFlowDropDown<String>(
                      multiSelectController: _model.dropDownValueController ??=
                          FormListFieldController<String>(null),
                      options: widget!.itemList!.map((e) => e.name).toList(),
                      width: 200,
                      height: 37,
                      searchHintTextStyle: FlutterFlowTheme.of(context)
                          .labelSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelSmallFamily,
                            color: FlutterFlowTheme.of(context).onSurface,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .labelSmallIsCustom,
                          ),
                      searchTextStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                      textStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelMediumFamily,
                            color: FlutterFlowTheme.of(context).onSurface,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .labelMediumIsCustom,
                          ),
                      hintText: widget!.hintText,
                      searchHintText: 'Search...',
                      searchCursorColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).onSurface,
                        size: 24,
                      ),
                      fillColor: FlutterFlowTheme.of(context).surface,
                      elevation: 4,
                      borderColor: FlutterFlowTheme.of(context).outline,
                      borderWidth: 1,
                      borderRadius: 8,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: true,
                      isMultiSelect: true,
                      onMultiSelectChanged: (val) async {
                        safeSetState(() => _model.dropDownValue = val);
                        safeSetState(() {
                          _model.dropDownValueController?.value =
                              _model.dropDownValue!;
                        });
                        unawaited(
                          () async {
                            await widget.onSelection?.call(
                              _model.dropDownValue![0] ,
                            );
                          }(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
