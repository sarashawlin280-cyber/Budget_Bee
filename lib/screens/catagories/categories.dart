import 'package:flutter/material.dart';

class categories extends StatefulWidget {
  @override
  State<categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<categories> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController percentController = TextEditingController();

  List<String> categories = ["food", "transport", "shopping", "bills", "Health"];
  List<int> percentages = [30, 15, 20, 25, 10];

  void addEntry() {
    if (nameController.text.isNotEmpty && percentController.text.isNotEmpty) {
      setState(() {
        categories.add(nameController.text);
        percentages.add(int.parse(percentController.text));
        nameController.clear();
        percentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "My categories",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.yellow,
      ),

      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Category",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: percentController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "%",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: addEntry,
                  icon: Icon(Icons.add_box, color: Colors.yellow, size: 35),
                )
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          percentages[index].toString() + "%",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}