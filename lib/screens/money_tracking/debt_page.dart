import 'package:flutter/material.dart';

// 1. The Widget Class
class DebtPage extends StatefulWidget {
  const DebtPage({super.key});

  @override
  State<DebtPage> createState() => _DebtPageState();
}

// 2. The State Class
class _DebtPageState extends State<DebtPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Debts & Lending",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFFFD700), // Honey Yellow
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SUMMARY SECTION ---
            Row(
              children: [
                _buildSummaryBox("TOTAL DEBT", "\$2,500", Colors.redAccent),
                const SizedBox(width: 15),
                _buildSummaryBox("TOTAL LENT", "\$1,800", Colors.greenAccent),
              ],
            ),

            const SizedBox(height: 30),

            // --- SIMPLEST INPUT BAR (NO ICONS) ---
            const Text("ADD ENTRY",
                style: TextStyle(color: Color(0xFFFFD700), fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFFD700), width: 1),
              ),
              child: const Text(
                "Type name and amount here...",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),

            const SizedBox(height: 30),
            const Text("LIST",
                style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold)),
            const Divider(color: Color(0xFFFFD700), thickness: 0.5),

            // --- LIST OF PEOPLE (CLEAN & SIMPLE) ---
            _buildPersonTile("Sara", "Owe her \$500", Colors.redAccent),
            _buildPersonTile("Roza", "Owe her \$200", Colors.redAccent),
            _buildPersonTile("Tisha", "Lent her \$300", Colors.greenAccent),
            _buildPersonTile("Mahi", "Owe her \$1,000", Colors.redAccent),
            _buildPersonTile("Shova", "Lent her \$500", Colors.greenAccent),
            _buildPersonTile("Faiza", "Owe her \$800", Colors.redAccent),
            _buildPersonTile("Susmita", "Lent her \$1,000", Colors.greenAccent),
          ],
        ),
      ),
    );
  }

  // Simplest Summary Box Helper
  Widget _buildSummaryBox(String title, String amount, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFFFD700), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            Text(amount, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }

  // Simplest Person Tile Helper
  Widget _buildPersonTile(String name, String sub, Color subColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          Text(sub, style: TextStyle(color: subColor, fontSize: 14)),
        ],
      ),
    );
  }
}