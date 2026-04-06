
import 'package:flutter/material.dart';
import 'package:budget_bee/screens/catagories/categories.dart';
import 'package:budget_bee/screens/catagories/budget_report_screen.dart';
import 'package:budget_bee/screens/money_tracking/tracking_page.dart';
import 'package:budget_bee/screens/money_tracking/debt_page.dart';

class HomePage extends StatefulWidget {
  final String userName;
  final String userEmail;

  const HomePage({super.key, required this.userName, this.userEmail = "user@budgetbee.com"});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showBalance = true;
  final double _currentBalance = 1250.50;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      endDrawer: _buildDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // --- TOP BRANDING & HAMBURGER SECTION ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent.withOpacity(0.1),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.orangeAccent.withOpacity(0.5), width: 1),
                        ),
                        child: const Text("🐝", style: TextStyle(fontSize: 24)),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "BudgetBee",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.orangeAccent, size: 30),
                    onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // --- WELCOME SECTION ---
              Column(
                children: [
                  Text(
                    "Welcome back,",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[500], fontSize: 16),
                  ),


                ],
              ),

              const SizedBox(height: 40),
              _buildBalanceCard(),
              const SizedBox(height: 40),

              // --- FEATURES GRID ---
              Row(
                children: [
                  _buildMenuBox(Icons.category_outlined, "Categories", Colors.yellow, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesPage()));
                  }),
                  const SizedBox(width: 15),
                  _buildMenuBox(Icons.pie_chart_outline_rounded, "Analytics", Colors.orangeAccent, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BudgetReportScreen()));
                  }),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  _buildMenuBox(Icons.calendar_month_outlined, "Monthly Tracker", Colors.amberAccent, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TrackingPage()));
                  }),
                  const SizedBox(width: 15),
                  _buildMenuBox(Icons.handshake_outlined, "Debt & Lending", Colors.orange, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DebtPage()));
                  }),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      // FloatingActionButton section has been removed from here
    );
  }

  // --- DRAWER WIDGET ---
  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.transparent),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.orangeAccent,
              child: Icon(Icons.person, color: Colors.black, size: 40),
            ),
            accountName: Text(
              widget.userName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              widget.userEmail,
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          const Divider(color: Colors.white10),
          _drawerTile(Icons.settings_outlined, "Account Settings", () {}),
          _drawerTile(Icons.help_outline_rounded, "Help & Support", () {}),
          _drawerTile(Icons.privacy_tip_outlined, "Privacy Policy", () {}),
          _drawerTile(Icons.notifications_none_rounded, "Notifications", () {}),
          const Spacer(),
          const Divider(color: Colors.white10),
          _drawerTile(Icons.logout_rounded, "Log Out", () {}, textColor: Colors.redAccent),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _drawerTile(IconData icon, String title, VoidCallback onTap, {Color textColor = Colors.white}) {
    return ListTile(
      leading: Icon(icon, color: textColor == Colors.white ? Colors.orangeAccent : textColor),
      title: Text(title, style: TextStyle(color: textColor, fontSize: 16)),
      onTap: onTap,
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey[900]!, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Balance",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              GestureDetector(
                onTap: () => setState(() => _showBalance = !_showBalance),
                child: Icon(
                  _showBalance ? Icons.visibility_off : Icons.visibility,
                  color: Colors.orangeAccent,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _showBalance ? "\$${_currentBalance.toStringAsFixed(2)}" : "••••••",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuBox(IconData icon, String title, Color color, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.grey[900]?.withOpacity(0.5),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}