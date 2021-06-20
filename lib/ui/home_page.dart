import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_bank/ui/base_state.dart';
import 'package:my_first_bank/blocs/home_bloc.dart';
import 'package:my_first_bank/ui/no_available_page.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_app_bar.dart';
import 'package:my_first_bank/ui/platform_widgets/platform_bottom_tab_bar.dart';
import 'package:my_first_bank/ui/services_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeBloc>
    with TickerProviderStateMixin {
  Map<int, String> pagesTitles;
  List<Type> pagesType;
  List<Widget> pages;
  int initialHomePage = 2;

  @override
  getBlocInstance() {
    return HomeBloc();
  }

  @override
  void initState() {
    super.initState();
    _loadPagesTypes();
    _loadPages();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadPagesTitle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAppBar(
        title: StreamBuilder<int>(
          stream: bloc.currentPage,
          initialData: initialHomePage,
          builder: (context, curretnPageStream) {
            return Text(pagesTitles[curretnPageStream.data] ?? '');
          },
        ),
      ),
      body: StreamBuilder<int>(
        stream: bloc.currentPage,
        initialData: initialHomePage,
        builder: (context, snapshot) {
          _report(snapshot.data);
          return IndexedStack(
            index: snapshot.data,
            children: pages,
          );
        },
      ),
      floatingActionButton: StreamBuilder<int>(
        stream: bloc.currentPage,
        initialData: 2,
        builder: (context, snapshot) {
          return AnimatedSize(
              duration: Duration(microseconds: 200),
              vsync: this,
              child: (snapshot.data == 2 || snapshot.data == 3)
                  ? FloatingActionButton(
                      child: Icon(Icons.qr_code),
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NoAvailablePage()));
                      })
                  : SizedBox());
        },
      ),
      bottomNavigationBar: StreamBuilder<int>(
        stream: bloc.currentPage,
        initialData: initialHomePage,
        builder: (context, currentPage) {
          return PlatformBottomTabBar(
            currentIndex: currentPage.data,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.login),
                    )
                  ],
                ),
                label: l10n.home,
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: l10n.services)
            ],
          );
        },
      ),
    );
  }

  void _loadPagesTitle() {
    pagesTitles = {
      0: l10n.home,
      1: l10n.services,
    };
  }

  void _loadPagesTypes() {
    pagesType = [];
    pagesType.add(HomePage);
    pagesType.add(ServicesPage);
  }

  void _loadPages() {
    pages = [];
    pages.add(HomePage());
    pages.add(ServicesPage());
  }

  void _report(int index) {}

  void _onItemTapped(int index) {
    bloc.changePage(index);
  }
}
