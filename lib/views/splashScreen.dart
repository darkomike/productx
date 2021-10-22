import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productx/views/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: IndexedStack(
        index: _page,
        children: [
          pageScreenOne(_height, _width),
          pageScreenTwo(_height, _width),
          pageScreenThree(_height, _width),
          pageScreenFour(_height, _width)
        ],
      ),
    );
  }

  GestureDetector pageScreenOne(double _height, double _width) {
    return GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx < 0) {
            setState(() {
              _page = 1;
            });
          }
        },
        child: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: _height / 7,
                child: Image.asset("assets/drug.png"),
                width: _width / 8.5,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  // Expanded(
                  //   child: IconButton(
                  //     icon: Icon(Icons.arrow_back),
                  //     onPressed: () {},
                  //   ),
                  // ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Wrap(
                        children: [
                          Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              style: GoogleFonts.workSans(
                                color: Colors.black,
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: IconButton(
                  //     icon: Icon(Icons.arrow_forward),
                  //     onPressed: () {},
                  //   ),
                  // )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          color: Color(0xFF0FABBC),
          height: _height,
          width: _width,
        ));
  }

  GestureDetector pageScreenTwo(double _height, double _width) {
    return GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            setState(() {
              _page = 0;
            });
          }
           if (details.delta.dx <  0) {
            setState(() {
              _page = 2;
            });
          }
        },
        child: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: _height / 7,
                child: Image.asset("assets/delivery.png"),
                width: _width / 8.5,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  // Expanded(
                  //   child: IconButton(
                  //     icon: Icon(Icons.arrow_back),
                  //     onPressed: () {},
                  //   ),
                  // ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Wrap(
                        children: [
                          Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              style: GoogleFonts.workSans(
                                color: Colors.black,
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: IconButton(
                  //     icon: Icon(Icons.arrow_forward),
                  //     onPressed: () {},
                  //   ),
                  // )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          color: Colors.yellow,
          height: _height,
          width: _width,
        ));
  }

  GestureDetector pageScreenThree(double _height, double _width) {
    return GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            setState(() {
              _page = 1;
            });
          }
           if (details.delta.dx < 0) {
            setState(() {
              _page = 3;
            });
          }
        },
        child: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: _height / 7,
                child: Image.asset("assets/pre.png"),
                width: _width / 8.5,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  // Expanded(
                  //   child: IconButton(
                  //     icon: Icon(Icons.arrow_back),
                  //     onPressed: () {},
                  //   ),
                  // ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Wrap(
                        children: [
                          Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              style: GoogleFonts.workSans(
                                color: Colors.black,
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: IconButton(
                  //     icon: Icon(Icons.arrow_forward),
                  //     onPressed: () {},
                  //   ),
                  // )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          color: Colors.brown[300],
          height: _height,
          width: _width,
        ));
  }

  GestureDetector pageScreenFour(double _height, double _width) {
    return GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            setState(() {
              _page = 2;
            });
          }
          if (details.delta.dx < 0) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => SignIn()));
          }
        },
        child: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: _height / 7,
                child: Image.asset("assets/pre.png"),
                width: _width / 8.5,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  // Expanded(
                  //   child: IconButton(
                  //     icon: Icon(Icons.arrow_back),
                  //     onPressed: () {},
                  //   ),
                  // ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Wrap(
                        children: [
                          Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              style: GoogleFonts.workSans(
                                color: Colors.black,
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: IconButton(
                  //     icon: Icon(Icons.arrow_forward),
                  //     onPressed: () {},
                  //   ),
                  // )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          color: Colors.red[200],
          height: _height,
          width: _width,
        ));
  }
}
