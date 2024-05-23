
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ShowTable {
  static Future showTable(BuildContext context)  {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white,width: 3),

          ),
          backgroundColor: Colors.redAccent,
          title: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom:height*0.02),
              child: Text('Unit conversion chart',
              style: TextStyle(color: Colors.white,
              fontSize: width*0.05,
              fontWeight: FontWeight.bold),),
        ),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Table(
                border: TableBorder.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
                children:const [
                  TableRow(
                    children: [
                      BuildTableCell(text1: 'CUP', text2: '(cup)',),
                        BuildTableCell(text1: 'ONCE', text2: '(oz)',),
                      BuildTableCell(text1: 'TABLE', text2: 'APOON', text3: '(tbsp)'),
                      BuildTableCell(text1: 'TEA', text2: 'APOON', text3: '(tbs)'),
                      BuildTableCell(text1: 'MILLI', text2: 'LITRE', text3: '(ml)'),
                    ],
                  ),
                  TableRow(
                    children: [
                      BuildTableCell(text1: 'CUP', text2: '(cup)',),
                      BuildTableCell(text1: 'ONCE', text2: '(oz)',),
                      BuildTableCell(text1: 'TABLE', text2: 'APOON', text3: '(tbsp)'),
                      BuildTableCell(text1: 'TEA', text2: 'APOON', text3: '(tbs)'),
                      BuildTableCell(text1: 'MILLI', text2: 'LITRE', text3: '(ml)'),
                    ],
                  ),
                  TableRow(
                    children: [
                      BuildTableCell(text1: 'CUP', text2: '(cup)',),
                      BuildTableCell(text1: 'ONCE', text2: '(oz)',),
                      BuildTableCell(text1: 'TABLE', text2: 'APOON', text3: '(tbsp)'),
                      BuildTableCell(text1: 'TEA', text2: 'APOON', text3: '(tbs)'),
                      BuildTableCell(text1: 'MILLI', text2: 'LITRE', text3: '(ml)'),
                    ],
                  ),
                  TableRow(
                    children: [
                      BuildTableCell(text1: 'CUP', text2: '(cup)',),
                      BuildTableCell(text1: 'ONCE', text2: '(oz)',),
                      BuildTableCell(text1: 'TABLE', text2: 'APOON', text3: '(tbsp)'),
                      BuildTableCell(text1: 'TEA', text2: 'APOON', text3: '(tbs)'),
                      BuildTableCell(text1: 'MILLI', text2: 'LITRE', text3: '(ml)'),
                    ],
                  ),
                  TableRow(
                    children: [
                      BuildTableCell(text1: 'CUP', text2: '(cup)',),
                      BuildTableCell(text1: 'ONCE', text2: '(oz)',),
                      BuildTableCell(text1: 'TABLE', text2: 'APOON', text3: '(tbsp)'),
                      BuildTableCell(text1: 'TEA', text2: 'APOON', text3: '(tbs)'),
                      BuildTableCell(text1: 'MILLI', text2: 'LITRE', text3: '(ml)'),
                    ],
                  ),
                ],
              ),
              Center(
                child: Text('weight chart',
                  style: TextStyle(color: Colors.white,
                      fontSize: width*0.05,fontWeight: FontWeight.bold),),
              ),
              Table(
                border: TableBorder.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 2,
                ),
                children: const [
                  TableRow(
                    children: [
                      BuildTableCell(text1: '1000', text2: 'gram',),
                      BuildTableCell(text1: '1', text2: 'Kilogram',),
                      BuildTableCell(text1: '2.2', text2: 'pound',),
                      BuildTableCell(text1: '35.74', text2: 'Ounce',),
                    ],
                  ),
                ],
              ),

            ],
          ),


        );

      }

    );
  }

}

class BuildTableCell extends StatelessWidget {
  final String text1,text2;
  final String? text3;
  const BuildTableCell({super.key, required this.text1, required this.text2, this.text3});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return TableCell(
        child: Container(
          color: Colors.redAccent,
          width: width*0.4,
          height: height*0.1,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text1,style: TextStyle(color: Colors.white,fontSize: 10),),
              Text(text2,style: TextStyle(color: Colors.white,fontSize:10),),
              if (text3 != null)
              Text(text1,style: TextStyle(color: Colors.white,fontSize: 8),),
            ],
          ),

        ),
    );
  }
}
