import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voting_system_cryptography/constants.dart';
import 'package:voting_system_cryptography/screens/LoginScreen.dart';
import 'package:local_auth/local_auth.dart';
import 'package:voting_system_cryptography/screens/RegistrationSuccessfulScreen.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric = false;
  List<BiometricType> _availableBiometrics = [];
  String authorized = "Not authorized";

  Future<void> _checkBiometric() async {
    bool canCheckBiometric = false;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;
    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future<void> _getAvailableBiometric() async {
    List<BiometricType> availableBiometric = [];
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    setState(() {
      _availableBiometrics = availableBiometric;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      print("Hello");
      authenticated = await auth.authenticate(
          localizedReason: "Scan your finger to authenticate",
          useErrorDialogs: true,
          stickyAuth: false);
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      authorized =
      authenticated ? "Authorization success" : "Failed to Authenticate";
      print(authorized);
    });
  }

  @override
  void initState(){
    _checkBiometric();
    _getAvailableBiometric();
  }

  final formKey = GlobalKey<FormState>();
  String username = '';
  String voterID = '';
  String email = '';
  String password = '';
  String repassword = '';
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              height: size.height,
              width: size.width,
              padding: EdgeInsets.fromLTRB(size.width * 0.1, size.height * 0.05,
                  size.width * 0.1, size.height * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Row(
                    children: [

                      Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 45.0, fontWeight: FontWeight.bold,color: Colors.red),
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.wb_incandescent_sharp,
                        size: 95.0,
                        color: Colors.redAccent,
                      )
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hey there! Welcome.",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Container(
                      child: Column(
                        children: [
                          usernameHandler(),
                          SizedBox(
                            height: 20,
                          ),
                          voterIDHandler(),
                          SizedBox(
                            height: 20,
                          ),
                          emailHandler(),
                          SizedBox(
                            height: 20,
                          ),
                          passwordHandler(),
                          SizedBox(
                            height: 20,
                          ),
                          rePasswordHandler(),

                        ],
                      )),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final isValid = formKey.currentState!.validate();
                      if (isValid) {
                        formKey.currentState!.save();

                        print('Username: $username');
                        print('VoterID: $voterID');
                        print('Email: $email');
                        print('Password: $password');
                        await _authenticate();
                        print("Status :"+authorized);
                        if(authorized == "Authorization success"){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => RegistrationSuccessfulPage(
                              username: username,
                              voterID: voterID,
                              userEmail : email,
                              userPassword: password,
                            )),
                          );
                        }
                      }
                    },
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(35.0)),
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(child: SizedBox()),
                  Divider(
                    thickness: 4.0,
                    color: Colors.black87,
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text("Have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => LoginPage()),
                                );
                          },

                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

  Widget usernameHandler() => TextFormField(
    onChanged: (value) => setState(() => this.username = value),
    onSaved: (value) => setState(() => this.username = value!),
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.transparent, width: 3.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.transparent, width: 3.0),
      ),
      hintStyle: TextStyle(
        fontSize: 12,
        fontStyle: FontStyle.italic,
      ),
      filled: true,
      fillColor: Color(0xffE7EBED),
      contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
      hintText: "Name",
    ),
    validator: (value) {
      if (value!.length < 4) {
        return 'Enter at least 4 characters';
      } else if (value.length > 30) {
        return 'Enter atmost 30 characters';
      } else{
        return null;
      }
    },
    keyboardType: TextInputType.name,
    textInputAction: TextInputAction.done,
  );

  Widget voterIDHandler() => TextFormField(
    onChanged: (value) => setState(() => this.voterID = value),
    onSaved: (value) => setState(() => this.voterID = value!),
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.transparent, width: 3.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.transparent, width: 3.0),
      ),
      hintStyle: TextStyle(
        fontSize: 12,
        fontStyle: FontStyle.italic,
      ),
      filled: true,
      fillColor: Color(0xffE7EBED),
      contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
      hintText: "Voter ID",
    ),
    validator: (value) {
      if (value!.length < 4) {
        return 'Enter at least 4 characters';
      } else if (value.length > 16) {
        return 'Enter atmost 16 characters';
      } else{
        return null;
      }
    },
    keyboardType: TextInputType.name,
    textInputAction: TextInputAction.done,
  );

  Widget emailHandler() => TextFormField(
    onChanged: (value) => setState(() => this.email = value),
    onSaved: (value) => setState(() => this.email = value!),
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.transparent, width: 3.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.transparent, width: 3.0),
      ),
      hintStyle: TextStyle(
        fontSize: 12,
        fontStyle: FontStyle.italic,
      ),
      filled: true,
      fillColor: Color(0xffE7EBED),
      contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
      hintText: "Email",
    ),
    validator: (value) {
      final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
      final regExp = RegExp(pattern);

      if (value!.isEmpty) {
        return 'Enter an email';
      } else if (!regExp.hasMatch(value)) {
        return 'Enter a valid email';
      } else {
        return null;
      }
    },
    keyboardType: TextInputType.emailAddress,
    textInputAction: TextInputAction.done,
  );

  Widget passwordHandler() => TextFormField(
    onChanged: (value) => setState(() => this.password = value),
    onSaved: (value) => setState(() => this.password = value!),
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.transparent, width: 3.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.transparent, width: 3.0),
      ),
      hintStyle: TextStyle(
        fontSize: 12,
        fontStyle: FontStyle.italic,
      ),
      suffixIcon: IconButton(
        icon: isPasswordVisible
            ? Icon(Icons.visibility_off)
            : Icon(Icons.visibility),
        onPressed: () =>
            setState(() => isPasswordVisible = !isPasswordVisible),
      ),
      filled: true,
      fillColor: Color(0xffE7EBED),
      contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
      hintText: "Password",
    ),
    validator: (value) {
      final pattern =
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
      final regExp = RegExp(pattern);

      if (value!.isEmpty) {
        return 'Enter Password';
      } else if (!regExp.hasMatch(value)) {
        return 'Enter a valid password';
      } else {
        return null;
      }
    },
    obscureText: isPasswordVisible,
  );

  Widget rePasswordHandler() => TextFormField(
    onChanged: (value) => setState(() => this.repassword = value),
    onSaved: (value) => setState(() => this.repassword = value!),
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.transparent, width: 3.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.transparent, width: 3.0),
      ),
      hintStyle: TextStyle(
        fontSize: 12,
        fontStyle: FontStyle.italic,
      ),
      suffixIcon: IconButton(
        icon: isPasswordVisible
            ? Icon(Icons.visibility_off)
            : Icon(Icons.visibility),
        onPressed: () =>
            setState(() => isPasswordVisible = !isPasswordVisible),
      ),
      filled: true,
      fillColor: Color(0xffE7EBED),
      contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
      hintText: "Confirm Password",
    ),
    validator: (value) {
      final pattern =
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
      final regExp = RegExp(pattern);


      if (value!.isEmpty) {
        return 'Enter Password';
      }else if (value != password ) {
        return 'Passwords do not match';
      }else if (!regExp.hasMatch(value)) {
        return 'Enter a valid password';
      } else{
        return null;
      }
    },
    obscureText: isPasswordVisible,
  );

}
