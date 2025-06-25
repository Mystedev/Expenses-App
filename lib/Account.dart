// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Settings',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Perfil
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage('assets/Person.png'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Elena Olaiz',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'View Profile',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32),
              // General
              Text(
                'General',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Card(
                margin: EdgeInsets.only(left: 0),
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildIcon('Notifications', Icons.notifications_none),
                    SizedBox(height: 6),
                    buildIcon('Appearance', Icons.wb_sunny_outlined),
                    SizedBox(height: 6),
                    buildIcon('Language', Icons.language),
                    SizedBox(height: 6),
                    buildIcon('Currency', Icons.attach_money),
                  ],
                ),
              ),
              SizedBox(height: 8),
              // Support
              Text(
                'Support',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Card(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    buildIcon('Help Center', Icons.help_outline),
                    SizedBox(height: 6),
                    buildIcon('Contact Us', Icons.mail_outline),
                    SizedBox(height: 6),
                    buildIcon('Terms of Service', Icons.description_outlined),
                    SizedBox(height: 6),
                    buildIcon('Privacy Policy', Icons.verified_user_outlined),
                  ],
                ),
              ),
              SizedBox(height: 24),
              // Log Out Button
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.black,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildIcon(String title, IconData icon) {
  return ListTile(
    contentPadding: EdgeInsets.zero, // Elimina el padding lateral
    leading: Card(
      color: Colors.blueGrey[100],
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
  );
}