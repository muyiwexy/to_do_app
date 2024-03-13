import 'package:flutter/material.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/views/add_view.dart';
import 'package:to_do_app/views/widgets/all_screen.dart';
import 'package:to_do_app/views/widgets/completed_screen.dart';

import '../controller/todo_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0; // base index for the bottom navigation bar
  late final List<Widget> _screens; // Initializing the screen's list

  // Instantiate the TodoController class
  final todoListNotifier = TodoController([]);

  @override
  void initState() {
    _screens = [
      AllScreen(
        todoListNotifier: todoListNotifier,
      ),
      CompletedScreen(
        todoListNotifier: todoListNotifier,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      // Route to the Add page
                      builder: (context) => AddView(
                            todoListNotifier: todoListNotifier,
                          )));
            },
            backgroundColor: AppColors.kPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.add, color: AppColors.kWhite),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 1000),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.toc_outlined),
            label: "All",
          ),
          NavigationDestination(
            icon: Icon(Icons.check),
            label: "Completed",
          )
        ],
        indicatorColor: Colors.transparent,
      ),
      appBar: AppBar(
        backgroundColor: AppColors.kPrimary,
        toolbarHeight: kToolbarHeight * 1.8,
        title: const Text(
          "TODO APP",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.kWhite),
        ),
        actions: const [
          SizedBox(
            height: 60,
            width: 60,
            child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.scaleDown,
              child: Icon(
                Icons.calendar_today_outlined,
                color: AppColors.kWhite,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: _screens.elementAt(_selectedIndex),
    );
  }
}
