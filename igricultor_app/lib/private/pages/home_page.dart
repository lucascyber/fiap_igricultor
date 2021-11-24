import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final drawerHeader = UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Colors.green.shade700,
      ),
      accountName: const Text(
        'João da Silva',
      ),
      accountEmail: const Text(
        'joao.silva@gmail.com',
      ),
      currentAccountPicture: CircleAvatar(
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                'https://pbs.twimg.com/profile_images/606980557931737088/gLx5YTBA.jpg',
              ),
            ),
          ),
        ),
      ),
    );

    final drawerItems = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: const Text(
            'Negociações',
          ),
          leading: const FaIcon(FontAwesomeIcons.commentsDollar),
          onTap: () {
            Navigator.pushNamed(context, '/chat');
          },
        ),
        ListTile(
          title: const Text(
            'Pedidos',
          ),
          leading: const FaIcon(FontAwesomeIcons.shoppingBasket),
          onTap: () {
            Navigator.pushNamed(context, '/order-list');
          },
        ),
        ListTile(
          title: const Text(
            'Sair',
          ),
          leading: const FaIcon(FontAwesomeIcons.signOutAlt),
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
        ),
      ],
    );

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
      backgroundColor: Colors.grey.shade200,
      drawer: Drawer(
        child: drawerItems,
      ),
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
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
