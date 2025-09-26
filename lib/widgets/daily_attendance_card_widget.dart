import 'package:flutter/material.dart';

class DailyAttendanceCard extends StatelessWidget {
  final int checkInCount;
  final int checkOutCount;
  final VoidCallback onSeeAll;

  const DailyAttendanceCard({
    Key? key,
    required this.checkInCount,
    required this.checkOutCount,
    required this.onSeeAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
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
                TextButton(onPressed: onSeeAll, child: const Text("See All")),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              // otomatis ambil tanggal hari ini
              "${DateTime.now().toLocal().toString().split(' ')[0]}",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Numbers Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStat("Check In", checkInCount, Colors.green),
                Container(height: 40, width: 1, color: Colors.grey.shade300),
                _buildStat("Check Out", checkOutCount, Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, int value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),
        Text(
          "$value",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
