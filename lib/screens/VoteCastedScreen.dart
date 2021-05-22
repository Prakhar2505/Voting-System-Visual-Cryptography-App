import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoteCastedScreen extends StatefulWidget {
  final String name;
  VoteCastedScreen({required this.name});
  @override
  _VoteCastedScreenState createState() => _VoteCastedScreenState();
}

class _VoteCastedScreenState extends State<VoteCastedScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Spacer(flex: 2,),
              Center(child: Text("THANK YOU",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.red),)),
              Spacer(flex:1),
              Center(child: Text("Your vote to ${widget.name} been casted successfully",textAlign: TextAlign.center,style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.black),)),
              Spacer(flex:2),
              Container(
                height: size.height * 0.5,
                width: size.width * 0.42,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  image: DecorationImage(
                    image: AssetImage("assets/deva.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(flex:1),
              Center(child: Text("AN APP FOR",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.black),)),
              Center(child: Text("DEVASHISH NAITHANI",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.red),)),
              Center(child: Text("Btech CSE-D (1918321)",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.red),)),
              Spacer(flex:2),
            ],
          ),
        ),
      ),
    );
  }
}
