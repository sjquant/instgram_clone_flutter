import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/duration.dart';
import 'package:instagram_clone/widgets/signin_form.dart';
import 'package:instagram_clone/widgets/signup_form.dart';

class FadeStack extends StatefulWidget {
  final int currentStackIndex;

  const FadeStack({Key key, this.currentStackIndex}) : super(key: key);
  @override
  _FadeStackState createState() => _FadeStackState();
}

class _FadeStackState extends State<FadeStack>
    with SingleTickerProviderStateMixin {
  List<Widget> forms = [SignupForm(), SigninForm()];
  AnimationController _fadeController;

  @override
  void initState() {
    _fadeController =
        AnimationController(vsync: this, duration: COMMON_DURATION);
    _fadeController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FadeStack oldWidget) {
    if (oldWidget.currentStackIndex != widget.currentStackIndex) {
      _fadeController.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeController,
      child: IndexedStack(
        index: widget.currentStackIndex,
        children: forms,
      ),
    );
  }
}
