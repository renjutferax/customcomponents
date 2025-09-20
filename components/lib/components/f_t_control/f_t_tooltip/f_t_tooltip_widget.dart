import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_tooltip_model.dart';
export 'f_t_tooltip_model.dart';

class FTTooltipWidget extends StatefulWidget {
  const FTTooltipWidget({super.key, this.tooltipText});

  final String? tooltipText;

  @override
  State<FTTooltipWidget> createState() => _FTTooltipWidgetState();
}

class _FTTooltipWidgetState extends State<FTTooltipWidget> {
  late FTTooltipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTTooltipModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlignedTooltip(
      content: Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          widget!.tooltipText!,
          style: TextStyle(
            color: FlutterFlowTheme.of(context).onSurfaceVariant,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      offset: 4,
      preferredDirection: AxisDirection.up,
      borderRadius: BorderRadius.circular(8),
      backgroundColor: FlutterFlowTheme.of(context).surfaceVariant,
      elevation: 4,
      tailBaseWidth: 24,
      tailLength: 12,
      waitDuration: Duration(milliseconds: 100),
      showDuration: Duration(milliseconds: 1500),
      triggerMode: TooltipTriggerMode.tap,
      child: Opacity(
        opacity: 0.8,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.info_outline,
            color: FlutterFlowTheme.of(context).onSurfaceVariant,
            size: 18,
          ),
        ),
      ),
    );
  }
}
