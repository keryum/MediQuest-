import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:get/get.dart';
import 'package:mediquest/app/ui/global_controllers/session_controller.dart';
import 'package:mediquest/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:mediquest/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:mediquest/app/ui/global_widgets/dialogs/show_input_dialog.dart';
import 'package:mediquest/app/ui/my_appbar.dart';
import 'package:mediquest/app/ui/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({super.key});

  void _updateDisplayName(BuildContext context) async {
    final sessionController = sessionProvider.read;
    final value = await showInputDialog(
      context,
      initalValue: sessionController.user!.displayName ?? "",
    );
    if (value != null) {
      ProgressDialog.show(context);
      final user = await sessionController.updateDisplayName(value);
      Navigator.pop(context);
      if (user == null) {
        Dialogs.alert(
          context,
          title: "ERROR",
          content: "Check your internet connection",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, watch) {
    final sessionController = watch(sessionProvider);
    final user = sessionController.user!;

    final displayName = user.displayName ?? '';
    final letter = displayName.isNotEmpty ? displayName[0] : "";
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          SizedBox(
            height: 200,
            child: UserAccountsDrawerHeader(
              accountName: TextButton(
                  onPressed: () => _updateDisplayName(context),
                  child: Text(
                    displayName,
                    style: const TextStyle(color: Colors.white),
                  )), // Reemplaza con el nombre del usuario
              accountEmail:
                  Text(user.email ?? ''), // Reemplaza con el correo del usuario
              currentAccountPicture: CircleAvatar(
                backgroundImage: user.photoURL != null
                    ? NetworkImage(user.photoURL!)
                    : null, // Reemplaza con la URL de la imagen del usuario
              ),
            ),
          ),
          const ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Compartir',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 25)),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.share,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sonido',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 25)),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Obx(() => IconButton(
                        onPressed: changeIsSound,
                        icon: playerController.isSoundEnabled.value
                            ? const Icon(
                                Icons.volume_up,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.volume_mute,
                                color: Colors.grey,
                              ),
                      )),
                ),
              ],
            ),
          ),
          const ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Calificar',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 25)),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ButtonBar(alignment: MainAxisAlignment.center, children: [
            OutlinedButton(
              child: const Text(
                'Cerrar sesión',
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () async {
                ProgressDialog.show(context);
                await sessionProvider.read.signOut();
                playerController.disconnectFirestoreStream();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                router.pushNamedAndRemoveUntil(Routes.LOGINPAGE);
              },
            ),
          ])
        ],
      ),
    );
  }

  void changeIsSound() {
    playerController.isSoundEnabled.value =
        !playerController.isSoundEnabled.value;
  }
}
