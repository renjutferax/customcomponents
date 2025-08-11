import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';

import '/components/f_t_control/f_t_tooltip/f_t_tooltip_widget.dart';

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_text_sub_title_model.dart';
export 'f_t_text_sub_title_model.dart';

class FTTextSubTitleWidget extends StatefulWidget {
  const FTTextSubTitleWidget({
    super.key,
    this.tooltipText,
    this.labelText,
    this.color,
  });

  final String? tooltipText;
  final String? labelText;
  final Color? color;

  @override
  State<FTTextSubTitleWidget> createState() => _FTTextSubTitleWidgetState();
}

class _FTTextSubTitleWidgetState extends State<FTTextSubTitleWidget> {
  late FTTextSubTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTTextSubTitleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
          child: Text(
            valueOrDefault<String>(
              widget!.labelText,
              'text',
            ),
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                  color: FlutterFlowTheme.of(context).onSurface,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).titleSmallIsCustom,
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
    );
  }
}
