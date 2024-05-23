import 'package:flutter/material.dart';
import 'package:recipesapp/controller/images_path.dart';
import 'package:recipesapp/views/main_screen.dart';
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child:Stack(

          children: [
            Positioned(
                top: 0,
                child: Container(
                  height: height *0.79,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImagesPath.onboarding),
                        fit: BoxFit.cover
                    ),
                  ),

                ),
            ),
            Center(
              child: Text('Recipes ',style: TextStyle( fontSize: width*0.2,fontWeight: FontWeight.bold,color: Colors.redAccent),),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: height *0.243,
                width: width,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                  color: Colors.white,
                ),
                child: Padding(

                  padding: EdgeInsets.only(top: height *0.032),

                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Let's cook Good food",style: TextStyle( fontSize: width*0.06,fontWeight: FontWeight.w800),),
                          SizedBox(height: height*0.01,),
                          const Text("Check out the app and start cooking favourite meals!",style: TextStyle( fontSize:14,fontWeight: FontWeight.w500),),
                          SizedBox(height: height*0.032,),
                          SizedBox(
                            width: width*0.8,
                            child: ElevatedButton(onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const MainScreen()));
                            },
                              child: Text('Get Started',
                                style: TextStyle( fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),),
                          ),

                        ]
                    ),
                  ),),

              ),
            ),

          ]

        ),

      )
    );
  }
}
