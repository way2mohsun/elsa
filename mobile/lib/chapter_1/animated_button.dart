import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String initialText, finalText;
  final ButtonStyleUtil buttonStyle;
  final IconData iconData;
  final double iconSize;
  final Duration animationDuration;
  final Function onTab;

  const AnimatedButton({
    this.initialText,
    this.finalText,
    this.buttonStyle,
    this.iconData,
    this.iconSize,
    this.animationDuration,
    this.onTab,
  });

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  AnimationController _controller;
  ButtonState _currentState;
  Duration _smallDuration;
  Animation<double> _scaleFinalTextAnimation;

  @override
  void initState() {
    super.initState();
    _smallDuration = Duration(
        milliseconds: (widget.animationDuration.inMilliseconds * .2).round());
    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _currentState = ButtonState.SHOW_ONLY_TEXT;
    _controller.addListener(() {
      double _controllerValue = _controller.value;
      if (_controllerValue < .2) {
        setState(() {
          _currentState = ButtonState.SHOW_ONLY_ICON;
        });
      } else if (_controllerValue > .8) {
        setState(() {
          _currentState = ButtonState.SHOW_TEXT_ICON;
        });
      }
    });
    _scaleFinalTextAnimation =
        Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onTab();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: widget.buttonStyle.elevation,
      borderRadius:
          BorderRadius.all(Radius.circular(widget.buttonStyle.borderRadious)),
      child: InkWell(
        onTap: () {
          _controller.forward();
        },
        child: AnimatedContainer(
          duration: _smallDuration,
          height: widget.iconSize + 16,
          decoration: BoxDecoration(
            color: (_currentState == ButtonState.SHOW_ONLY_ICON ||
                    _currentState == ButtonState.SHOW_TEXT_ICON)
                ? widget.buttonStyle.secondaryColor
                : widget.buttonStyle.primaryColor,
            border: Border.all(
                color: (_currentState == ButtonState.SHOW_ONLY_ICON ||
                        _currentState == ButtonState.SHOW_TEXT_ICON)
                    ? widget.buttonStyle.primaryColor
                    : Colors.transparent),
            borderRadius: BorderRadius.all(
                Radius.circular(widget.buttonStyle.borderRadious)),
          ),
          padding: EdgeInsets.symmetric(
              horizontal:
                  (_currentState == ButtonState.SHOW_ONLY_ICON) ? 16 : 48,
              vertical: 8),
          child: AnimatedSize(
            vsync: this,
            curve: Curves.easeIn,
            duration: _smallDuration,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                (_currentState == ButtonState.SHOW_ONLY_ICON ||
                        _currentState == ButtonState.SHOW_TEXT_ICON)
                    ? Icon(
                        widget.iconData,
                        size: widget.iconSize,
                        color: widget.buttonStyle.primaryColor,
                      )
                    : Container(),
                SizedBox(
                  width: _currentState == ButtonState.SHOW_TEXT_ICON ? 20 : 0,
                ),
                getTextWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getTextWidget() {
    if (_currentState == ButtonState.SHOW_ONLY_TEXT) {
      return Text(
        widget.initialText,
        style: widget.buttonStyle.initialTextStyle,
      );
    } else if (_currentState == ButtonState.SHOW_ONLY_ICON) {
      return Container();
    } else {
      return ScaleTransition(
        scale: _scaleFinalTextAnimation,
        child: Text(
          widget.finalText,
          style: widget.buttonStyle.finalTextStyle,
        ),
      );
    }
  }
}

class ButtonStyleUtil {
  final TextStyle initialTextStyle, finalTextStyle;
  final Color primaryColor, secondaryColor;
  final double elevation, borderRadious;

  ButtonStyleUtil(
      {this.borderRadious,
      this.elevation,
      this.initialTextStyle,
      this.finalTextStyle,
      this.primaryColor,
      this.secondaryColor});
}

enum ButtonState {
  SHOW_ONLY_TEXT,
  SHOW_ONLY_ICON,
  SHOW_TEXT_ICON,
}
