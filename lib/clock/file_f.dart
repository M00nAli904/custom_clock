import 'package:flutter/material.dart';

void main() {
  runApp(FileF());
}
class FileF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _homeSelectedIndex = 0;
  int _accountSelectedIndex = 0;

  void _onHomeItemTapped(int index) {
    setState(() {
      _homeSelectedIndex = index;
    });
  }

  void _onAccountItemTapped(int index) {
    setState(() {
      _accountSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Demo'),
      ),
      body: _homeSelectedIndex == 0
          ? HomeScreen()
          : MyAccountScreen(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () => _onHomeItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.account_circle_rounded),
              onPressed: () => _onAccountItemTapped(1),
            ),
          ],
        ),
      ),

    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen Data'),
    );
  }
}

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Account Screen Data'),
    );
  }
}
