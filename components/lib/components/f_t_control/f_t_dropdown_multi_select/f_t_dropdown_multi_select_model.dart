import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';
import 'package:flutterflow_theme/flutter_flow/form_field_controller.dart';

import '/backend/schema/structs/index.dart';
import '/components/f_t_control/f_t_tooltip/f_t_tooltip_widget.dart';

import 'dart:async';
import 'dart:ui';
import 'f_t_dropdown_multi_select_widget.dart' show FTDropdownMultiSelectWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FTDropdownMultiSelectModel
    extends FlutterFlowModel<FTDropdownMultiSelectWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for FTTooltip component.
  late FTTooltipModel fTTooltipModel;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    fTTooltipModel = createModel(context, () => FTTooltipModel());
  }

  @override
  void dispose() {
    fTTooltipModel.dispose();
  }
}
