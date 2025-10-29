
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_buttom_model.dart';
export 'f_t_buttom_model.dart';

class FTButtomWidget extends StatefulWidget {
  const FTButtomWidget({
    super.key,
    required this.fillcolor,
    required this.icon,
    required this.textcolor,
    required this.text,
    required this.hoverfillcolor,
    required this.hovertextcolor,
    required this.onTap,
  });

  final Color? fillcolor;
  final Widget? icon;
  final Color? textcolor;
  final String? text;
  final Color? hoverfillcolor;
  final Color? hovertextcolor;
  final Future Function()? onTap;

  @override
  State<FTButtomWidget> createState() => _FTButtomWidgetState();
}

class _FTButtomWidgetState extends State<FTButtomWidget> {
  late FTButtomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTButtomModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
        print('button pressed ...');
      },
      text: widget!.text!,
      icon: widget!.icon,
      options: FFButtonOptions(
        width: double.infinity,
        height: 40,
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
        iconAlignment: IconAlignment.start,
        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
        color: valueOrDefault<Color>(
          widget!.fillcolor,
          FlutterFlowTheme.of(context).surface,
        ),
        textStyle: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
              color: valueOrDefault<Color>(
                widget!.textcolor,
                FlutterFlowTheme.of(context).onSurface,
              ),
              letterSpacing: 0.0,
              fontWeight: FontWeight.w600,
              useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
            ),
        elevation: 0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).outline,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
        hoverColor: valueOrDefault<Color>(
          widget!.hoverfillcolor,
          FlutterFlowTheme.of(context).primary,
        ),
        hoverTextColor: valueOrDefault<Color>(
          widget!.hovertextcolor,
          FlutterFlowTheme.of(context).onPrimary,
        ),
        hoverElevation: 2,
      ),
      showLoadingIndicator: false,
    );
  }
}
