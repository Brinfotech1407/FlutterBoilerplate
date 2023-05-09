import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MonthViewCalender extends StatefulWidget {
  const MonthViewCalender({Key? key}) : super(key: key);

  @override
  State<MonthViewCalender> createState() => _MonthViewCalenderState();
}

class _MonthViewCalenderState extends State<MonthViewCalender> {
  CalendarController controller = CalendarController();
  ValueNotifier<bool> IsSelected = ValueNotifier<bool>(false);

  @override
  void initState() {
    controller = CalendarController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 6.h),
      height: DeviceUtils.getDeviceHeight(context) / 2,
      child: SfCalendar(
        controller: controller,
        view: CalendarView.month,
        initialSelectedDate: DateTime.now(),
        cellBorderColor: Colors.grey.shade200,
        headerStyle: buildCalendarHeaderStyle(),
        viewHeaderStyle: buildViewHeaderStyle(),
         selectionDecoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple, width: 2),
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        //todayHighlightColor: Colors.white,
        headerDateFormat: 'yyyy. MM',
        cellEndPadding: 4,
        monthViewSettings:
            MonthViewSettings(monthCellStyle: buildMonthCellStyle()),
        showCurrentTimeIndicator: true,
        monthCellBuilder: monthCellBuilder,
      ),
    ));
  }

  Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {
     bool IsSelected = controller.selectedDate != null &&
        details.date.year == controller.selectedDate?.year &&
        details.date.month == controller.selectedDate?.month &&
        details.date.day == controller.selectedDate?.day;
    if (IsSelected == true) {
      return Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.purpleAccent,
            shape: BoxShape.circle,
          ),
          child: Center(child: Text(details.date.day.toString())));
    } else {
      return Center(
        child: Text(details.date.day.toString(),
            style: TextStyle(
                color: details.date.month == controller.selectedDate?.month
                    ? Colors.black
                    : Colors.grey)),
      );
    }
  }

  MonthCellStyle buildMonthCellStyle() {
    return MonthCellStyle(
        textStyle: TextStyle(
          fontSize: 12.sp,
          color: Colors.black,
        ),
        trailingDatesTextStyle: TextStyle(fontSize: 12.sp, color: Colors.grey),
        leadingDatesTextStyle: TextStyle(fontSize: 12.sp, color: Colors.grey));
  }

  ViewHeaderStyle buildViewHeaderStyle() {
    return ViewHeaderStyle(
      backgroundColor: Colors.grey,
      dayTextStyle: TextStyle(
          fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.w500),
    );
  }

  CalendarHeaderStyle buildCalendarHeaderStyle() {
    return CalendarHeaderStyle(
        textAlign: TextAlign.center,
        textStyle: TextStyle(
            fontSize: 20.sp,
            fontStyle: FontStyle.normal,
            letterSpacing: 4.sp,
            color: AppColors.themeColor,
            fontWeight: FontWeight.w500));
  }
}
