import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../size_configs.dart';
import '../../../styles.dart';

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
  Map user_stats = {
    'name': 'Bear',
    'reg_date': '12/12/2020',
    'last_logged_in': "9/7/2022",
    'studied_days_total': 10,
    'studied_words_total': 1000,
    'words_added': 100,
    'log': [
      {
        'date': '12/12/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/13/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/14/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/15/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/16/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/17/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/18/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/19/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/20/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/21/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/22/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/23/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/24/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/25/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/26/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/27/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/28/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '12/29/2020',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '9/4/2022',
        'words_added': 100,
        'words_studied': 100,
      },
      {
        'date': '9/5/2022',
        'words_added': 100,
        'words_studied': 100,
      },
    ]
  };
  List stats = [
    {
      'title': 'Words Added',
      'value': 100,
      'color': kPrimaryColor2,
    },
    {
      'title': 'Words Studied',
      'value': 100,
      'color': kPrimaryColor2,
    },
    {
      'title': 'Words Added',
      'value': 100,
      'color': kPrimaryColor2,
    },
    {
      'title': 'Words Studied',
      'value': 100,
      'color': kPrimaryColor2,
    },
    {
      'title': 'Words Studied',
      'value': 100,
      'color': kPrimaryColor2,
    },
    {
      'title': 'Words Studied',
      'value': 100,
      'color': kPrimaryColor2,
    },
    {
      'title': 'Words Studied',
      'value': 100,
      'color': kPrimaryColor2,
    },
  ];

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
    final SizeH = SizeConfig.blockSizeHorizontal!;

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
