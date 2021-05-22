import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:voting_system_cryptography/screens/LoginScreen.dart';

class RegistrationSuccessfulPage extends StatelessWidget {
  final String username;
  final String voterID;
  final String userEmail;
  final String userPassword;

  RegistrationSuccessfulPage({required this.username, required this.voterID, required this.userEmail, required this.userPassword});
  String generateAuthenticationKey(){
    String authenticationPrivateKey = username+voterID+userEmail+userPassword;
    return authenticationPrivateKey;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 2,),
            Text("Congratulations !",style: TextStyle(fontSize: 45.0,color: Colors.grey.shade600,fontWeight: FontWeight.bold),),
            Spacer(flex: 1,),
            Text("Your registration is successful",style: TextStyle(fontSize: 20.0),),
            Spacer(flex: 1,),
            QrImage(
              data: generateAuthenticationKey(),
              version: QrVersions.auto,
              size: 200.0,
            ),
            Spacer(flex: 1,),
            Text("Save this QR code to cast vote."),
            Text("This will help to authenticate your vote."),
            Spacer(flex: 2,),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: size.width*0.8,height: size.width*0.12),
              child: ElevatedButton(
                  onPressed: (){
                    print("Vote Now");
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => LoginPage()),
                    );
                  },
                  child: Text("Vote now",style: TextStyle(fontSize: 20.0),),
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
            Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
