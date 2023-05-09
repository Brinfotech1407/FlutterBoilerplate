import 'package:boilerplate/constants/text_style.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SearchTextField extends StatefulWidget {
  final TextInputType? textInputType;
  final String hint;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final Widget? leadingIcon;
  final IconData? trailIcon;

  SearchTextField({
    required this.hint,
    required this.onChanged,
    this.leadingIcon,
    this.trailIcon,
    this.textInputType,
    required this.controller,
  });

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  ValueNotifier<bool> showCloseIcon = ValueNotifier<bool>(false);

  @override
  void initState() {
    widget.controller.addListener(
      () {
        showCloseIcon.value = widget.controller.text.isNotEmpty;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Neumorphic(
          margin: EdgeInsets.only(left: 8, top: 2, bottom: 4, right: 8),
          style: NeumorphicStyle(
              color: Color(0xffECF0F3),
              depth: NeumorphicTheme.embossDepth(context),
              boxShape: NeumorphicBoxShape.stadium()),
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 22,
                width: 22,
                margin: EdgeInsets.only(right: 8, left: 2),
                padding: EdgeInsets.all(2),
                child: widget.leadingIcon ?? Icon(Icons.search),
              ),
              Expanded(
                child: TextField(
                  onChanged: this.widget.onChanged,
                  controller: widget.controller,
                  keyboardType: widget.textInputType ?? TextInputType.text,
                  cursorColor: Colors.black,
                  style: Styles.body2MediumTextStyle()
                      .copyWith(color: Color(0xFF212529)),
                  decoration: InputDecoration.collapsed(
                    hintText: this.widget.hint,
                    hintStyle: Styles.body2MediumTextStyle()
                        .copyWith(color: Color(0xFF8195A0)),
                  ),
                ),
              ),
              widget.trailIcon != null
                  ? ValueListenableBuilder<bool>(
                      builder: (context, bool value, child) {
                        return value
                            ? GestureDetector(
                                onTap: () {
                                  widget.controller.text = '';
                                },
                                child: Container(
                                  child: Icon(widget.trailIcon),
                                ),
                              )
                            : SizedBox();
                      },
                      valueListenable: showCloseIcon,
                    )
                  : SizedBox(),
            ],
          ),
        )
      ],
    );
  }
}
