import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class BottomNavBar extends StatefulWidget {
  final int SelectedItem;
  final Function(int) onTap;
  const BottomNavBar({super.key, required this.SelectedItem, required this.onTap});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical:  height * 0.01,horizontal: width * 0.015),
        child: GNav(
        gap: 10,
        activeColor: Colors.white,
        tabBorderRadius: 100,
    backgroundColor: Colors.grey[100]!,
    color: Colors.blue[600],
   tabBackgroundGradient: LinearGradient(
       colors:[
         Colors.blue[400]!,
         Colors.blueAccent.shade700,
       ],
     begin: Alignment.topLeft,
     end: Alignment.bottomLeft,

   ),
          iconSize: 30,
          textSize: 20,
          padding: EdgeInsets.symmetric(vertical: height * 0.01,horizontal: width * 0.015),
          tabs: [
            GButton(icon: CupertinoIcons.home,text: 'Home',),
            GButton(icon: Icons.category,text: 'Catogories',),
            GButton(icon: CupertinoIcons.home,text: 'Search',),
            GButton(icon: CupertinoIcons.bookmark_solid,text: 'Saved',),
            GButton(icon: CupertinoIcons.shopping_cart,text: 'Shopping',),
          ],
         onTabChange: widget.onTap,
          selectedIndex: 0,

         ),
      ),);
  }
}
