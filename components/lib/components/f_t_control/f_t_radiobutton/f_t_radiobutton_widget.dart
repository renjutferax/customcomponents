import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_radio_button.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:flutterflow_theme/flutter_flow/form_field_controller.dart';

import '/components/f_t_control/f_t_tooltip/f_t_tooltip_widget.dart';

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_radiobutton_model.dart';
export 'f_t_radiobutton_model.dart';

class FTRadiobuttonWidget extends StatefulWidget {
  const FTRadiobuttonWidget({
    super.key,
    this.tooltipText,
    this.labelText,
    required this.optionList,
    required this.onSelected,
    this.width,
  });

  final String? tooltipText;
  final String? labelText;
  final List<String>? optionList;
  final Future Function(String selectedOption)? onSelected;
  final double? width;

  @override
  State<FTRadiobuttonWidget> createState() => _FTRadiobuttonWidgetState();
}

class _FTRadiobuttonWidgetState extends State<FTRadiobuttonWidget> {
  late FTRadiobuttonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTRadiobuttonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
      child: Container(
        width: valueOrDefault<double>(
          widget!.width,
          250.0,
        ),
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  child: Text(
                    valueOrDefault<String>(
                      widget!.labelText,
                      'text',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).onSurface,
                          fontSize: 14,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
              child: FlutterFlowRadioButton(
                options: widget!.optionList!.toList(),
                onChanged: (val) async {
                  safeSetState(() {});
                  safeSetState(() {
                    _model.radioButtonValueController?.value =
                        _model.radioButtonValue!;
                  });
                  unawaited(
                    () async {
                      await widget.onSelected?.call(
                        _model.radioButtonValue!,
                      );
                    }(),
                  );
                },
                controller: _model.radioButtonValueController ??=
                    FormFieldController<String>(null),
                optionHeight: 28,
                textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).labelMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).labelMediumIsCustom,
                    ),
                selectedTextStyle: FlutterFlowTheme.of(context)
                    .bodyMedium
                    .override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
                textPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                buttonPosition: RadioButtonPosition.left,
                direction: Axis.horizontal,
                radioButtonColor: FlutterFlowTheme.of(context).primary,
                inactiveRadioButtonColor:
                    FlutterFlowTheme.of(context).secondaryText,
                toggleable: true,
                horizontalAlignment: WrapAlignment.start,
                verticalAlignment: WrapCrossAlignment.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
