
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_button_model.dart';
export 'f_t_button_model.dart';

class FTButtonWidget extends StatefulWidget {
  const FTButtonWidget({
    super.key,
    this.onPressed,
    this.onLongPress,
  });

  final Future Function()? onPressed;
  final Future Function()? onLongPress;

  @override
  State<FTButtonWidget> createState() => _FTButtonWidgetState();
}

class _FTButtonWidgetState extends State<FTButtonWidget> {
  late FTButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTButtonModel());

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
        text: 'Button',
        options: FFButtonOptions(
          height: 40.0,
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: FlutterFlowTheme.of(context).primary,
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                color: FlutterFlowTheme.of(context).info,
                letterSpacing: 0.0,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).titleSmallIsCustom,
              ),
          elevation: 0.0,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
