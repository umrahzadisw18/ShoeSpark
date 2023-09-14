import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/screens/home_page.dart';
import 'package:shopping_cart/screens/signup_screen.dart';

import '../resuableWidgets/reusable_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  final GlobalKey<FormState> _key= GlobalKey<FormState>();
  String errorMessage='';
   //bool _obscureText = true;

//  Function? _toggle(){
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//     return null;
//   }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Logowidget("images/shop logo.png"),
                  //Text("Shoe Spark"),
                  SizedBox(height: 20),
                  reusableTextField("Enter UserName", Icons.person_outline, false,
                      _emailTextController,
                      ),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outlined, true,
                      _passwordTextController, 
                      ),
                  SizedBox(
                    height: 20,
                  ),
                  // Center(child: Text(errorMessage, style: TextStyle(color: Colors.red),),),
                  SignInSignupButton(context, true, () {
                    if(_key.currentState!.validate()){
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailTextController.text, 
                      password: _passwordTextController.text).then((value){
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => HomePage())));
                      }).onError((error, stackTrace) {
                        errorMessage= error.toString();
                      });
                    }
                  }),
                  SignUpOption(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row SignUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have Account?",
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: Text(
            " SignUp",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
String? validateEmail(String? formEmail){
  if(formEmail==null || formEmail.isEmpty){
    return "E-mail Address is required";
  }
  String pattern= r'\w+@\w+.\w+';
  RegExp regex= RegExp(pattern);
  if(!regex.hasMatch(formEmail)) return 'Invalid E-mail Address Format';
  return null;
}

String? validatePassword(String? formPassword){
  if(formPassword==null || formPassword.isEmpty){
    return "Password is required";
  }
  String pattern= r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
  RegExp regex= RegExp(pattern);
  if(!regex.hasMatch(formPassword))
  return '''
Password must be Atleast 8 Characters,
include uppercase, letter ,symbol and number,
          ''';
  return null;
}
String? validateName(String? formName){
  if(formName==null || formName.isEmpty){
    return 'Username required';
  }
    return null;
  }
