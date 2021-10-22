import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _page,
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  _page += 1;
                });
              },
              child: Container(
                child: Center(child: Text("1")),
                color: Colors.yellow,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              )),
          GestureDetector(
              onTap: () {
                setState(() {
                  _page += 1;
                });
              },
              child: Container(
                child: Center(child: Text("2")),
                color: Colors.green,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              )),
          GestureDetector(
              onTap: () {
                setState(() {
                  _page += 1;
                });
              },
              child: Container(
                child: Center(child: Text("3")),
                color: Colors.red,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              )),
          GestureDetector(
            onTap: (){
              setState(() {
                _page+=1;
              });
            },
            child: Container(
              child: Center(child: Text("4")),
              color: Colors.blue,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                _page=0;
              });
            },
            child: Container(
              child: Center(child: Text("5")),
              color: Colors.deepOrangeAccent,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}
