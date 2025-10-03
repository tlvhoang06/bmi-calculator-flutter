import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/services/database_service.dart';
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
            return Text(
              "Error",
              style: TextStyle(color: Colors.red, fontSize: 20),
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
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              final String date = data['time'].toDate().toString().substring(0,16);
              return ListTile(
                title: Text(
                  "BMI: ${data['result'].toStringAsFixed(1)}",
                  style: TextStyle(color: Color(0XFFc0fdff), fontSize: 20),
                ),
                subtitle: Text(date)
              );
            },
          );
        },
      ),
    );
  }
}
