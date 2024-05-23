import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final String lable;
  const CircleButton({super.key, required this.icon, required this.lable});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CircleAvatar(
          radius: width * 0.06,
          backgroundColor: Colors.redAccent,

          child: Center(
            child: Icon(icon,
              color: Colors.white,

            ),
          ),
        ),
        SizedBox(height: height*0.005,),

        Text(lable,style: TextStyle(fontSize: width*0.03,fontWeight: FontWeight.bold),)

      ],
    );
  }
}
