import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/universal_provider.dart';
import 'package:todo/screens/completed_screen.dart';
import 'package:todo/screens/todos_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = [
      TodosScren(),
      CompletedScreen(),
    ];

    return Consumer<UniversalProvider>(
      builder: (context, universalProvider, child) => Scaffold(
        body: PageView.builder(
          controller: universalProvider.pageController,
          onPageChanged: (index) => universalProvider.currentScreenInd = index,
          itemCount: pages.length,
          itemBuilder: (context, index) => pages[index],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey[300]!,
              ),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            currentIndex: universalProvider.currentScreenInd,
            onTap: (index) {
              universalProvider.pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.linear);
              universalProvider.currentScreenInd = index;
            },
            backgroundColor: Colors.white,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                label: 'Tasks',
                icon: Icon(
                  Icons.list_rounded,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Completed',
                icon: Icon(Icons.done_all_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
