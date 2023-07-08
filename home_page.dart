import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_01/map_page.dart';
import 'package:flutter_app_01/self_photo_list/image_page.dart';
import 'package:flutter_app_01/secound_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    double wight = MediaQuery.of(context).size.width;
    double bannerHeight = MediaQuery.of(context).size.height*252/540;
    double bannerWidth = wight*450/960;
    double bannerWidth2 = wight*219/960;
    double spacing =(wight-bannerWidth2-bannerWidth2-bannerWidth-40)/2;
    double bottomHeight = MediaQuery.of(context).size.height*142/540;
    double bottomItemWidth = (wight-40-36)/4;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20,top: 20,right: 20),
        child:Column(
          children: [
            //logo
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset('assets/showicons/icon_logo.png',width: 96,height: 28),
            ),
            SizedBox(height: 12,),
            Container(
              width: double.infinity,
              height: bannerHeight,
              child: Row(
                children: [
                  ClipRRect(
                    child: Stack(
                      children: [
                        Image.asset('assets/showicons/logiconW.png',width: bannerWidth,fit: BoxFit.cover,),
                        CachedNetworkImage(
                          imageUrl: "https://img1.mklimg.com/g4/M00/10/E7/rBBrel6lI0SAIykPAADZAcV26yM986.jpg",width:bannerWidth, fit: BoxFit.cover,),
                        Container(
                          width: bannerWidth,
                          child:TextButton(
                            onPressed:(){
                              print("点击了");
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (ctx){
                                      return SecoundPage();
                                })
                              );
                            },
                            child: Container(),
                          ),
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  SizedBox(width: spacing,),
                  ClipRRect(
                      child: Stack(
                        children :[
                          Image.asset('assets/showicons/logiconW.png',width: bannerWidth2,fit: BoxFit.cover,),
                          CachedNetworkImage(
                            imageUrl: "https://img2.mklimg.com/g4/M00/10/F0/rBBrel6lKg6AHYxAAAcO05Qxvqo159.jpg",width: bannerWidth2,fit: BoxFit.cover,),
                          Container(
                            width: bannerWidth2,
                            child: TextButton(
                              onPressed: (){
                                print('点击');
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (ctx){
                                          return MapPage(lat: '120.58578',long: '31.30206',);
                                        })
                                );
                                },
                              child: Container(),
                            ),
                          ),
                        ],
                      ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  SizedBox(width: spacing,),
                  ClipRRect(
                      child: Stack(
                        children:[
                          Image.asset('assets/showicons/logiconW.png',width: bannerWidth2,fit: BoxFit.cover,),
                          CachedNetworkImage(
                            imageUrl: "https://img1.mklimg.com/g4/M00/10/F0/rBBreV6lKf2AV4FrAAjhZ2ESktY090.jpg",width: bannerWidth2,fit: BoxFit.cover,),
                          Container(
                            width: bannerWidth2,
                            child: TextButton(
                              onPressed: (){
                                print('点击');
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder:(ctx){
                                        return ImagePage();
                                      })
                                );
                              }, child: Container(),
                            ),
                       )
                        ],
                      ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              height: bottomHeight,
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (ctx,index){
                  List images=[
                    "https://img3.mklimg.com/g4/M00/10/E5/rBBrel6lIo6ADxR2AAaKjThpOK4756.jpg",
                    "https://img3.mklimg.com/g4/M00/10/E8/rBBrel6lJF2AQoQ8AASR960TSAM446.jpg",
                    "https://img2.mklimg.com/g4/M00/10/E9/rBBrel6lJROAPPoWAAe85C3UvQc158.jpg",
                    "https://img2.mklimg.com/g4/M00/10/EA/rBBrel6lJcaAFOvDAAchkKQybiw051.jpg",
                  ];
                  bool isShow = true;
                  if(index == 3){
                    isShow = false;
                  }
                  return Row(
                    children: [
                      ClipRRect(
                        child: Stack(
                          children:[
                            Image.asset('assets/showicons/logiconW.png',width: bottomItemWidth,fit: BoxFit.cover,),
                            CachedNetworkImage(
                              imageUrl:images[index],
                              width: bottomItemWidth,
                              fit: BoxFit.cover,
                          ),
                        ],),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      isShow ? SizedBox(width: 12,) : Container(),
                    ],
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
