
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'f_t_text_field_grid_model.dart';
export 'f_t_text_field_grid_model.dart';

class FTTextFieldGridWidget extends StatefulWidget {
  const FTTextFieldGridWidget({
    super.key,
    this.width,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.focusNode,
    this.readOnly,
  });

  final double? width;
  final Future Function(String changedText)? onChanged;
  final Future Function(String submittedText)? onSubmitted;
  final String? controller;
  final String? focusNode;
  final bool? readOnly;

  @override
  State<FTTextFieldGridWidget> createState() => _FTTextFieldGridWidgetState();
}

class _FTTextFieldGridWidgetState extends State<FTTextFieldGridWidget> {
  late FTTextFieldGridModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTTextFieldGridModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
      child: Container(
        width: valueOrDefault<double>(
          widget!.width,
          250.0,
        ),
        height: 33.75,
        decoration: BoxDecoration(),
        child: Container(
          width: 200,
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
              safeSetState(() {
                _model.textController?.text = _model.textController.text;
              });
              unawaited(
                () async {
                  await widget.onSubmitted?.call(
                    _model.textController.text,
                  );
                }(),
              );
            },
            autofocus: false,
            readOnly: widget!.readOnly!,
            obscureText: false,
            decoration: InputDecoration(
              isDense: true,
              hintStyle: FlutterFlowTheme.of(context).labelSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                    color: FlutterFlowTheme.of(context).outline,
                    fontSize: 14,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).labelSmallIsCustom,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).outline,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              filled: true,
              fillColor: Colors.transparent,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).onSurface,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                ),
            cursorColor: FlutterFlowTheme.of(context).primaryText,
            validator: _model.textControllerValidator.asValidator(context),
          ),
        ),
      ),
    );
  }
}
