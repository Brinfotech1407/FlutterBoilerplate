import 'package:boilerplate/constants/text_style.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CommonTextField extends StatefulWidget {
  final String label;
  final String hint;
  final TextInputType? textInputType;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final bool isObSecure;
  CommonTextField({
    required this.label,
    required this.hint,
    required this.onChanged,
    this.isObSecure=false,
    this.textInputType,
    required this.controller,
  });

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
            child: Text(this.widget.label, style: Styles.cap2MediumTextStyle()),
          ),
          Neumorphic(
            margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
            style: NeumorphicStyle(
              color: Colors.transparent,
              depth: NeumorphicTheme.embossDepth(context),
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
            ),
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            child: TextField(
              onChanged: this.widget.onChanged,
              controller: widget.controller,
              keyboardType: widget.textInputType ?? TextInputType.text,cursorColor: Colors.black,
              obscureText: widget.isObSecure,decoration: InputDecoration.collapsed(
                  hintText: this.widget.hint,
                  hintStyle: Styles.body2MediumTextStyle(),
            ),
          ),
        )],
      ),
    );
  }
}
