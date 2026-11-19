import 'package:flutter/material.dart';

import '../../../core/theme/constructly_theme.dart';
import '../../../core/widgets/constructly_scaffold.dart';
import 'apartment_list_screen.dart';

class ApartmentDetailScreen extends StatelessWidget {
  const ApartmentDetailScreen({required this.apartment, super.key});

  final ApartmentSummary apartment;

  @override
  Widget build(BuildContext context) {
    return ConstructlyScaffold(
      title: 'Daire ${apartment.code}',
      actions: [
        IconButton(
          onPressed: () {},
          tooltip: 'Düzenle',
          icon: const Icon(Icons.edit_outlined),
        ),
      ],
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    apartment.location,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text('İlerleme: %${(apartment.progress * 100).round()}'),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: apartment.progress,
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _DetailValue(
                  label: 'Tahmini bütçe',
                  value: '${_formatMoney(apartment.budget)} TL',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _DetailValue(
                  label: 'Mevcut harcama',
                  value:
                      '${_formatMoney((apartment.budget * apartment.progress).round())} TL',
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Text('İş kalemleri', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          const _WorkItem(
            title: 'Elektrik tesisatı',
            state: 'Tamamlandı',
            done: true,
          ),
          const _WorkItem(
            title: 'Boya ve badana',
            state: 'Devam ediyor',
            done: false,
          ),
          const _WorkItem(
            title: 'Mutfak montajı',
            state: 'Planlandı',
            done: false,
          ),
        ],
      ),
    );
  }

  static String _formatMoney(int value) {
    final digits = value.toString();
    final buffer = StringBuffer();
    for (var index = 0; index < digits.length; index++) {
      final remaining = digits.length - index;
      buffer.write(digits[index]);
      if (remaining > 1 && remaining % 3 == 1) buffer.write('.');
    }
    return buffer.toString();
  }
}

class _DetailValue extends StatelessWidget {
  const _DetailValue({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 6),
            Text(value, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}

class _WorkItem extends StatelessWidget {
  const _WorkItem({
    required this.title,
    required this.state,
    required this.done,
  });

  final String title;
  final String state;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(
          done
              ? Icons.check_circle_rounded
              : Icons.radio_button_unchecked_rounded,
          color: done ? ConstructlyColors.success : ConstructlyColors.orange,
        ),
        title: Text(title),
        subtitle: Text(state),
      ),
    );
  }
}
