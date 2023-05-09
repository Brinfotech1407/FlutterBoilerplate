import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({required this.selectedTab, Key? key})
      : super(key: key);
  final int selectedTab;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  ValueNotifier<int> selectedButton = ValueNotifier<int>(0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedButton.value = widget.selectedTab;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xffB6C6D0),
            blurRadius: 10.0,
            spreadRadius: 4.0,
            offset: const Offset(
              5.0,
              5.0,
            ),
          )
        ],
        color: Color(0xffECF0F3),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      height: 70,
      width: double.infinity,
      child: ValueListenableBuilder<int>(
        valueListenable: selectedButton,
        builder: (context, int selectedButtonVal, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NeumorphicButton(
                style: buttonStyleView(
                    selectedButtonVal == 1 ? true : false, context),
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Assets.homeNavigationIconImg,
                  height: 27,
                  width: 27,
                  color: selectedButtonVal == 1 ? Color(0xff212529) : null,
                ),
                onPressed: () {
                  selectedButton.value = 1;

                },
              ),
              SizedBox(
                height: 12,
              ),
              NeumorphicButton(
                onPressed: () {
                  selectedButton.value = 2;

                },
                style: buttonStyleView(
                    selectedButtonVal == 2 ? true : false, context),
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  selectedButtonVal == 2
                      ? Assets.messageOnTapNavigationIconImg
                      : Assets.messageNavigationIconImg,
                  height: 27,
                  width: 27,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              NeumorphicButton(
                onPressed: () {
                  selectedButton.value = 3;
                },
                style: buttonStyleView(selectedButtonVal == 3, context),
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Assets.personNavigationIconImg,
                  height: 27,
                  width: 27,
                  color: selectedButtonVal == 3 ? Color(0xff212529) : null,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  NeumorphicStyle buttonStyleView(bool buttonOnTapValue, BuildContext context) {
    return buttonOnTapValue
        ? NeumorphicStyle(
            color: Color(0xffECF0F3),
            depth: NeumorphicTheme.embossDepth(context),
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)))
        : NeumorphicStyle(
            shape: NeumorphicShape.flat,
            color: Color(0xffECF0F3),
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 4,
            lightSource: LightSource.topLeft,
          );
  }
}
