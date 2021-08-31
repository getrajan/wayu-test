import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:wayu_test/core/utils/typograph.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5.0),
                )),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "My Location",
                        style: CustomTypograph.lightSubtitle,
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  Text(
                    "Cox's Bazar, BD",
                    style: CustomTypograph.boldSubtitle,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Icon(
                    EvaIcons.bellOutline,
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
          ),
          Expanded(
            flex: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Icon(
                Icons.menu,
              ),
            ),
          )
        ],
      ),
    );
  }
}
