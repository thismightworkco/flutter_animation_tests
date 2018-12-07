import 'package:animation_tests/animated_container.dart';
import 'package:animation_tests/animated_crossfade.dart';
import 'package:animation_tests/delay_animation_widget.dart';
import 'package:animation_tests/easing_animation_widget.dart';
import 'package:animation_tests/hart_animation_widget.dart';
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: Text("Easing animation"),
              subtitle: Text("An example of a simple easing animation."),
              onTap: () {
                Navigator.of(context).push(new PageRouteBuilder(
                    opaque: true,
                    transitionDuration: new Duration(seconds: 1),
                    pageBuilder:
                        (BuildContext content, Animation _, Animation __) {
                      return new EasingAnimationWidget();
                    },
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> _,
                        Widget child) {
                      return new FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    }));
              },
            ),
            new ListTile(
              title: Text("Delayed animation"),
              subtitle: Text("An example a delayed animation."),
              onTap: () {
                Navigator.of(context).push(new PageRouteBuilder(
                    opaque: true,
                    transitionDuration: new Duration(seconds: 1),
                    pageBuilder: (BuildContext content, Animation _,
                        Animation secondAnimation) {
                      return new DelayAnimationWidget();
                    },
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondAnimation,
                        Widget child) {
                      return new FadeTransition(
                          opacity: animation, child: child);
                    }));
              },
            ),
            new ListTile(
              title: Text("Hart animation"),
              subtitle: Text("An example a hart animation."),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HartAnimationWidget()),
                );
              },
            ),
            new ListTile(
              title: Text("Transition animation"),
              subtitle: Text("An example of a transition animation."),
              onTap: () {
                Navigator.of(context).push(new PageRouteBuilder(
                    opaque: true,
                    transitionDuration: new Duration(seconds: 1),
                    pageBuilder: (BuildContext content, Animation priman,
                        Animation secondAnimation) {
                      return new TransitionAnimationWidget(priman);
                    },
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondAnimation,
                        Widget child) {
                      return child;
                    }));
              },
            ),
            new ListTile(
              title: Text("Sequence animation"),
              subtitle: Text("An example of a sequenced animation."),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SequenceAnimationWidget()),
                );
              },
            ),
            new ListTile(
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
            new ListTile(
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
            new ListTile(
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
          ],
        ),
      ),
    );
  }
}
