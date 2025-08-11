
import 'dart:async';
import 'dart:ui';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_checkbox_model.dart';
export 'f_t_checkbox_model.dart';

class FTCheckboxWidget extends StatefulWidget {
  const FTCheckboxWidget({
    super.key,
    this.tooltipText,
    this.labelText,
    this.onCheckChanged,
  });

  final String? tooltipText;
  final String? labelText;
  final Future Function(bool newValue)? onCheckChanged;

  @override
  State<FTCheckboxWidget> createState() => _FTCheckboxWidgetState();
}

class _FTCheckboxWidgetState extends State<FTCheckboxWidget> {
  late FTCheckboxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTCheckboxModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
      child: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Theme(
                data: ThemeData(
                  checkboxTheme: CheckboxThemeData(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                ),
                child: Checkbox(
                  value: _model.checkboxValue ??= false,
                  onChanged: (newValue) async {
                    safeSetState(() => _model.checkboxValue = newValue!);
                    if (newValue!) {
                      safeSetState(() {
                        _model.checkboxValue = _model.checkboxValue!;
                      });
                      unawaited(
                        () async {
                          await widget.onCheckChanged?.call(
                            _model.checkboxValue!,
                          );
                        }(),
                      );
                    } else {
                      safeSetState(() {
                        _model.checkboxValue = _model.checkboxValue!;
                      });
                      unawaited(
                        () async {
                          await widget.onCheckChanged?.call(
                            _model.checkboxValue!,
                          );
                        }(),
                      );
                    }
                  },
                  side: (FlutterFlowTheme.of(context).alternate != null)
                      ? BorderSide(
                          width: 2,
                          color: FlutterFlowTheme.of(context).alternate!,
                        )
                      : null,
                  activeColor: FlutterFlowTheme.of(context).primary,
                  checkColor: FlutterFlowTheme.of(context).info,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget!.labelText,
                    'text',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).onSurface,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
              ),
              AlignedTooltip(
                content: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    widget!.tooltipText!,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                offset: 4.0,
                preferredDirection: AxisDirection.up,
                borderRadius: BorderRadius.circular(8.0),
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 4.0,
                tailBaseWidth: 24.0,
                tailLength: 12.0,
                waitDuration: Duration(milliseconds: 100),
                showDuration: Duration(milliseconds: 1500),
                triggerMode: TooltipTriggerMode.tap,
                child: Opacity(
                  opacity: 0.8,
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.info_outline,
                      color: FlutterFlowTheme.of(context).onSurfaceVariant,
                      size: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
