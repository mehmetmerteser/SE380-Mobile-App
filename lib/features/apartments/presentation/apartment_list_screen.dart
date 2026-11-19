import 'package:flutter/material.dart';

import '../../../core/theme/constructly_theme.dart';
import '../../../core/widgets/constructly_scaffold.dart';
import '../../../core/widgets/dashboard_widgets.dart';
import 'apartment_detail_screen.dart';

class ApartmentListScreen extends StatefulWidget {
  const ApartmentListScreen({super.key});

  @override
  State<ApartmentListScreen> createState() => _ApartmentListScreenState();
}

class _ApartmentListScreenState extends State<ApartmentListScreen> {
  String _query = '';

  static const _apartments = [
    ApartmentSummary('A-01', 'Blok A · 1. Kat', 'Tamamlandı', 0.92, 2450000),
    ApartmentSummary('A-02', 'Blok A · 1. Kat', 'Devam ediyor', 0.68, 2190000),
    ApartmentSummary('B-05', 'Blok B · 3. Kat', 'Devam ediyor', 0.47, 1980000),
    ApartmentSummary('B-08', 'Blok B · 4. Kat', 'Planlandı', 0.12, 2320000),
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = _apartments.where((item) {
      final searchable = '${item.code} ${item.location} ${item.status}'
          .toLowerCase();
      return searchable.contains(_query.toLowerCase());
    }).toList();

    return ConstructlyScaffold(
      title: 'Daire yönetimi',
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Daire ekleme formu sonraki geliştirme adımında bağlanacak.',
            ),
          ),
        ),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Daire ekle'),
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            onChanged: (value) => setState(() => _query = value),
            decoration: const InputDecoration(
              hintText: 'Daire veya durum ara',
              prefixIcon: Icon(Icons.search_rounded),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            '${filtered.length} daire',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          for (final apartment in filtered) ...[
            _ApartmentCard(
              apartment: apartment,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => ApartmentDetailScreen(apartment: apartment),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class ApartmentSummary {
  const ApartmentSummary(
    this.code,
    this.location,
    this.status,
    this.progress,
    this.budget,
  );

  final String code;
  final String location;
  final String status;
  final double progress;
  final int budget;
}

class _ApartmentCard extends StatelessWidget {
  const _ApartmentCard({required this.apartment, required this.onTap});

  final ApartmentSummary apartment;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final statusColor = switch (apartment.status) {
      'Tamamlandı' => ConstructlyColors.success,
      'Planlandı' => Colors.blueGrey,
      _ => ConstructlyColors.orange,
    };

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFFEAF0FE),
                    child: Text(apartment.code.substring(0, 1)),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          apartment.code,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(apartment.location),
                      ],
                    ),
                  ),
                  StatusChip(label: apartment.status, color: statusColor),
                  const SizedBox(width: 8),
                  const Icon(Icons.chevron_right_rounded),
                ],
              ),
              const SizedBox(height: 14),
              LinearProgressIndicator(
                value: apartment.progress,
                minHeight: 7,
                borderRadius: BorderRadius.circular(999),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
