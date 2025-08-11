
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_text_field_normal_model.dart';
export 'f_t_text_field_normal_model.dart';

class FTTextFieldNormalWidget extends StatefulWidget {
  const FTTextFieldNormalWidget({
    super.key,
    this.width,
    this.onChanged,
    this.onSubmitted,
  });

  final double? width;
  final Future Function(String changedText)? onChanged;
  final Future Function(String submittedText)? onSubmitted;

  @override
  State<FTTextFieldNormalWidget> createState() =>
      _FTTextFieldNormalWidgetState();
}

class _FTTextFieldNormalWidgetState extends State<FTTextFieldNormalWidget> {
  late FTTextFieldNormalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTTextFieldNormalModel());

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
    return Container(
      width: valueOrDefault<double>(
        widget!.width,
        250.0,
      ),
      height: 33.75,
      decoration: BoxDecoration(),
      child: Container(
        width: 200.0,
        child: TextFormField(
          controller: _model.textController,
          focusNode: _model.textFieldFocusNode,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.textController',
            Duration(milliseconds: 0),
            () async {
              safeSetState(() {
                _model.textController?.text = _model.textController.text;
              });
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
          obscureText: false,
          decoration: InputDecoration(
            isDense: true,
            hintStyle: FlutterFlowTheme.of(context).labelSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                  color: FlutterFlowTheme.of(context).outline,
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).labelSmallIsCustom,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).outline,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(0.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(0.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(0.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(0.0),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                letterSpacing: 0.0,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).bodyMediumIsCustom,
              ),
          cursorColor: FlutterFlowTheme.of(context).primaryText,
          validator: _model.textControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
