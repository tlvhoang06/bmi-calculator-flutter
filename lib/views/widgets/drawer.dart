import 'package:demo/data/notifer.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
          Divider(color: Colors.grey, indent: 35, endIndent: 35),
          SizedBox(height: 30),
          ValueListenableBuilder(
            valueListenable: isDarkMode,
            builder: (context, isDark, child) {
              return ListTile(
                title: Text(isDark ? 'Dark mode' : 'Light mode'),
                trailing: Switch(
                  value: isDark,
                  onChanged: (value) {
                    isDarkMode.value = !isDarkMode.value;
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
        ],
      ),
    );
  }
}
