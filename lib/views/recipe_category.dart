import 'package:flutter/material.dart';
import 'package:recipesapp/components/recipe_category_view.dart';
import 'package:recipesapp/controller/category_list.dart';
import 'package:recipesapp/views/all_recipe.dart';
class RecipeCategory extends StatelessWidget {
  const RecipeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.06,),
            Text('For you',style: TextStyle(fontSize: width*0.06,fontWeight: FontWeight.bold),),
            SizedBox(height: height * 0.01,),
            SizedBox(
              height: height * 0.107,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecipeCategoryView(image: image[0], name: name[0]),
                  RecipeCategoryView(image: image[1], name: name[1]),
                  RecipeCategoryView(image: image[2], name: name[2]),
                  RecipeCategoryView(image: image[3], name: name[3]),
                ],
              ),
            ),
            SizedBox(height: height * 0.01,),
            Text('For you',style: TextStyle(fontSize: width*0.055,fontWeight: FontWeight.bold),),

            SizedBox(
              height: height * 0.45,
              child: GridView.builder(
                itemCount: CategoryImage.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:4,
                  mainAxisSpacing: width * 0.021,
                  crossAxisSpacing: height * 0.01,
                ),

                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AllRecipe(recipe: categories[index],)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * 0.043,
                              width: width * 0.08,
                              child: Image.asset(CategoryImage[index]),),
                            SizedBox(height: height * 0.003,),

                            Text(categories[index],
                              style: TextStyle(color: Colors.black45,
                                  fontWeight: FontWeight.bold),
                            ),







                          ],
                        ),
                      ),
                    ),
                  );
                },

              ),
            ),
           // SizedBox(height: height * 0.01,),
            Text('Your Preference',style: TextStyle(fontSize: width*0.055,fontWeight: FontWeight.bold),),

            SizedBox(
              height: height * 0.13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecipeCategoryView(name: "Easy", image: image[0]),
                  RecipeCategoryView(name: "Quick", image: image[1]),
                  RecipeCategoryView(name: "Beef", image: image[2]),
                  RecipeCategoryView(name: "Low fat", image: image[3]),
                ],
              ),



            ),
          ],
        ),
      ),
    );
  }
}
