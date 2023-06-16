import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vsounds/generated/assets.gen.dart';
import 'dart:math' as math;

enum TabEnum {
  o0('Today'),
  o1('Best'),
  o2('Brach'),
  o3('Sellers'),
  o4('Lifestyle'),
  o5('Sale'),
  o6('Hot');

  final String groupName;
  const TabEnum(this.groupName);
}

final groupTabIndex = StateProvider.autoDispose<int>((ref) => 0);
final groupTabsProvider = StateProvider.autoDispose<List<Tab>>(
  (ref) => TabEnum.values
      .map(
        (e) => Tab(text: e.groupName),
      )
      .toList(),
);

class ProfilePage extends StatefulHookConsumerWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  Color color1 = const Color(0xff1A1A1A);
  Color color2 = const Color(0xff212324);
  Color color727678 = const Color(0xff727678);

  @override
  Widget build(BuildContext context) {
    var tabController = useTabController(
      initialLength: ref.watch(groupTabsProvider).length,
      initialIndex: ref.watch(groupTabIndex),
    );
    ScrollController _scrollViewController =
        ScrollController(initialScrollOffset: 0.0);

    tabController.addListener(() {
      ref.read(groupTabIndex.notifier).update(
            (state) => tabController.index,
          );
    });
    return Scaffold(
      backgroundColor: color1,
      body: SafeArea(
        // child: CustomScrollView(
        //   slivers: [
        //     SliverAppBar(
        //       leading: Padding(
        //         padding: const EdgeInsets.only(left: 14.0),
        //         child: MyAssets.zigzang.logo.svg(),
        //       ),
        //       backgroundColor: color1,
        //       leadingWidth: 100,
        //       floating: true,
        //       elevation: 0,
        //       actions: [
        //         IconButton(
        //           onPressed: () {},
        //           icon: MyAssets.zigzang.menu.svg(),
        //         ),
        //         IconButton(
        //           onPressed: () {},
        //           icon: MyAssets.zigzang.search.svg(),
        //         ),
        //         IconButton(
        //           onPressed: () {},
        //           icon: MyAssets.zigzang.shopping.svg(),
        //         ),
        //       ],
        //     ),
        //     SliverToBoxAdapter(
        //       child: Container(
        //         height: 300,
        //         decoration: const BoxDecoration(
        //           image: DecorationImage(
        //             fit: BoxFit.cover,
        //             image: NetworkImage(
        //               'https://images.unsplash.com/photo-1684843946691-7b6e48153dc6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     SliverPersistentHeader(
        //       pinned: true,
        //       delegate: _SliverAppBarDelegate(
        //         minHeight: 60.0,
        //         maxHeight: 60.0,
        //         child: Container(
        //           padding: const EdgeInsets.symmetric(horizontal: 14),
        //           decoration: BoxDecoration(
        //             color: color1,
        //             border: Border(
        //               bottom: BorderSide(
        //                 color: color2,
        //                 width: 1,
        //               ),
        //             ),
        //           ),
        //           child: TabBar(
        //             onTap: (index) {
        //               ref.read(groupTabIndex.notifier).update(
        //                     (state) => index,
        //                   );
        //             },
        //             isScrollable: true,
        //             controller: tabController,
        //             tabs: ref.watch(groupTabsProvider),
        //             indicatorColor: Colors.white,
        //             // unselectedLabelStyle: UITextStyle.body2Regular,
        //             unselectedLabelColor: color727678,
        //             // labelStyle: UITextStyle.body2Regular,
        //             labelColor: Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //     SliverList.builder(
        //       itemCount: 50,
        //       itemBuilder: (context, index) => Container(
        //         height: 50,
        //         color: color2,
        //         margin: EdgeInsets.only(bottom: 12),
        //       ),
        //     ),
        //   ],
        // ),
        child: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: MyAssets.zigzang.logo.svg(),
                ),
                backgroundColor: color1,
                leadingWidth: 100,
                floating: true,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: MyAssets.zigzang.menu.svg(),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: MyAssets.zigzang.search.svg(),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: MyAssets.zigzang.shopping.svg(),
                  ),
                ],
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 60.0,
                  maxHeight: 60.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: color1,
                      border: Border(
                        bottom: BorderSide(
                          color: color2,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    child: TabBar(
                      onTap: (index) {
                        ref.read(groupTabIndex.notifier).update(
                              (state) => index,
                            );
                      },
                      isScrollable: true,
                      controller: tabController,
                      tabs: ref.watch(groupTabsProvider),
                      indicatorColor: Colors.white,
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedLabelColor: color727678,
                      // label
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                      labelColor: Colors.white,
                    ),
                  ),
                ),
              ),
              // SliverToBoxAdapter(
              //   child: Container(
              //     height: 300,
              //     decoration: const BoxDecoration(
              //       image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: NetworkImage(
              //           'https://images.unsplash.com/photo-1684843946691-7b6e48153dc6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              
            ];
          },
          
          body: TabBarView(
            controller: tabController,
            // physics: const BouncingScrollPhysics(),
            children: [
              ListView.separated(
                // controller: _scrollViewController,
                itemCount: 40,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    color: color2,
                    height: 40,
                    child: Center(
                      child: Text(
                        '$index',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Gap(12),
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
