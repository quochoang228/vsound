import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vsounds/design/colors.dart';
import 'package:vsounds/design/text_style.dart';
import 'package:vsounds/generated/assets.gen.dart';

enum SnackbarTopStatus {
  informative,
  warning,
  success,
  error,
}

abstract class DialogHelper {
  /// show snack message
  static showSnackMessage(
    context, {
    required String message,
    Widget? icon,
    bool showAction = false,
    Function? onAction,
    String? actionLabel,
    Color backgroundColor = AppColors.bgSecondary,
    Color messageColor = AppColors.sysWhite,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    Duration duration = const Duration(milliseconds: 2000),
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              icon ??
                  MyAssets.images.information.svg(
                    colorFilter: const ColorFilter.mode(
                      AppColors.sysWhite,
                      BlendMode.srcIn,
                    ),
                  ),
              const Gap(16),
              Expanded(
                child: Text(
                  message,
                  style: UITextStyles.footnote.copyWith(
                    color: messageColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          elevation: 4,
          duration: duration,
          behavior: behavior,
          showCloseIcon: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          action: showAction
              ? SnackBarAction(
                  label: actionLabel ?? 'OK',
                  onPressed: () {
                    onAction!();
                  },
                )
              : null,
        ),
      );

  static Future<T?> showFullscreenDialogRoute<T>(
      BuildContext context, Widget child,
      {bool transparent = false}) async {
    return await Navigator.of(context).push<T>(
      PageRoutes.dialog<T>(child, duration: const Duration(milliseconds: 200)),
    );
  }
}

class PageRoutes {
  static const Duration kDefaultDuration = Duration(milliseconds: 300);

  static Route<T> dialog<T>(Widget child,
      {Duration duration = kDefaultDuration, bool opaque = false}) {
    // Use cupertino routes for all dialogs so we get the 'swipe right to go back' behavior
    if (opaque) {
      return CupertinoPageRoute(builder: (_) => child);
    }

    // SB: Removed this in favor of Cupertino routes, we could restore with a `useFade` option
    return PageRouteBuilder<T>(
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      opaque: opaque,
      fullscreenDialog: true,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
