import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  @override
  AnimatedCrossFadeWidgetState createState() => AnimatedCrossFadeWidgetState();
}

class AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  @override
  void initState() {
    super.initState();
  }

  double _size = 200.0;

  CrossFadeState _fadeState = CrossFadeState.showFirst;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedCrossFade(
              crossFadeState: _fadeState,
              duration: new Duration(milliseconds: 1000),
              firstCurve: Curves.easeInOut,
              secondCurve: Curves.easeInOut,
              firstChild: Center(
                child: Image.asset(
                  "images/flutter-logo.png",
                  width: _size,
                  height: _size,
                ),
              ),
              secondChild: Center(
                child: Image.asset(
                  "images/dart-logo.png",
                  width: _size,
                  height: _size,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: new RaisedButton(
                onPressed: () {
                  setState(() {
                    _fadeState = _fadeState == CrossFadeState.showFirst
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst;
                  });
                },
                child: Text("Animate"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
