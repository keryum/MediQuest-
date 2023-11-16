import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mediquest/app/ui/pages/achievements/achievements_page.dart';
import 'package:mediquest/app/ui/my_appbar.dart';
import 'package:mediquest/app/ui/pages/friends/friends_page.dart';
import 'package:mediquest/app/ui/pages/home/home_page.dart';
import 'package:mediquest/app/ui/pages/home/my_drawer.dart';
import 'package:mediquest/app/ui/pages/question_page/question_controller.dart';
import 'package:mediquest/app/ui/player_controller.dart';

final questionController = Get.find<QuestionController>();
final playerController = Get.find<PlayerController>();

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => InitialPageState();
}

class InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBannerAd();
  }

  late BannerAd bannerAd;
  bool isAdLoaded = false;
  var adUnit = "ca-app-pub-8421407502949534/2450793155";

  void initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: adUnit,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          // Intenta cargar el anuncio nuevamente después de 30 segundos
          Future.delayed(const Duration(seconds: 30), () {
            initBannerAd();
          });
        },
      ),
      request: const AdRequest(),
    );
    bannerAd.load();
  }

  int _currentIndex = 1;
  final controller = PageController(initialPage: 1);

  void onTabTapped(index) {
    setState(() {
      _currentIndex = index;
      controller.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color myAppBarColor = Colors.white;
    return Scaffold(
      appBar: const MyAppBar(),
      backgroundColor: myAppBarColor,
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              controller: controller,
              children: const [AchievementsPage(), HomePage(), FriendsPage()],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 2)),
            child: BottomNavigationBar(
              showUnselectedLabels: false,
              backgroundColor: Colors.white,
              fixedColor: const Color.fromARGB(255, 16, 27, 88),
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.star), label: 'Logros'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Página principal'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), label: 'Amigos'),
              ],
            ),
          ),
          isAdLoaded
              ? SizedBox(
                  height: bannerAd.size.height.toDouble(),
                  width: bannerAd.size.width.toDouble(),
                  child: AdWidget(ad: bannerAd),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
