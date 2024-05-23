import 'package:flutter/material.dart';
import 'package:recipesapp/views/all_recipe.dart';


class RecipeCategoryView extends StatelessWidget {

  final String name,image;
  const RecipeCategoryView({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AllRecipe(recipe: name,)));
      },
      child: SizedBox(
        height: height*0.105,
        width: width*0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height*0.07,
              width: width*0.15,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            Center(
                child: Text(name,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),))
       ], ),
      ),
    );
  }
}
