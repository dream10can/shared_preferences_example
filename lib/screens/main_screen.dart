import 'package:flutter/material.dart';
import 'package:share_preference_practice/screens/second_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final myController = TextEditingController();

  // void _addStringTSF(String value) async {}

  @override
  void initState() {
    super.initState();
    // myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('share preference'),
      ),
      body: Center(
          child: Column(
        children: [
          TextField(
            controller: myController,
            decoration: InputDecoration(
              icon: Icon(
                Icons.info,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () async {
              print(myController.text);
              SharedPreferences pref = await SharedPreferences.getInstance();

              pref.setString('name', myController.text);
            },
            child: Text('submit'),
          ),
          SizedBox(
            height: 20.0,
          ),
          IconButton(
            icon: Icon(
              Icons.forward,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(),
                ),
              );
            },
            color: Colors.blueAccent,
          )
        ],
      )),
    );
  }
}
