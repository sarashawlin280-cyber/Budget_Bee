import 'dart:math';
import 'package:flutter/material.dart';

class BudgetReportScreen extends StatelessWidget {
  BudgetReportScreen({super.key});

  // Branding Colors
  final Color honeyYellow = const Color(0xFFFFC107);
  final Color darkGrey = const Color(0xFF1E1E1E);

  // Data based on presentation slides [cite: 16, 36]
  final Map<String, double> data = {
    "Food": 4000,
    "Travel": 2000,
    "Rent": 3000,
    "Shopping": 1500,
    "Others": 1000,
  };

  final double monthlyLimit = 15000; // [cite: 25]

  @override
  Widget build(BuildContext context) {
    double totalSpent = data.values.reduce((a, b) => a + b);
    double remaining = monthlyLimit - totalSpent;

    return Scaffold(
      appBar: AppBar(
        title: const Text("BUDGET BEE",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: honeyYellow,
        centerTitle: true,
        elevation: 0,
        actions: const [
          Icon(Icons.cloud_done, color: Colors.black), // Cloud Sync [cite: 40]
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Monthly Budget Status
            _buildStatusCard(totalSpent, remaining),

            const SizedBox(height: 30),
            Text("Spending Habit (Pie Chart)", // [cite: 36]
                style: TextStyle(color: honeyYellow, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: CustomPaint(painter: BudgetPiePainter(data)),
              ),
            ),

            const SizedBox(height: 40),
            Text("Savings Goals", //
                style: TextStyle(color: honeyYellow, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),

            // Visual indicators like progress bars
            _buildSavingsGoal("New Phone", 25000, 18000),
            _buildSavingsGoal("Travel Fund", 10000, 3000),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(double spent, double remaining) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: darkGrey,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: honeyYellow, width: 1),
      ),
      child: Column(
        children: [
          const Text("Total Expenses", style: TextStyle(color: Colors.white70)),
          Text("৳$spent", style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
          const Divider(color: Colors.white24, height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Remaining Budget:", style: TextStyle(color: Colors.white70)),
              Text("৳$remaining",
                  style: TextStyle(color: remaining >= 0 ? honeyYellow : Colors.red, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSavingsGoal(String title, double target, double current) {
    double progress = current / target;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white10,
            color: honeyYellow,
            minHeight: 10,
          ),
          const SizedBox(height: 5),
          Text("${(progress * 100).toInt()}% towards goal",
              style: const TextStyle(color: Colors.white54, fontSize: 12)),
        ],
      ),
    );
  }
}

class BudgetPiePainter extends CustomPainter {
  final Map<String, double> data;
  BudgetPiePainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    double total = data.values.reduce((a, b) => a + b);
    double startAngle = -pi / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Shades of Honey Yellow for the pie slices
    final List<Color> colors = [
      const Color(0xFFFFC107),
      const Color(0xFFFFD54F),
      const Color(0xFFFFA000),
      const Color(0xFFFFECB3),
      const Color(0xFFB18904),
    ];

    int i = 0;
    data.forEach((key, value) {
      final sweepAngle = (value / total) * 2 * pi;
      final paint = Paint()..color = colors[i % colors.length];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, sweepAngle, true, paint);
      startAngle += sweepAngle;
      i++;
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}