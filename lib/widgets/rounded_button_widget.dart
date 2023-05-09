import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RoundedButtonWidget extends StatefulWidget {
  final IconData? buttonIcon;
  final Color? buttonColor;
  final Color textColor;
  final VoidCallback onPressed;
  final bool isLoginScreen;
  final double? size;
  final Widget? buttonChildView;

  const RoundedButtonWidget({
    Key? key,
    this.buttonIcon,
    this.buttonColor,
    this.buttonChildView,
    this.size,
    this.textColor = Colors.white,
    this.isLoginScreen = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<RoundedButtonWidget> createState() => _RoundedButtonWidgetState();
}

class _RoundedButtonWidgetState extends State<RoundedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.all(11),
      style: NeumorphicStyle(
          color: Color(0xffE1E7EC),
          depth: NeumorphicTheme.depth(context),
          boxShape: NeumorphicBoxShape.circle()),
      child: widget.isLoginScreen
          ? widget.buttonChildView
          : buildBackIcon(context),
      onPressed: widget.onPressed,
    );
  }

  Icon buildBackIcon(BuildContext context) {
    return Icon(
      widget.buttonIcon,
      size: widget.size ?? 20,
      color: NeumorphicTheme.isUsingDark(context)
          ? Colors.white70
          : const Color.fromRGBO(74, 82, 92, 1),
    );
  }
}
