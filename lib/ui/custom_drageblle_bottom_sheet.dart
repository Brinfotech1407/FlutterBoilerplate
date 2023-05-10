import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DraggableBottomSheet extends StatefulWidget {
  final Widget? bottomSheetHeader;
  final Widget? bottomSheetContent;
  final Widget? bottomSheetFooter;
  final String? headerTitle;
  final String? bottomButtonTitle;

  DraggableBottomSheet({
    this.bottomSheetHeader,
    this.bottomSheetContent,
    this.bottomSheetFooter,
    this.bottomButtonTitle,
    this.headerTitle,
    Key? key,
  }) : super(key: key);

  @override
  State<DraggableBottomSheet> createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyWidget(
          headerTitle: widget.headerTitle,
          bottomButtonTitle: widget.bottomButtonTitle,
          bottomSheetContent: widget.bottomSheetContent,
          bottomSheetHeader: widget.bottomSheetHeader,
          bottomSheetFooter: widget.bottomSheetFooter),
    );
  }
}

class MyWidget extends StatefulWidget {
  final Widget? bottomSheetHeader;
  final Widget? bottomSheetContent;
  final Widget? bottomSheetFooter;
  final String? headerTitle;
  final String? bottomButtonTitle;

  MyWidget({
    this.bottomSheetHeader,
    this.bottomSheetContent,
    this.bottomSheetFooter,
    this.headerTitle,
    this.bottomButtonTitle,
    Key? key,
  }) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
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
                  widget.bottomSheetContent ??
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 1.w),
                        child: Row(
                          children: [
                            Text(widget.headerTitle ?? 'HEADER',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: Styles.body2SemiBoldTextStyle()),
                            Spacer(),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
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
                  widget.bottomSheetContent ??
                      Flexible(
                        child: ListView(
                          shrinkWrap: true,
                          controller: scrollController,
                          children: List<Text>.generate(count,
                              (x) => Text("List of the bottom-sheet $x")),
                        ),
                      ),
                  widget.bottomSheetFooter ??
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 1.h),
                          elevation: 8.sp, // Elevation
                        ),
                        child: Text(
                          widget.bottomButtonTitle ?? 'Button',
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
