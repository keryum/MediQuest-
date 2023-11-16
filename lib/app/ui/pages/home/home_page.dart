import 'package:flutter/material.dart';
import 'package:mediquest/app/ui/routes/routes.dart';
import 'package:mediquest/app/ui/pages/categories/categories_page.dart';
import 'package:mediquest/app/ui/my_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
              image: AssetImage(
                  'assets/mediquest_logo.gif')), // Reemplaza 'assets/logo.png' con la ubicación de tu imagen de logo.
          const SizedBox(height: 106),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
            ),
            onPressed: () {
              isInitialPage = false;
              // Navegar a la página de selección de categoría.
              Navigator.of(context).pushNamed(Routes.CATEGORIES);
              focusedIndex = 0;
            },
            child: const Text(
              'Comenzar',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
