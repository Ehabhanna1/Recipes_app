import 'package:flutter/material.dart';
import 'package:recipesapp/components/custom_app_bar.dart';
import 'package:recipesapp/components/text_field_widget.dart';
import 'package:recipesapp/controller/search_tags.dart';
import 'package:recipesapp/views/all_recipe.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(title: 'Search', back: false),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.032, vertical: height * 0.016),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextFieldWidget(),
            SizedBox(height: height * 0.04,),
            Text('Search Tags',style: TextStyle(fontSize: width*0.06,fontWeight: FontWeight.bold),),
            Wrap(
              spacing: 8,
              children: tags.map((lable) {
                return ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AllRecipe(recipe: lable)));

                    },
                    child: Text(lable),

                );


              }).toList(),
            ),


          ],
        ),
      ),

    );
  }
}
