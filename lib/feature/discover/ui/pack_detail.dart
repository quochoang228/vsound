import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vsounds/design/colors.dart';
import 'package:vsounds/design/text_style.dart';
import 'package:vsounds/generated/assets.gen.dart';
import 'package:vsounds/widgets/appbar.dart';
import 'package:vsounds/widgets/divider_view.dart';
import 'package:vsounds/widgets/normal_button.dart';

class PackdetailPage extends ConsumerStatefulWidget {
  const PackdetailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PackdetailPageState();
}

class _PackdetailPageState extends ConsumerState<PackdetailPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: const AppBarUI(
        title: 'Sleep',
        backgroundColor: Colors.transparent,
        titleColor: AppColors.sysPrimery,
        backIconColor: AppColors.sysPrimery,
      ),
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: MyAssets.images.packDetailBg.provider(),
                  fit: BoxFit.cover,
                ),
              ),
              height: double.maxFinite,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 41,
                ).copyWith(top: size.height * 0.35),
                // padding: const EdgeInsets.all(16),
                // color: Colors.amber,
                height: 100,
                child: Row(
                  children: [
                    Column(
                      children: [
                        MyAssets.images.moon.svg(),
                        const Text(
                          'Mood',
                          style: UITextStyles.footnote,
                        ),
                        const Text(
                          'Lighthearted',
                          style: UITextStyles.title2,
                        ),
                      ],
                    ),
                    const Gap(16),
                    Column(
                      children: [
                        MyAssets.images.sleep.svg(),
                        const Text(
                          'Dreams',
                          style: UITextStyles.footnote,
                        ),
                        const Text(
                          'Daydreams',
                          style: UITextStyles.title2,
                        ),
                      ],
                    ),
                  ],
                ),
              )

              // child: SizedBox(
              //   height: 295,
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Column(
              //         children: [
              //           MyAssets.images.information.svg(),
              //           const Text(
              //             'Mood',
              //             style: UITextStyles.footnote,
              //           ),
              //           const Text(
              //             'Lighthearted',
              //             style: UITextStyles.title2,
              //           ),
              //         ],
              //       ),
              //       Column(
              //         children: [
              //           MyAssets.images.information.svg(),
              //           const Text(
              //             'Dreams',
              //             style: UITextStyles.footnote,
              //           ),
              //           const Text(
              //             'Daydreams',
              //             style: UITextStyles.title2,
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            // snap: true,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.bgPrimery,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Gap(12),
                      Container(
                        width: size.width * 0.12,
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.bgTertiary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Guitar Camp',
                              style: UITextStyles.largeTitle,
                            ),
                            Text(
                              '7 Songs . Instrumental',
                              style: UITextStyles.subhead.copyWith(
                                color: AppColors.textSecondary.withOpacity(0.6),
                              ),
                            ),
                            const DividerView(),
                            Row(
                              children: [
                                Expanded(
                                  child: NormalButton(
                                    height: 38,
                                    insertPadding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    backgroundColor: AppColors.sysPrimery,
                                    text: 'Play',
                                    icon: MyAssets.images.play.svg(),
                                    onTap: () {},
                                  ),
                                ),
                                const Gap(15),
                                Expanded(
                                  child: NormalButton(
                                    height: 38,
                                    insertPadding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    text: 'Favorite',
                                    icon: MyAssets.images.favorite.svg(),
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                            const DividerView(),
                            Row(
                              children: [
                                Expanded(
                                  child: NormalButton(
                                    height: 38,
                                    insertPadding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    backgroundColor: AppColors.sysTertiary,
                                    text: 'Unlock',
                                    icon: MyAssets.images.padlock.svg(),
                                    onTap: () {},
                                  ),
                                ),
                                const Gap(15),
                                Expanded(
                                  child: NormalButton.outline(
                                    lineColor: AppColors.sysTertiary,
                                    height: 38,
                                    insertPadding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    text: 'Unfavorite',
                                    textColor: AppColors.sysTertiary,
                                    icon: MyAssets.images.unfavorite.svg(),
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                            const DividerView(),
                            const Text(
                              'About this pack',
                              style: UITextStyles.hedline,
                            ),
                            Text(
                              'An acoustic mix has been specially selected for you. The camping atmosphere will help you improve your sleep and your body as a whole. Your dreams will be delightful and vivid.',
                              style: UITextStyles.body.copyWith(
                                color: AppColors.textSecondary.withOpacity(0.6),
                              ),
                            ),
                            const Gap(16),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.bgSecondary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(
                                      vertical: 22, horizontal: 16)
                                  .copyWith(bottom: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'List of songs'.toUpperCase(),
                                    style: UITextStyles.footnote.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  ListView.separated(
                                    itemCount: 4,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    separatorBuilder: (context, index) =>
                                        const Divider(
                                      color: AppColors.bgTertiary,
                                      height: 2,
                                    ),
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 56,
                                        child: Row(
                                          children: [
                                            Text(
                                              '01',
                                              style: UITextStyles.footnote
                                                  .copyWith(
                                                color: AppColors.textSecondary
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                            const Gap(8),
                                            CircleAvatar(
                                                backgroundColor:
                                                    AppColors.bgPrimery,
                                                child:
                                                    MyAssets.images.play.svg()),
                                            const Gap(16),
                                            const Text(
                                              'The Guitars ',
                                              style: UITextStyles.body,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const Gap(20),
                            const Text(
                              'Featured On',
                              style: UITextStyles.hedline,
                            ),
                            const Gap(8),
                            GridView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero.copyWith(
                                  bottom: 16,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // số item 1 hàng
                                  mainAxisSpacing: 15, // margin phía dưới
                                  crossAxisSpacing: 15, // marigin bên phải
                                  childAspectRatio:
                                      1 / 1.2, // Tỉ lệ 2 chiều ngang / dọc
                                  // mainAxisExtent: (size.width - 46) / 2,
                                ),
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            image: DecorationImage(
                                              image: MyAssets
                                                  .images.packDetailBg
                                                  .provider(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Gap(8),
                                      const Text(
                                        'Chill-hop',
                                        style: UITextStyles.body,
                                      ),
                                      Text(
                                        '7 Songs . Instrumental',
                                        style: UITextStyles.subhead.copyWith(
                                          color: AppColors.textSecondary
                                              .withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
              // return SingleChildScrollView(
              //   controller: scrollController,
              //   child: Column(
              //     children: [
              //       Container(
              //         height: 200,
              //         color: Colors.amber,
              //       ),
              //       Container(
              //         height: 200,
              //         color: Colors.red,
              //       ),
              //       Container(
              //         height: 500,
              //         color: Colors.black,
              //       ),
              //     ],
              //   ),
              // );
            },
            // builder: (BuildContext context, ScrollController scrollController) {
            //   return SingleChildScrollView(
            //     controller: scrollController,
            //     child: Container(
            //       height: MediaQuery.of(context).size.height * 0.9,
            //       decoration: const BoxDecoration(
            //         color: Colors.amber,
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(24),
            //           topRight: Radius.circular(24),
            //         ),
            //       ),
            //     ),
            //   );
            // },
          ),
        ],
      ),
    );
  }
}
