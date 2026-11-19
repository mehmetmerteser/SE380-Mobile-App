import 'package:flutter/material.dart';

import 'management_list.dart';

class SupplierScreen extends StatelessWidget {
  const SupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ManagementList(
      title: 'Tedarikçiler',
      summaryLabel: 'Toplam tedarikçi borcu',
      summaryValue: '₺426.300',
      addLabel: 'Tedarikçi ekle',
      entries: [
        ManagementEntry(
          title: 'Ege Beton A.Ş.',
          subtitle: 'Beton ve çimento',
          amount: '₺215.000',
          status: 'Kısmi ödeme',
        ),
        ManagementEntry(
          title: 'İzmir Yapı Market',
          subtitle: 'Yapı malzemeleri',
          amount: '₺128.800',
          status: 'Bekliyor',
        ),
        ManagementEntry(
          title: 'Nova Elektrik',
          subtitle: 'Elektrik ekipmanı',
          amount: '₺82.500',
          status: 'Vadesi yaklaşan',
        ),
      ],
    );
  }
}
