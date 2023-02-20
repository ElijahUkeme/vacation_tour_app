import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vacation_tour_app/cubit/app_cubit.dart';
import 'package:vacation_tour_app/indicator/circle_tab_indicator.dart';
import 'package:vacation_tour_app/utils/app_colors.dart';
import 'package:vacation_tour_app/widgets/app_large_text.dart';
import 'package:vacation_tour_app/widgets/app_text.dart';

import '../cubit/app_cubit_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  var images = {
    "balloning.png":"Balloning",
    "hiking.png":"Hiking",
    "kayaking.png":"Kayaking",
    "snorkling.png":"Snorkling"
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabBarController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(
        builder: (context, state) {
          if(state is LoadedState){
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu, size: 30, color: Colors.black54,),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5)
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: AppLargeText(text: "Discover"),
                ),
                SizedBox(height: 20,),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        labelPadding: EdgeInsets.only(left: 20, right: 20),
                        controller: _tabBarController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorSize: TabBarIndicatorSize.label,
                        isScrollable: true,
                        indicator: CircleTabIndicator(
                            color: AppColors.mainColor, radius: 4),
                        tabs: [
                          Tab(text: "Places",),
                          Tab(text: "Inspiration",),
                          Tab(text: "Emotions",),
                        ]),
                  ),
                ),
                Container(
                  height: 200,
                  padding: EdgeInsets.only(left: 20),
                  width: double.maxFinite,
                  child: TabBarView(
                      controller: _tabBarController,
                      children: [
                        ListView.builder(
                          itemCount: info.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: (){
                                BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 15,top: 10),
                                width: 200,
                                height: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(info[index].image),
                                        fit: BoxFit.cover)
                                ),
                              ),
                            );
                          },
                        ),
                        Text("There"),
                        Text("Bye")
                      ]),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(text: "Explore More",size: 22,),
                      AppText(text: "See all")
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_,index){
                        return Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Container(
                                //margin: EdgeInsets.only(right: 40),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/"+images.keys.elementAt(index)),
                                        fit: BoxFit.cover)
                                ),

                              ),
                              Container(
                                child: AppText(text: images.values.elementAt(index)),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            );
          }else{
            return Container();
          }
        }),
    );
  }
}
