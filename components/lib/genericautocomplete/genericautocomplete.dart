import 'package:flutter/material.dart';
import 'package:flutterflow_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:my_custom_widgets_ferax/pages/genericautocomplete/genericautocompleteconfig.dart';

import 'genericautocompleteconfig.dart';

// class GenericAutocompletePage<T> extends StatefulWidget {
//   final AutocompleteConfig<T> config;
//   final hintText;

//   const GenericAutocompletePage({
//     super.key,
//     required this.config,
//     this.hintText,
//   });

//   @override
//   State<GenericAutocompletePage<T>> createState() =>
//       _GenericAutocompletePageState<T>();
// }

// class _GenericAutocompletePageState<T>
//     extends State<GenericAutocompletePage<T>> {
//   final ScrollController _scrollController = ScrollController();
//   late TextEditingController _textEditingController;
//   List<T> options = [];
//   int _currentPage = 1;
//   final int pageSize = 20;
//   bool _hasMore = true;
//   bool isDropdownExpanded = false;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _textEditingController = TextEditingController();
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels >=
//               _scrollController.position.maxScrollExtent &&
//           !_isLoading &&
//           _hasMore) {
//         _fetchMoreData();
//       }
//     });
//     _fetchMoreData();
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     //  _textEditingController.dispose();
//     super.dispose();
//   }

//   Future<void> _fetchMoreData() async {
//     if (_isLoading || !_hasMore) return;

//     _isLoading = true;
//     try {
//       final newItems = await widget.config.fetchItems(
//         _textEditingController.text.trim(),
//         _currentPage,
//         pageSize,
//       );

//       setState(() {
//         options.addAll(newItems);
//         if (newItems.length < pageSize) {
//           _hasMore = false;
//         } else {
//           _currentPage++;
//         }
//       });
//     } finally {
//       _isLoading = false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Autocomplete<Object>(
//       optionsBuilder: (TextEditingValue textEditingValue) async {
//         if (textEditingValue.text.trim().isEmpty) {
//           options = [];
//           _currentPage = 1;
//           _hasMore = true;
//         }

//         final newItems = await widget.config.fetchItems(
//           textEditingValue.text,
//           _currentPage,
//           pageSize,
//         );

//         setState(() {
//           options = newItems;
//           if (newItems.length < pageSize) {
//             _hasMore = false;
//           }
//         });

//         return options.cast<Object>();
//       },
//       displayStringForOption:
//           (Object option) => widget.config.displayStringForOption(option as T),
//       onSelected: (Object selection) {
//         widget.config.onSelected(widget.config.convertToMap(selection as T));
//       },
//       fieldViewBuilder: (context, controller, focusNode, _) {
//         _textEditingController = controller;

//         return TextFormField(
//           controller: controller,
//           focusNode: focusNode,
//           decoration: InputDecoration(
//             labelText: '',
//             isDense: true,
//             hintText: widget!.hintText,
//             hintStyle: FlutterFlowTheme.of(context).labelSmall.override(
//               fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
//               color: FlutterFlowTheme.of(context).borderColor,
//               letterSpacing: 0.0,
//               useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: FlutterFlowTheme.of(context).borderColor,
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Color(0x00000000), width: 1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: FlutterFlowTheme.of(context).error,
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: FlutterFlowTheme.of(context).error,
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             filled: true,
//             fillColor: FlutterFlowTheme.of(context).secondaryBackground,

//             suffixIcon: SizedBox(
//               width: 80,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.arrow_drop_down),
//                     onPressed: () {
//                       _textEditingController.clear();
//                       _currentPage = 1;
//                     },
//                   ),
//                   IconButton(icon: const Icon(Icons.search), onPressed: () {}),
//                 ],
//               ),
//             ),
//           ),
//           onChanged: (_) => _currentPage = 1,
//         );
//       },
//       optionsViewBuilder: (context, onSelected, options) {
//         return Align(
//           alignment: Alignment.topLeft,
//           child: Material(
//             elevation: 4,
//             child: Container(
//               height: MediaQuery.of(context).size.height / 2.5,
//               width: 600,
//               padding: const EdgeInsets.all(8),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildHeader(),
//                       if (isDropdownExpanded) _buildFieldSelector(),
//                       const Divider(),
//                       SizedBox(
//                         height: 600,
//                         width: 600,
//                         child: ListView.builder(
//                           controller: _scrollController,
//                           itemCount: options.length + (_hasMore ? 1 : 0),
//                           itemBuilder: (context, index) {
//                             if (index == options.length && _hasMore) {
//                               return const Center(
//                                 child: Padding(
//                                   padding: EdgeInsets.all(16),
//                                   child: CircularProgressIndicator(),
//                                 ),
//                               );
//                             }
//                             final item = options.elementAt(index);
//                             return InkWell(
//                               onTap: () => onSelected(item),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 6,
//                                 ),
//                                 child: Row(
//                                   children:
//                                       widget.config.fieldOrder
//                                           .where(
//                                             (f) =>
//                                                 widget
//                                                     .config
//                                                     .fieldVisibility[f]!,
//                                           )
//                                           .map(
//                                             (f) => Expanded(
//                                               flex:
//                                                   widget.config.fieldFlex[f] ??
//                                                   1,
//                                               child: Text(
//                                                 widget.config
//                                                     .getFieldValue(item as T, f)
//                                                     .toString(),
//                                               ),
//                                             ),
//                                           )
//                                           .toList(),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildHeader() {
//     return Container(
//       width: 600,
//       height: 50,
//       color: Colors.blueGrey[50],
//       padding: const EdgeInsets.all(8),
//       child: Stack(
//         children: [
//           Row(
//             children:
//                 widget.config.fieldOrder
//                     .where((f) => widget.config.fieldVisibility[f]!)
//                     .map(
//                       (f) => Expanded(
//                         flex: widget.config.fieldFlex[f] ?? 1,
//                         child: Text(
//                           widget.config.fieldLabels[f]!,
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     )
//                     .toList(),
//           ),
//           Positioned(
//             top: 0,
//             right: 0,
//             child: IconButton(
//               icon: const Icon(Icons.info_outline),
//               onPressed: () {
//                 setState(() {
//                   isDropdownExpanded = !isDropdownExpanded;
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFieldSelector() {
//     return Container(
//       height: 200,
//       width: 600,
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       color: Colors.grey[100],
//       child: ReorderableListView(
//         onReorder: (oldIndex, newIndex) {
//           setState(() {
//             if (newIndex > oldIndex) newIndex--;
//             final item = widget.config.fieldOrder.removeAt(oldIndex);
//             widget.config.fieldOrder.insert(newIndex, item);
//           });
//         },
//         children: [
//           for (final f in widget.config.fieldOrder)
//             ListTile(
//               key: ValueKey(f),
//               title: Text(widget.config.fieldLabels[f]!),
//               leading: Checkbox(
//                 value: widget.config.fieldVisibility[f],
//                 onChanged: (v) {
//                   setState(() {
//                     widget.config.fieldVisibility[f] = v!;
//                   });
//                 },
//               ),
//               trailing: const Icon(Icons.drag_handle),
//             ),
//         ],
//       ),
//     );
//   }
// }
class GenericAutocompletePage extends StatefulWidget {
  final AutocompleteConfig config;
  final String? hintText;

  const GenericAutocompletePage({
    super.key,
    required this.config,
    this.hintText,
  });

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
      final newItems = await widget.config.fetchItems(
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

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Object>(
      optionsBuilder: (TextEditingValue textEditingValue) async {
        if (textEditingValue.text.trim().isEmpty) {
          options = [];
          _currentPage = 1;
          _hasMore = true;
        }

        final newItems = await widget.config.fetchItems(
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
          (Object option) => widget.config.displayStringForOption(option),
      onSelected: (Object selection) {
        widget.config.onSelected(widget.config.convertToMap(selection));
      },
      fieldViewBuilder: (context, controller, focusNode, _) {
        _textEditingController = controller;

        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: '',
            isDense: true,
            hintText: widget.hintText,
            hintStyle: FlutterFlowTheme.of(context).labelSmall.override(
              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
              color: FlutterFlowTheme.of(context).outline,
              letterSpacing: 0.0,
              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).outline,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x00000000), width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
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
              width: 600,
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),
                      if (isDropdownExpanded) _buildFieldSelector(),
                      const Divider(),
                      SizedBox(
                        height: 600,
                        width: 600,
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
                                child: Row(
                                  children:
                                      widget.config.fieldOrder
                                          .where(
                                            (f) =>
                                                widget
                                                    .config
                                                    .fieldVisibility[f]!,
                                          )
                                          .map(
                                            (f) => Expanded(
                                              flex:
                                                  widget.config.fieldFlex[f] ??
                                                  1,
                                              child: Text(
                                                widget.config
                                                    .getFieldValue(item, f)
                                                    .toString(),
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
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      width: 600,
      height: 50,
      color: Colors.blueGrey[50],
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Row(
            children:
                widget.config.fieldOrder
                    .where((f) => widget.config.fieldVisibility[f]!)
                    .map(
                      (f) => Expanded(
                        flex: widget.config.fieldFlex[f] ?? 1,
                        child: Text(
                          widget.config.fieldLabels[f]!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
            final item = widget.config.fieldOrder.removeAt(oldIndex);
            widget.config.fieldOrder.insert(newIndex, item);
          });
        },
        children: [
          for (final f in widget.config.fieldOrder)
            ListTile(
              key: ValueKey(f),
              title: Text(widget.config.fieldLabels[f]!),
              leading: Checkbox(
                value: widget.config.fieldVisibility[f],
                onChanged: (v) {
                  setState(() {
                    widget.config.fieldVisibility[f] = v!;
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
