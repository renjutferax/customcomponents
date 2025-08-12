import '/backend/schema/structs/index.dart';

import 'package:flutterflow_theme/flutter_flow/flutter_flow_drop_down.dart';
import 'package:flutterflow_theme/flutterflow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutterflow_theme/flutter_flow/form_field_controller.dart';
import 'f_t_dropdown_simple_copy_widget.dart' show FTDropdownSimpleCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FTDropdownSimpleCopyModel
    extends FlutterFlowModel<FTDropdownSimpleCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
