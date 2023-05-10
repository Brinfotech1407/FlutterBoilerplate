import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/app_icon_widget.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppIconWidget(image: Assets.appLogo),
              buildTitleView(context),
              buildRowImageIconView(),
              SizedBox(height: 25),
              buildBottomButtonView(
                title: "이메일로 로그인",
                onLoginWithEmailButtonPressed: () {

                },
              ),
              SizedBox(height: 16),
              buildBottomButtonView(
                title: "회원가입",
                isMembershipButton: true,
                onMemberShipButtonPressed: () {

                },
              ),
              SizedBox(height: 20),
              bottomTextView(),
            ],
          ),
        ),
      ),
    );
  }

  Row bottomTextView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: findIdPwdText(text: '아이디찾기'),
          onTap: () {

          },
        ),
        Neumorphic(
          margin: EdgeInsets.only(right: 6, left: 6),
          child: Container(
            height: 12,
            width: 1,
            color: Color(0xffECF0F3),
          ),
        ),
        GestureDetector(
          child: findIdPwdText(text: '비밀번호 찾기'),
          onTap: () {

          },
        ),
      ],
    );
  }

  Padding findIdPwdText({required String text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Styles.body2SemiBoldTextStyle(),
      ),
    );
  }

  Row buildBottomButtonView({
    required String title,
    bool isMembershipButton = false,
    VoidCallback? onMemberShipButtonPressed,
    VoidCallback? onLoginWithEmailButtonPressed,
  }) {
    return Row(
      children: [
        Expanded(
          child: NeumorphicButton(
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              color: Colors.transparent,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
            ),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
            margin: EdgeInsets.only(right: 30, left: 30),
            child: isMembershipButton
                ? Center(child: buildButtonTextView(title))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.inboxIconImg, width: 16, height: 16),
                      SizedBox(
                        width: 4,
                      ),
                      buildButtonTextView(title),
                    ],
                  ),
            onPressed: isMembershipButton
                ? onMemberShipButtonPressed
                : onLoginWithEmailButtonPressed,
          ),
        ),
      ],
    );
  }

  Text buildButtonTextView(String title) {
    return Text(
      title,
      style: Styles.body2TextStyle(),
    );
  }

  Widget buildTitleView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildNeumorphicLineWidget(context),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Text('간편로그인', style: Styles.body1TextStyle()),
          ),
          buildNeumorphicLineWidget(context),
        ],
      ),
    );
  }

  Widget buildNeumorphicLineWidget(
    BuildContext context,
  ) {
    return Neumorphic(
      margin: EdgeInsets.only(right: 6, left: 6),
      child: Container(
        height: 1.5,
        width: DeviceUtils.getDeviceWidth(context) / 4,
        color: Color(0xffECF0F3),
      ),
    );
  }

  Row buildRowImageIconView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RoundedButtonWidget(
          onPressed: () {},
          isLoginScreen: true,
          buttonChildView:
              Image.asset(Assets.messageIconImg, width: 20, height: 20),
        ),
        RoundedButtonWidget(
          onPressed: () {},
          isLoginScreen: true,
          buttonChildView:
              Image.asset(Assets.letterNIconImg, width: 18, height: 19),
        ),
        RoundedButtonWidget(
          onPressed: () {},
          isLoginScreen: true,
          buttonChildView:
              Image.asset(Assets.facebookIconImg, width: 24, height: 23),
        ),
        RoundedButtonWidget(
          onPressed: () {},
          isLoginScreen: true,
          buttonChildView:
              Image.asset(Assets.appleIconImg, width: 20, height: 22),
        ),
        RoundedButtonWidget(
          onPressed: () {},
          isLoginScreen: true,
          buttonChildView:
              Image.asset(Assets.googleIconImg, width: 19, height: 19),
        ),
      ],
    );
  }

  NeumorphicButton buildNeumorphicRoundButton(BuildContext context) {
    return NeumorphicButton(
      margin: const EdgeInsets.only(top: 8, bottom: 6),
      padding: const EdgeInsets.all(12),
      style: const NeumorphicStyle(
        color: Colors.transparent,
        boxShape: NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.concave,
        depth: 12,
      ),
      child: buildBackIcon(context),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Icon buildBackIcon(BuildContext context) {
    return Icon(
      Icons.arrow_back_ios_new_outlined,
      size: 20,
      color: NeumorphicTheme.isUsingDark(context)
          ? Colors.white70
          : const Color.fromRGBO(74, 82, 92, 1),
    );
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    Future.delayed(Duration(milliseconds: 0), () {

    });

    return Container();
  }
}
