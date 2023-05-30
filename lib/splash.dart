import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vsounds/design/colors.dart';
import 'package:vsounds/design/text_style.dart';
import 'package:vsounds/generated/assets.gen.dart';
import 'package:vsounds/router/paths.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
    @override
  void initState() {
    super.initState();
    var duration = const Duration(seconds: 2);
    Timer(duration, () {
      context.pushReplacement(Paths.start);
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.bgPrimery,
          // gradient: LinearGradient(
          //   colors: [
          //     AppColors.bgPrimery,
          //     Color(0xff162258),
          //   ],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyAssets.images.appIcon.svg(),
            const Gap(16),
            const Text(
              'Sleep Sounds',
              textAlign: TextAlign.center,
              style: UITextStyles.largeTitle,
            ),
          ],
        ),
      ),
    );
  }
}
