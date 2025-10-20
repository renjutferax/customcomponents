import 'package:components/app_state.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';

import '/components/f_t_control/f_t_tooltip/f_t_tooltip_widget.dart';

import 'dart:async';
import 'dart:ui';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_text_field_model.dart';
export 'f_t_text_field_model.dart';

class FTTextFieldWidget extends StatefulWidget {
  const FTTextFieldWidget({
    super.key,
    this.hintText,
    this.tooltipText,
    this.labelText,
    this.width,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.semanticsLabel,
    this.validationMessage,
    this.validationMessages,
  });

  final String? hintText;
  final String? tooltipText;
  final String? labelText;
  final double? width;
  final Future Function(String changedText)? onChanged;
  final Future Function(String submittedText)? onSubmitted;
  final Future Function(String completedText)? onEditingComplete;
  final String? semanticsLabel;
  final String? validationMessage;
  final List<String>? validationMessages;

  @override
  State<FTTextFieldWidget> createState() => _FTTextFieldWidgetState();
}

class _FTTextFieldWidgetState extends State<FTTextFieldWidget> {
  late FTTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTTextFieldModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        await widget.onEditingComplete?.call(
          _model.textController.text,
        );
      },
    );
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
      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 2),
      child: Container(
        width: valueOrDefault<double>(
          widget!.width,
          250.0,
        ),
        height: 90,
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
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                    child: Semantics(
                      label: widget!.semanticsLabel!,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 0),
                          () async {
                            unawaited(
                              () async {
                                await widget.onChanged?.call(
                                  _model.textController.text,
                                );
                              }(),
                            );
                          },
                        ),
                        onFieldSubmitted: (_) async {
                          unawaited(
                            () async {
                              await widget.onSubmitted?.call(
                                _model.textController.text,
                              );
                            }(),
                          );
                        },
                        autofocus: false,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: widget!.hintText,
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
                              color: widget!.validationMessages?.contains(
                                          widget!.validationMessage) ==
                                      true
                                  ? Color(0xFFFF0606)
                                  : FlutterFlowTheme.of(context).outline,
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
                              color: widget!.validationMessages?.contains(
                                          widget!.validationMessage) ==
                                      true
                                  ? Color(0xFFFF0606)
                                  : FlutterFlowTheme.of(context).outline,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget!.validationMessages?.contains(
                                          widget!.validationMessage) ==
                                      true
                                  ? Color(0xFFFF0606)
                                  : FlutterFlowTheme.of(context).outline,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).surface,
                          hoverColor:
                              FlutterFlowTheme.of(context).inverseOnSurface,
                        ),
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelMediumIsCustom,
                                ),
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (widget!.validationMessages
                          ?.contains(widget!.validationMessage) ==
                      true)
                    Text(
                      widget!.validationMessage!,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            color: FlutterFlowTheme.of(context).error,
                            letterSpacing: 0.0,
                            fontStyle: FontStyle.italic,
                            useGoogleFonts:
                                !FlutterFlowTheme.of(context).bodySmallIsCustom,
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