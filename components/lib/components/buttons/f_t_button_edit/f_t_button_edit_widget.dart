
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_button_edit_model.dart';
export 'f_t_button_edit_model.dart';

class FTButtonEditWidget extends StatefulWidget {
  const FTButtonEditWidget({
    super.key,
    this.onPressed,
    this.onLongPress,
  });

  final Future Function()? onPressed;
  final Future Function()? onLongPress;

  @override
  State<FTButtonEditWidget> createState() => _FTButtonEditWidgetState();
}

class _FTButtonEditWidgetState extends State<FTButtonEditWidget> {
  late FTButtonEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTButtonEditModel());

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
        text: 'Edit',
        icon: Icon(
          Icons.edit,
          size: 22,
        ),
        options: FFButtonOptions(
          height: 35,
          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 12, 0),
          iconAlignment: IconAlignment.start,
          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          iconColor: FlutterFlowTheme.of(context).secondaryText,
          color: FlutterFlowTheme.of(context).secondaryBackground,
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                color: FlutterFlowTheme.of(context).secondaryText,
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
