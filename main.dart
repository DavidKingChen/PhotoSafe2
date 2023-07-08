import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_01/home_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main () {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    // DeviceOrientation.landscapeLeft
    // DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:loginMain(context),
    );
  }

  //主体内容
  Widget loginMain(BuildContext context){
    return Stack(
      alignment: Alignment.center,
      children: [
        backgroudimage(context),
        twoCode(context),
      ],
    );
  }

  //背景图
 Widget backgroudimage(BuildContext context){
    return  Image.asset(
      'assets/images/login_bg.png',
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
 }

 //二维码
 Widget twoCode(BuildContext context){
    return Container(
      padding: EdgeInsets.only(left: 20,top: 20,right: 20),
      alignment: Alignment.center,
      width: 180,
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
          color: Colors.white
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              //二维码
              Container(
                child: AspectRatio(
                  aspectRatio: 1/1,
                  child:QrImage(
                    data: 'www.baidu.com',
                    padding: EdgeInsets.all(0),
                  ),
                ),
              ),
              //logo
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/showicons/logiconW.png',
                  width: 35,
                  height: 35,
                ),
              ),
              Container(
                width: 150,
                height: 150,
                child: TextButton(
                  onPressed: (){
                    print("点击了");
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx){
                          return HomePage();
                        }
                      ),
                    );
                  },
                  child: Container(),
                  style: ButtonStyle(
                      // backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Text(
            '请使用微信扫码登录',
            style: TextStyle(
              color:Color(0xff333333),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }


}

