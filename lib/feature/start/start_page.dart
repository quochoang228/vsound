import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vsounds/design/colors.dart';
import 'package:vsounds/design/text_style.dart';
import 'package:vsounds/generated/assets.gen.dart';
import 'package:vsounds/widgets/normal_button.dart';

final startPageViewController =
    StateProvider<PageController>((ref) => PageController(initialPage: 0));
final startPageIndex = StateProvider.autoDispose<int>((ref) => 0);

class StartPage extends ConsumerStatefulWidget {
  const StartPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StartPageState();
}

class _StartPageState extends ConsumerState<StartPage> {
  @override
  Widget build(BuildContext context) {
    var pageController = ref.watch(startPageViewController);

    var _listPage = [
      PageViewStart(
        image: MyAssets.images.startStp1.svg(),
        title: 'Exclusive sounds',
        subTitle:
            'We have an author\'s library of sounds that you will not find anywhere else',
      ),
      PageViewStart(
        image: MyAssets.images.startStp2.svg(),
        title: 'Relax sleep sounds',
        subTitle: 'Our sounds will help to relax and improve your sleep health',
      ),
      PageViewStart(
        image: MyAssets.images.startStp3.svg(),
        title: 'Story for kids',
        subTitle:
            'Famous fairy tales with soothing sounds will help your children fall asleep faster',
      ),
    ];

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.bgPrimery,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) =>
                  ref.read(startPageIndex.notifier).update((state) => value),
              physics: const NeverScrollableScrollPhysics(),
              children: _listPage,
            ),
          ),
          const Gap(64),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _listPage.asMap().entries.map((entry) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: ref.watch(startPageIndex) == entry.key ? 24 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: ref.watch(startPageIndex) == entry.key
                      ? AppColors.sysPrimery
                      : AppColors.bgSecondary,
                  borderRadius: BorderRadius.circular(30),
                ),
              );
            }).toList(),
          ),
          const Gap(24),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 32).copyWith(bottom: 32),
            child: NormalButton(
              text: "Next",
              onTap: () {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.ease);
              },
            ),
          )

          // TextButton.icon(
          //   onPressed: () {
          //     pageController.previousPage(
          //         duration: const Duration(milliseconds: 800),
          //         curve: Curves.ease);
          //   },
          //   icon: Icon(Icons.navigate_next),
          //   label: Text('Back'),
          // ),
          // TextButton.icon(
          //   onPressed: () {
          //     pageController.nextPage(
          //         duration: const Duration(milliseconds: 800),
          //         curve: Curves.ease);
          //   },
          //   icon: Icon(Icons.navigate_next),
          //   label: Text('Next'),
          // ),
        ],
      ),
    );
  }
}

class PageViewStart extends StatelessWidget {
  const PageViewStart({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final Widget image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        image,
        const Gap(40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            title,
            style: UITextStyles.largeTitle,
            textAlign: TextAlign.center,
          ),
        ),
        const Gap(8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: UITextStyles.body.copyWith(
              color: const Color(0xffEBEBF5).withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }
}
