import 'package:flutter/material.dart';
import 'package:wayu_test/core/utils/colors.dart';
import 'package:wayu_test/core/utils/typograph.dart';
import 'package:wayu_test/data/model/hotel.dart';

class HomeTabbarListWidget extends StatefulWidget {
  const HomeTabbarListWidget({
    Key? key,
  }) : super(key: key);

  @override
  _HomeTabbarListWidgetState createState() => _HomeTabbarListWidgetState();
}

class _HomeTabbarListWidgetState extends State<HomeTabbarListWidget>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: MyColors.greyLight,
            labelStyle: CustomTypograph.normalText.copyWith(fontSize: 12.0),
            indicatorColor: MyColors.deepPurple,
            tabs: [
              Tab(text: "5 Star"),
              Tab(text: "4 Star"),
              Tab(text: "3 Star"),
              Tab(text: "2 Star"),
              Tab(text: "1 Star")
            ],
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              ListItemWidget(),
              ListItemWidget(),
              ListItemWidget(),
              ListItemWidget(),
              ListItemWidget(),
            ]),
          )
        ],
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: categoryHotels.length,
        itemBuilder: (context, index) {
          final hotel = categoryHotels[index];
          return Container(
            height: 200.0,
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: MyColors.greyLight.withOpacity(0.5),
                  blurRadius: 2.0,
                  spreadRadius: 3.0,
                  offset: Offset(0, 1),
                )
              ],
            ),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 0,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        hotel.coverPhotoURL,
                        width: 150.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            color: MyColors.deepPurple,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            "${hotel.discount.toString()}% Off",
                            style: CustomTypograph.normalText,
                          ),
                        ),
                        Text(
                          hotel.name,
                          style: CustomTypograph.boldSubtitle,
                        ),
                        Text(hotel.about),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "from ",
                                style: CustomTypograph.normalText
                                    .copyWith(color: Colors.black)),
                            TextSpan(
                                text: "\$${hotel.price}/month",
                                style: CustomTypograph.normalText.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))
                          ]),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
