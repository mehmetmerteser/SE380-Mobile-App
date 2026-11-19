import 'package:flutter/material.dart';

import 'management_list.dart';

class CostTrackingScreen extends StatelessWidget {
  const CostTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ManagementList(
      title: 'Maliyet takibi',
      summaryLabel: 'Bu ay toplam gider',
      summaryValue: '₺348.750',
      addLabel: 'Gider ekle',
      entries: [
        ManagementEntry(
          title: 'Hazır beton',
          subtitle: 'Malzeme',
          amount: '₺185.000',
          status: 'Ödendi',
        ),
        ManagementEntry(
          title: 'Elektrik tesisatı',
          subtitle: 'İşçilik',
          amount: '₺92.500',
          status: 'Onaylandı',
        ),
        ManagementEntry(
          title: 'Seramik siparişi',
          subtitle: 'Malzeme',
          amount: '₺71.250',
          status: 'Bekliyor',
        ),
      ],
    );
  }
}
