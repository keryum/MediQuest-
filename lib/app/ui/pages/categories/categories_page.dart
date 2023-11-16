import 'package:flutter/material.dart';
import 'package:mediquest/app/ui/my_appbar.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

int focusedIndex = 0;

List<Category> categoryList = [
  Category(
      'assets/microscopio.png',
      'Histología',
      '¡Descubre la maravilla de la vida microscópica!',
      '/categories/histology',
      const Color.fromARGB(255, 245, 68, 127),
      const Color.fromARGB(255, 255, 139, 178)),
  Category(
      'assets/fisiologia.png',
      'Fisiología',
      '¡Mira cómo tu cuerpo es una máquina perfecta!',
      "/categories/physiology",
      const Color.fromARGB(255, 244, 73, 61),
      const Color.fromARGB(255, 255, 146, 138)),
  Category(
      'assets/bioquimica.png',
      'Bioquímica',
      '¡Entiende la vida a nivel molecular!',
      "/categories/biochemistry",
      const Color.fromARGB(255, 50, 157, 23),
      const Color.fromARGB(255, 120, 196, 102)),
  Category(
      'assets/interrogacion.png',
      'proximamete',
      'Pronto traeremos más categorías con nuevas preguntas. ¡Anda pendiente!',
      "",
      const Color.fromARGB(255, 118, 118, 118),
      const Color.fromARGB(255, 190, 190, 190))
];

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class Category {
  String imagePath, title, description, route;
  Color color, pageColor;

  Category(this.imagePath, this.title, this.description, this.route, this.color,
      this.pageColor);
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(isHomePage: false),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Selecciona una categoría',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: categoryList[focusedIndex].color,
                fontSize: 35,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 60),
          Center(
            child: SizedBox(
                height: 500,
                child: ScrollSnapList(
                  itemBuilder: _buildListItem,
                  itemCount: categoryList.length,
                  itemSize: 250,
                  onItemFocus: (index) {
                    setState(() {
                      focusedIndex = index;
                    });
                  },
                  dynamicItemSize: true,
                )),
          ),
        ],
      ),
      backgroundColor: categoryList[focusedIndex].pageColor,
    );
  }

  Widget _buildListItem(BuildContext context, int i) {
    Category category = categoryList[i];
    return SizedBox(
        width: 250,
        height: 500,
        child: GestureDetector(
          onTap: () {
            focusedIndex = i;
            Navigator.pushNamed(context, categoryList[i].route);
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: categoryList[i].color,
            elevation: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                    child: Image.asset(category.imagePath, fit: BoxFit.cover),
                  ),
                  Text(
                    categoryList[i].title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 35, left: 20, right: 20),
                    child: Text(
                      category.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
