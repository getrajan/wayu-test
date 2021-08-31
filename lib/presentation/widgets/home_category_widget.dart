import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wayu_test/core/utils/colors.dart';
import 'package:wayu_test/core/utils/typograph.dart';
import 'package:wayu_test/data/model/hotel.dart';
import 'package:wayu_test/presentation/blocs/cubit/categoryhotel_cubit.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Category",
                style: CustomTypograph.boldTitle,
              ),
              Icon(
                EvaIcons.moreHorizotnal,
                size: 30.0,
              )
            ],
          ),
          BlocBuilder<CategoryhotelCubit, CategoryhotelState>(
            builder: (context, state) {
              if (state is CategoryLoadedState) {
                final _hotels = state.hotels;
                return Container(
                  margin: EdgeInsets.only(top: 10.0),
                  constraints: BoxConstraints(
                    maxHeight: 350.0,
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _hotels.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(20.0),
                          width: MediaQuery.of(context).size.width * 0.7,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3.0,
                                  spreadRadius: 2.0,
                                  color: MyColors.greyLight.withOpacity(0.5),
                                  offset: Offset(0, 2))
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxHeight: 200.0,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    _hotels[index].coverPhotoURL,
                                    // width: double.infinity,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                _hotels[index].category,
                                style: CustomTypograph.boldSubtitle,
                              ),
                              Text(
                                _hotels[index].about,
                                style: CustomTypograph.lightSubtitle,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 20.0),
                                    decoration: BoxDecoration(
                                      color: MyColors.darkBlueGrey,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(text: "from"),
                                        TextSpan(
                                            text:
                                                "\$${_hotels[index].price}/month",
                                            style: CustomTypograph.normalText
                                                .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ]),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color:
                                          MyColors.greyLight.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Icon(
                                      EvaIcons.arrowForward,
                                      color: MyColors.deepPurple,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
