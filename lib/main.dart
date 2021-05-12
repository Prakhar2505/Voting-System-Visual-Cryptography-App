import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting_system_crytography/screens/LoginScreen.dart';
import 'package:voting_system_crytography/screens/RegisterScreen.dart';

void main() {
  runApp(MaterialApp(
    home: IntroScreen(),
  ));
}

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 2,),
            Text("Welcome to"),
            Text(
              "Remote Voting System",
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
            ),
            Spacer(flex: 2,),
            Container(
              height: size.width * 0.8,
              width: size.width * 0.8,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                  image: AssetImage("assets/election.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Spacer(flex: 3,),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: size.width*0.8,height: size.width*0.12),
              child: ElevatedButton(
                onPressed: (){
                  print("Pressed");
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => RegisterPage()),
                  );
                },
                child: Text("Register",style: TextStyle(fontSize: 20.0),),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)
                          ),
                      ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  )
              ),
            ),
            Spacer(flex: 1,),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: size.width*0.8,height: size.width*0.12),
              child: ElevatedButton(
                  onPressed: (){
                    print("Login");
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => LoginPage()),
                    );
                  },
                  child: Text("Login",style: TextStyle(fontSize: 20.0),),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  )
              ),
            ),
            Spacer(flex: 1,)
          ],
        ),
      ),
    );
  }
}
