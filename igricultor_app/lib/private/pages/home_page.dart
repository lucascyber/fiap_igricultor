import 'package:flutter/material.dart';
import 'package:igricultor_app/private/pages/commerce_page.dart';
import 'package:igricultor_app/private/pages/fair_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, RestorationMixin {
  TabController? _tabController;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    _tabController!.addListener(() {
      setState(() {
        tabIndex.value = _tabController!.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController!.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<HomeTabItem> tabs = [
      HomeTabItem(
        title: 'Feirinha',
        page: const FairPage(),
      ),
      HomeTabItem(
        title: 'Atacado',
        page: const CommercePage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        automaticallyImplyLeading: false,
        title: const Text('Market Place'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          indicatorColor: Colors.white,
          indicatorWeight: 5,
          labelStyle: const TextStyle(fontSize: 16),
          tabs: [
            for (final tab in tabs) Tab(text: tab.title),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          for (final tab in tabs)
            Center(
              child: tab.page,
            ),
        ],
      ),
    );
  }

  @override
  String get restorationId => 'tab_non_scrollable_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController!.index = tabIndex.value;
  }
}

class HomeTabItem {
  HomeTabItem({
    required this.title,
    required this.page,
  });

  final String title;
  final Widget page;
}
