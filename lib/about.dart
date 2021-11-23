import 'package:flutter/material.dart';

class about extends StatefulWidget {
  const about({ Key? key }) : super(key: key);

  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191919),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF191919),
        title: Text('About Me',style: TextStyle(fontSize: 50,color: Colors.white),),
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.97,
            color: Colors.white,),
        ),
        Container(
          height: 300,
          width: 240,
          color: Colors.red,
        )
      ],),
      
    );
  }
}