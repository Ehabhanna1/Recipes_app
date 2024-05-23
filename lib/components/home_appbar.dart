import 'package:flutter/material.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
   // final height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Text('What are you\n cooking today?',
          style: TextStyle(fontSize: width *0.07,fontWeight: FontWeight.bold,height: 1),),
         const Spacer(),

      ]
    );
  }
}
