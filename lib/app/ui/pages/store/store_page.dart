import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mediquest/app/ui/global_controllers/session_controller.dart';
import 'package:mediquest/app/ui/pages/login/utils/handle_login_response.dart';
import 'package:mediquest/app/ui/pages/question_page/question_controller.dart';
import 'package:soundpool/soundpool.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createRewardedAd();
  }

  RewardedAd? _rewardedAd;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      titlePadding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      actionsPadding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      actionsAlignment: MainAxisAlignment.center,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18))),
      backgroundColor: Colors.white,
      title: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: const SizedBox(
          height: 50,
          child: Center(
              child: Text(
            'Tienda',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
          )),
        ),
      ),
      content: SizedBox(
        height: 250,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Icon(Icons.favorite, color: Colors.red, size: 40),
                              Positioned.fill(
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Icon(Icons.favorite, color: Colors.red, size: 40),
                              Positioned.fill(
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Icon(Icons.favorite, color: Colors.red, size: 40),
                              Positioned.fill(
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Icon(Icons.favorite, color: Colors.red, size: 40),
                              Positioned.fill(
                                child: Center(
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                      const SizedBox(
                        width: 20,
                      ),
                      const Expanded(
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('30',
                                    style: TextStyle(color: Colors.black)),
                                Icon(Icons.monetization_on, color: Colors.amber)
                              ],
                            ),
                            Row(
                              children: [
                                Text('55',
                                    style: TextStyle(color: Colors.black)),
                                Icon(Icons.monetization_on, color: Colors.amber)
                              ],
                            ),
                            Row(
                              children: [
                                Text('80',
                                    style: TextStyle(color: Colors.black)),
                                Icon(Icons.monetization_on, color: Colors.amber)
                              ],
                            ),
                            Row(
                              children: [
                                Text('1',
                                    style: TextStyle(color: Colors.black)),
                                SizedBox(width: 6),
                                Icon(
                                  Icons.live_tv,
                                  color: Colors.amber,
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 24,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)))),
                                  onPressed: () {
                                    if (playerController.monedas.value >= 30) {
                                      playerController.monedas.value -= 30;
                                      playerController.vidas.value += 1;
                                      savePlayerData(sessionController.user);
                                      storeSound();
                                    }
                                  },
                                  child: const Text(
                                    'comprar',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ),
                            SizedBox(
                              height: 24,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)))),
                                  onPressed: () {
                                    if (playerController.monedas.value >= 55) {
                                      playerController.monedas.value -= 55;
                                      playerController.vidas.value += 2;
                                      savePlayerData(sessionController.user);
                                      storeSound();
                                    }
                                  },
                                  child: const Text(
                                    'comprar',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ),
                            SizedBox(
                              height: 24,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)))),
                                  onPressed: () {
                                    if (playerController.monedas.value >= 80) {
                                      playerController.monedas.value -= 80;
                                      playerController.vidas.value += 3;
                                      savePlayerData(sessionController.user);
                                      storeSound();
                                    }
                                  },
                                  child: const Text(
                                    'comprar',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ),
                            SizedBox(
                              height: 24,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)))),
                                  onPressed: () {
                                    _showRewardedAd();
                                  },
                                  child: const Text(
                                    'comprar',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        const SizedBox(height: 20),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cerrar', style: TextStyle(color: Colors.black)))
      ],
    );
  }

  void storeSound() async {
    if (playerController.isSoundEnabled.value) {
      Soundpool pool = Soundpool(streamType: StreamType.notification);
      int soundId = await rootBundle
          .load("assets/audios/storeSound.wav")
          .then((ByteData soundData) {
        return pool.load(soundData);
      });
      int streamId = await pool.play(soundId);
    }
  }

  void _showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createRewardedAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createRewardedAd();
          _showRewardedAd(); // Vuelve a cargar el anuncio si falla al mostrar
        },
      );

      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          setState(() {
            playerController.vidas.value += 5;
            playerController.incrementAdsSeen();
            storeSound();
          });
        },
      );

      _rewardedAd = null;
    } else {
      // Si el anuncio recompensado no está cargado, intenta cargarlo.
      _createRewardedAd();
    }
  }

  void _createRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-8421407502949534/4950632286',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => setState(() => _rewardedAd = ad),
        onAdFailedToLoad: (error) => setState(() => _rewardedAd = null),
      ),
    );
  }
}
