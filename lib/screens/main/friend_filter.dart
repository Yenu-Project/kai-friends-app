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
  List<String> searchResult = [];

  onSearchTextChanged(String text) {
    searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    filterSearchList.forEach((filter) {
      if (filter.contains(text)) searchResult.add(filter);
    });

    setState(() {});
  }

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
                    onChanged: (val) {},
                  ),
                  const FilterList(
                    title: '추가된 필터',
                    filters: defaultFilterList,
                  ),
                ],
              ),
              FilterList(
                title: '검색 결과',
                filters: searchResult,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
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
              onPressed: () {},
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

class LabelCheckbox extends StatefulWidget {
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
  _LabelCheckboxState createState() => _LabelCheckboxState();
}

class _LabelCheckboxState extends State<LabelCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialState;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
              });
              widget.onChanged(value ?? false);
            },
          ),
          Text(widget.label),
        ],
      ),
    );
  }
}

class FilterList extends StatefulWidget {
  final String title;
  final List<String>? filters;

  const FilterList({
    Key? key,
    required this.title,
    this.filters,
  }) : super(key: key);

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  List<String> filters = [];

  @override
  Widget build(BuildContext context) {
    filters = widget.filters ?? [];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
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
