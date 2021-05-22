import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting_system_cryptography/screens/LoginScreen.dart';


class VoteNotCastedScreen extends StatefulWidget {
  final String name;
  VoteNotCastedScreen({required this.name});
  @override
  _VoteNotCastedScreenState createState() => _VoteNotCastedScreenState();
}

class _VoteNotCastedScreenState extends State<VoteNotCastedScreen> {
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
              Center(child: Text("SORRY",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.red),)),
              Spacer(flex:1),
              Center(child: Text("Your vote was not casted.",textAlign: TextAlign.center,style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.black),)),
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => LoginPage()),
                  );
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(35.0)),
                  child: Center(
                    child: Text(
                      "Try Again",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Spacer(flex:1),
            ],
          ),
        ),
      ),
    );
  }
}
