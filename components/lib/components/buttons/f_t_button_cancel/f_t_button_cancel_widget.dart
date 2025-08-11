
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_button_cancel_model.dart';
export 'f_t_button_cancel_model.dart';

class FTButtonCancelWidget extends StatefulWidget {
  const FTButtonCancelWidget({
    super.key,
    this.onPressed,
    this.onLongPress,
  });

  final Future Function()? onPressed;
  final Future Function()? onLongPress;

  @override
  State<FTButtonCancelWidget> createState() => _FTButtonCancelWidgetState();
}

class _FTButtonCancelWidgetState extends State<FTButtonCancelWidget> {
  late FTButtonCancelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTButtonCancelModel());

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
        text: 'Cancel',
        icon: Icon(
          Icons.cancel_outlined,
          size: 22.0,
        ),
        options: FFButtonOptions(
          height: 35.0,
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 12.0, 0.0),
          iconAlignment: IconAlignment.start,
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          iconColor: FlutterFlowTheme.of(context).secondaryText,
          color: FlutterFlowTheme.of(context).secondaryBackground,
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 14.0,
                letterSpacing: 0.0,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).titleSmallIsCustom,
              ),
          elevation: 0.0,
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).secondaryText,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
          hoverBorderSide: BorderSide(
            color: FlutterFlowTheme.of(context).tertiary,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
