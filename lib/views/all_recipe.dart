import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:recipesapp/components/custom_app_bar.dart';
import 'package:recipesapp/controller/constant_functions.dart';
import 'package:recipesapp/controller/images_path.dart';
import 'package:recipesapp/views/details_screen.dart';
class AllRecipe extends StatelessWidget {
  final String recipe;
  const AllRecipe({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(title: recipe, back: true,),
      body: FutureBuilder(
          future: ConstantFunctions.getResponse(recipe),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (!snapshot.hasData) {
              return  Container(
                margin: EdgeInsets.only(top: height * 0.05),

                height: height * 0.77,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(ImagesPath.error),
                      fit: BoxFit.cover
                  ),
                ),

              );
            }
            return Padding(
                padding: EdgeInsets.only(right: width * 0.034, left: width * 0.034, top: height * 0.03),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 10,
                    childAspectRatio: 6/10,
                  ),
                  itemBuilder: (context, index) {
                    Map<String, dynamic> snap  = snapshot.data![index];
                    int time = snap['totalTime'].toInt();
                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                              child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => DetailsScreen(item: snap),));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey,
                                        image: DecorationImage(
                                            image: NetworkImage(snap['image']),
                                            fit: BoxFit.cover
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 7,left: 15,
                                      child: Container(
                                        height: 22,
                                        width: 43,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text("${time.toString()} min ",style: TextStyle(color: Colors.white),),
                                        ),
                                      ),
                                  ),
                                ],

                              ),),
                          Expanded(
                            flex: 1,

                              child: Padding(
                                  padding:EdgeInsets.only(top: 8,left: 6),
                                child: Text(snap['label'],
                                  style: TextStyle(fontSize: width*0.03,fontWeight: FontWeight.bold),),
                              ),
                          ),
                        ],
                      ),

                    );
                  }

              ),

            );
          }
      ),
    );
  }
}
