import 'package:demo/data/notifer.dart';
import 'package:demo/views/pages/bmi_page.dart';
import 'package:demo/views/pages/history_page.dart';
import 'package:demo/views/drawer.dart';
import 'package:demo/views/navbar.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [BmiPage(), HistoryPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.0,
        backgroundColor: Color(0XFFb8f2e6),
        centerTitle: true,
        title: ValueListenableBuilder(
          valueListenable: selectedPage,
          builder: (context, pageIndex, child) {
            return Text(
              (pageIndex == 0)
                  ? 'B M I   C A L C U L A T O R'
                  : 'L A T E S T   R E S U L T S',
              style: TextStyle(
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 2.0,
                    color: Colors.black38,
                  ),
                ],
                fontSize: 30.0,
              ),
            );
          },
        ),
        actions: [SizedBox(width: 10.0)],
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: NavBar(),
      body: ValueListenableBuilder(
        valueListenable: selectedPage,
        builder: (context, pageIndex, child) {
          return pages.elementAt(pageIndex);
        },
      ),
    );
  }
}
