import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/general.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/about.dart';
class DesktopHome extends StatefulWidget {
  const DesktopHome({Key? key}) : super(key: key);

  @override
  _DesktopHomeState createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  var f=[true,false,false,false,false];
  var menu =['   ','About','Blog','Projects','Experience'];
  PageController controller = PageController();

  void _scrollToIndex(int index){
          controller.animateToPage(index, duration: Duration(seconds: 1), curve: Curves.easeOut);
        }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child:Container(
            color: Color(0xFF191919),
            child: Column(
              children: <Widget>[
                 SizedBox(height: 50,),
               Container(
                 color: Color(0xFF191919),
                 child: Row(
                   children: <Widget>[
                     SizedBox(width: 20,),
                    GestureDetector(
                      onTap: (){
                        _scrollToIndex(0);
                      setState(() {
                          f=[false,false,false,false,false];
                            f[0]=true;
                      });
                      },
                      child: Text("B",style: TextStyle(color :f[0]?Color(0xFFEA3057):Colors.white ,fontSize:f[0]?60:40),)),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 60.0, 10.0),
                    child: Row(
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GestureDetector(onTap: () {
                            _scrollToIndex(index);
                            setState(() {
                              f=[false,false,false,false,false];
                              f[index]=true;
                            });
                          }, child: Container(
                            child: Text(menu[index],style: TextStyle(color:f[index]?Color(0xFF766FCF0):Colors.white ,fontSize: f[index]?23:20),))),
                        );
                      }),
                    ),
                  ),
                   ],
                 ),
               ),
                Expanded(child:PageView(
                  scrollDirection: Axis.vertical,
                  pageSnapping: true,
                  controller: controller,
                  children: <Widget>[
                    HomeD(),
                    about(),
                    Container(color: Color(0xFF191919)),
                    Container(color:  Color(0xFF191919)),
                    Container(color:  Color(0xFF191919)),
                  ]
                ))
              ],
            ),
          ) ),
        );

  }
}


class HomeD extends StatefulWidget {
  const HomeD({ Key? key }) : super(key: key);

  @override
  _HomeDState createState() => _HomeDState();
}

class _HomeDState extends State<HomeD> {
  @override
  var i =[false,false,false,false,false,false];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:   Color(0xFF191919),
      body: Stack(
        children: <Widget>[
          Container(
          decoration: BoxDecoration( color: Color(0xFF191919),),
          height: 150,
          width: 500,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:List.generate(6, (index){
            return  InkWell(child: Tab(icon: Image(image: AssetImage(i[index] ?im[index]:img[index]),height:i[index] ? 80:100,),),
            onTap: ()async {
              setState(() {
                i=[false,false,false,false,false,false];
              i[index]=true;
              });
              if (await canLaunch(link[index])) {
            await launch(link[index]);
              } else {
            throw "cannot launch";
              }
              }
            );
          })
        )),
    
        Container(
          color: Colors.amber,
          child: Expanded(
            child: Image(image: AssetImage('images/shikamaru.jpg'),
            height: 400,
            width: 200,),
          ),
        ),
        ],
      )
    );
  }
}

