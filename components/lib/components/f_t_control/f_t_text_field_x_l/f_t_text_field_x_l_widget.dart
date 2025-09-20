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
import 'f_t_text_field_x_l_model.dart';
export 'f_t_text_field_x_l_model.dart';

class FTTextFieldXLWidget extends StatefulWidget {
  const FTTextFieldXLWidget({
    super.key,
    this.hintText,
    this.tooltipText,
    this.labelText,
    this.onSubmitted,
    this.onChanged,
    required this.onEditingComplete,
  });

  final String? hintText;
  final String? tooltipText;
  final String? labelText;
  final Future Function(String submittedText)? onSubmitted;
  final Future Function(String changedText)? onChanged;
  final Future Function(String changedValue)? onEditingComplete;

  @override
  State<FTTextFieldXLWidget> createState() => _FTTextFieldXLWidgetState();
}

class _FTTextFieldXLWidgetState extends State<FTTextFieldXLWidget> {
  late FTTextFieldXLModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTTextFieldXLModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() async {
      await widget.onEditingComplete?.call(_model.textController.text);
    });
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
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  child: Text(
                    valueOrDefault<String>(widget!.labelText, 'text'),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
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
                  child: FTTooltipWidget(tooltipText: widget!.tooltipText),
                ),
              ],
            ),
     
          Container(
                width: 200,
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  onChanged:
                      (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 0
                        ),
                        () async {
                          safeSetState(() {
                            _model.textController?.text =
                                _model.textController.text;
                          });
                          unawaited(() async {
                            await widget.onChanged?.call(
                              _model.textController.text,
                            );
                          }());
                        },
                      ),
                  onFieldSubmitted: (_) async {
                    safeSetState(() {
                      _model.textController?.text = _model.textController.text;
                    });
                    unawaited(() async {
                      await widget.onSubmitted?.call(
                        _model.textController.text,
                      );
                    }());
                  },
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: widget!.hintText,
                    hintStyle: FlutterFlowTheme.of(
                      context,
                    ).labelMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).labelMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).labelMediumIsCustom,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).outline,
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
                    fillColor: FlutterFlowTheme.of(context).surface,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).onBackground,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
                  maxLines: null,
                  minLines: 2,
                  keyboardType: TextInputType.multiline,
                  cursorColor: FlutterFlowTheme.of(context).primary,
                  validator: _model.textControllerValidator.asValidator(
                    context,
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
