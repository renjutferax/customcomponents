import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_text_field_amount_model.dart';
export 'f_t_text_field_amount_model.dart';

class FTTextFieldAmountWidget extends StatefulWidget {
  const FTTextFieldAmountWidget({
    super.key,
    this.hintText,
    this.tooltipText,
    this.labelText,
    this.width,
    this.onChanged,
    this.onSubmitted,
    this.currency,
    this.amount,
    this.onEditingComplete,
  });

  final String? hintText;
  final String? tooltipText;
  final String? labelText;
  final double? width;
  final Future Function(String changedText)? onChanged;
  final Future Function(String submittedText)? onSubmitted;
  final String? currency;
  final String? amount;
  final Future Function(String completedString)? onEditingComplete;

  @override
  State<FTTextFieldAmountWidget> createState() =>
      _FTTextFieldAmountWidgetState();
}

class _FTTextFieldAmountWidgetState extends State<FTTextFieldAmountWidget> {
  late FTTextFieldAmountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTTextFieldAmountModel());

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
    return Container(
      width: valueOrDefault<double>(
        widget!.width,
        250.0,
      ),
      decoration: BoxDecoration(),
      child: Semantics(
        label: 'fortesting',
        child: Container(
          width: 200,
          child: TextFormField(
            controller: _model.textController,
            focusNode: _model.textFieldFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.textController',
              Duration(milliseconds: 0),
              () async {
                await widget.onChanged?.call(
                  _model.textController.text,
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
              hintStyle: FlutterFlowTheme.of(context).labelSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                    color: FlutterFlowTheme.of(context).onSurfaceVariant,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).labelSmallIsCustom,
                  ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).outline,
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).surface,
              contentPadding: EdgeInsetsDirectional.fromSTEB(0, 8, 2, 8),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).onSurface,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                ),
            textAlign: TextAlign.end,
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            cursorColor: FlutterFlowTheme.of(context).primaryText,
            validator: _model.textControllerValidator.asValidator(context),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^\\d+\\.?\\d{0,3}'))
            ],
          ),
        ),
      ),
    );
  }
}
