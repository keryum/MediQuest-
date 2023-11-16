import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

/* final loginProvider = SimpleProvider(
  (_) => LoginController(sessionProvider.read),
); */
bool isLogedIn = false;

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  Future<Map<String, dynamic>> getFriendsData() async {
    // Obtener los datos de amigos de Facebook, incluyendo 'picture'
    final facebookFriends =
        await FacebookAuth.i.getUserData(fields: 'friends{id,name,picture}');
    // Obtener la lista de IDs de Facebook de los amigos
    final friendsIds = facebookFriends?['friends']['data']
        .map<String>((friend) => friend['id'].toString())
        .toList();
    print(facebookFriends);

    // Realizar una consulta en Firestore para obtener información de amigos
    final friendsFirestoreData = await FirebaseFirestore.instance
        .collection('Usuarios')
        .where('facebookId', whereIn: friendsIds)
        .get();

    // Crear un mapa con la información combinada
    final Map<String, dynamic> combinedData = {};
    for (final friendData in friendsFirestoreData.docs) {
      combinedData[friendData['facebookId']] = {
        'name': friendData['displayName'],
        'profilePictureUrl': friendData['profilePictureUrl'],
        'vidas': friendData['vidas'],
        'monedas': friendData['monedas'],
        'histologyHighestLevel': friendData['highestLevels']
            ['histologyHighestLevel'],
        'physiologyHighestLevel': friendData['highestLevels']
            ['physiologyHighestLevel'],
        'biochemistryHighestLevel': friendData['highestLevels']
            ['biochemistryHighestLevel'],
        // Reemplaza 'nombre' con el campo real
        // Agrega otros campos según sea necesario
      };
    }

    return combinedData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
              future: getFriendsData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No se encontraron amigos.'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final facebookId = snapshot.data!.keys.elementAt(index);
                      final friendData = snapshot.data![facebookId];
                      final profilePictureUrl =
                          friendData['profilePictureUrl'] as String;

                      return Container(
                        color: Color.fromARGB(255, 166, 41, 25),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: ListTile(
                            title: Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(profilePictureUrl)),
                                      Text(
                                        friendData['name'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              const Icon(Icons.favorite,
                                                  color: Colors.red),
                                              Positioned.fill(
                                                  child: Center(
                                                      child: Text(
                                                friendData['vidas'].toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              )))
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.monetization_on,
                                                color: Colors.amber,
                                              ),
                                              Text(
                                                friendData['monedas']
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                            height: 50,
                                            child: Image.asset(
                                                'assets/microscopio.png')),
                                        Text(
                                          friendData['histologyHighestLevel']
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                            height: 50,
                                            child: Image.asset(
                                                'assets/fisiologia.png')),
                                        Text(
                                          friendData['physiologyHighestLevel']
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                            height: 50,
                                            child: Image.asset(
                                                'assets/bioquimica.png')),
                                        Text(
                                          friendData['biochemistryHighestLevel']
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            // Puedes agregar más widgets aquí para mostrar más información
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
