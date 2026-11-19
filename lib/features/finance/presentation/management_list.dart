import 'package:flutter/material.dart';

import '../../../core/theme/constructly_theme.dart';
import '../../../core/widgets/constructly_scaffold.dart';

class ManagementEntry {
  const ManagementEntry({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.status,
  });

  final String title;
  final String subtitle;
  final String amount;
  final String status;
}

class ManagementList extends StatelessWidget {
  const ManagementList({
    required this.title,
    required this.summaryLabel,
    required this.summaryValue,
    required this.entries,
    required this.addLabel,
    super.key,
  });

  final String title;
  final String summaryLabel;
  final String summaryValue;
  final List<ManagementEntry> entries;
  final String addLabel;

  @override
  Widget build(BuildContext context) {
    return ConstructlyScaffold(
      title: title,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '$addLabel formu Firebase bağlantısıyla etkinleşecek.',
            ),
          ),
        ),
        icon: const Icon(Icons.add_rounded),
        label: Text(addLabel),
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [ConstructlyColors.navy, Color(0xFF29486F)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summaryLabel,
                  style: const TextStyle(color: Color(0xFFC7D2E1)),
                ),
                const SizedBox(height: 6),
                Text(
                  summaryValue,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text('Son kayıtlar', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          for (final entry in entries)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 8,
                ),
                title: Text(entry.title),
                subtitle: Text('${entry.subtitle} · ${entry.status}'),
                trailing: Text(
                  entry.amount,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
