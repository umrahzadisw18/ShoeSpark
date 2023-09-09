import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/resuableWidgets/reusable_widget.dart';
import 'package:shopping_cart/screens/home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
   final GlobalKey<FormState> _key= GlobalKey<FormState>();
   String errorMessage= '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter UserName", Icons.person_outline, false,
                      _usernameTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Email-Id", Icons.person_outline, false,
                      _emailTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      _passwordTextController,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(errorMessage, 
                    style: TextStyle(color: Colors.red))),
                  ),
                  SignInSignupButton(context, false, () {
                    if(_key.currentState!.validate()){
                  //    try{
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      print("New Account Created");
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => HomePage())));
                    }).onError((error, stackTrace) {
                    errorMessage = error.toString();
                    }
                    );
                   // errorMessage='';
                      // } on FirebaseAuthException catch(error){
                      //   errorMessage= error.message!;
                      // }
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
