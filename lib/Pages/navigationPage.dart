import 'package:flutter/material.dart';
import 'package:a_m_s/Pages/Home/homePage.dart';
import 'package:a_m_s/Pages/Promotions/promotionPage.dart';
import 'package:a_m_s/StateManagment/Promotions/promotionsProviderModel.dart';
import 'package:a_m_s/Widgets/countBadgeWidget.dart';
import 'package:provider/provider.dart';

import 'Contacts/ContactUsPage.dart';
import 'News/newsPage.dart';
import 'Notification/notificationsPage.dart';

// ignore: must_be_immutable
class NavigationPage extends StatefulWidget {
  dynamic currentTab = 0;
  NavigationPage({
    this.currentTab,
  });
  late Widget currentPage = HomePage();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  _PagesWidgetState createState() {
    return _PagesWidgetState();
  }
}

class _PagesWidgetState extends State<NavigationPage> {
  initState() {
    super.initState();
    _selectTab(widget.currentTab == null ? 0 : widget.currentTab);
  }

  @override
  void didUpdateWidget(NavigationPage oldWidget) {
    _selectTab(oldWidget.currentTab);
    super.didUpdateWidget(oldWidget);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem;
      switch (tabItem) {
        case 0:
          widget.currentPage = HomePage();
          break;
        case 1:
          widget.currentPage = PromotionPage();
          break;
        case 2:
          widget.currentPage = NotificationPage();
          break;
        case 3:
          widget.currentPage = NewsPage();
          break;
        case 4:
          widget.currentPage = ContactUsPage();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      body: widget.currentPage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).focusColor.withOpacity(1),
        currentIndex: widget.currentTab,
        showUnselectedLabels: true,

        onTap: (int i) {
          this._selectTab(i);
        },
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Consumer<PromotionsProviderModel>(
              builder: (context, myModel, child) {
                return CountBadgeWidget(
                  Icons.campaign_outlined,
                  myModel.getLengthOfPromotions(),
                );
              },
            ),
            label: "Promotions",
          ),
          BottomNavigationBarItem(
            icon: CountBadgeWidget(Icons.notifications, 0),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
              size: 30,
            ),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.contact_page,
              size: 30,
            ),
            label: "Contacts",
          ),
        ],
      ),
    );
  }
}
