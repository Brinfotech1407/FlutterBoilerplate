import 'package:boilerplate/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
}
