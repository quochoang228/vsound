import 'package:flutter/material.dart';
import 'package:vsounds/design/colors.dart';
import 'package:vsounds/design/text_style.dart';

class AppBarUI extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleTextStyle;
  final bool isShowNavigation;
  final bool centerTitle;
  final AppBar? appBar;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actionWidget;
  final Function? backFunction;
  final Color? backgroundColor;
  final Widget? leadingWidget;
  final double? elevation;
  final Color? titleColor;
  final Color? backIconColor;

  const AppBarUI({
    Key? key,
    required this.title,
    this.titleTextStyle,
    this.isShowNavigation = true,
    this.centerTitle = true,
    this.appBar,
    this.actionWidget,
    this.backFunction,
    this.backgroundColor,
    this.leadingWidget,
    this.elevation,
    this.bottom,
    this.titleColor = Colors.white,
    this.backIconColor = Colors.white,
  }) : super(key: key);

  @override
  VAppBarState createState() => VAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight((appBar ?? AppBar()).preferredSize.height);
}

class VAppBarState extends State<AppBarUI> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor ?? AppColors.bgPrimery,
      automaticallyImplyLeading: false,
      leading: widget.isShowNavigation
          ? widget.leadingWidget != null
              ? GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    widget.backFunction != null
                        ? widget.backFunction!()
                        : Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: widget.leadingWidget,
                  ),
                )
              : BackButton(
                  color: widget.backIconColor,
                  onPressed: () {
                    widget.backFunction != null
                        ? widget.backFunction!()
                        : Navigator.of(context).pop();
                  },
                )
          : const SizedBox(),
      elevation: widget.elevation ?? 0.0,
      centerTitle: widget.centerTitle,
      title: Text(
        widget.title,
        style: widget.titleTextStyle ??
            UITextStyles.body.copyWith(
              color: widget.titleColor,
            ),
      ),
      actions: widget.actionWidget,
      bottom: widget.bottom,
    );
  }
}
