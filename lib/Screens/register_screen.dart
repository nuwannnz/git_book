import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:git_book/Screens/ListTitles.dart';
import 'package:git_book/Screens/loading.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key, this.tabController}) : super(key: key);

  final TabController? tabController;

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _agree = false;
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _reEnterPwdInputController = TextEditingController();

  _RegisterScreenState() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        // FirebaseAuth.instance.signOut();

        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return ListTitles();
        }));
      }
    });
  }

  _formSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _loading = true);
      _formKey.currentState!.save();
      print('Email:' + _emailInputController.text);
      print('Password:' + _passwordInputController.text);
      print('Re-enter Password:' + _reEnterPwdInputController.text);

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailInputController.text,
            password: _reEnterPwdInputController.text);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          setState(() => _loading = false);
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text('Uh oh.'),
                    content: Text('The password provided is too weak.'),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () => Navigator.pop(context, 'TRY AGAIN'),
                          child: Text('TRY AGAIN'))
                    ],
                  ));
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          setState(() => _loading = false);
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text('Uh oh.'),
                    content: Text('The account already exists for that email.'),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () => Navigator.pop(context, 'TRY AGAIN'),
                          child: Text('TRY AGAIN'))
                    ],
                  ));
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<UserCredential> _signInWithGoogle() async {
    // await FirebaseAuth.instance.signOut();
    // await GoogleSignIn().signOut();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth!.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Widget _buildEmail() {
    return Container(
        margin: const EdgeInsets.only(
            top: 20.0, bottom: 0.0, right: 20.0, left: 20.0),
        child: Wrap(
          children: <Widget>[
            TextFormField(
              controller: _emailInputController,
              validator: (input) =>
                  (!input!.contains('@') ? 'Please enter a valid email' : null),
              obscureText: false,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.green, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.green, width: 2.0),
                  ),
                  hintText: 'Enter your email',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.green,
                  ),
                  labelText: 'Email'),
            ),
          ],
        ));
  }

  Widget _buildPassword() {
    return Container(
        margin: const EdgeInsets.only(
            top: 20.0, bottom: 0.0, right: 20.0, left: 20.0),
        child: Wrap(
          children: <Widget>[
            TextFormField(
              controller: _passwordInputController,
              validator: (input) => input!.length < 8
                  ? 'Password must be at least 8 characters'
                  : null,
              obscureText: true,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.green, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.green, width: 2.0),
                  ),
                  hintText: 'Enter your password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.green,
                  ),
                  labelText: 'Password'),
            ),
          ],
        ));
  }

  Widget _buildReEnterPassword() {
    return Container(
      margin: const EdgeInsets.only(
          top: 20.0, bottom: 0.0, right: 20.0, left: 20.0),
      child: TextFormField(
        controller: _reEnterPwdInputController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please Re-Enter New Password";
          } else if (value.length < 8) {
            return "Password must be atleast 8 characters long";
          } else if (value != _reEnterPwdInputController.text) {
            return "Password must be same as above";
          } else {
            return null;
          }
        },
        obscureText: true,
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.green),
            focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.green, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.green, width: 2.0),
            ),
            hintText: 'Re-enter your password',
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.green,
            ),
            labelText: 'Re-enter Password'),
      ),
    );
  }

  Widget _buildCheckAgreement() {
    return Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: <Widget>[
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.green),
              child: Checkbox(
                value: _agree,
                checkColor: Colors.white,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    _agree = value!;
                  });
                },
              )),
          Text(
            'I agree with terms & conditions',
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpWith() {
    return Wrap(
      children: <Widget>[
        Center(
          child: Text(
            '- OR -',
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              'Sign up with',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSignUpBtn() {
    return Container(
      margin: const EdgeInsets.only(
          left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
        elevation: 5.0,
        onPressed: _formSubmit,
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.green,
        child: Text(
          'SIGN UP',
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'),
        ),
      ),
    );
  }

  Widget _buildSignUpWithGoogle() {
    return Center(
        // ignore: deprecated_member_use
        child: FlatButton(
      onPressed: _signInWithGoogle,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5.0),
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: AssetImage(
              'images/google.jpg',
            ),
          ),
        ),
      ),
    ));
  }

  Widget _buildSignInMsg() {
    return Container(
        // ignore: deprecated_member_use
        child: FlatButton(
      onPressed: () {
        widget.tabController!.animateTo(0);
      },
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: 'Already have an account?  ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400)),
              TextSpan(
                  text: 'Sign In',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Loading()
        : Scaffold(
            body: Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Wrap(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          _buildEmail(),
                          _buildPassword(),
                          _buildReEnterPassword(),
                          _buildCheckAgreement(),
                          _buildSignUpBtn(),
                          _buildSignUpWith(),
                          _buildSignUpWithGoogle(),
                          _buildSignInMsg(),
                        ],
                      )),
                ],
              ),
            ),
          );
  }
}
