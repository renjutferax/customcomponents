import '/components/f_t_control/f_t_tooltip/f_t_tooltip_widget.dart';

import 'package:flutterflow_theme/flutter_flow/flutter_flow_radio_button.dart';
import 'package:flutterflow_theme/flutterflow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_widgets.dart';

import 'package:flutterflow_theme/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:ui';
import 'f_t_radiobutton_widget.dart' show FTRadiobuttonWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FTRadiobuttonModel extends FlutterFlowModel<FTRadiobuttonWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for FTTooltip component.
  late FTTooltipModel fTTooltipModel;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {
    fTTooltipModel = createModel(context, () => FTTooltipModel());
  }

  @override
  void dispose() {
    fTTooltipModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
