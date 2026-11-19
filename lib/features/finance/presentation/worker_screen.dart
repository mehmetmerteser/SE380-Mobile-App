import 'package:flutter/material.dart';

import 'management_list.dart';

class WorkerScreen extends StatelessWidget {
  const WorkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ManagementList(
      title: 'Çalışan yönetimi',
      summaryLabel: 'Bu hafta işçilik ödemesi',
      summaryValue: '₺96.400',
      addLabel: 'Çalışan ekle',
      entries: [
        ManagementEntry(
          title: 'Ahmet Yılmaz',
          subtitle: 'Elektrik ustası · 5 gün',
          amount: '₺22.500',
          status: 'Ödendi',
        ),
        ManagementEntry(
          title: 'Mehmet Kaya',
          subtitle: 'Boya ustası · 6 gün',
          amount: '₺24.600',
          status: 'Bekliyor',
        ),
        ManagementEntry(
          title: 'Montaj ekibi',
          subtitle: 'Mutfak montajı',
          amount: '₺49.300',
          status: 'Onaylandı',
        ),
      ],
    );
  }
}
