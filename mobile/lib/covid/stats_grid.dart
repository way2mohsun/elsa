import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .25,
      //color: Colors.yellow,
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                _buildStatCard(
                  color: Colors.orange,
                  title: 'Total Case',
                  count: '1.81 M',
                ),
                _buildStatCard(
                  color: Colors.red,
                  title: 'Deaths',
                  count: '105 K',
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatCard(
                  color: Colors.green,
                  title: 'Recovered',
                  count: '391 K',
                ),
                _buildStatCard(
                  color: Colors.lightBlue,
                  title: 'Active',
                  count: '1.3 M',
                ),
                _buildStatCard(
                  color: Colors.purple,
                  title: 'Critical',
                  count: 'N/A',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatCard({
    String title,
    String count,
    MaterialColor color,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
