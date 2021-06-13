import 'package:flutter/material.dart';
import 'package:git_book/Screens/login_screen.dart';
import 'package:git_book/Screens/register_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabControl;

  @override
  void initState() {
    super.initState();
    _tabControl = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabControl!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange[400],
          title: Text(
            'Git Book',
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
            controller: _tabControl,
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
          controller: _tabControl,
          children: <Widget>[
            LoginScreen(tabController: _tabControl),
            RegisterScreen(
              tabController: _tabControl,
            ),
          ],
        ),
      ),
    );
  }
}
