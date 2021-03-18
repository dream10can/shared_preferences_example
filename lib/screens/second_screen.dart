import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String _name = '';
  @override
  void initState() {
    super.initState();
    _loadFS();
  }

  _loadFS() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = (prefs.getString('name') ?? '');
    });
  }

  Future<bool> _removeFS() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.remove('name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Container(
          width: 200.0,
          height: 100.0,
          child: Card(
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.amberAccent,
            child: ListTile(
              title: Align(
                alignment: Alignment.center,
                child: Text(_name),
              ),
              trailing: InkWell(
                onTap: () async {
                  print('pressed');
                  _removeFS();
                  _loadFS();
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
