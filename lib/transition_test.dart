import 'package:flutter/material.dart';

class TransitionAnimationWidget extends StatefulWidget {
  @override
  TransitionAnimationWidgetState createState() =>
      TransitionAnimationWidgetState();

  Animation _animation;

  TransitionAnimationWidget(this._animation);
}

class TransitionAnimationWidgetState extends State<TransitionAnimationWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: widget._animation,
          child: new Container(
            width: 200.0,
            height: 200.0,
            color: Colors.orange,
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
    super.dispose();
  }
}
