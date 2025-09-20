// Automatic FlutterFlow imports

import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutterflow_theme/flutter_flow/keep_alive_wrapper.dart';

import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:expandable/expandable.dart';


// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

class FTGrid extends StatefulWidget {
  FTGrid({super.key, required this.gridconfig});

  final AutocompleteConfigGrid gridconfig;
  @override
  State<FTGrid> createState() => _FTGridState();
}

final List<String> options = [""];
List<ExpandableController> _controllers = [];
bool isDropdownExpanded = false;

class _FTGridState extends State<FTGrid> {
  @override
  void initState() {
    _controllers = List.generate(options.length, (_) => ExpandableController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Material(
          color: Colors.transparent,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
              //  color: FlutterFlowTheme.of(context).borderColor,
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [_buildHeader()],
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24,
                          ),
                          onPressed: () {
                            setState(() {
                              isDropdownExpanded = !isDropdownExpanded;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (isDropdownExpanded) _buildFieldSelector(),
                Container(
                  constraints: BoxConstraints(maxHeight: 300),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      final item = options.elementAt(index);
                      return ExpandableNotifier(
                        controller: _controllers[index],
                        child: ExpandablePanel(
                          header: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            child: Row(
                              children: widget.gridconfig.fieldOrder
                                  .where(
                                    (f) =>
                                        widget.gridconfig.fieldVisibility[f]!,
                                  )
                                  .map(
                                    (f) => Expanded(
                                      flex: widget.gridconfig.fieldFlex[f] ?? 1,
                                      child: widget.gridconfig.getFieldValue!(
                                          item, f),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          collapsed: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Collapsed body text',
                                style: FlutterFlowTheme.of(
                                  context,
                                ).bodyMedium.override(
                                      fontFamily: FlutterFlowTheme.of(
                                        context,
                                      ).bodyMediumFamily,
                                      color: Color(0x8A000000),
                                      fontSize: 0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: !FlutterFlowTheme.of(
                                        context,
                                      ).bodyMediumIsCustom,
                                    ),
                              ),
                            ],
                          ),
                          expanded: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.25,
                                constraints: BoxConstraints(minHeight: 65),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(
                                    context,
                                  ).secondaryBackground,
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment(-1, 0),
                                      child: TabBar(
                                        isScrollable: true,
                                        tabAlignment: TabAlignment.start,
                                        labelColor: FlutterFlowTheme.of(
                                          context,
                                        ).primary,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(
                                          context,
                                        ).secondaryText,
                                        labelStyle: FlutterFlowTheme.of(
                                          context,
                                        ).titleMedium.override(
                                              fontFamily: FlutterFlowTheme.of(
                                                context,
                                              ).titleMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(
                                                context,
                                              ).titleMediumIsCustom,
                                            ),
                                        unselectedLabelStyle:
                                            FlutterFlowTheme.of(
                                          context,
                                        ).titleSmall.override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                    context,
                                                  ).titleSmallFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                    context,
                                                  ).titleSmallIsCustom,
                                                ),
                                        indicatorColor: FlutterFlowTheme.of(
                                          context,
                                        ).primary,
                                        tabs: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  0,
                                                  0,
                                                  8,
                                                  0,
                                                ),
                                                child: Icon(Icons.list),
                                              ),
                                              Tab(text: 'Specification'),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  0,
                                                  0,
                                                  8,
                                                  0,
                                                ),
                                                child: Icon(
                                                  Icons.workspaces_sharp,
                                                ),
                                              ),
                                              Tab(text: 'Workflow'),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  0,
                                                  0,
                                                  8,
                                                  0,
                                                ),
                                                child: Icon(
                                                  Icons.wechat_outlined,
                                                ),
                                              ),
                                              Tab(text: 'Office Chat'),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  0,
                                                  0,
                                                  8,
                                                  0,
                                                ),
                                                child: Icon(Icons.groups_2),
                                              ),
                                              Tab(text: 'Collab'),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  0,
                                                  0,
                                                  8,
                                                  0,
                                                ),
                                                child: Icon(
                                                  Icons.cameraswitch_sharp,
                                                ),
                                              ),
                                              Tab(text: 'Activity'),
                                            ],
                                          ),
                                        ],
                                        // controller: _model
                                        //     .tabBarController1,
                                        onTap: (i) async {
                                          [
                                            () async {},
                                            () async {},
                                            () async {},
                                            () async {},
                                            () async {},
                                          ][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        // controller: _model
                                        //     .tabBarController1,
                                        children: [
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [],
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [],
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [],
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [],
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          theme: ExpandableThemeData(
                            tapHeaderToExpand: true,
                            tapBodyToExpand: false,
                            tapBodyToCollapse: false,
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            hasIcon: true,
                          ),
                        ),
                      );
                      // return Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 6),
                      //   child: Row(
                      //     children: config!.fieldOrder!
                      //         .where((f) => config!.fieldVisibility![f]!)
                      //         .map(
                      //           (f) => Expanded(
                      //             flex: config!.fieldFlex![f] ?? 1,
                      //             child: config!.getFieldValue!(item, f ),
                      //           ),
                      //         )
                      //         .toList(),
                      //   ),
                      // );
                    },
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        setState(() {
                          options.add("");
                          _controllers.add(
                            ExpandableController(initialExpanded: false),
                          );
                        });
                      },
                      text: 'Add New Item',
                      icon: Icon(Icons.add, size: 15),
                      options: FFButtonOptions(
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconColor: FlutterFlowTheme.of(context).primary,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(
                          context,
                        ).titleSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 16,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .titleSmallIsCustom,
                            ),
                        elevation: 0,
                        borderRadius: BorderRadius.circular(8),
                        hoverElevation: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Row(
              children: widget.gridconfig.fieldOrder!
                  .where((f) => widget.gridconfig.fieldVisibility![f]!)
                  .map(
                    (f) => Expanded(
                      flex: widget.gridconfig.fieldFlex![f] ?? 1,
                      child: Text(
                        widget.gridconfig.fieldLabels![f]!,
                        style: FlutterFlowTheme.of(
                          context,
                        ).titleMedium.override(
                              fontFamily: FlutterFlowTheme.of(
                                context,
                              ).titleMediumFamily,
                              color: FlutterFlowTheme.of(context).info,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(
                                context,
                              ).titleMediumIsCustom,
                            ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            // Positioned(
            //   top: 0,
            //   right: 0,
            //   child: IconButton(
            //     icon: const Icon(Icons.info_outline),
            //     onPressed: () {
            //       setState(() {
            //       //  isDropdownExpanded = !isDropdownExpanded;
            //       });
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldSelector() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: 200,
        width: 600,
        margin: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.grey[100],
        child: ReorderableListView(
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) newIndex--;
              final item = widget.gridconfig.fieldOrder.removeAt(oldIndex);
              widget.gridconfig.fieldOrder.insert(newIndex, item);
            });
          },
          children: [
            for (final f in widget.gridconfig.fieldOrder)
              ListTile(
                key: ValueKey(f),
                title: Text(widget.gridconfig.fieldLabels[f]!),
                leading: Checkbox(
                  value: widget.gridconfig.fieldVisibility[f],
                  onChanged: (v) {
                    setState(() {
                      widget.gridconfig.fieldVisibility[f] = v!;
                    });
                  },
                ),
                trailing: const Icon(Icons.drag_handle),
              ),
          ],
        ),
      ),
    );
  }
}

class AutocompleteConfigGrid {
  // final Future<List<dynamic>> Function(String search, int page, int pageSize)
  // fetchItems;
  final Map<String, String> fieldLabels;
  final List<String> fieldOrder;
  final Map<String, bool> fieldVisibility;
  final Map<String, int> fieldFlex;

  final String Function(dynamic item) displayStringForOption;
  final Widget Function(dynamic item, String field)? getFieldValue;
  final Map<String, dynamic> Function(dynamic item) convertToMap;
  final Function(Map<String, dynamic>) onSelected;

  AutocompleteConfigGrid({
    // required this.fetchItems,
    required this.displayStringForOption,
    required this.getFieldValue,
    required this.convertToMap,
    required this.onSelected,
    required this.fieldLabels,
    required this.fieldOrder,
    required this.fieldVisibility,
    required this.fieldFlex,
  });
}
