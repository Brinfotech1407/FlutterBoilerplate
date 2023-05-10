import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/ui/month_view_calender.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DraggableBottomSheet extends StatefulWidget {
  const DraggableBottomSheet({Key? key}) : super(key: key);

  @override
  State<DraggableBottomSheet> createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Center(child: Text('Show Modal')),
      onPressed: () {
        _showModal(context, 50);
      },
    );
  }

  _showModal(context, count) {
    showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: .5,
          maxChildSize: 1,
          minChildSize: 0.40,
          builder: (context, scrollController) {
            return Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                    child: Row(
                      children: [
                        Text('HEADER',
                            style: Styles.subHeadSemiBoldTextStyle()),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            size: 22.sp,
                            color: AppColors.darkGrayColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      controller: scrollController,
                      children:
                          List<Text>.generate(count, (x) => Text("List of the bottom-sheet $x")),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
                      elevation: 8.sp, // Elevation

                    ),
                    child: Text(
                      'Button',
                      style: TextStyle(fontSize: 17.sp),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
