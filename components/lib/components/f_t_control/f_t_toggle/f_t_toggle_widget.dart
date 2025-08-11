import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';

import '/components/f_t_control/f_t_tooltip/f_t_tooltip_widget.dart';

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_toggle_model.dart';
export 'f_t_toggle_model.dart';

class FTToggleWidget extends StatefulWidget {
  const FTToggleWidget({
    super.key,
    this.tooltipText,
    this.labelText,
    String? activeStateText,
    String? inactiveStateText,
  })  : this.activeStateText = activeStateText ?? 'Yes',
        this.inactiveStateText = inactiveStateText ?? 'No';

  final String? tooltipText;
  final String? labelText;
  final String activeStateText;
  final String inactiveStateText;

  @override
  State<FTToggleWidget> createState() => _FTToggleWidgetState();
}

class _FTToggleWidgetState extends State<FTToggleWidget> {
  late FTToggleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTToggleModel());

    _model.switchValue = false;
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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 10.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget!.labelText,
                    'text',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 14.0,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 10.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget!.inactiveStateText,
                    'No',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
              ),
              Switch.adaptive(
                value: _model.switchValue!,
                onChanged: (newValue) async {
                  safeSetState(() => _model.switchValue = newValue!);
                },
                activeColor: FlutterFlowTheme.of(context).primary,
                activeTrackColor: FlutterFlowTheme.of(context).primary,
                inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                inactiveThumbColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 10.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget!.activeStateText,
                    'Yes',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
