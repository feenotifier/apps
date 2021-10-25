import 'package:apps/sections/constant/constants.dart';
import 'package:flutter/material.dart';

class RoundBackButton extends StatefulWidget {
  final Color backgroundColor;
  final Color arrowIconColor;
  const RoundBackButton({
    Key key,
    this.backgroundColor,
    this.arrowIconColor,
    void onPressed,
  }) : super(key: key);

  @override
  _RoundBackButtonState createState() => _RoundBackButtonState();
}

class _RoundBackButtonState extends State<RoundBackButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _arrowSlideAnimation;

  @override
  void initState() {
    _initAnimationController();
    _animationController.forward();
    _initArrowSlideAnimation();
    super.initState();
  }

  _initAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
  }

  _initArrowSlideAnimation() {
    _arrowSlideAnimation = Tween<Offset>(
      begin: Offset(-2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: SlideTransition(
        position: _arrowSlideAnimation,
        child: Container(
          padding: EdgeInsets.only(
            left: Distance_Unit * 2,
          ),
          height: Distance_Unit * 10,
          width: Distance_Unit * 10,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(
              Distance_Unit * 12,
            ),
          ),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: widget.arrowIconColor ?? Color(0xFF6F69AC),
            ),
          ),
        ),
      ),
    );
  }
}
