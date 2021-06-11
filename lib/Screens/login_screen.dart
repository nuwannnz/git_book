import 'package:flutter/material.dart';

/// This is the stateless widget that the main application instantiates.
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _rememberMe = false;
  bool _agree = false;

  Widget _buildEmailSignIn() {
    return Container(
        margin: const EdgeInsets.only(
            top: 20.0, bottom: 0.0, right: 20.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
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

  Widget _buildPasswordSignIn() {
    return Container(
        margin: const EdgeInsets.only(
            top: 20.0, bottom: 0.0, right: 20.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
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

  Widget _buildForgotPasswordSignIn() {
    return Container(
      margin: const EdgeInsets.only(right: 20.0),
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
        ),
      ),
    );
  }

  Widget _buildRememberMeSignIn() {
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
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Login Button Pressed'),
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
    return GestureDetector(
        onTap: () => print('Sign In with Google'),
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(bottom: 15.0),
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

  Widget _buildSignUpMsg() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
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
    );
  }

  // Sign Up Form
  Widget _buildEmailSignUp() {
    return Container(
        margin: const EdgeInsets.only(
            top: 10.0, bottom: 0.0, right: 20.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
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

  Widget _buildPasswordSignUp() {
    return Container(
        margin: const EdgeInsets.only(
            top: 10.0, bottom: 0.0, right: 20.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
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

  Widget _buildReEnterPasswordSignUp() {
    return Container(
        margin: const EdgeInsets.only(
            top: 10.0, bottom: 0.0, right: 20.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
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
          ],
        ));
  }

  Widget _buildCheckAgreementSignUp() {
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
          left: 20.0, right: 20.0, bottom: 10.0, top: 0.0),
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Register Button Pressed'),
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
    return GestureDetector(
        onTap: () => print('Sign Up with Google'),
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(bottom: 25.0),
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
    return GestureDetector(
      onTap: () => print('Sign In Button Pressed'),
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
    );
  }

// Main Code
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[400],
          title: const Text(
            'Git Book',
            style: TextStyle(color: Colors.black),
          ),
          bottom: const TabBar(
            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(
                text: "Sign In",
                icon: Icon(Icons.login_outlined),
              ),
              Tab(
                text: "Sign Up",
                icon: Icon(Icons.app_registration_outlined),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Wrap(
                spacing: 20.0,
                runSpacing: 4.0,
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
                  _buildEmailSignIn(),
                  _buildPasswordSignIn(),
                  _buildForgotPasswordSignIn(),
                  _buildRememberMeSignIn(),
                  _buildSignInBtn(),
                  _buildSignInWith(),
                  _buildSignInWithGoogle(),
                  _buildSignUpMsg(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Wrap(
                spacing: 20.0,
                runSpacing: 4.0,
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
                  _buildEmailSignUp(),
                  _buildPasswordSignUp(),
                  _buildReEnterPasswordSignUp(),
                  _buildCheckAgreementSignUp(),
                  _buildSignUpBtn(),
                  _buildSignUpWith(),
                  _buildSignUpWithGoogle(),
                  _buildSignInMsg(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
