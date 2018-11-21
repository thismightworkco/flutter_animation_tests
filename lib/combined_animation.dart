import 'package:flutter/material.dart';

// TODO: Animation abstract extenden?
// TODO: absolute values versus fractional
class CombinedAnimation {
  List<AnimationStep> steps;

  List<Animation<double>> animations = new List();

  // TODO:  Can value be negative?
  double get value {
    return getCombinedValue();
  }

  AnimationController parent;

  // Constructor

  // Add assertions? - total interval can be max 1.0, no overlap?
  // Instead of asking developer to calculate the begin and end value, ask end state and calculate values here?
  CombinedAnimation(List<AnimationStep> steps, AnimationController parent) {
    this.parent = parent;
    this.steps = steps;

    for (AnimationStep step in steps) {
      animations.add(
        Tween<double>(begin: step.begin, end: step.end).animate(
          CurvedAnimation(
              parent: parent,
              curve: Interval(step.intervalStart, step.intervalEnd,
                  curve: step.curve)),
        ),
      );
    }
  }

  double getCombinedValue() {
    double value = 0.0;

    for (Animation<double> animation in animations) {
      value = value + animation.value;
    }

    if (value < 0.0) {
      return 0.0;
    }

    return value;
  }
}

class AnimationStep<double> {
  AnimationStep(
      {this.begin, this.end, this.curve, this.intervalStart, this.intervalEnd});

  double begin;
  double end;
  Curve curve;
  double intervalStart;
  double intervalEnd;
}
