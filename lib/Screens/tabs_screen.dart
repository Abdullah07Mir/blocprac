import 'package:bloc_task_fluuter/Screens/add_taskScreen.dart';
import 'package:bloc_task_fluuter/Screens/completeScreen.dart';
import 'package:bloc_task_fluuter/Screens/favoriteScreen.dart';
import 'package:bloc_task_fluuter/Screens/my_drawer.dart';
import 'package:bloc_task_fluuter/Screens/pendingScreen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({super.key});
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': PendingTaskScreen(), 'title': 'Pending Tasks'},
    {'pageName': CompleteTaskScreen(), 'title': 'Complete Tasks'},
    {'pageName': FavoriteTaskScreen(), 'title': 'Favorite Tasks'},
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTaskScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title'],),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton:_selectedPageIndex == 0 ?FloatingActionButton(
        onPressed: () => _addTask(context),
        child: Icon(Icons.add),
      ): null,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (index) {
            setState(() {
              
            _selectedPageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.incomplete_circle_sharp), label: 'Pending Task'),
            BottomNavigationBarItem(
                icon: Icon(Icons.done), label: 'Complete Task'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite Task'),
          ]),
    );
  }
}
