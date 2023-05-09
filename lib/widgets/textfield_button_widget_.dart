import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CommonTextFieldWithButton extends StatefulWidget {
  final String label;
  final String buttonText;
  final TextInputType? textInputType;
  final void Function() onButtonTap;
  final String hint;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final bool isCheckButtonActive;

  CommonTextFieldWithButton({
    required this.label,
    required this.hint,
    required this.onChanged,
    required this.buttonText,
    this.textInputType,
    required this.onButtonTap,
    required this.isCheckButtonActive,
    required this.controller,
  });

  @override
  _CommonTextFieldWithButtonState createState() =>
      _CommonTextFieldWithButtonState();
}

class _CommonTextFieldWithButtonState extends State<CommonTextFieldWithButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  onChanged: this.widget.onChanged,
                  controller: widget.controller,
                  keyboardType: widget.textInputType ?? TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                      hintText: this.widget.hint,
                      hintStyle: Styles.body2MediumTextStyle()),
                ),
              ),
              Container(
                height: 40,
                width: 120,
                margin: EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  onPressed: widget.onButtonTap,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      widget.isCheckButtonActive
                          ? AppColors.checkButtonActiveColor
                          : AppColors.checkButtonInActiveColor,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  child: Text(
                    widget.buttonText,
                    style: Styles.body2SemiBoldTextStyle().copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
