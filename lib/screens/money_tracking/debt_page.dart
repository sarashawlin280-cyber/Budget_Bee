import 'package:flutter/material.dart';

class DebtPage extends StatefulWidget {
  const DebtPage({super.key});

  @override
  State<DebtPage> createState() => _DebtPageState();
}

class _DebtPageState extends State<DebtPage> {
  // 1. Memory (The List and Totals)
  final List<Map<String, dynamic>> _peopleList = [];
  double _totalDebt = 0;
  double _totalLent = 0;

  // 2. Typing Controllers
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
        title: const Text("Debts & Lending", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFFFD700),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Totals Boxes
            Row(
              children: [
                _buildBox("DEBT", "\$${_totalDebt.toStringAsFixed(0)}", Colors.redAccent),
                const SizedBox(width: 10),
                _buildBox("LENT", "\$${_totalLent.toStringAsFixed(0)}", Colors.greenAccent),
              ],
            ),
            const SizedBox(height: 20),

            // Input Fields
            _simpleInput("Name", _nameController, false),
            const SizedBox(height: 10),
            _simpleInput("Amount", _amountController, true),
            const SizedBox(height: 10),

            // Add Buttons
            Row(
              children: [
                _actionBtn("Lent (+)", Colors.greenAccent, () => _addEntry(true)),
                const SizedBox(width: 10),
                _actionBtn("Owe (-)", Colors.redAccent, () => _addEntry(false)),
              ],
            ),
            const Divider(color: Color(0xFFFFD700), height: 40),

            // The List
            Column(
              children: List.generate(_peopleList.length, (index) {
                var p = _peopleList[index];
                return _personRow(index, p['name'], p['amount'], p['isLent']);
              }),
            ),
          ],
        ),
      ),
    );
  }

  // --- VERY SIMPLE HELPERS ---

  Widget _buildBox(String t, String amt, Color c) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(border: Border.all(color: const Color(0xFFFFD700)), borderRadius: BorderRadius.circular(10)),
        child: Column(children: [Text(t, style: const TextStyle(color: Colors.grey, fontSize: 10)), Text(amt, style: TextStyle(color: c, fontSize: 20, fontWeight: FontWeight.bold))]),
      ),
    );
  }

  Widget _simpleInput(String hint, TextEditingController ctr, bool isNum) {
    return TextField(
      controller: ctr,
      keyboardType: isNum ? TextInputType.number : TextInputType.text,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint, hintStyle: const TextStyle(color: Colors.grey),
        filled: true, fillColor: const Color(0xFF1A1A1A),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _actionBtn(String txt, Color c, VoidCallback press) {
    return Expanded(child: ElevatedButton(onPressed: press, style: ElevatedButton.styleFrom(backgroundColor: c), child: Text(txt, style: const TextStyle(color: Colors.black))));
  }

  Widget _personRow(int index, String name, double amt, bool isLent) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$name: \$${amt.toStringAsFixed(0)}", style: TextStyle(color: isLent ? Colors.greenAccent : Colors.redAccent, fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: () => _deleteEntry(index),
            child: const Icon(Icons.close, color: Colors.grey, size: 20),
          ),
        ],
      ),
    );
  }
}
//final