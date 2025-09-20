
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_icon_button.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_t_button_menu2_model.dart';
export 'f_t_button_menu2_model.dart';

class FTButtonMenu2Widget extends StatefulWidget {
  const FTButtonMenu2Widget({
    super.key,
    this.onPressed,
    this.onLongPress,
  });

  final Future Function()? onPressed;
  final Future Function()? onLongPress;

  @override
  State<FTButtonMenu2Widget> createState() => _FTButtonMenu2WidgetState();
}

class _FTButtonMenu2WidgetState extends State<FTButtonMenu2Widget> {
  late FTButtonMenu2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FTButtonMenu2Model());

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
      icon: Icon(
        Icons.keyboard_control,
        color: FlutterFlowTheme.of(context).onSurface,
      ),
      showLoadingIndicator: true,
      onPressed: () async {
       // context.pop();
      },
    );
  }
}
