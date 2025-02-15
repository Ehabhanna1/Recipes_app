import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class ShowDialog {
  static Future showCalories(Map<String, dynamic> item, BuildContext context) async {

    int fat =item['FAT']['quantity'].toInt();
    int sFat=item['FASAT']['quantity'].toInt();
    int cholestrole=item['CHOLE']['quantity'].toInt();
    int nA=item['NA']['quantity'].toInt();
    int carbohydrate=item['CHOCDF.net']['quantity'].toInt();
    int sugar=item['SUGAR']['quantity'].toInt();
    int protein=item['PROCNT']['quantity'].toInt();


    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
         contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.redAccent,
          title:const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: Text('Nutrition Facts',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),

            ),
          ) ,
          content: Container(
            height: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),

              ),
              color: Colors.white,
            ),
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('total fat'),
                      Text(fat.toString()),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('saturated fat'),
                      Text(sFat.toString()),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('cholesterol'),
                      Text(cholestrole.toString()),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('sodium'),
                      Text(nA.toString()),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Carbohydrate'),
                      Text(carbohydrate.toString()),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('sugar'),
                      Text(sugar.toString()),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('protein'),
                      Text(protein.toString()),

                    ],
                  ),
                ],
              ),

            ),
          ),
        );
      }

    );

  }
}