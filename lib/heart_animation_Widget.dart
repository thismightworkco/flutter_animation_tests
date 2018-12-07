import 'package:animation_tests/combined_animation.dart';
import 'package:flutter/material.dart';

class HeartAnimationWidget extends StatefulWidget {
  @override
  HeartAnimationWidgetState createState() => HeartAnimationWidgetState();
}

class HeartAnimationWidgetState extends State<HeartAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  CombinedAnimation _redHeartSizeAnimation;
  CombinedAnimation _redCircleSizeAnimation;
  CombinedAnimation _whiteCircleSizeAnimation;
  CombinedAnimation _waveEffectSizeAnimation;
  CombinedAnimation _waveEffectOpacityAnimation;
  CombinedAnimation _greyHeartSizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1500));

    _redHeartSizeAnimation = new CombinedAnimation([
      AnimationStep(
          begin: 0.0,
          end: 200.0,
          curve: Curves.easeOut,
          intervalStart: 0.1,
          intervalEnd: 0.3),
      AnimationStep(
        begin: 0.0,
        end: -120.0,
        curve: const Cubic(0.71, -0.01, 1.0, 1.0),
        intervalStart: 0.3,
        intervalEnd: 0.5,
      ),
      AnimationStep(
        begin: 0.0,
        end: 68.0,
        curve: Curves.elasticOut,
        intervalStart: 0.5,
        intervalEnd: 1.0,
      ),
    ], _controller);

    _greyHeartSizeAnimation = new CombinedAnimation([
      AnimationStep(
          begin: 148.0,
          end: 0.0,
          curve: Curves.easeInOut,
          intervalStart: 0.0,
          intervalEnd: 0.15),
    ], _controller);

    _redCircleSizeAnimation = new CombinedAnimation([
      AnimationStep(
          begin: 0.0,
          end: 310.0,
          curve: Curves.easeInOut,
          intervalStart: 0.0,
          intervalEnd: 0.3),
    ], _controller);

    _whiteCircleSizeAnimation = new CombinedAnimation([
      AnimationStep(
          begin: 0.0,
          end: 315.0,
          curve: Curves.easeInOut,
          intervalStart: 0.1,
          intervalEnd: 0.25),
    ], _controller);

    _waveEffectSizeAnimation = new CombinedAnimation([
      AnimationStep(
          begin: 110.0,
          end: 220.0,
          curve: Curves.easeInOut,
          intervalStart: 0.3,
          intervalEnd: 0.5),
    ], _controller);

    _waveEffectOpacityAnimation = new CombinedAnimation([
      AnimationStep(
          begin: 0.0,
          end: 1.0,
          curve: Curves.easeInOut,
          intervalStart: 0.2,
          intervalEnd: 0.5),
      AnimationStep(
          begin: 0.0,
          end: -1.0,
          curve: Curves.easeInOut,
          intervalStart: 0.50,
          intervalEnd: 0.7),
    ], _controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: GestureDetector(
              onTap: () {
                _controller.reset();
                _controller.forward();
              },
              child: Center(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (BuildContext context, Widget child) {
                          return Container(
                            height: _redCircleSizeAnimation.value,
                            width: _redCircleSizeAnimation.value,
                            child: Center(
                              child: Image.asset('images/Circle_Red.png'),
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (BuildContext context, Widget child) {
                          return Container(
                            height: _whiteCircleSizeAnimation.value,
                            width: _whiteCircleSizeAnimation.value,
                            child: Center(
                              child: Image.asset('images/Circle_white.png'),
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (BuildContext context, Widget child) {
                          return Opacity(
                            opacity: _waveEffectOpacityAnimation.value,
                            child: Container(
                              height: _waveEffectSizeAnimation.value,
                              width: _waveEffectSizeAnimation.value,
                              child: Center(
                                child:
                                    Image.asset('images/Heart_WaveEffect.png'),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (BuildContext context, Widget child) {
                          return Container(
                            height: _redHeartSizeAnimation.value,
                            width: _redHeartSizeAnimation.value,
                            child: Center(
                              child: Image.asset('images/Heart_Red.png'),
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (BuildContext context, Widget child) {
                          return Container(
                            height: _greyHeartSizeAnimation.value,
                            width: _greyHeartSizeAnimation.value,
                            child: Center(
                              child: Image.asset('images/Heart_Grey.png'),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
