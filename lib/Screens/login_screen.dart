import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:git_book/Screens/home.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, this.tabController}) : super(key: key);

  final TabController? tabController;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  _LoginScreenState() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        // FirebaseAuth.instance.signOut();

        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return HomeScreen();
        }));
      }
    });
  }

  _formSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Email:' + _emailInputController.text);
      print('Password:' + _passwordInputController.text);

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailInputController.text,
            password: _passwordInputController.text);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return HomeScreen();
        }));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  Future<UserCredential> _signInWithGoogle() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
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
        child: Column(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

  Widget _buildForgotPassword() {
    return Container(
      margin: const EdgeInsets.only(right: 20.0),
      alignment: Alignment.centerRight,
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
        ),
      ),
    );
  }

  Widget _buildRememberMe() {
    return Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: <Widget>[
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.green),
              child: Checkbox(
                value: _rememberMe,
                checkColor: Colors.white,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value!;
                  });
                },
              )),
          Text(
            'Remember me',
          ),
        ],
      ),
    );
  }

  Widget _buildSignInBtn() {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
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
          'SIGN IN',
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

  Widget _buildSignInWith() {
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
              'Sign in with',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSignInWithGoogle() {
    return Center(
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: _signInWithGoogle,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20.0),
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
      ),
    );
  }

  Widget _buildSignUpMsg() {
    return Container(
        margin: const EdgeInsets.only(top: 15.0),
        // ignore: deprecated_member_use
        child: FlatButton(
          onPressed: () {
            widget.tabController!.animateTo(1);
          },
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'Don\'t have an account?  ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: 'Sign Up',
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

// Main Code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Wrap(
        children: <Widget>[
          Center(
            child: Text(
              'Sign In',
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
                ],
              )),
          _buildForgotPassword(),
          _buildRememberMe(),
          _buildSignInBtn(),
          _buildSignInWith(),
          _buildSignInWithGoogle(),
          _buildSignUpMsg(),
        ],
      ),
    ));
  }
}
