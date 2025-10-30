
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_icon_button.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_button_back_model.dart';
export 'f_t_button_back_model.dart';

class FTButtonBackWidget extends StatefulWidget {
  const FTButtonBackWidget({
    super.key,
    this.onPressed,
    this.onLongPress,
  });

  final Future Function()? onPressed;
  final Future Function()? onLongPress;

  @override
  State<FTButtonBackWidget> createState() => _FTButtonBackWidgetState();
}

class _FTButtonBackWidgetState extends State<FTButtonBackWidget> {
  late FTButtonBackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTButtonBackModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderColor: Colors.transparent,
      borderRadius: 30,
      borderWidth: 1,
      hoverIconColor: FlutterFlowTheme.of(context).primary,
      icon: Icon(
        Icons.arrow_back_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 30,
      ),
      onPressed: () async {
        await widget.onPressed?.call();
      },
    );
  }
}

