import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: DebtPage()));
}

class DebtPage extends StatefulWidget {
  const DebtPage({super.key});

  @override
  State<DebtPage> createState() => _DebtPageState();
}

class _DebtPageState extends State<DebtPage> {
  final List<Map<String, dynamic>> _peopleList = [];
  double _totalDebt = 0;
  double _totalLent = 0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  void _addEntry(bool isLent) {
    String name = _nameController.text;
    double? amount = double.tryParse(_amountController.text);

    if (name.isNotEmpty && amount != null) {
      setState(() {
        _peopleList.add({
          "name": name,
          "amount": amount,
          "isLent": isLent,
        });

        if (isLent) {
          _totalLent = _totalLent + amount;
        } else {
          _totalDebt = _totalDebt + amount;
        }
      });
      _nameController.clear();
      _amountController.clear();
    }
  }

  void _deleteEntry(int index) {
    setState(() {
      var item = _peopleList[index];
      if (item['isLent'] == true) {
        _totalLent = _totalLent - item['amount'];
      } else {
        _totalDebt = _totalDebt - item['amount'];
      }
      _peopleList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: const Text("Debt Tracker")),
      body: Column(
        children: [
          Text("Total Debt: $_totalDebt"),
          Text("Total Lent: $_totalLent"),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: "Enter Name"),
          ),
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(labelText: "Enter Amount"),
            keyboardType: TextInputType.number,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _addEntry(true),
                child: const Text("Lent"),
              ),
              ElevatedButton(
                onPressed: () => _addEntry(false),
                child: const Text("Owe"),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _peopleList.length,
              itemBuilder: (context, index) {
                String status = _peopleList[index]['isLent'] ? "Lent" : "Debt";

                return ListTile(
                  title: Text("${_peopleList[index]['name']} ($status)"),
                  subtitle: Text(_peopleList[index]['amount'].toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteEntry(index),
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