import 'package:flutter/material.dart';

class DelayAnimationWidget extends StatefulWidget {
  @override
  DelayAnimationWidgetState createState() => DelayAnimationWidgetState();
}

class DelayAnimationWidgetState extends State<DelayAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  Animation _lateAnimation;

  @override
  void initState() {
    super.initState();

    void handler(status) {
      if (status == AnimationStatus.completed) {
        _animation.removeStatusListener(handler);
        _controller.reset();
        _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.fastOutSlowIn,
        ));

        _lateAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _controller,
          curve: Interval(0.2, 1.0, curve: Curves.fastOutSlowIn),
        ))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.pop(context);
            }
          });
        _controller.forward();
      }
    }

    _controller = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));

    _animation = new Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn))
      ..addStatusListener(handler);

    _lateAnimation = new Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 1.0, curve: Curves.fastOutSlowIn)));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform(
                  transform: Matrix4.translationValues(
                      _animation.value * width, 0.0, 0.0),
                  child: new Container(
                    width: 200.0,
                    height: 50.0,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                  width: 100.0,
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      _lateAnimation.value * width, 0.0, 0.0),
                  child: new Container(
                    width: 200.0,
                    height: 50.0,
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
