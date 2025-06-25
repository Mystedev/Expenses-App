// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, library_private_types_in_public_api, unused_element

import 'package:flutter/material.dart';

import 'Account.dart';
import 'Expenses.dart';
import 'Transport.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  // Mueve la función aquí, dentro de la clase
  Route<dynamic> _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Cambiado para animar desde la derecha
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Expenses',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'This Month',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            // Add your expense widgets here
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity, 
                child: Card(
                  color: Colors.grey[100],
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description of the expense goes here.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$100.00',
                          style: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Recents',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildItem('Food', '80€', Icons.fastfood),
                  buildItem('Transport', '100€', Icons.directions_car),
                  buildItem('Entertainment', '80€', Icons.movie),
                  buildItem('Utilities', '20€', Icons.lightbulb_outline),
                  buildItem('Shopping', '150€', Icons.shopping_cart),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.monetization_on_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).push(_createRoute(Expenses()));
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.train_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).push(_createRoute(Transport()));
                },
              ),
              IconButton(
                  icon: Icon(
                    Icons.person_outline_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(_createRoute(Account()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildItem(String title, String subtitle, IconData icon) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: Card(
      color: Colors.blueGrey[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon, color: Colors.black, size: 30),
      ),
    ),
    title: Align(
      alignment: Alignment.centerLeft, // Alinea el texto a la izquierda
      child: Text(title, style: TextStyle(fontSize: 18)),
    ),
    subtitle: Align(
      alignment: Alignment.centerLeft,
      child: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
    ),
  );
}
