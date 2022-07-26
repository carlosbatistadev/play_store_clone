import 'package:flutter/material.dart';

import 'pages/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentPage = const MainPage();

  void setCurrentPage(int index) {
    if (index == 0) {
      currentPage = const MainPage();
    } else if (index == 1) {
      currentPage = const Text('Top charts');
    } else if (index == 2) {
      currentPage = const Text('Children');
    } else if (index == 3) {
      currentPage = const Text('Categories');
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Builder(builder: (context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            setCurrentPage(tabController.index);
          }
        });

        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  snap: false,
                  floating: true,
                  expandedHeight: 100.0,
                  elevation: 0.0,
                  bottom: const TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(text: 'For you'),
                      Tab(text: 'Top charts'),
                      Tab(text: 'Children'),
                      Tab(text: 'Categories'),
                      Tab(text: 'Editor\'s Choice'),
                    ],
                  ),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 1,
                    titlePadding: const EdgeInsets.only(
                      bottom: 50,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(
                        left: 14,
                        right: 20,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: ColoredBox(
                          color: Colors.blueGrey.shade50,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 15.0,
                              left: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.search,
                                  color: Colors.black87,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search for apps & games',
                                    ),
                                  ),
                                ),
                                Icon(Icons.mic_none_sharp),
                                SizedBox(width: 12),
                                CircleAvatar(
                                  radius: 15.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    ColoredBox(
                      color: Colors.grey.shade300,
                      child: const SizedBox(
                        width: double.maxFinite,
                        height: 1.0,
                      ),
                    ),
                    currentPage,
                  ]),
                ),
              ],
            ),
          ),
          bottomNavigationBar: ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: SizedBox(
              width: double.maxFinite,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Icon(Icons.gamepad),
                        SizedBox(height: 5),
                        Text('Games'),
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.gamepad),
                        SizedBox(height: 5),
                        Text('Games'),
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.gamepad),
                        SizedBox(height: 5),
                        Text('Games'),
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.gamepad),
                        SizedBox(height: 5),
                        Text('Games'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
