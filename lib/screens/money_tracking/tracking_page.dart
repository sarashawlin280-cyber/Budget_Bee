/*
import 'package:flutter/material.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Monthly Tracker",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFFFD700), // Honey Yellow
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // --- INCOME HEADER ---
            const Text("TOTAL MONTHLY INCOME",
                style: TextStyle(color: Colors.grey, letterSpacing: 1.5)),
            const SizedBox(height: 10),
            const Text("\$5,000.00",
                style: TextStyle(color: Color(0xFFFFD700), fontSize: 45, fontWeight: FontWeight.bold)),

            const Divider(color: Color(0xFFFFD700), height: 50, thickness: 1),

            // --- EXPENSES & SAVINGS ROW ---
            Row(
              children: [
                _buildStatCard("Expenses", "\$2,800", Colors.redAccent),
                const SizedBox(width: 15),
                _buildStatCard("Savings", "\$1,200", Colors.blueAccent),
              ],
            ),

            const SizedBox(height: 30),

            // --- REMAINING BALANCE SECTION ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFD700).withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: const Column(
                children: [
                  Text("REMAINING BALANCE",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("\$1,000.00",
                      style: TextStyle(color: Colors.black, fontSize: 38, fontWeight: FontWeight.w900)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // REUSABLE UI COMPONENT: The Stat Card
  Widget _buildStatCard(String label, String value, Color textColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A), // Dark Grey Card
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFFFD700), width: 0.5),
        ),
        child: Column(
          children: [
            Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 10),
            Text(value, style: TextStyle(color: textColor, fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
 */
import 'package:flutter/material.dart';

// 1. The Widget class (This part is short now)
class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

// 2. The State class (This is where the "Brain" lives)
class _TrackingPageState extends State<TrackingPage> {

  // These are our variables. They can CHANGE.
  double income = 5000.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Live Tracker", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFFFD700),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("TOTAL MONTHLY INCOME", style: TextStyle(color: Colors.grey, letterSpacing: 1.5)),
            const SizedBox(height: 10),

            // Now, instead of typing "$5,000", we use the variable $income
            Text("\$${income.toStringAsFixed(0)}",
                style: const TextStyle(color: Color(0xFFFFD700), fontSize: 45, fontWeight: FontWeight.bold)),

            const Divider(color: Color(0xFFFFD700), height: 50, thickness: 1),

            Row(
              children: [
                _buildStatCard("Expenses", "\$2,800", Colors.redAccent),
                const SizedBox(width: 15),
                _buildStatCard("Savings", "\$1,200", Colors.blueAccent),
              ],
            ),

            const SizedBox(height: 30),

            // --- THE INTERACTIVE BUTTON ---
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFD700)),
              onPressed: () {
                // This is the MAGIC part!
                setState(() {
                  income = income + 100;
                });
              },
              child: const Text("Add \$100 to Income", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  // The Helper stays EXACTLY the same as before!
  Widget _buildStatCard(String label, String value, Color textColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFFFD700), width: 0.5),
        ),
        child: Column(
          children: [
            Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 10),
            Text(value, style: TextStyle(color: textColor, fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}