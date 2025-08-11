// Automatic FlutterFlow imports
import 'package:components/custom_code/widgets/f_t_search_widget_normal.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_util.dart';

import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:aligned_tooltip/aligned_tooltip.dart';

import 'package:google_fonts/google_fonts.dart';

/// Set your widget name, define your parameter, and then add the boilerplate
/// code using the green button on the right!
class FTSearchWidgetGrid extends StatefulWidget {
  const FTSearchWidgetGrid({
    super.key,
    this.hintText,
    this.tooltipText,
    this.labelText,
    this.width,
    this.onChanged,
    this.onSubmitted,
    required this.config,
  });

  final String? hintText;
  final String? tooltipText;
  final String? labelText;
  final double? width;
  final Future Function(String changedText)? onChanged;
  final Future Function(String submittedText)? onSubmitted;
  final AutocompleteConfig config; // Changed to non-generic

  @override
  State<FTSearchWidgetGrid> createState() => _FTSearchWidgetGridState();
}

class _FTSearchWidgetGridState extends State<FTSearchWidgetGrid> {
  late AutocompleteConfig config;

  @override
  void initState() {
    super.initState();

    config =
        widget.config ??
        AutocompleteConfig(
          fetchItems: (String search, int page, int pageSize) async => [],
          displayStringForOption: (_) => '',
          getFieldValue: (_, __) => '',
          convertToMap: (_) => {},
          onSelected: (_) {},
          fieldLabels: const {},
          fieldOrder: const [],
          fieldVisibility: const {},
          fieldFlex: const {},
        );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
      child: Container(
        width: valueOrDefault<double>(widget.width, 250.0),
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(
                        //   color: FlutterFlowTheme.of(context).borderColor,
                      ),
                    ),
                    child: GenericAutocompletePage(
                      config: config!,
                      hintText: widget.hintText,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GenericAutocompletePage extends StatefulWidget {
  AutocompleteConfig? config;
  final String? hintText;

  GenericAutocompletePage({super.key, this.config, this.hintText});

  @override
  State<GenericAutocompletePage> createState() =>
      _GenericAutocompletePageState();
}

class _GenericAutocompletePageState extends State<GenericAutocompletePage> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _textEditingController;
  List<dynamic> options = [];
  int _currentPage = 1;
  final int pageSize = 20;
  bool _hasMore = true;
  bool isDropdownExpanded = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_isLoading &&
          _hasMore) {
        _fetchMoreData();
      }
    });
    _fetchMoreData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchMoreData() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    try {
      final newItems = await widget.config!.fetchItems!(
        _textEditingController.text.trim(),
        _currentPage,
        pageSize,
      );

      setState(() {
        options.addAll(newItems);
        if (newItems.length < pageSize) {
          _hasMore = false;
        } else {
          _currentPage++;
        }
      });
    } finally {
      _isLoading = false;
    }
  }
 double getTotalFlexWidth() {
  final visibleFields = widget.config!.fieldOrder!
      .where((f) => widget.config!.fieldVisibility![f] == true)
      .toList();

  final totalFlex = visibleFields.fold<double>(
    0,
    (sum, f) => sum + (widget.config!.fieldFlex![f] ?? 1),
  );
  return totalFlex;
}

double getTotalPixelWidth(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
 final visibleFields = widget.config!.fieldOrder!
      .where((f) => widget.config!.fieldVisibility![f] == true)
      .toList();
  return visibleFields.fold<double>(
    0,
    (sum, col) {
      final percent = double.tryParse(widget.config!.fieldFlex![col]?.toString() ?? '0') ?? 0;
      return sum + (screenWidth * (percent / 100));
    },
  );
}


  @override
  Widget build(BuildContext context) {
 final totalUnits = getTotalFlexWidth();
  final totalwidth = (getTotalPixelWidth(context))+100;



    return Autocomplete<Object>(
      optionsBuilder: (TextEditingValue textEditingValue) async {
        if (textEditingValue.text.trim().isEmpty) {
          options = [];
          _currentPage = 1;
          _hasMore = true;
        }

        final newItems = await widget.config!.fetchItems!(
          textEditingValue.text,
          _currentPage,
          pageSize,
        );

        setState(() {
          options = newItems;
          if (newItems.length < pageSize) {
            _hasMore = false;
          }
        });

        return options.cast<Object>();
      },
      displayStringForOption:
          (Object option) => widget.config!.displayStringForOption!(option),
      onSelected: (Object selection) {
        widget.config!.onSelected!(widget.config!.convertToMap!(selection));
      },
      fieldViewBuilder: (context, controller, focusNode, _) {
        _textEditingController = controller;

        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            isDense: true,
            hintStyle: FlutterFlowTheme.of(context).labelSmall.override(
              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
              color: FlutterFlowTheme.of(context).outline,
              fontSize: 14.0,
              letterSpacing: 0.0,
              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).outline,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(0.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x00000000), width: 1.0),
              borderRadius: BorderRadius.circular(0.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(0.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(0.0),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            hoverColor: FlutterFlowTheme.of(context).inverseOnSurface,
            suffixIcon: SizedBox(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      _textEditingController.clear();
                      _currentPage = 1;
                    },
                  ),
                  IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                ],
              ),
            ),
          ),
          onChanged: (_) => _currentPage = 1,
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
   

        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width:totalUnits < 100 ? totalwidth :1500 ,
              padding: const EdgeInsets.all(8),
          
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Stack(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                       maxWidth:totalwidth ,
                     ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildHeader(),
                              const Divider(),
                              SizedBox(
                                height: 600,
                             //   width:10* MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: options.length + (_hasMore ? 1 : 0),
                                  itemBuilder: (context, index) {
                                    if (index == options.length && _hasMore) {
                                      return const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(16),
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    }
                                    final item = options.elementAt(index);
                                    return InkWell(
                                      onTap: () => onSelected(item),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                        ),
                                        child:Row(
                                          children:
                                              widget.config!.fieldOrder!
                                                  .where(
                                                    (f) =>
                                                        widget
                                                            .config!
                                                            .fieldVisibility![f]!,
                                                  )
                                                  .map(
                                                    (f) => SizedBox(

                                                      width:((MediaQuery.of(context).size.width * ( widget
                                                              .config!
                                                              .fieldFlex![f] ??
                                                          1)) / 100),
                                                      
                                                      child: Text(
                                                        widget
                                                            .config!
                                                            .getFieldValue!(item, f)
                                                            .toString(),
                                                             textAlign: TextAlign.left,
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                        ),
                          
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isDropdownExpanded)
                          Positioned(
                            top: 40,
                            right: 10,
                            child: _buildFieldSelector(),
                          ),
                      ],
                    ),
                  ),
                ),
        
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {

 final totalUnits = getTotalFlexWidth();
  final totalwidth = (getTotalPixelWidth(context))+100;
    return Container(
      width: totalwidth, 
      height: 50,
        decoration: BoxDecoration( 
                             color: FlutterFlowTheme.of(context).primary,
                             borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                             ),
                             ),
      padding: const EdgeInsets.only(top: 8),
      child: Stack(
        children: [
      Row(
            children:
                widget.config!.fieldOrder!
                    .where((f) => widget.config!.fieldVisibility![f]!)
                    .map(
                      (f) =>SizedBox(

                                                      width:((MediaQuery.of(context).size.width * ( widget
                                                              .config!
                                                              .fieldFlex![f] ??
                                                          1)) / 100),
                        child: Text(
                          widget.config!.fieldLabels![f]!,
                          style: FlutterFlowTheme.of(
                                    context,
                                  ).titleMedium.override(
                                    fontFamily:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).titleMediumFamily,
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(
                                          context,
                                        ).titleMediumIsCustom,
                                  ),
                                  textAlign: TextAlign.left,
                        ),
                      ),
                    )
                    .toList(),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                setState(() {
                  isDropdownExpanded = !isDropdownExpanded;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldSelector() {
    return Container(
      height: 200,
      width: 600,
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey[100],
      child: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex--;
            final item = widget.config!.fieldOrder!.removeAt(oldIndex);
            widget.config!.fieldOrder!.insert(newIndex, item);
          });
        },
        children: [
          for (final f in widget.config!.fieldOrder!)
            if (f != 'id')
              ListTile(
                key: ValueKey(f),
                title: Text(widget.config!.fieldLabels![f]!),
                leading: Checkbox(
                  value: widget.config!.fieldVisibility![f],
                  onChanged: (v) {
                    setState(() {
                      widget.config!.fieldVisibility![f] = v!;
                    });
                  },
                ),
                trailing: const Icon(Icons.drag_handle),
              ),
        ],
      ),
    );
  }
}

// class AutocompleteConfig {
//   final Future<List<dynamic>> Function(String search, int page, int pageSize)?
//       fetchItems;
//   final Map<String, String>? fieldLabels;
//   final List<String>? fieldOrder;
//   final Map<String, bool>? fieldVisibility;
//   final Map<String, int>? fieldFlex;

//   final String Function(dynamic item)? displayStringForOption;
//   final String Function(dynamic item, String field)? getFieldValue;
//   final Map<String, dynamic> Function(dynamic item)? convertToMap;
//   final Function(Map<String, dynamic>)? onSelected;

//   AutocompleteConfig({
//     this.fetchItems,
//     this.displayStringForOption,
//     this.getFieldValue,
//     this.convertToMap,
//     this.onSelected,
//     this.fieldLabels,
//     this.fieldOrder,
//     this.fieldVisibility,
//     this.fieldFlex,
//   });
// }
