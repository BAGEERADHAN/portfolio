import 'package:flutter/material.dart';


class MobHome extends StatefulWidget {
  const MobHome({ Key? key }) : super(key: key);

  @override
  _MobHomeState createState() => _MobHomeState();
}

class _MobHomeState extends State<MobHome> {

 var menu =['Home','About','Gallery','Projects','Achievements'];
  var colors = [Colors.amber,Colors.black,Colors.white,Colors.blue,Colors.red];
  PageController controller = PageController();

  void _scrollToIndex(int index){
          controller.animateToPage(index, duration: Duration(seconds: 1), curve: Curves.fastLinearToSlowEaseIn);
        }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:List.generate(5, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(onTap: () {
                          _scrollToIndex(index);
                          Navigator.pop(context);
                        }, child: Container(
                          color: Colors.white,
                          child: Text(menu[index],style: TextStyle(color:Colors.black,fontFamily: 'VT323',fontSize: 20),))),
                      );
                    }),
          ),
        ),
      ),
      appBar: AppBar(),
      body: PageView(
                scrollDirection: Axis.vertical,
                pageSnapping: false,
                controller: controller,
                children: List.generate(menu.length, (index){
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    color: colors[index],
                    child: Text(menu[index]),
                  );
                }),
              ),
    );
  }
}