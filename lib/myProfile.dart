import 'package:flutter/material.dart';
import 'package:git_book/main.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Git Book"),
        ),
        body: ListView(
          children: <Widget>[
            Column(children: [
              TopContainer(),
              MyCustomForm(),
            ])
          ],
        ));
  }
}

class TopContainer extends StatefulWidget {
  @override
  TopContainerState createState() {
    return TopContainerState();
  }
}

class TopContainerState extends State<TopContainer> {
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFffa726), //remove color to make it transpatent
            border: Border.all(style: BorderStyle.solid, color: Colors.white)),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                child: (ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.asset(
                    'images/avatar.png',
                    width: 200,
                    height: 200,
                    //fit: BoxFit.cover,
                  ),
                ))),
            Center(
                child: Text("@the_alpha",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ))),
            Container(
                decoration: BoxDecoration(
                    color:
                        Color(0xFF7cb342), //remove color to make it transpatent
                    border: Border.all(
                        style: BorderStyle.solid, color: Colors.white)),
                margin: const EdgeInsets.only(bottom: 0, top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      //height: MediaQuery.of(context).size.height / 6
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Lessons : 12 \nCompleted  ',
                            style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Color(0xFFFFFFFF)),
                          )),
                    ),
                    SizedBox(
                      //height: MediaQuery.of(context).size.height / 6,
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Level : 8',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Color(0xFFFFFFFF)),
                          )),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    initialValue: "nirmal amanda",
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(), labelText: 'Name'),
                    validator: (name) {
                      if (name == null || name.isEmpty) {
                        return 'Please enter a valid name';
                      }
                      return null;
                    },
                  )),
              Container(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    obscureText: true,
                    initialValue: "nirmal@123",
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(), labelText: 'Password'),
                    validator: (pwd) {
                      if (pwd == null || pwd.isEmpty) {
                        return 'Please enter a valid password';
                      }
                      return null;
                    },
                  )),
              Container(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    initialValue: "0704081881",
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(), labelText: 'Mobile'),
                    validator: (mobile) {
                      if (mobile == null || mobile.isEmpty) {
                        return 'Please enter a valid mobile number';
                      }
                      return null;
                    },
                  )),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        showAlertDialog(context);
                      }
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
                )
                
            ],
          ),
        ));
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Updated Successfully"),
    content: Text("You have successfully updated"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
