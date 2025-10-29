import 'package:flutterflow_theme/flutter_flow/flutter_flow_model.dart';

import '/components/f_t_control/f_t_text_sub_title/f_t_text_sub_title_widget.dart';

import 'dart:ui';
import 'help_menu_widget.dart' show HelpMenuWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HelpMenuModel extends FlutterFlowModel<HelpMenuWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for FTTextSubTitle component.
  late FTTextSubTitleModel fTTextSubTitleModel;

  @override
  void initState(BuildContext context) {
    fTTextSubTitleModel = createModel(context, () => FTTextSubTitleModel());
  }

  @override
  void dispose() {
    fTTextSubTitleModel.dispose();
  }
}
