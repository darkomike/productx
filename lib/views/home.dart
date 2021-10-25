import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _slideShowPageController = PageController();

  int _index = 0;

  void _changeSlideStack() {
    Timer.periodic(new Duration(seconds: 5), (timer) {
      setState(() {
        if (_index >= 3) {
          _index = 0;
        } else {
          _index += 1;
        }
      });
      debugPrint("Timer " + timer.tick.toString());
    });
  }

  void _changeSlidePage() {
    Timer.periodic(new Duration(seconds: 10), (timer) {
      setState(() {
        if (_index >= 3) {
          _index = 0;
        } else {
          _index += 1;
        }
      });

      if (_slideShowPageController.hasClients) {
        _slideShowPageController.animateToPage(
          _index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInCubic,
        );
      }

      debugPrint("Timer " + timer.tick.toString());
    });
  }

  @override
  void initState() {
    // _changeSlideStack();
    _changeSlidePage();
    _index = 0;
    super.initState();
  }

  void dispose() {
    _slideShowPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: _height / 17),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: WelcomeProfilePic(width: _width),
            ),
            Expanded(
              flex: 18,
              child: Container(
                margin: EdgeInsets.only(top: 0),
                child: ListView(
                  children: [
                    SlideImagesCard(
                      width: _width,
                      index: _index,
                      height: _height,
                      slideShowPageController: _slideShowPageController,
                    ),
                    RemindersCard(width: _width, height: _height),
                    VitalsCard(width: _width, height: _height),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VitalsCard extends StatelessWidget {
  const VitalsCard({
    Key? key,
    required double width,
    required double height,
  })  : _width = width,
        _height = height,
        super(key: key);

  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      elevation: 10,
      shadowColor: Colors.indigo,

      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: _width,
        margin: EdgeInsets.all(4),
        child: Center(
            child: Text("Vitals",
                style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold))),
        height: _height / 4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class RemindersCard extends StatelessWidget {
  const RemindersCard({
    Key? key,
    required double width,
    required double height,
  })  : _width = width,
        _height = height,
        super(key: key);

  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      elevation: 10,
      shadowColor: Colors.indigo,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: _width,
        margin: EdgeInsets.all(4),
        child: Center(
            child: Text("Reminders",
                style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold))),
        height: _height / 4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class SlideImagesCard extends StatelessWidget {
  const SlideImagesCard(
      {Key? key,
      required double width,
      required int index,
      required double height,
      required PageController slideShowPageController})
      : _width = width,
        _index = index,
        _height = height,
        _slideShowPageController = slideShowPageController,
        super(key: key);

  final double _width;
  final int _index;
  final double _height;
  final PageController _slideShowPageController;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      shadowColor: Colors.indigo,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        width: _width,
        child: Stack(
          children: [
            Container(
              child: PageView(
                controller: _slideShowPageController,
                onPageChanged: (index) {
                  print("Page index: " + index.toString());

                  _slideShowPageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInCubic,
                  );
                },
                children: [
                  SlideImage(height: _height, imagePath: "assets/vd.jpg"),
                  SlideImage(height: _height, imagePath: "assets/cd.png"),
                  SlideImage(height: _height, imagePath: "assets/kk.jpg"),
                  SlideImage(height: _height, imagePath: "assets/drug.jpg"),
                ],
              ),
            ),
            Positioned(
              bottom: 25,
              left: _width / 3.0,
              child: SlideIndicators(width: _width, index: _index),
            )
          ],
        ),
        height: _height / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
      ),
    );
  }
}

class SlideImagesStack extends StatelessWidget {
  const SlideImagesStack({
    Key? key,
    required int index,
    required double height,
  })  : _index = index,
        _height = height,
        super(key: key);

  final int _index;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _index,
      children: [
        SlideImage(height: _height, imagePath: "assets/vd.jpg"),
        SlideImage(height: _height, imagePath: "assets/cd.png"),
        SlideImage(height: _height, imagePath: "assets/kk.jpg"),
        SlideImage(height: _height, imagePath: "assets/drug.jpg"),
      ],
    );
  }
}

class SlideImage extends StatelessWidget {
  const SlideImage({Key? key, required double height, required imagePath})
      : _height = height,
        _imagePath = imagePath,
        super(key: key);

  final double _height;
  final String _imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(_imagePath),
            fit: BoxFit.fill,
          ),
          color: Colors.white),
    );
  }
}

class SlideIndicators extends StatelessWidget {
  const SlideIndicators({
    Key? key,
    required double width,
    required int index,
  })  : _width = width,
        _index = index,
        super(key: key);

  final double _width;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      width: _width / 3.6,
      decoration: BoxDecoration(
        color: Colors.indigo[700],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _index == 0 ? Colors.red : Colors.white),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _index == 1 ? Colors.red : Colors.white),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _index == 2 ? Colors.red : Colors.white),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _index == 3 ? Colors.red : Colors.white),
          )
        ],
      ),
    );
  }
}

class WelcomeProfilePic extends StatelessWidget {
  const WelcomeProfilePic({
    Key? key,
    required double width,
  })  : _width = width,
        super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [WelcomeUser(), ProfilePicture(width: _width)],
      ),
    );
  }
}

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text("Pleased to meet you,\n User",
            style: GoogleFonts.nunito(
              color: Colors.black,
              fontSize: 20,
            )),
      ],
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
    required double width,
  })  : _width = width,
        super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.indigo,
        maxRadius: _width / 12,
        child: Text("PP"),
      ),
    );
  }
}
// Expanded(
// flex: 6,
// child: SlideImagesCard(
// width: _width, index: _index, height: _height),
// ),
