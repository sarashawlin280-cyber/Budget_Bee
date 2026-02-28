/*
import 'package:flutter/material.dart';

class DebtPage extends StatelessWidget {
  const DebtPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Debts & Lending", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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

            const SizedBox(height: 30),
            const Text("PEOPLE LIST", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, letterSpacing: 1.2)),
            const Divider(color: Color(0xFFFFD700), thickness: 0.5),

            // --- LIST OF PEOPLE ---
            // Using Column because we are inside a SingleChildScrollView
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

  // Helper for Top Summary Boxes
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

  // Helper for Individual Person Rows
  Widget _buildPersonTile(String name, String sub, bool isDebt) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A), // Soft Black
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFFFD700),
          child: Text(name[0], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        title: Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        subtitle: Text(sub, style: TextStyle(color: isDebt ? Colors.redAccent.withOpacity(0.7) : Colors.greenAccent.withOpacity(0.7))),
        trailing: Icon(
          isDebt ? Icons.arrow_outward : Icons.arrow_downward,
          color: isDebt ? Colors.redAccent : Colors.greenAccent,
          size: 18,
        ),
      ),
    );
  }
}
 */
import 'package:flutter/material.dart';

class DebtPage extends StatefulWidget {
  const DebtPage({super.key});

  @override
  State<DebtPage> createState() => _DebtPageState();
}

class _DebtPageState extends State<DebtPage> {
  // 1. DATA: We move Sara's debt into a variable so it can change
  int saraDebt = 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Live Debts", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFFFD700),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("ACTIVE DEBTS", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold)),
          const Divider(color: Color(0xFFFFD700)),

          // --- SARA'S INTERACTIVE CARD ---
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFFFD700),
                child: Text("S", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              title: const Text("Sara", style: TextStyle(color: Colors.white)),
              // 2. DISPLAY: The text now shows the variable 'saraDebt'
              subtitle: Text("Owe: \$$saraDebt", style: const TextStyle(color: Colors.redAccent)),

              // 3. ACTION: We add buttons on the right side
              trailing: Row(
                mainAxisSize: MainAxisSize.min, // Keeps the buttons from taking the whole width
                children: [
                  // Decrease Button (Pay back)
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline, color: Colors.greenAccent),
                    onPressed: () {
                      setState(() {
                        if (saraDebt > 0) saraDebt -= 50; // Subtract 50
                      });
                    },
                  ),
                  // Increase Button (Borrow more)
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline, color: Colors.redAccent),
                    onPressed: () {
                      setState(() {
                        saraDebt += 50; // Add 50
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          const Center(
            child: Text("Click icons to change debt amount",
                style: TextStyle(color: Colors.grey, fontSize: 12)),
          )
        ],
      ),
    );
  }
}

