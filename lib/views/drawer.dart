import 'package:demo/data/current_user_data.dart';
import 'package:demo/data/notifer.dart';
import 'package:demo/views/functions/confirm_dialog.dart';
import 'package:demo/views/functions/textfield_dialog.dart';
import 'package:demo/views/pages/change_password.dart';
import 'package:demo/views/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo/data/constants.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      foregroundColor: Colors.black,
                      backgroundColor: Color(0XFF48bfe3).withOpacity(0.2),
                      child: Icon(Icons.person_2_outlined),
                    ),
                    SizedBox(width: 10),
                    Text(
                      curentUserData().displayName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        showTextFieldDialog(
                          context: context,
                          title: "Change Username",
                          onConfirm: (newName) async {
                            await authServices.value.updateUserName(
                              username: newName,
                            );
                            setState(() {});
                          },
                        );
                      },
                      icon: Icon(Icons.edit, size: 20),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey, indent: 50, endIndent: 50),
              SizedBox(height: 30),
              Text('S e t t i n g'),
            ],
          ),
          SizedBox(height: 15),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChangePassword();
                  },
                ),
              );
            },
            splashColor: Colors.grey.shade100,
            child: ListTile(title: Text('Change password')),
          ),
          Divider(color: Colors.grey, indent: 16, endIndent: 16),

          InkWell(
            onTap: () {
              showConfirmDialog(
                title: "Confirm Logout",
                content: "Are you sure you want to log out?",
                context: context,
                onConfirm: logOut,
              );
            },
            splashColor: Colors.grey.shade100,
            child: ListTile(title: Text('Log out')),
          ),
        ],
      ),
    );
  }
}
