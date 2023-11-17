import 'package:flutter/material.dart';
import 'package:flutter_dating_template/pages/home/community/index.dart';
import 'package:flutter_dating_template/pages/home/index/index.dart';
import 'package:flutter_dating_template/pages/home/message/index.dart';
import 'package:flutter_dating_template/pages/home/mine/index.dart';
import 'package:flutter_dating_template/state/token.dart';

import 'package:flutter_dating_template/wcao/ui/theme.dart';
import 'package:get/get.dart';

/// 首页 PageView Controller.
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int curPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      if (TokenController.to.token.isEmpty) {
        Get.toNamed('/login/verify-code');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          PageViewIndex(),
          PageViewCommunity(),
          PageViewMessage(),
          PageViewMine(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: WcaoTheme.primary,
        onPressed: () {
          Get.toNamed('/publish');
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              barItem(curPage == 0, 0, icon: Icons.home_filled, text: "Front page"),
              barItem(curPage == 1, 1, icon: Icons.access_alarm, text: "Community"),
              const SizedBox(
                width: 48,
              ),
              barItem(curPage == 2, 2, icon: Icons.message_sharp, text: "Information"),
              barItem(curPage == 3, 3, icon: Icons.person, text: "Mine"),
            ],
          ),
        ),
      ),
    );
  }

  IconButton barItem(
    bool active,
    int initPage, {
    required IconData icon,
    required String text,
  }) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      color: active ? WcaoTheme.primary : WcaoTheme.secondary,
      icon: Column(
        children: [
          Icon(icon),
          Text(
            text,
            style: TextStyle(
              color: active ? WcaoTheme.primary : WcaoTheme.secondary,
            ),
          ),
        ],
      ),
      onPressed: () {
        setState(() {
          curPage = initPage;
          _pageController.jumpToPage(curPage);
        });
      },
    );
  }
}
