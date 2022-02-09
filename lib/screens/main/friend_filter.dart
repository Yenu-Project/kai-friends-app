import 'package:flutter/material.dart';
import 'package:kai_friends_app/assets/constants.dart';
import 'package:kai_friends_app/widgets/bottom_nav_bar.dart';
import 'package:kai_friends_app/widgets/color_chip.dart';

void main() {
  runApp(const FriendFilterPage());
}

class FriendFilterPage extends StatefulWidget {
  const FriendFilterPage({Key? key}) : super(key: key);

  @override
  State<FriendFilterPage> createState() => _FriendFilterPageState();
}

class _FriendFilterPageState extends State<FriendFilterPage> {
  // TODO: use backend API
  Set<String> searchResult = {};
  Set<String> addedFilters = {};
  String searchText = '';
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(
                onSearchTextChanged: onSearchTextChanged,
              ),
              Stack(
                children: [
                  LabelCheckbox(
                    label: '내 기본 필터 가져오기',
                    initialState: isChecked,
                    onChanged: onCheckboxChanged,
                  ),
                  FilterList(
                    title: '추가된 필터',
                    filters: addedFilters,
                    onPressed: onAddedFilterPressed,
                  ),
                ],
              ),
              FilterList(
                title: '검색 결과',
                filters: searchResult,
                onPressed: onSearchResultPressed,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  onSearchTextChanged(String text) {
    searchText = text;
    searchResult.clear();
    if (text.isNotEmpty) {
      filterSearchList.forEach((filter) {
        if (filter.contains(text) && !addedFilters.contains(filter)) {
          searchResult.add(filter);
        }
      });
    }
    setState(() {});
  }

  onCheckboxChanged(val) {
    setState(() {
      isChecked = val;
      if (val) {
        addedFilters.addAll(defaultFilterList.toSet().difference(searchResult));
      } else {
        addedFilters.removeAll(defaultFilterList);
      }
    });
  }

  onAddedFilterPressed(filter) {
    setState(() {
      addedFilters.remove(filter);
      isChecked = addedFilters.containsAll(defaultFilterList);
      if (searchText != '' && filter.contains(searchText)) {
        searchResult.add(filter);
      }
    });
  }

  onSearchResultPressed(filter) {
    setState(() {
      searchResult.remove(filter);
      addedFilters.add(filter);
      isChecked = addedFilters.containsAll(defaultFilterList);
    });
  }
}

class SearchBar extends StatelessWidget {
  final Function(String) onSearchTextChanged;

  const SearchBar({
    Key? key,
    required this.onSearchTextChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(),
      ),
      child: Center(
        child: TextField(
          onChanged: (val) => onSearchTextChanged(val),
          decoration: InputDecoration(
            iconColor: Colors.black,
            prefixIcon: IconButton(
              onPressed: () {}, // TODO: move to prev page
              icon: const Icon(Icons.chevron_left),
            ),
            hintText: '검색',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class LabelCheckbox extends StatelessWidget {
  final String label;
  final bool initialState;
  final Function(bool) onChanged;

  const LabelCheckbox({
    Key? key,
    required this.label,
    this.initialState = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Checkbox(
            value: initialState,
            onChanged: (bool? value) {
              onChanged(value ?? false);
            },
          ),
          Text(label),
        ],
      ),
    );
  }
}

class FilterList extends StatelessWidget {
  final String title;
  final Set<String> filters;
  final Function(String) onPressed;

  const FilterList({
    Key? key,
    required this.title,
    required this.filters,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Wrap(
              spacing: 6.0,
              runSpacing: 6.0,
              children: filters
                  .map((filter) => ColorChip(
                        key: Key(filter),
                        text: filter,
                        onPressed: () => onPressed(filter),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
