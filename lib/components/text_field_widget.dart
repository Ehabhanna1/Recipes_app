import 'package:flutter/material.dart';
import 'package:recipesapp/views/all_recipe.dart';
class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height*0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 1),
          blurRadius: 2.0,
        ),
      ],
        color: Colors.white
      ),
      child: TextField(
        controller: search,
        style: TextStyle(
          fontSize: width*0.04,
          color: Colors.black,
        ),
        decoration: InputDecoration(
         filled: true,
          fillColor: Colors.white,
          hintText: "what's cooking in your mind....?",
          hintStyle: TextStyle(
            fontSize: width*0.03,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),

          ),
          suffixIcon: GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllRecipe(recipe: search.text),));
              },
              child: Icon(Icons.search,
                color: Colors.deepOrangeAccent,
                size: width*0.07,)),
        ),

      ),

    );
  }
}


