import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:boilerplate/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class CustomAppBarWithSearchView extends StatefulWidget
    implements PreferredSizeWidget {
  final VoidCallback onPressed;
  final String searchHint;

  const CustomAppBarWithSearchView({
    Key? key,
    required this.onPressed,
    required this.searchHint,
  }) : super(key: key);

  @override
  State<CustomAppBarWithSearchView> createState() =>
      _CustomAppBarWithSearchViewState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 55);
}

class _CustomAppBarWithSearchViewState extends State<CustomAppBarWithSearchView> {
  TextEditingController searchController = TextEditingController();

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
      title: Center(
        child: SearchTextField(
          hint: widget.searchHint,
          trailIcon: Icons.close,
          leadingIcon: Image.asset(Assets.searchIconImg, height: 15, width: 15),
          onChanged: (value) {},
          controller: searchController,
        ),
      ),
    );
  }
}
