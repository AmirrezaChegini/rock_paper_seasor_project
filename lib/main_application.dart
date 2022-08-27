import 'dart:math';

import 'package:flutter/material.dart';

class MainApplication extends StatefulWidget {
  const MainApplication({Key? key}) : super(key: key);

  @override
  State<MainApplication> createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  int top = 1;
  int bottom = 1;
  int topScore = 0;
  int bottomScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return AppBar(
      title: Text('Rock     Paper     Seasor'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () => resetGame(),
          icon: Icon(Icons.refresh),
        ),
      ],
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.deepOrange, Colors.white],
            radius: 0.7,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity),
            Text(
              '$topScore',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Image(image: AssetImage('assets/images/$top.png')),
            SizedBox(height: 150),
            TextButton(
              onPressed: () => playgGame(),
              child: Text('Start'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                shape: CircleBorder(),
                minimumSize: Size(60, 60),
              ),
            ),
            SizedBox(height: 150),
            Image(image: AssetImage('assets/images/$bottom.png')),
            SizedBox(height: 20),
            Text(
              '$bottomScore',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  void playgGame() {
    setState(() {
      top = Random().nextInt(3) + 1;
      bottom = Random().nextInt(3) + 1;

      updatePoint();
    });
  }

  void updatePoint() {
    if (top == 1 && bottom == 3) {
      topScore++;
    } else if (top == 2 && bottom == 1) {
      topScore++;
    } else if (top == 3 && bottom == 2) {
      topScore++;
    } else if (top == bottom) {
      return;
    } else {
      bottomScore++;
    }
  }

  void resetGame(){
    setState(() {
      topScore = 0;
      bottomScore = 0;
      top = 1;
      bottom = 1;
    });
  }
}
