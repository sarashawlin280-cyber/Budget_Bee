import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showBalance = true;
  double _currentBalance = 1250.50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              // --- Top Balance Section ---
              _buildBalanceSection(),

              const Spacer(),

              // --- NEW BEE ICON ---
              // Replacing the piggy bank with a themed Bee circle
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.orangeAccent, width: 2),
                ),
                child: const Text(
                  "🐝", // Bee Emoji
                  style: TextStyle(fontSize: 50),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "BudgetBee",
                style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    letterSpacing: 1.5
                ),
              ),

              const SizedBox(height: 40),

              // --- Fixed Box Menu (No Scrolling) ---
              Row(
                children: [
                  _buildMenuBox(Icons.pie_chart, "Pie Chart", Colors.orangeAccent),
                  const SizedBox(width: 15),
                  _buildMenuBox(Icons.category, "Categories", Colors.yellow),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  _buildMenuBox(Icons.money_off, "Debts & Lending", Colors.orange),
                  const SizedBox(width: 15),
                  _buildMenuBox(Icons.calendar_month, "Monthly Tracker", Colors.amberAccent),
                ],
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceSection() {
    return Center(
      child: Column(
        children: [
          const Text(
            "Total Balance",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _showBalance ? "\$${_currentBalance.toStringAsFixed(2)}" : "****",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(
                  _showBalance ? Icons.visibility_off : Icons.visibility,
                  color: Colors.orangeAccent,
                ),
                onPressed: () => setState(() => _showBalance = !_showBalance),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuBox(IconData icon, String title, Color color) {
    return Expanded(
      child: Container(
        height: 140,
        decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: color.withOpacity(0.4), width: 2),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}