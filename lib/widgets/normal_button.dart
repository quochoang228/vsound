import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vsounds/design/colors.dart';
import 'package:vsounds/design/text_style.dart';

class NormalButton extends StatelessWidget {
  /// Cho biết button có khả dụng không. Mặc đinh là [true]
  final bool isEnable;

  /// Hàm gọi lại
  final VoidCallback? onTap;

  /// Văn bản hiển thị
  final String text;

  ///
  final Widget? icon;

  /// Màu của văn bản. Mặc định là [White]
  final Color textColor;

  /// Kích thước của văn bản
  final double fontSize;

  /// Màu văn bản khi [isEnable] == false
  final Color? disableTextColor;

  /// Màu nền, mặc định là [vBrandColorRed]
  final Color backgroundColor;

  /// Màu nền khi [isEnable] == false
  final Color disableBackgroundColor;

  /// Padding theo chiều ngang và chiều dọc
  final EdgeInsetsGeometry insertPadding;

  ///
  final Decoration? decoration;

  /// Child, có mức độ hiển thị cao hơn [text]
  final Widget? child;

  /// Kiểu hiển thị văn bản, có mức độ ưu tiên cao hơn [textColor]
  final TextStyle? textStyle;

  /// Weight của văn bản. Mặc định là [FontWeight.bold]
  final FontWeight fontWeight;

  /// Ràng buộc về bố cục
  final BoxConstraints constraints;

  /// Căn chỉnh bên trong, mặc định là null
  final Alignment? alignment;

  /// Border
  final BorderRadiusGeometry? borderRadius;

  final double height;

  const NormalButton({
    Key? key,
    required this.text,
    this.icon,
    this.backgroundColor = AppColors.bgSecondary,
    this.isEnable = true,
    this.onTap,
    this.insertPadding =
        const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    this.decoration,
    this.child,
    this.textStyle,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 14,
    this.textColor = AppColors.sysWhite,
    this.disableTextColor = AppColors.sysBlack,
    this.disableBackgroundColor = AppColors.bgTertiary,
    this.constraints = const BoxConstraints.tightFor(),
    this.borderRadius = const BorderRadius.all(Radius.circular(21)),
    this.alignment,
    this.height = 50,
  }) : super(key: key);

  NormalButton.outline({
    Key? key,
    Color? disableLineColor = AppColors.bgTertiary,
    Color? lineColor = AppColors.bgSecondary,
    double radius = 38,
    double borderWith = 1.0,
    required this.text,
    this.icon,
    this.isEnable = true,
    this.backgroundColor = AppColors.sysWhite,
    this.disableBackgroundColor = AppColors.bgTertiary,
    this.alignment,
    this.child,
    this.onTap,
    this.textColor = AppColors.sysWhite,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 14,
    this.disableTextColor = AppColors.sysBlack,
    this.insertPadding =
        const EdgeInsets.symmetric(vertical: 11, horizontal: 30),
    this.textStyle,
    this.constraints = const BoxConstraints.tightFor(),
    this.borderRadius = const BorderRadius.all(Radius.circular(38)),
    this.height = 50,
  })  : decoration = _OutlineBoxDecorationCreator.createOutlineBoxDecoration(
            isEnable: isEnable,
            disableBackgroundColor: disableBackgroundColor,
            disableLineColor: disableLineColor,
            lineColor: lineColor,
            backgroundColor: backgroundColor,
            radius: radius,
            borderWith: borderWith),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // if (ClickUtils.isMultiClick()) {
        //   return;
        // }
        if (isEnable && onTap != null) {
          FocusScope.of(context).requestFocus(FocusNode());
          onTap!();
        }
      },
      child: Container(
        height: height,
        alignment: alignment,
        decoration: decoration ?? _getBoxDecoration(_getBackgroundColor()),
        constraints: constraints,
        padding: insertPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            const Gap(6),
            Text(
              text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: _getTextStyle(),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _getTextStyle() {
    if (textStyle != null) {
      return textStyle!;
    }
    Color textColor;
    if (isEnable) {
      textColor = this.textColor;
    } else {
      textColor = disableTextColor ?? (this.textColor).withOpacity(0.7);
    }

    return UITextStyles.hedline.copyWith(
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    );
  }

  Color _getBackgroundColor() {
    return isEnable ? backgroundColor : disableBackgroundColor;
  }

  BoxDecoration _getBoxDecoration(Color? bgColor) {
    return BoxDecoration(
      color: bgColor,
      borderRadius: borderRadius,
    );
  }
}

class _OutlineBoxDecorationCreator {
  static BoxDecoration createOutlineBoxDecoration({
    required bool isEnable,
    Color? disableLineColor,
    Color? lineColor,
    required Color backgroundColor,
    required Color disableBackgroundColor,
    double radius = 6,
    double borderWith = 1.0,
  }) {
    Color lineColor0 = isEnable ? lineColor! : disableLineColor!;
    Color bgColor = isEnable ? backgroundColor : disableBackgroundColor;

    return BoxDecoration(
        border: Border.all(color: lineColor0, width: borderWith),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: bgColor);
  }
}
