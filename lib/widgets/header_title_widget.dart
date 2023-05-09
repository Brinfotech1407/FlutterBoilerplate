import 'package:boilerplate/constants/text_style.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HeaderTitleWidget extends StatefulWidget {
  final String titleText;

  const HeaderTitleWidget({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  State<HeaderTitleWidget> createState() => _HeaderTitleWidgetState();
}

class _HeaderTitleWidgetState extends State<HeaderTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.titleText,
      style: Styles.subHeadSemiBoldTextStyle(),
    );
  }
}
