import 'package:flutter/material.dart';
import 'package:flutter_car_selling_app/core/project_colors.dart';
int _selectedIndex = 0;
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      alignment: Alignment.bottomCenter,
      child: Text('Selected tab: $_selectedIndex'),
    ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(          
          borderRadius: BorderRadius.circular(40),
          color: ProjectColors.BerryChalk
        ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.facebook, color: ProjectColors.MaximumOrange,),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.biotech_rounded),
              onPressed: () => _onItemTapped(1),
            ),
            IconButton(
              icon: Icon(Icons.social_distance),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    ),
  );
  }
  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}
}


