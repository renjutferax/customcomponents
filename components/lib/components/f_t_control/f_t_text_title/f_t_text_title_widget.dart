import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';

import '/components/f_t_control/f_t_tooltip/f_t_tooltip_widget.dart';

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_text_title_model.dart';
export 'f_t_text_title_model.dart';

class FTTextTitleWidget extends StatefulWidget {
  const FTTextTitleWidget({
    super.key,
    this.tooltipText,
    this.labelText,
    this.semanticsLabel,
  });

  final String? tooltipText;
  final String? labelText;
  final String? semanticsLabel;

  @override
  State<FTTextTitleWidget> createState() => _FTTextTitleWidgetState();
}

class _FTTextTitleWidgetState extends State<FTTextTitleWidget> {
  late FTTextTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTTextTitleModel());

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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
          child: Text(
            valueOrDefault<String>(
              widget!.labelText,
              'text',
            ),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                  color: FlutterFlowTheme.of(context).onSurface,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).titleLargeIsCustom,
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
