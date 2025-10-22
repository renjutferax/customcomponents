import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';

import '/components/f_t_control/f_t_tooltip/f_t_tooltip_widget.dart';

import 'dart:ui';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'f_t_date_picker_model.dart';
import 'package:flutter/cupertino.dart';

class FTDatePickerWidget extends StatefulWidget {
  const FTDatePickerWidget({
    super.key,
    this.tooltipText,
    this.labelText,
    this.onDateChange,
  });

  final String? tooltipText;
  final String? labelText;
  final Future Function(String changedDate)? onDateChange;

  @override
  State<FTDatePickerWidget> createState() => _FTDatePickerWidgetState();
}

class _FTDatePickerWidgetState extends State<FTDatePickerWidget> {
  late FTDatePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTDatePickerModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.textFieldMask = MaskTextInputFormatter(mask: '##/##/####');
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
        width: 250,
        height: 70,
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
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).onSurface,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
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
            Container(
              height: 36,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).outline,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 200,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 0),
                          () async {
                            safeSetState(() {
                              _model.textController?.text =
                                  _model.textController.text;
                              _model.textFieldMask.updateMask(
                                newValue: TextEditingValue(
                                  text: _model.textController!.text,
                                ),
                              );
                            });
                            await widget.onDateChange?.call(
                              _model.textController.text,
                            );
                          },
                        ),
                        autofocus: false,
                        readOnly: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'DD/MM/YYYY',
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelSmallFamily,
                                color: FlutterFlowTheme.of(context)
                                    .onSurfaceVariant,
                                letterSpacing: 0.0,
                                fontStyle: FontStyle.italic,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelSmallIsCustom,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          hoverColor:
                              FlutterFlowTheme.of(context).inverseOnSurface,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).onSurface,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                        keyboardType: TextInputType.datetime,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                        inputFormatters: [_model.textFieldMask],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final _datePickedDate = await showDatePicker(
                          context: context,
                          initialDate: getCurrentTimestamp,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2050),
                          builder: (context, child) {
                            return wrapInMaterialDatePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).onPrimary,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineLargeFamily,
                                    fontSize: 32,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .headlineLargeIsCustom,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context).surface,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).onSurface,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).onPrimary,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              iconSize: 24,
                            );
                          },
                        );

                        if (_datePickedDate != null) {
                          safeSetState(() {
                            _model.datePicked = DateTime(
                              _datePickedDate.year,
                              _datePickedDate.month,
                              _datePickedDate.day,
                            );
                          });
                        } else if (_model.datePicked != null) {
                          safeSetState(() {
                            _model.datePicked = getCurrentTimestamp;
                          });
                        }
                        safeSetState(() {
                          _model.textController?.text =
                              dateTimeFormat("d/M/y", _model.datePicked);
                          _model.textFieldMask.updateMask(
                            newValue: TextEditingValue(
                              text: _model.textController!.text,
                            ),
                          );
                        });
                        await widget.onDateChange?.call(
                          _model.textController.text,
                        );
                      },
                      child: Icon(
                        Icons.calendar_month,
                        color: FlutterFlowTheme.of(context).onSurfaceVariant,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
