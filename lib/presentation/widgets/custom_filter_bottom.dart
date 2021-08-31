import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wayu_test/core/utils/colors.dart';
import 'package:wayu_test/core/utils/typograph.dart';
import 'package:wayu_test/presentation/widgets/pop_over_widget.dart';

class CustomFilterBottomSheet extends StatefulWidget {
  const CustomFilterBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  _CustomFilterBottomSheetState createState() =>
      _CustomFilterBottomSheetState();
}

class _CustomFilterBottomSheetState extends State<CustomFilterBottomSheet> {
  double lowValue = 30;
  double highValue = 50;
  late RangeValues _values;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _values = RangeValues(lowValue, highValue);

    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      child: Popover(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //  destination
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search Your Destination",
                  style: CustomTypograph.boldSubtitle,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: MyColors.greyLight.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(LineIcons.mapMarker),
                      suffixIcon: Container(
                        margin: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          LineIcons.angleDown,
                          size: 16.0,
                        ),
                      ),
                      hintText: "Enter location",
                      hintStyle: CustomTypograph.lightSubtitle
                          .copyWith(fontStyle: FontStyle.italic),
                      border: InputBorder.none,
                    ),
                    items: [],
                  ),
                ),
              ],
            ),
            // house type
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Type of house",
                  style: CustomTypograph.boldSubtitle,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: MyColors.greyLight.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(LineIcons.home),
                      suffixIcon: Container(
                        margin: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          LineIcons.angleDown,
                          size: 16.0,
                        ),
                      ),
                      hintText: "Type of house",
                      hintStyle: CustomTypograph.lightSubtitle
                          .copyWith(fontStyle: FontStyle.italic),
                      border: InputBorder.none,
                    ),
                    items: [],
                  ),
                ),
              ],
            ),
            // range slider
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Filter my price",
                  style: CustomTypograph.boldSubtitle,
                ),
                Container(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: MyColors.deepPurple,
                      thumbColor: MyColors.deepPurple,
                      // rangeThumbShape: ,
                    ),
                    child: RangeSlider(
                      divisions: 20,
                      values: _values,
                      labels: RangeLabels(_values.start.round().toString(),
                          _values.end.round().toString()),
                      onChanged: (RangeValues value) {
                        setState(() {
                          lowValue = value.start;
                          highValue = value.end;
                        });
                      },
                      min: 10,
                      max: 100,
                    ),
                  ),
                )
              ],
            ),

            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: MyColors.darkBlueGrey,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                "Confirm",
                style:
                    CustomTypograph.boldSubtitle.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
