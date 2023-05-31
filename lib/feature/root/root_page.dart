import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vsounds/design/colors.dart';
import 'package:vsounds/feature/discover/ui/discover_page.dart';
import 'package:vsounds/feature/discover/ui/pack_detail.dart';
import 'package:vsounds/generated/assets.gen.dart';
import 'package:vsounds/helper/dialog_helper.dart';
import 'package:vsounds/widgets/bottom_nav_bar.dart';

final rootPageControllerProvider =
    StateProvider<PageController>((ref) => PageController(initialPage: 0));

final discoverScrollController =
    StateProvider.autoDispose<ScrollController>((ref) => ScrollController());

final rootIndexProvider = StateProvider<int>((ref) => 0);

Widget iconNav({required Widget child}) => Container(
      padding: const EdgeInsets.only(bottom: 3),
      child: child,
    );

void handleBottomNavTap({
  required int index,
  required WidgetRef ref,
  required BuildContext context,
}) {}

class RootPage extends ConsumerStatefulWidget {
  const RootPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<RootPage> {
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    var pageController = ref.watch(rootPageControllerProvider);
    var discoverScroll = ref.watch(discoverScrollController);

    return WillPopScope(
      onWillPop: () async {
        if (ref.watch(rootIndexProvider) != 0) {
          ref.read(rootIndexProvider.notifier).update(
                (state) => 0,
              );
          pageController.jumpToPage(
            0,
          );
          return false;
        } else {
          DateTime now = DateTime.now();
          if (currentBackPressTime == null ||
              now.difference(currentBackPressTime!) >
                  const Duration(seconds: 2)) {
            currentBackPressTime = now;

            DialogHelper.showSnackMessage(context,
                message: 'Bấm lần nữa để thoát nhé!');

            return false;
          }
          return true;
        }
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.bgPrimery,
        bottomNavigationBar: BottomNavBar(
          items: [
            BottomNavigationBarItem(
              icon: iconNav(child: MyAssets.images.nav.discover.svg()),
              activeIcon: iconNav(child: MyAssets.images.nav.discoverSel.svg()),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: iconNav(child: MyAssets.images.nav.composer.svg()),
              activeIcon: iconNav(child: MyAssets.images.nav.composerSel.svg()),
              label: 'Composer',
            ),
            BottomNavigationBarItem(
              icon: iconNav(child: MyAssets.images.nav.profile.svg()),
              activeIcon: iconNav(child: MyAssets.images.nav.profileSel.svg()),
              label: 'Profile',
            ),
          ],
          currentIndex: ref.watch(rootIndexProvider),
          onTap: (index) {
            if (index != ref.watch(rootIndexProvider)) {
              ref.read(rootIndexProvider.notifier).update((state) => index);
            } else {
              switch (index) {
                case 0:
                  if (discoverScroll.hasClients) {
                    discoverScroll.animateTo(
                      0.0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    );
                  }
                  break;
                case 1:
                  break;
                case 2:
                  break;
              }
            }
            pageController.jumpToPage(index);
          },
        ),
        body: PageView(
          // physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (value) =>
              ref.read(rootIndexProvider.notifier).update((state) => value),
          children: [
            DiscoverPage(
              scrollController: discoverScroll,
            ),
            PackdetailPage(),
            Container(),
          ],
        ),
      ),
    );
  }
}
