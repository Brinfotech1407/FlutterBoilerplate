import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/src/neumorphic_icons.dart';
import 'package:flutter_neumorphic/src/widget/container.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';



typedef void NeumorphicCheckboxListener<T>(T value);

/// A Style used to customize a NeumorphicCheckbox
///
/// selectedDepth : the depth when checked
/// unselectedDepth : the depth when unchecked (default : theme.depth)
/// selectedColor : the color when checked (default: theme.accent)
///
class CustomCheckboxStyle {
  final double? selectedDepth;
  final double? unselectedDepth;
  final bool? disableDepth;
  final double? selectedIntensity;
  final double unselectedIntensity;
  final Color? selectedColor;
  final Color? disabledColor;
  final LightSource? lightSource;
  final NeumorphicBorder border;
  final NeumorphicBoxShape? boxShape;

  const CustomCheckboxStyle({
    this.selectedDepth,
    this.border = const NeumorphicBorder.none(),
    this.selectedColor,
    this.unselectedDepth,
    this.disableDepth,
    this.lightSource,
    this.disabledColor,
    this.boxShape,
    this.selectedIntensity = 1,
    this.unselectedIntensity = 0.7,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CustomCheckboxStyle &&
              runtimeType == other.runtimeType &&
              selectedDepth == other.selectedDepth &&
              border == other.border &&
              unselectedDepth == other.unselectedDepth &&
              disableDepth == other.disableDepth &&
              selectedIntensity == other.selectedIntensity &&
              lightSource == other.lightSource &&
              unselectedIntensity == other.unselectedIntensity &&
              boxShape == other.boxShape &&
              selectedColor == other.selectedColor &&
              disabledColor == other.disabledColor;

  @override
  int get hashCode =>
      selectedDepth.hashCode ^
      unselectedDepth.hashCode ^
      border.hashCode ^
      lightSource.hashCode ^
      disableDepth.hashCode ^
      selectedIntensity.hashCode ^
      unselectedIntensity.hashCode ^
      boxShape.hashCode ^
      selectedColor.hashCode ^
      disabledColor.hashCode;
}

/// A Neumorphic Checkbox
///
/// takes a NeumorphicCheckboxStyle as `style`
/// takes the current checked state as `value`
///
/// notifies the parent when user interact with this widget with `onChanged`
///
/// ```
///  bool check1 = false;
///  bool check2 = false;
///  bool check3 = false;
///
///  Widget _buildChecks() {
///    return Row(
///      children: <Widget>[
///
///        NeumorphicCheckbox(
///          value: check1,
///          onChanged: (value) {
///            setState(() {
///              check1 = value;
///            });
///          },
///        ),
///
///        NeumorphicCheckbox(
///          value: check2,
///          onChanged: (value) {
///            setState(() {
///              check2 = value;
///            });
///          },
///        ),
///
///        NeumorphicCheckbox(
///          value: check3,
///          onChanged: (value) {
///            setState(() {
///              check3 = value;
///            });
///          },
///        ),
///
///      ],
///    );
///  }
/// ```
///
@immutable
class CustomCheckbox extends StatefulWidget {
  final bool value;
  final CustomCheckboxStyle style;
  final NeumorphicCheckboxListener onChanged;
  final isEnabled;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Duration duration;
  final Curve curve;

  CustomCheckbox({
    this.style = const CustomCheckboxStyle(),
    required this.value,
    required this.onChanged,
    this.curve = Neumorphic.DEFAULT_CURVE,
    this.duration = Neumorphic.DEFAULT_DURATION,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    this.margin = const EdgeInsets.all(0),
    this.isEnabled = true,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool get isSelected => this.widget.value;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void _onClick() {
    this.widget.onChanged(!this.widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final NeumorphicThemeData theme = NeumorphicTheme.currentTheme(context);
    final selectedColor = this.widget.style.selectedColor ?? theme.accentColor;

    final double selectedDepth =
        -1 * (this.widget.style.selectedDepth ?? theme.depth).abs();
    final double unselectedDepth =
    (this.widget.style.unselectedDepth ?? theme.depth).abs();
    final double selectedIntensity =
    (this.widget.style.selectedIntensity ?? theme.intensity)
        .abs()
        .clamp(Neumorphic.MIN_INTENSITY, Neumorphic.MAX_INTENSITY);
    final double unselectedIntensity = this
        .widget.style
        .unselectedIntensity
        .clamp(Neumorphic.MIN_INTENSITY, Neumorphic.MAX_INTENSITY);

    double depth = isSelected ? unselectedDepth : selectedDepth;
    if (!this.widget.isEnabled) {
      depth = 0;
    }

    Color? color = Colors.transparent;
    if (!this.widget.isEnabled) {
      color = null;
    }

    Color iconColor = isSelected ? Color(0XFFB6C6D0) : Color(0XFF0BA5EC);
    if (!this.widget.isEnabled) {
      iconColor = theme.disabledColor;
    }

    return NeumorphicButton(
      padding: this.widget.padding,
      pressed: isSelected,
      margin: this.widget.margin,
      duration: this.widget.duration,
      curve: this.widget.curve,
      onPressed: () {
        if (this.widget.isEnabled) {
          _onClick();
        }
      },
      drawSurfaceAboveChild: true,
      minDistance: selectedDepth.abs(),
      child: Icon(
        NeumorphicIcons.check,
        color: iconColor,
        size: 20.0,
      ),
      style: NeumorphicStyle(
        boxShape: this.widget.style.boxShape,
        border: this.widget.style.border,
        color: color,
        depth: depth,
        lightSource: this.widget.style.lightSource ?? theme.lightSource,
        disableDepth: this.widget.style.disableDepth,
        intensity: isSelected ? selectedIntensity : unselectedIntensity,
        shape: NeumorphicShape.flat,
      ),
    );
  }
}