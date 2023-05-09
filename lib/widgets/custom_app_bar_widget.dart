import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/widgets/header_title_widget.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback onPressed;
  final String title;
  final String? count;

  const CustomAppBar({
    Key? key,
    required this.onPressed,
    required this.title,
    this.count,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 55);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Container(
        height: 45,
        width: 45,
        child: RoundedButtonWidget(
          buttonIcon: Icons.arrow_back_ios_outlined,
          onPressed: widget.onPressed,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Center(
          child: widget.count != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeaderTitleWidget(
                      titleText: widget.title,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        widget.count ?? '10',
                        style: Styles.subHeadSemiBoldTextStyle()
                            .copyWith(color: AppColors.themeColor),
                      ),
                    )
                  ],
                )
              : HeaderTitleWidget(
                  titleText: widget.title,
                ),
        ),
      ),
    );
  }
}
