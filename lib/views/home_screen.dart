import 'package:flutter/material.dart';
import 'package:recipesapp/components/home_appbar.dart';
import 'package:recipesapp/components/tab_bar_widget.dart';
import 'package:recipesapp/components/text_field_widget.dart';
import 'package:recipesapp/controller/images_path.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),

            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const  HomeAppBar(),
              SizedBox(height: height*0.022,),
              TextFieldWidget(),
              SizedBox(height: height*0.022,),
              Container(
                height: height*0.25,
                width: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImagesPath.explore),
                        fit: BoxFit.fill
                    ),
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories',style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.bold),),
                  const Text('see all'),
                  SizedBox(width: width*0.022,),
                ],
              ),
              SizedBox(height: height*0.022,),

              const TabBarWidget(),


          ]
        )
    ),
        ),
      )
    );
  }
}
