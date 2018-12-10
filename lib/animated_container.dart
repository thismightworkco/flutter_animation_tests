import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  @override
  AnimatedContainerWidgetState createState() => AnimatedContainerWidgetState();
}

class AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  @override
  void initState() {
    super.initState();
  }

  Color _color = Colors.lightGreen;
  double _size = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new AnimatedContainer(
              duration: new Duration(milliseconds: 1000),
              curve: Curves.decelerate,
              width: _size,
              height: _size,
              color: _color,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: new RaisedButton(
                onPressed: () {
                  setState(() {
                    _size = _size == 200.0 ? 250.0 : 200.0;

                    _color = _color == Colors.deepOrange
                        ? Colors.lightGreen
                        : Colors.deepOrange;
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
