import 'package:flutter/material.dart ';
import 'package:recipesapp/components/bottom_nav_bar.dart';

import 'package:recipesapp/views/home_screen.dart';
import 'package:recipesapp/views/recipe_category.dart';
import 'package:recipesapp/views/saved_screen.dart';
import 'package:recipesapp/views/search_screen.dart';
import 'package:recipesapp/views/shopping_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
          SelectedItem: currentIndex,
          onTap: (index){
            pageController.animateToPage(
                index,
                duration: Duration(milliseconds:200),
                curve: Curves.easeInOut);

            setState(() {
              currentIndex = index;
            });


          },

      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index){
          setState(() {
            currentIndex = index;
          });
        },
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen (),
          RecipeCategory(),
          SearchScreen(),
          SavedScreen(),
          ShoppingScreen(),
        ]
      ),

    );
  }
}
