import 'package:demo/data/notifer.dart';
import 'package:demo/views/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo/data/constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void popPage() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Logged out'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => false,
      );
    }

    void logOut() async {
      try {
        await authServices.value.signOut();
        popPage();
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${error.message}')));
      }
      ;
    }

    return Drawer(
      backgroundColor: Color(0XFFe0fbfc),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 15, left: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      foregroundColor: Colors.black,
                      backgroundColor: Color(0XFF48bfe3).withOpacity(0.2),
                      child: Icon(Icons.person_3_outlined),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Truong Le Vu Hoang',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ), // temp
                  ],
                ),
              ),
              Text('S e t t i n g'),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(height: 30),
          ValueListenableBuilder(
            valueListenable: isDarkMode,
            builder: (context, isDark, child) {
              return ListTile(
                title: Text(isDark ? 'Dark mode' : 'Light mode'),
                trailing: Switch(
                  value: isDark,
                  onChanged: (value) async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool(KThemeModeKey.themeKey, value);
                    isDarkMode.value = value;
                  },
                  activeColor: Color(0XFF0d1b2a),
                  inactiveTrackColor: Color(0XFFedeec9),
                  thumbIcon: MaterialStateProperty.all(
                    Icon(
                      isDark ? Icons.dark_mode : Icons.light_mode,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
          Divider(color: Colors.grey, indent: 16, endIndent: 16),
          InkWell(
            onTap: () {
              logOut();
            },
            splashColor: Colors.grey.shade100,
            child: ListTile(title: Text('Log out')),
          ),
        ],
      ),
    );
  }
}
