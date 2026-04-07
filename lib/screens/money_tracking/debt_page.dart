import 'package:flutter/material.dart';

class DebtPage extends StatefulWidget {
  const DebtPage({super.key});

  @override
  State<DebtPage> createState() => _DebtPageState();
}

class _DebtPageState extends State<DebtPage> {
  // 1. Storage: The List and the two separate totals
  final List<Map<String, dynamic>> _peopleList = [];
  double _totalDebt = 0;
  double _totalLent = 0;

  // 2. Controllers: To grab text from inputs
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  // 3. Simple Add Function
  void _addEntry(bool isLent) {
    String name = _nameController.text;
    double? amount = double.tryParse(_amountController.text);

    if (name.isNotEmpty && amount != null) {
      setState(() {
        _peopleList.insert(0, {"name": name, "amount": amount, "isLent": isLent});
        if (isLent) { _totalLent += amount; } else { _totalDebt += amount; }
      });
      _nameController.clear();
      _amountController.clear();
    }
  }

  // 4. Simple Delete Function
  void _deleteEntry(int index) {
    setState(() {
      var person = _peopleList[index];
      if (person['isLent']) { _totalLent -= person['amount']; }
      else { _totalDebt -= person['amount']; }
      _peopleList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Debt and Lending Tracker", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFFFD700), // Gold
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- TOTAL BOXES ---
            Row(
              children: [
                Expanded(child: _infoBox("DEBT", _totalDebt, Colors.redAccent)),
                const SizedBox(width: 10),
                Expanded(child: _infoBox("LENT", _totalLent, Colors.greenAccent)),
              ],
            ),
            const SizedBox(height: 20),

            // --- INPUT FIELDS ---
            TextField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(hintText: "Name", hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: _amountController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(hintText: "Amount", hintStyle: TextStyle(color: Colors.grey)),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // --- ADD BUTTONS ---
            Row(
              children: [
                Expanded(child: ElevatedButton(onPressed: () => _addEntry(true), style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent), child: const Text("Lent (+)", style: TextStyle(color: Colors.black)))),
                const SizedBox(width: 10),
                Expanded(child: ElevatedButton(onPressed: () => _addEntry(false), style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent), child: const Text("Owe (-)", style: TextStyle(color: Colors.black)))),
              ],
            ),

            const Divider(color: Color(0xFFFFD700), height: 40),

            // --- THE SCROLLABLE LIST ---
            Expanded(
              child: ListView.builder(
                itemCount: _peopleList.length,
                itemBuilder: (context, index) {
                  var p = _peopleList[index];
                  return Card(
                    color: const Color(0xFF1A1A1A),
                    child: ListTile(
                      title: Text(p['name'], style: const TextStyle(color: Colors.white)),
                      subtitle: Text("\$${p['amount'].toStringAsFixed(0)}",
                          style: TextStyle(color: p['isLent'] ? Colors.greenAccent : Colors.redAccent, fontWeight: FontWeight.bold)),
                      trailing: IconButton(
                        icon: const Icon(Icons.close, color: Colors.grey),
                        onPressed: () => _deleteEntry(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Very Simple Helper for the top boxes
  Widget _infoBox(String title, double value, Color color) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(border: Border.all(color: const Color(0xFFFFD700)), borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          Text("\$${value.toStringAsFixed(0)}", style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}