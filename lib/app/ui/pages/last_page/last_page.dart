import 'package:flutter/material.dart';
import 'package:mediquest/app/ui/pages/categories/categories_page.dart';
import 'package:mediquest/app/ui/routes/routes.dart';

class LastPage extends StatelessWidget {
  const LastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: categoryList[focusedIndex].pageColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: 200,
              child: Image.asset(categoryList[focusedIndex].imagePath)),
          Title(
              color: categoryList[focusedIndex].color,
              child: const Center(
                child: Text(
                  '¡Felicidades!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
              )),
          const Text(
            'Ya terminaste todos los niveles aquí \n\n¡Ve a otra categoría para seguir aprendiendo!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 250,
            height: 70,
            child: OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: categoryList[focusedIndex]
                          .color, // Cambia aquí al color deseado
                      width:
                          1.0, // Puedes ajustar el ancho del borde según tus preferencias
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).popUntil((route) {
                    return route.settings.name == Routes.CATEGORIES;
                  });
                },
                child: Text(
                  'Volver',
                  style: TextStyle(
                      color: categoryList[focusedIndex].color, fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
