import 'package:flutter/material.dart';

class DailyAttendanceCard extends StatelessWidget {
  final int checkInCount;
  final int checkOutCount;
  final VoidCallback onSeeAll;

  const DailyAttendanceCard({
    super.key,
    required this.checkInCount,
    required this.checkOutCount,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // 🎨 Gradient background
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // ✨ Drop shadow
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today's Attendance",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: onSeeAll,
                child: const Text(
                  "See All",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            DateTime.now().toString().split(" ")[0], // show today's date
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),

          // Content: Check In & Check Out
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ✅ Check In
              Column(
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 28,
                  ), // icon
                  const SizedBox(height: 6),
                  const Text("Check In"),
                  const SizedBox(height: 4),
                  Text(
                    "$checkInCount",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              Container(width: 2, height: 60, color: Colors.grey.shade300),
              // 🚪 Check Out
              Column(
                children: [
                  const Icon(Icons.do_disturb_on_outlined , color: Colors.red, size: 28), // icon
                  const SizedBox(height: 6),
                  const Text("Check Out"),
                  const SizedBox(height: 4),
                  Text(
                    "$checkOutCount",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
