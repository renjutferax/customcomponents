import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';

import '/components/f_t_control/f_t_tooltip/f_t_tooltip_widget.dart';

import 'dart:ui';
import 'f_t_toggle_widget.dart' show FTToggleWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FTToggleModel extends FlutterFlowModel<FTToggleWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for FTTooltip component.
  late FTTooltipModel fTTooltipModel;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {
    fTTooltipModel = createModel(context, () => FTTooltipModel());
  }

  @override
  void dispose() {
    fTTooltipModel.dispose();
  }
}
