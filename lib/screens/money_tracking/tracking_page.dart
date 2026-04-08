import 'package:flutter/material.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text("Monthly Tracker"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("TOTAL MONTHLY INCOME",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("\$5,000.00",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),
            const Divider(color: Colors.black),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text("Expenses"),
                    const Text("\$2,800",
                        style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: [
                    const Text("Savings"),
                    const Text("\$1,200",
                        style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  const Text("REMAINING BALANCE",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text("\$1,000.00",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}