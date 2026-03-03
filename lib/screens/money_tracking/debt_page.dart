import 'package:flutter/material.dart';

class DebtPage extends StatelessWidget {
  const DebtPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Debts & Lending",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFFFD700), // Honey Yellow
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SUMMARY SECTION ---
            Row(
              children: [
                _buildSummaryBox("Total Debt", "\$2,500", Colors.redAccent),
                const SizedBox(width: 15),
                _buildSummaryBox("Total Lent", "\$1,800", Colors.greenAccent),
              ],
            ),

            const SizedBox(height: 25),

            // --- SIMPLE INPUT BAR (DESIGN ONLY - NO BLINKING) ---
            const Text("ADD NEW ENTRY",
                style: TextStyle(color: Color(0xFFFFD700), fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFFFD700), width: 1),
              ),
              child: const Row(
                children: [
                  Icon(Icons.person_add_alt_1, color: Color(0xFFFFD700)),
                  SizedBox(width: 15),
                  Text("Enter name and amount...", style: TextStyle(color: Colors.grey, fontSize: 14)),
                  Spacer(),
                  Icon(Icons.add_circle, color: Color(0xFFFFD700)),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Text("PEOPLE LIST",
                style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 1.2)),
            const Divider(color: Color(0xFFFFD700), thickness: 0.5),

            // --- LIST OF PEOPLE ---
            _buildPersonTile("Sara", "Owe her \$500", true),
            _buildPersonTile("Roza", "Owe her \$200", true),
            _buildPersonTile("Tisha", "Lent her \$300", false),
            _buildPersonTile("Mahi", "Owe her \$1,000", true),
            _buildPersonTile("Shova", "Lent her \$500", false),
            _buildPersonTile("Faiza", "Owe her \$800", true),
            _buildPersonTile("Susmita", "Lent her \$1,000", false),
            _buildPersonTile("Attoja", "Lent her \$200", false),
            _buildPersonTile("Ankita", "Owe her \$100", true),
          ],
        ),
      ),
    );
  }

  // Helper for Summary Boxes
  Widget _buildSummaryBox(String title, String amount, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFFFD700), width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            Text(amount, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }

  // Helper for People Rows
  Widget _buildPersonTile(String name, String sub, bool isDebt) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFFFD700),
          child: Text(name[0], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        title: Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        subtitle: Text(sub, style: TextStyle(color: isDebt ? Colors.redAccent : Colors.greenAccent, fontSize: 13)),
        trailing: Wrap(
          spacing: 12,
          children: [
            Icon(isDebt ? Icons.arrow_outward : Icons.arrow_downward,
                color: isDebt ? Colors.redAccent : Colors.greenAccent, size: 18),
            const Icon(Icons.delete_sweep, color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }
}