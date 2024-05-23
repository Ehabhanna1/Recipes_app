import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipesapp/components/circle_button.dart';
import 'package:recipesapp/components/custom_clip_path.dart';



import 'package:recipesapp/components/ingredient_list.dart';import 'package:recipesapp/controller/share.dart';
import 'package:recipesapp/controller/show_detail_dialog.dart';
import 'package:recipesapp/controller/show_table.dart';
import 'package:recipesapp/controller/start_cooking.dart';
class DetailsScreen extends StatefulWidget {

  final Map<String,dynamic> item;
  const DetailsScreen({super.key, required this.item});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String time = widget.item['totalTime'].toString();

    var myBox = Hive.box('saved');

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height*0.44,
        
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.item['image']),
                        fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: height*0.04,left: width*0.05,
                    child: const CircleAvatar(
        
                  backgroundColor: Colors.redAccent,
                  child: BackButton(color: Colors.white,),
                )),
        
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: width*0.04,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text(widget.item['label'],style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.w700,color: Colors.black),),
                ],
              ),
        
            ),
            const SizedBox(height: 1,),
            Text('$time min',),
            SizedBox(height: height*0.01,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    ShareRecipe.share(widget.item['url']);
                  },
                  child: CircleButton(
                      icon: Icons.share,
                      lable: 'Share',),
                ),
                ValueListenableBuilder(
                  valueListenable: myBox.listenable(),
                  builder:(context,box,_){
                    String key = widget.item['label'];
                    bool saved = myBox.containsKey(key);
                    if (saved) {
                      return GestureDetector(
                        onTap: (){

                          myBox.delete(key);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text('Recipe deleted'),
                            ),
                          );

                        },
                        child: CircleButton(
                          icon: Icons.bookmark,
                          lable: 'Saved',),
                      );
                    }
                    else {
                      return GestureDetector(
                        onTap: (){
                          myBox.put(key, key);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text('Recipe saved successfully'),
                            ),
                          );
                        },
                        child: CircleButton(
                          icon: Icons.bookmark_border,
                          lable: 'Save',),
                      );
                    }

                  } ,

                ),
                GestureDetector(
                  onTap: (){
                    ShowDialog.showCalories(widget.item['totalNutrients'], context);

                  },
                  child: CircleButton(
                    icon: Icons.monitor_heart_outlined,
                    lable: 'Calories',),
                ),
                 GestureDetector(
                   onTap: (){
                     ShowTable.showTable(context);

                   },
                   child: CircleButton(
                      icon: Icons.table_chart_outlined,
                      lable: 'unit chart',),
                 ),

              ],
            ),
            SizedBox(height: height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Direction',style: TextStyle(fontSize: width*0.06,fontWeight: FontWeight.bold),),
                SizedBox(
                  width: width*0.34,
                  child: ElevatedButton(onPressed: (){
                    StartCooking.startCooking(widget.item['url']);
                  },
                      child: Text('start'),
                  ),
        
                ),
        
              ],
            ),
            SizedBox(height: height*0.01,),
        
            Container(
              height: height*0.08,
        
              width: width,
             color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                      child: ClipPath(
                        clipper: CustomClipPath(),
                        child: Container(
                          color: Colors.redAccent,
                          child: Center(
                            child: Text('Ingredients Required',style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),),
        
                          ),
                        ),
                      )),
                  Expanded(
                    flex: 1,
                      child: Container(
                        color: Colors.white,
        
                        child: Center(
                          child: Text('   6\n Items',),
        
                        ),
                      ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height*1.8,
            child: IngredientList(
              ingredients: widget.item['ingredients'],),
            ),
        
          ],
        ),
      ),
    );
  }
}
