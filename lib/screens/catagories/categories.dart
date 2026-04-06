import'package:flutter/material.dart';
class categories extends StatefulWidget {
  @override
  State<categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<categories> {



  List<String> categories=["food","transport","shopping","bills","Health"];
  List<int> percentages  =[30,15,20,25,10];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text(
          "My categories",
          style: TextStyle(
            color:Colors.black,
          ),

        ),
        backgroundColor: Colors.yellow,
      ),

      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context,index){

          return Padding(
            padding:EdgeInsets.all(8),

            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.yellow,

              ),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    categories[index],
                    style:TextStyle(
                      fontSize:18,
                      color:Colors.black,
                    ),
                  ),
                  Text(
                    percentages[index].toString() +"%",
                    style: TextStyle(
                      fontSize:16,
                      color:Colors.black,
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );



  }
}