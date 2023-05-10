import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

class AppUtils {
  static void showToast({required String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.toastBackgroundColor,
      textColor: AppColors.toastTextColor,
      fontSize: 14.0,
    );
  }

  static Future<bool> showAlertDialog({
    required BuildContext context,
    String? desc,
    String? optionText1,
    String? optionText2,
    bool showCancel = true,
  }) async {
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  desc!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                height: 0.5,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (showCancel) ...<Widget>[
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.zero),
                        ),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop(false);
                        },
                        child: Text(
                          optionText1 ?? 'No',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 0.5,
                      height: 50,
                      color: Colors.grey,
                    )
                  ],
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop(
                            true); // dismisses only the dialog and returns true
                      },
                      child: Text(optionText2 ?? 'Yes',
                          style: const TextStyle(
                              fontSize: 16, color: AppColors.themeColor)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
    return result ?? false;
  }

  static void showCustomBottomSheet({
    required BuildContext context,
    Widget? bottomSheetHeader,
    Widget? bottomSheetContent,
    Widget? bottomSheetFooter,
    String? bottomButtonTitle,
    String? headerTitle,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      useSafeArea: true,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3.h), topRight: Radius.circular(3.h))),
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
                  bottomSheetHeader ??
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 1.w),
                        child: Row(
                          children: [
                            Text(headerTitle ?? 'HEADER',
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
                  Flexible(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        child: bottomSheetContent ??
                            ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: List<Text>.generate(50,
                                  (x) => Text("List of the bottom-sheet $x")),
                            ),
                      ),
                    ),
                  ),
                  bottomSheetFooter ??
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 1.h),
                          elevation: 8.sp, // Elevation
                        ),
                        child: Text(
                          bottomButtonTitle ?? 'Button',
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
