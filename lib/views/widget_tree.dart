import 'package:demo/data/notifer.dart';
import 'package:demo/views/pages/bmi_page.dart';
import 'package:demo/views/pages/history_page.dart';
import 'package:demo/views/pages/result_page.dart';
import 'package:demo/views/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
List<Widget> pages = [BmiPage(), HistoryPage()];
class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.teal.shade300,
        centerTitle: true,
        title: ValueListenableBuilder(
          valueListenable: selectedPage,
          builder: (context, pageIndex, child) {
            return Text(
              (pageIndex == 0) ? 'B M I   C A L C U L A T O R' : 'H I S T O R Y',
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
          }
        ),
        leading: Icon(Icons.fitness_center, size: 30.0),
        actions: [
          ValueListenableBuilder(
            valueListenable: isDarkMode,
            builder: (context, isDark, child) {
              return IconButton(
                onPressed: () {
                  isDarkMode.value = !isDarkMode.value;
                },
                icon: Icon((isDark) ? Icons.light_mode : Icons.dark_mode),
                iconSize: 32.0,
              );
            },
          ),
          SizedBox(width: 10.0),
        ],
      ),
      bottomNavigationBar: NavbarWidget(),
      body: ValueListenableBuilder(valueListenable: selectedPage, builder: (context, pageIndex, child) {
        return pages.elementAt(pageIndex);
      },)
    );
  }
}
