import 'package:animation_tests/animated_container.dart';
import 'package:animation_tests/animated_crossfade.dart';
import 'package:animation_tests/animation_inside.dart';
import 'package:animation_tests/delay_animation_widget.dart';
import 'package:animation_tests/easing_animation_widget.dart';
import 'package:animation_tests/heart_animation_widget.dart';
import 'package:animation_tests/sequence_animation_widget.dart';
import 'package:animation_tests/train_hopping_widget.dart';
import 'package:animation_tests/transition_test.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Animation Demo',
      theme: new ThemeData(),
      home: new MyHomePage(title: 'Animation Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Image.asset("images/flutter-belgium.png"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Easing animation"),
              subtitle: Text("A simple easing animation."),
              onTap: () {
                Navigator.of(context).push( PageRouteBuilder(
                    opaque: true,
                    transitionDuration:  Duration(seconds: 1),
                    pageBuilder:
                        (BuildContext content, Animation _, Animation __) {
                      return EasingAnimationWidget();
                    },
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> _,
                        Widget child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    }));
              },
            ),
            ListTile(
              title: Text("Delayed animation"),
              subtitle:
                  Text("A delayed animation, with custom page transition"),
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    opaque: true,
                    transitionDuration: Duration(seconds: 1),
                    pageBuilder: (BuildContext content, Animation _,
                        Animation secondAnimation) {
                      return DelayAnimationWidget();
                    },
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondAnimation,
                        Widget child) {
                      return FadeTransition(
                          opacity: animation, child: child);
                    }));
              },
            ),
            ListTile(
              title: Text("Heart animation"),
              subtitle: Text("A more complex micro-animation."),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HeartAnimationWidget()),
                );
              },
            ),
            ListTile(
              title: Text("Transition animation"),
              subtitle: Text(
                  "A scale transition animation, with custom page transition"),
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    opaque: true,
                    transitionDuration: Duration(seconds: 1),
                    pageBuilder: (BuildContext content, Animation priman,
                        Animation secondAnimation) {
                      return TransitionAnimationWidget(priman);
                    },
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondAnimation,
                        Widget child) {
                      return child;
                    }));
              },
            ),
            ListTile(
              title: Text("Sequence animation"),
              subtitle: Text("A sequenced animation."),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SequenceAnimationWidget()),
                );
              },
            ),
            ListTile(
              title: Text("Trainhopping animation"),
              subtitle: Text("An example of a trainhopping animation."),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TrainHoppingAnimationWidget()),
                );
              },
            ),
            ListTile(
              title: Text("Animated container "),
              subtitle: Text("An example of an animated container."),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AnimatedContainerWidget()),
                );
              },
            ),
            ListTile(
              title: Text("Animated CrossFade "),
              subtitle: Text("An example of an animated CrossFade."),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AnimatedCrossFadeWidget()),
                );
              },
            ),
            ListTile(
              title: Text("Animation Inside!"),
              subtitle: Text("A small SlideTransition"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AnimationInsideWidget()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
