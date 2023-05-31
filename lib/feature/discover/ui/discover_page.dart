import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vsounds/design/colors.dart';
import 'package:vsounds/design/text_style.dart';
import 'package:vsounds/helper/dialog_helper.dart';
import 'package:vsounds/router/paths.dart';
import 'package:vsounds/widgets/normal_button.dart';

class DiscoverPage extends ConsumerStatefulWidget {
  const DiscoverPage({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends ConsumerState<DiscoverPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.bgPrimery,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            DialogHelper.showSnackMessage(context, message: 'Refresh');
          },
          child: Padding(
            padding: const EdgeInsets.all(16).copyWith(bottom: 0),
            child: SingleChildScrollView(
              controller: widget.scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Discover',
                    textAlign: TextAlign.left,
                    style: UITextStyles.largeTitle,
                  ),
                  NormalButton(
                    text: 'Click',
                    onTap: () => context.push(Paths.packDetail),
                  ),
                  Container(
                    height: 1000,
                    // color: Colors.amber,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
