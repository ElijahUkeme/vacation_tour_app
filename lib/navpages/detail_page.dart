import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vacation_tour_app/cubit/app_cubit.dart';
import 'package:vacation_tour_app/cubit/app_cubit_state.dart';
import 'package:vacation_tour_app/utils/app_colors.dart';
import 'package:vacation_tour_app/widgets/app_buttons.dart';
import 'package:vacation_tour_app/widgets/app_large_text.dart';
import 'package:vacation_tour_app/widgets/app_text.dart';
import 'package:vacation_tour_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars=4;
  int selectedIndex= -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder:(context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 270,
                    decoration:  BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(detail.places.image),
                            fit: BoxFit.cover)
                    ),
                  )),
              Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        BlocProvider.of<AppCubits>(context).goHome();
                      }, icon: Icon(Icons.menu),color: Colors.white,),
                    ],
                  )),
              Positioned(
                  top: 250,
                  child:Container(
                    padding: EdgeInsets.only(right: 20,left: 20,top: 30),
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(text: detail.places.name,color: Colors.black54.withOpacity(0.8),),
                            AppLargeText(text: "\$"+detail.places.price.toString(),color: AppColors.mainColor,)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.location_on,color: AppColors.mainColor,),
                            SizedBox(width: 5,),
                            AppText(text: detail.places.location,color: AppColors.textColor1,)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Wrap(
                                children:List.generate(5, (index){
                                  return Icon(Icons.star,color: index<detail.places.stars?AppColors.starColor:AppColors.textColor2,);
                                })
                            ),
                            SizedBox(width: 10,),
                            AppText(text: "(5.0)",color: AppColors.textColor2,)
                          ],
                        ),
                        SizedBox(height: 15,),
                        AppLargeText(text: "People",color: Colors.black54.withOpacity(0.8),size: 20,),
                        SizedBox(height: 5,),
                        AppText(text: "Number of People in your group",color: AppColors.mainTextColor,),
                        SizedBox(height: 10,),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: AppButton(color: selectedIndex==index?Colors.white:Colors.black,
                                  size: 50,
                                  backgroundColor: selectedIndex==index?Colors.black:AppColors.buttonBackgroundColor,
                                  borderColor: selectedIndex==index?Colors.black:AppColors.buttonBackgroundColor,text: (index+1).toString(),),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 15,),
                        AppLargeText(text: "Description",color: Colors.black.withOpacity(0.8),size: 20,),
                        SizedBox(height: 5,),
                        AppText(text: detail.places.description,color: AppColors.mainTextColor,),
                      ],
                    ),

                  ) ),
              Positioned(
                  bottom: 15,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButton(
                        color: AppColors.textColor1,
                        size: 60,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor1,isIcon: true,icon: Icons.favorite_border,),
                      SizedBox(width: 20,),
                      ResponsiveButton(isResponsive: true,)
                    ],
                  ) )
            ],
          ),
        ),
      );
    });
  }
}
