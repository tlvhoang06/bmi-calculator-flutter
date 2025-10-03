import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/data/constants.dart';
import 'package:demo/data/notifer.dart';
import 'package:demo/data/current_user_data.dart';
import 'package:demo/services/database_service.dart';
import 'package:demo/views/functions/app_function.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: DatabaseService().getResult(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "No results yet",
                style: TextStyle(color: Color(0XFFc0fdff), fontSize: 20),
              ),
            );
          }
          final docs = snapshot.data!.docs;
          return Column(
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Card(
                  color: Color(primaryColor),
                  elevation: 5,
                  margin: EdgeInsets.all(8),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person, color: Colors.white, size: 28),
                            SizedBox(width: 5),
                            Text(
                              currentUserData().displayName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                        Text(currentUserData().user!.email!),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemExtent: 120,
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;
                    final String date = data['time']
                        .toDate()
                        .toString()
                        .substring(0, 16);
                    return Card(
                      elevation: 5,
                      shadowColor: Color(0XFFc0fdff),
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                      child: Center(
                        child: ListTile(
                          title: Row(
                            children: [
                              Text(
                                "Result: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${data['result'].toStringAsFixed(1)}",
                                style: TextStyle(
                                  color: StatusColor(data['result']),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 50),
                              Text(
                                Result(data['result']),
                                style: TextStyle(
                                  color: StatusColor(data['result']),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(date, style: TextStyle(fontSize: 12)),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete_outline, size: 32),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
