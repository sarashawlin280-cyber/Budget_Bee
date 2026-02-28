import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  final Color honeyYellow = const Color(0xFFFFC107);

  final List<Map<String, dynamic>> categoryList = [
    {"name": "Food & Dining", "icon": Icons.lunch_dining, "spent": 5200, "limit": 4500},
    {"name": "Travel", "icon": Icons.local_taxi, "spent": 1200, "limit": 2000},
    {"name": "Education", "icon": Icons.book_rounded, "spent": 3000, "limit": 3000},
    {"name": "Shopping", "icon": Icons.shopping_bag_outlined, "spent": 2100, "limit": 1500},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BUDGET BEE",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, letterSpacing: 2)),
        backgroundColor: honeyYellow,
        centerTitle: true,
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
        ),
      ),
      body: Column(
        children: [
          // NEW: Fancy Input Bar for Categories
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                hintText: "Add new category (e.g. Health)",
                hintStyle: const TextStyle(color: Colors.white38),
                prefixIcon: Icon(Icons.add_circle_outline, color: honeyYellow),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send, color: honeyYellow),
                  onPressed: () {
                    // Logic to add category would go here
                  },
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: honeyYellow.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: honeyYellow, width: 2),
                ),
              ),
            ),
          ),

          // The List of Categories
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                final item = categoryList[index];
                double percent = item['spent'] / item['limit'];
                bool isExceeded = item['spent'] > item['limit'];

                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: isExceeded ? Colors.red.withOpacity(0.5) : honeyYellow.withOpacity(0.2),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      _buildProgressCircle(percent, isExceeded, item['icon']),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildCategoryDetails(item['name'], item['limit']),
                      ),
                      _buildSpendingAmount(item['spent'], isExceeded),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for the circular indicator
  Widget _buildProgressCircle(double percent, bool isExceeded, IconData icon) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: CircularProgressIndicator(
            value: percent > 1.0 ? 1.0 : percent,
            backgroundColor: Colors.white10,
            color: isExceeded ? Colors.red : honeyYellow,
            strokeWidth: 6,
          ),
        ),
        Icon(icon, color: isExceeded ? Colors.red : Colors.white),
      ],
    );
  }

  // Helper widget for text details
  Widget _buildCategoryDetails(String name, int limit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        Text("Limit: ৳$limit", style: const TextStyle(color: Colors.white38, fontSize: 13)),
      ],
    );
  }

  // Helper widget for the amount display
  Widget _buildSpendingAmount(int spent, bool isExceeded) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("৳$spent",
            style: TextStyle(
                color: isExceeded ? Colors.red : honeyYellow,
                fontWeight: FontWeight.bold,
                fontSize: 18
            )),
        if (isExceeded)
          const Text("OVER!", style: TextStyle(color: Colors.red, fontSize: 9, fontWeight: FontWeight.w900)),
      ],
    );
  }
}