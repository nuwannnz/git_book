import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key, this.tabController}) : super(key: key);

  final TabController? tabController;

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _agree = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _reEnterPwdInputController = TextEditingController();

  _formSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Email:' + _emailInputController.text);
      print('Password:' + _passwordInputController.text);
      print('Re-enter Password:' + _reEnterPwdInputController.text);

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailInputController.text,
            password: _passwordInputController.text);
        widget.tabController!.animateTo(0);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
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
        child: Wrap(
          children: <Widget>[
            TextFormField(
              controller: _reEnterPwdInputController,
              validator: (input) => input != _reEnterPwdInputController.text
                  ? 'Password not much'
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
    return GestureDetector(
        onTap: () => print('Sign Up with Google'),
        child: Center(
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
    return Scaffold(
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
