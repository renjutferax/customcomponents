
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_button_print_model.dart';
export 'f_t_button_print_model.dart';

class FTButtonPrintWidget extends StatefulWidget {
  const FTButtonPrintWidget({
    super.key,
    this.onPressed,
    this.onLongPress,
  });

  final Future Function()? onPressed;
  final Future Function()? onLongPress;

  @override
  State<FTButtonPrintWidget> createState() => _FTButtonPrintWidgetState();
}

class _FTButtonPrintWidgetState extends State<FTButtonPrintWidget> {
  late FTButtonPrintModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTButtonPrintModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onLongPress: () async {
        unawaited(
          () async {
            await widget.onLongPress?.call();
          }(),
        );
      },
      child: FFButtonWidget(
        onPressed: () async {
          unawaited(
            () async {
              await widget.onPressed?.call();
            }(),
          );
        },
        text: 'Print',
        icon: Icon(
          Icons.print,
          size: 22,
        ),
        options: FFButtonOptions(
          height: 35,
          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 12, 0),
          iconAlignment: IconAlignment.start,
          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          iconColor: FlutterFlowTheme.of(context).info,
          color: FlutterFlowTheme.of(context).success,
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                color: FlutterFlowTheme.of(context).info,
                fontSize: 14,
                letterSpacing: 0.0,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).titleSmallIsCustom,
              ),
          elevation: 0,
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).secondaryText,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
          hoverBorderSide: BorderSide(
            color: FlutterFlowTheme.of(context).tertiary,
            width: 1,
          ),
        ),
      ),
    );
  }
}