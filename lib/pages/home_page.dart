import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_cubit/misc/colors.dart';
import 'package:flutter_app_cubit/widgets/app_large_text.dart';
import 'package:flutter_app_cubit/widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  var images = {
    'balloning.png' : 'Balloning',
    'hiking.png' : 'Hiking',
    'kayaking.png':'Kayaking',
    'snorkling.png':'Snorkling',
  };
  @override
  Widget build(BuildContext context) {
    TabController? _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
          Container(
            padding: EdgeInsets.only(top: 50,left: 20,right: 20),
            child: Row(
              children: [
                Icon(Icons.menu,size: 30,color: Colors.black54,),
                Expanded(child: SizedBox()),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          //discover text
          Container(
             margin: EdgeInsets.only(left: 20),
              child: AppLargeText(text: 'Discover')),
          SizedBox(height: 15,),
          // tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20,right: 20),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 3),
                tabs: <Widget>[
                  Tab(
                    child: Text('fruits'),
                  ),
                  Tab(
                    child: Text('vegetables'),
                  ),
                  Tab(
                    child: Text('berries'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 250,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView.builder(
                    itemCount : 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context,int index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 200,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'img/mountain.jpeg'
                                  ),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      );
                    }
                ),
                Center(child: Text('hello'),),
                Center(child: Text('hello world'),)
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            child: Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: 'Explore more',size: 20,),
                Expanded(child: SizedBox()),
                AppText(text: 'See all',color: AppColors.textColor1,)
              ],
            ),
          ),
          SizedBox(height: 10,),

          Container(
            height: 120,
            width: double.maxFinite,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
                itemBuilder: (BuildContext context,int index){
                return Container(
                  margin: EdgeInsets.only(right: 20,left: 15),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                              'img/${images.keys.elementAt(index)}' 
                            ),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      SizedBox(height: 5,),
                      AppText(text: images.values.elementAt(index)),
                    ],
                  ),
                );
                }),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color,required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([void Function]) {
    return _painter;
  }
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
    ..color = color
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
