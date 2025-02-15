import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipesapp/components/custom_app_bar.dart';
class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var myBox = Hive.box('saved');

    return Scaffold(
      appBar: const CustomAppBar(title: 'Saved', back: false),
      body: Padding(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: ValueListenableBuilder(
            valueListenable: myBox.listenable(),
            builder: (context, box, _) {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: ( context,index) {
                  var data = box.values.toList();
                  return ListTile(
                      title: Container(
                        height: height * 0.085,
                        color: Colors.grey[100],
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                                child: Text(data[index]),
                            ),
                            PopupMenuButton(
                                itemBuilder: (context){
                                  return const [
                                    PopupMenuItem(value: 'share',child: Text('share'),),
                                    PopupMenuItem(value: 'delete',child: Text('delete'),
                                    )
                                  ];
                                }
                            ),
                          ],
                        ),
                      ),
                  );


                },

              );
            }
        ),
      ),
    );
  }
}
