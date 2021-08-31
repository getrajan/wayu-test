import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wayu_test/core/utils/colors.dart';
import 'package:wayu_test/core/utils/typograph.dart';
import 'package:wayu_test/data/model/hotel.dart';
import 'package:wayu_test/data/model/profile.dart';
import 'package:wayu_test/presentation/widgets/custom_filter_bottom.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.searchText}) : super(key: key);
  final String searchText;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _searchController.text = widget.searchText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            toolbarHeight: 80.0,
            snap: true,
            expandedHeight: 100.0,
            pinned: true,
            title: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: NetworkImage(myProfile.photoURL),
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "My Location",
                            style: CustomTypograph.lightSubtitle,
                          ),
                          SizedBox(width: 8.0),
                          Icon(
                            LineIcons.angleDown,
                            size: 15.0,
                            color: Colors.black,
                          )
                        ],
                      ),
                      Text(
                        "Cox's Bazar, BD",
                        style: CustomTypograph.boldSubtitle,
                      )
                    ],
                  )
                ],
              ),
            ),
            backgroundColor: Colors.white,
            actions: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Icon(
                      EvaIcons.bellOutline,
                      color: Colors.black,
                    ),
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                margin: EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              )
            ],
          ),
          SliverFillRemaining(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Search For House",
                      style: CustomTypograph.boldTitle,
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    EvaIcons.search,
                                    color: Colors.black,
                                    size: 25.0,
                                  ),
                                  suffixIcon: Container(
                                    margin: EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      LineIcons.times,
                                      size: 16.0,
                                    ),
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
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20.0, top: 15.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Result for ",
                              style: CustomTypograph.boldSubtitle
                                  .copyWith(fontWeight: FontWeight.normal)),
                          TextSpan(
                              text: "${widget.searchText}",
                              style: CustomTypograph.boldSubtitle)
                        ]),
                      )),
                  Expanded(
                    child: Container(
                      // constraints: BoxConstraints(
                      //     maxHeight: MediaQuery.of(context).size.height * 0.5),
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView.builder(
                          itemCount: categoryHotels.length,
                          itemBuilder: (context, index) {
                            final hotel = categoryHotels[index];
                            return Container(
                              height: 150.0,
                              margin: EdgeInsets.only(bottom: 5.0),
                              decoration: BoxDecoration(
                                  color: MyColors.greyLight.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  hotel.coverPhotoURL),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            hotel.name,
                                            style: CustomTypograph.boldSubtitle
                                                .copyWith(fontSize: 15.0),
                                          ),
                                          Text(
                                            "${hotel.discount}% less than usual",
                                            style: CustomTypograph.lightSubtitle
                                                .copyWith(
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                    fontSize: 15.0),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(LineIcons.bed),
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5.0),
                                                      child: Text("4"))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(LineIcons.swimmer),
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5.0),
                                                      child: Text("2"))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(LineIcons.bath),
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5.0),
                                                      child: Text("3"))
                                                ],
                                              )
                                            ],
                                          ),
                                          RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: "from ",
                                                  style: CustomTypograph
                                                      .normalText
                                                      .copyWith(
                                                          color: Colors.black)),
                                              TextSpan(
                                                  text:
                                                      "\$${hotel.price}/month",
                                                  style: CustomTypograph
                                                      .normalText
                                                      .copyWith(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold))
                                            ]),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
