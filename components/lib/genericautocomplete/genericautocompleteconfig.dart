// class AutocompleteConfig<T> {
//   final Future<List<T>> Function(String search, int page, int pageSize) fetchItems;
//   final Map<String, String> fieldLabels;
//   final List<String> fieldOrder;
//   final Map<String, bool> fieldVisibility;
//   final Map<String, int> fieldFlex;
//   final String Function(T item) displayStringForOption;
//   final String Function(T item, String field) getFieldValue;
//   final Map<String, dynamic> Function(T item) convertToMap;
//   final Function(Map<String, dynamic>) onSelected;

//   AutocompleteConfig({
//     required this.fetchItems,
//     required this.displayStringForOption,
//     required this.getFieldValue,
//     required this.convertToMap,
//     required this.onSelected,
//     required this.fieldLabels,
//     required this.fieldOrder,
//     required this.fieldVisibility,
//     required this.fieldFlex,
//   });
// }
