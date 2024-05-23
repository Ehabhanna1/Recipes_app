import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:recipesapp/controller/constant_functions.dart';
import 'package:recipesapp/controller/images_path.dart';
import 'package:recipesapp/views/details_screen.dart';
class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              height: height * 0.05,
              child: TabBar(
                unselectedLabelColor: Colors.red,
                  labelColor: Colors.white,
                  dividerColor: Colors.white,
                  indicator: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  labelPadding: EdgeInsets.symmetric(horizontal: width * 0.012),
                  
                  tabs: [
                    TabItem(title: 'Breakfast'),
                    TabItem(title: 'Lunch'),
                    TabItem(title: 'Dinner'),
                    TabItem(title: 'Quik'),
                  ]),

            ),
            SizedBox(height: height*0.02,),
            SizedBox(height: height*0.3,
            child: TabBarView(
              children: [
                HomeTabBarView(recipe: 'breakfast'),
               HomeTabBarView(recipe: 'lunch'),
               HomeTabBarView(recipe: 'dinner'),
               HomeTabBarView(recipe: 'quik'),
              ],
            ),
            )
          ],
        ));
  }
}

class TabItem extends StatelessWidget {
  final String title;
   TabItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       border: Border.all(
         color: Colors.red,
       ),
        borderRadius: BorderRadius.circular(20),
      ),


      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, ),
      child: Center(
        child: Text(title,style: TextStyle(fontSize: 9.8),),
      ),
      )
    );
  }
}
class HomeTabBarView extends StatelessWidget {
  final String recipe;
   HomeTabBarView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 28,
      child:FutureBuilder(
        future: ConstantFunctions.getResponse(recipe),
        builder: (context,snapshot){
          if (snapshot.connectionState== ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );


          }
          else if(!snapshot.hasData){
            return Container(
              height: height *0.049,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagesPath.error),
                    fit: BoxFit.cover
                ),
              ),

            );
          }
          return SizedBox(
            height: height*0.28,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
               // physics:const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  Map<String,dynamic> snap =snapshot.data![index];
                  int time=snap['totalTime'].toInt();
                  int calories=snap['calories'].toInt();
                  return Container(
                    margin: EdgeInsets.only(right: width*0.02),
                    width: width*0.5,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsScreen(item:snap,),
                                    )
                                );
                              },
                              child: Container(
                                width: width,
                                height: height*0.17,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(snap['image']),

                                        fit: BoxFit.fill
                                    ),
                                  borderRadius: BorderRadius.circular(20)

                                ),

                              ),
                            ),
                            SizedBox(height: height*0.01,),
                            Text(snap['label'],style: TextStyle(fontSize: width*0.035,fontWeight: FontWeight.bold),),
                            SizedBox(height: height*0.01,),
                            Text("calories: ${calories.toString()}. ${time.toString()}",style: TextStyle(fontSize: width*0.03,color: Colors.grey),),
                          ],
                        ),
                      ],
                    ),
                  );

                }
                ,
                separatorBuilder: (context, index) {

                  return SizedBox(width: 15,);
                },
                itemCount: snapshot.data!.length,

            ),
          );
        },
      ),


    );
  }
}
