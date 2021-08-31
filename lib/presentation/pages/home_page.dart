import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wayu_test/core/utils/colors.dart';
import 'package:wayu_test/core/utils/typograph.dart';
import 'package:wayu_test/data/model/hotel.dart';
import 'package:wayu_test/data/model/profile.dart';
import 'package:wayu_test/presentation/blocs/cubit/categoryhotel_cubit.dart';
import 'package:wayu_test/presentation/widgets/home_app_bar.dart';
import 'package:wayu_test/presentation/widgets/home_category_widget.dart';
import 'package:wayu_test/presentation/widgets/home_search_widget.dart';
import 'package:wayu_test/presentation/widgets/home_tabbar_list_widget.dart';

final GetIt getIt = GetIt.instance;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                          SizedBox(
                            width: 8.0,
                          ),
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
          SliverList(
              delegate: SliverChildListDelegate([
            // Search Widget
            HomeSearchWidget(),

            // top photo
            _homeAdPhotoWidget(context),

            // Category
            BlocProvider(
                create: (_) =>
                    getIt<CategoryhotelCubit>()..loadCategoryHotels(),
                child: HomeCategoryWidget()),

            // More Tabbar
            HomeTabbarListWidget()
          ]))
        ],
      ),
    );
  }

  Widget _homeAdPhotoWidget(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Stack(
        children: [
          Container(
            height: 180.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    colorFilter:
                        new ColorFilter.mode(Colors.black, BlendMode.dstIn),
                    fit: BoxFit.cover,
                    image: NetworkImage(categoryHotels[0].coverPhotoURL))),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            padding: EdgeInsets.only(
              top: 30.0,
              bottom: 10.0,
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
              maxHeight: 180.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Enjoy your weekends with family | Special Offer!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  "${categoryHotels[2].discount}% Off",
                  style: TextStyle(
                    fontSize: 30.0,
                    letterSpacing: 1.1,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
