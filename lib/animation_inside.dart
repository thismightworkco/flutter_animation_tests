import 'package:flutter/material.dart';

class AnimationInsideWidget extends StatefulWidget {
  @override
  AnimationInsideWidgetState createState() => AnimationInsideWidgetState();
}

class AnimationInsideWidgetState extends State<AnimationInsideWidget>
    with SingleTickerProviderStateMixin {
  @override
  AnimationController _controller;
  Animation<Offset> _positionAnimation;

  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _positionAnimation = Tween(
      begin: Offset(0.0, -6.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.greenAccent,
          child: Align(
            alignment: Alignment(0.0, 0.0),
            child: SlideTransition(
              position: _positionAnimation,
              child: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.amberAccent,
              ),
            ),
          ),
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
    _controller.dispose();
    super.dispose();
  }
}
