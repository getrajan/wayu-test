import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wayu_test/core/utils/colors.dart';
import 'package:wayu_test/core/utils/typograph.dart';
import 'package:wayu_test/presentation/pages/search_page.dart';
import 'package:wayu_test/presentation/widgets/custom_filter_bottom.dart';
import 'package:wayu_test/presentation/widgets/pop_over_widget.dart';

class HomeSearchWidget extends StatefulWidget {
  const HomeSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  _HomeSearchWidgetState createState() => _HomeSearchWidgetState();
}

class _HomeSearchWidgetState extends State<HomeSearchWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: MyColors.greyLight.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextFormField(
                controller: _searchController,
                textInputAction: TextInputAction.search,
                onEditingComplete: () {
                  print("Edit complete: ${_searchController.text}");
                  FocusScope.of(context).unfocus();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SearchPage(
                                searchText: _searchController.text,
                              )));
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      EvaIcons.search,
                      color: Colors.black,
                      size: 25.0,
                    ),
                    hintText: "Search Your Hotels",
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.1,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return CustomFilterBottomSheet();
                    });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(
                  EvaIcons.optionsOutline,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
