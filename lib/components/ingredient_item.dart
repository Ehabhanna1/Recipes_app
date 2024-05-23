import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
 
class IngredientItem extends StatelessWidget {

  final String quantity,measure,food,imageUrl;
  const IngredientItem({super.key, required this.quantity, required this.measure, required this.food, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var myBox = Hive.box('shopping');
    return Container(
      margin: EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.033),
      padding: EdgeInsets.only(
        top: height*0.008,
        bottom: height*0.008,
        left: width*0.008,
        right: width*0.08,
    ),


      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              height: height*0.1,
              width: width*0.2,
              fit: BoxFit.cover,
            ),

          ),
          Text("$food\n $quantity $measure ",style: TextStyle(fontSize: width*0.04,fontWeight: FontWeight.bold,letterSpacing: 1),),
          SizedBox(width: width*0.033,),
          ValueListenableBuilder(
            valueListenable: myBox.listenable(),
              builder: (context, box, _) {
              bool exist= box.containsKey(food);
              if(exist){
                return GestureDetector(
                    onTap: (){
                      myBox.delete(food);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('item deleted'),
                        ),
                      );
                    },
                    child: Icon(Icons.done,color: Colors.green,size: width*0.07,));
              }
             else {
                return GestureDetector(
                  onTap: () {
                    String value = "$food $quantity $measure";
                    myBox.put(food, value);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('item added successfully'),
                      ),
                    );
                  },
                  child: Icon(

                    Icons.add_circle_outline_rounded,
                    color: Colors.red, size: width * 0.07,),
                );
              }
             },

             ),
        ]

      ), );
  }
}
