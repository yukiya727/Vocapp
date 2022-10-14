import 'package:flutter/material.dart';
import 'package:vocapp/pages/home/components/stats_details.dart';
import 'package:vocapp/test/test.dart';

import '../../../styles.dart';

class StatsView extends StatefulWidget {
  StatsView({
    Key? key,
    required this.books,
  }) : super(key: key);

  final List<Book> books;

  @override
  _StatsViewState createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView> with TickerProviderStateMixin {
  List tabs = <String>['Weekly', 'Monthly', 'Yearly', 'All'];
  int _selectedTab = 0;
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
        length: tabs.length, vsync: this, animationDuration: Duration.zero);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kScaffoldBackground,
          elevation: 0,
          toolbarHeight: 0,
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            indicatorColor: kPrimaryColor2,
            onTap: (index) {
              _selectedTab = index;
              setState(() {});
            },
            tabs: [
              for (int i = 0; i < tabs.length; i++)
                Tab(
                  child: Text(
                    tabs[i],
                    style: TextStyle(
                      fontSize: _selectedTab == i ? 17 : 15,
                      color: _selectedTab == i
                          ? kTextColor
                          : kTextColor.withOpacity(0.5),
                      fontWeight: _selectedTab == i
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
            ],
          ),
        ),
        body: StatsDetailsView(
          index: _selectedTab,
          tabController: _tabController,
          tabsLength: tabs.length,
          onScroll: (position) => print('$position'),
        ),
      ),
    );
  }
}
