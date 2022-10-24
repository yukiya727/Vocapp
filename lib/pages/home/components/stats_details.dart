import 'package:flutter/material.dart';
import '../../../size_configs.dart';
import '../../../styles.dart';
import 'test_content.dart' as contents;

class StatsDetailsView extends StatefulWidget {
  StatsDetailsView({
    required this.index,
    required this.tabsLength,
    required this.tabController,
    required this.onScroll,
  });

  final int index;
  final int tabsLength;
  final TabController tabController;
  final ValueChanged<double?> onScroll;

  @override
  State<StatsDetailsView> createState() => _StatsDetailsViewState();
}

class _StatsDetailsViewState extends State<StatsDetailsView> {
  late TabController _controller;
  // for testing
  Map user_stats = contents.user_stats;
  List stats = contents.stats;

  @override
  void initState() {
    for (int i = 0; i < user_stats['log'].length; i++) {
      if (user_stats['log'][i]['date'] == user_stats['last_logged_in']) {
        user_stats['log'].removeRange(i, user_stats['log'].length);
      }
    }
    _controller = widget.tabController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SizeV = SizeConfig.blockSizeV!;
    final SizeH = SizeConfig.blockSizeH!;

    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
    for (int i = 0; i < widget.tabsLength; i++)
      Container(
        padding: EdgeInsets.symmetric(horizontal: SizeH * 2)
            .add(EdgeInsets.only(top: SizeV * 2)),
        child: ListView.builder(
          itemCount: stats.length +1 ,
          itemBuilder: (BuildContext context, int index) {
            return index == 0
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeH * 5),
                    child: Image.asset(
                      'assets/images/onboarding_image_3.png',
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: SizeH * 8)
                        .add(EdgeInsets.symmetric(vertical: SizeV * 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeV * 5,
                          height: SizeV * 5,
                          child: Image.asset(
                            'assets/images/icons/book_stack.png',
                            // 'assets/images/onboarding_gif_2.gif',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: SizeH * 5,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '300',
                                style: kBodyText3,
                              ),
                              TextSpan(
                                  text: ' ${stats[index - 1]['title']}',
                                  style: kBodyText3),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    ],
    );
  }
}
