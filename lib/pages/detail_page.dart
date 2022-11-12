import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cubit/misc/colors.dart';
import 'package:flutter_app_cubit/widgets/app_large_text.dart';
import 'package:flutter_app_cubit/widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  int gottenStars = 4;
  @override
  Widget build(BuildContext context) {
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
                   height: 350,
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       image: AssetImage('img/mountain.jpeg'),
                       fit: BoxFit.cover
                     ),
                   ),
                 ),
               ),
               Positioned(
                 left: 20,
                 top: 70,
                 child: Row(
                   children: [
                     IconButton(onPressed: (){},icon:Icon(Icons.menu,color: Colors.white,),),
                     SizedBox(width: 280,),
                     IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,)),
                   ],
                 ),
               ),
               Positioned(
                 top: 320,
                 child: Container(
                   padding: EdgeInsets.only(top:20,left: 20,right: 20),
                   width:MediaQuery.of(context).size.width,
                   height:500,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           AppLargeText(text: 'Yosemite',color: Colors.black.withOpacity(0.5),),
                           AppLargeText(text: '\$ 250',color: AppColors.mainColor,)
                         ],
                       ),
                       SizedBox(height: 10,),
                       Row(
                         children: [
                           Icon(Icons.location_on,color: AppColors.mainColor,),
                           SizedBox(width: 5,),
                           AppText(text: 'USA , California',color: AppColors.textColor1,),
                         ],
                       ),
                       SizedBox(height: 10,),
                       Row(
                         children: [
                           Wrap(
                               children: List.generate(5, (index){
                                 return Icon(Icons.star,color:index<gottenStars? AppColors.starColor:AppColors.textColor2);
                               }),
                           ),
                           SizedBox(width: 10,),
                           AppText(text: '(4.0)',color: AppColors.textColor2,)
                         ],
                       ),
                     ],
                   ),
                 ),
               )
             ],
        ),
      ),
    );
  }
}
