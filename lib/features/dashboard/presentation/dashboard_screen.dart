import 'package:flutter/material.dart';

import '../../../core/theme/constructly_theme.dart';
import '../../../core/widgets/dashboard_widgets.dart';
import '../../../repositories/auth_repository.dart';
import '../../apartments/presentation/apartment_list_screen.dart';
import '../../auth/presentation/login_screen.dart';
import '../../finance/presentation/cost_tracking_screen.dart';
import '../../finance/presentation/supplier_screen.dart';
import '../../finance/presentation/worker_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
    this.userName = 'Mert',
    this.isDemo = true,
  });

  final String userName;
  final bool isDemo;

  void _open(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Constructly'),
        actions: [
          IconButton(
            tooltip: 'Çıkış yap',
            onPressed: () async {
              if (!isDemo) {
                await FirebaseAuthRepository().signOut();
              }
              if (!context.mounted) return;
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute<void>(builder: (_) => const LoginScreen()),
                (_) => false,
              );
            },
            icon: const Icon(Icons.logout_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1050),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Merhaba, $userName',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 6),
                  const Text('Constructly Sitesi · Genel proje görünümü'),
                  const SizedBox(height: 24),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final columns = constraints.maxWidth > 760 ? 3 : 1;
                      return GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: columns,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: columns == 1 ? 3.4 : 2.1,
                        children: const [
                          SummaryCard(
                            label: 'Toplam daire',
                            value: '24',
                            icon: Icons.apartment_rounded,
                          ),
                          SummaryCard(
                            label: 'Devam eden işler',
                            value: '9',
                            icon: Icons.construction_rounded,
                            accent: ConstructlyColors.orange,
                          ),
                          SummaryCard(
                            label: 'Bütçe kullanımı',
                            value: '%62',
                            icon: Icons.pie_chart_rounded,
                            accent: ConstructlyColors.success,
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Yönetim araçları',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 14),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final columns = constraints.maxWidth > 760 ? 4 : 2;
                      return GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: columns,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1.05,
                        children: [
                          FeatureTile(
                            title: 'Daireler',
                            subtitle:
                                'Daire durumlarını ve detaylarını yönetin',
                            icon: Icons.domain_rounded,
                            onTap: () =>
                                _open(context, const ApartmentListScreen()),
                          ),
                          FeatureTile(
                            title: 'Maliyetler',
                            subtitle:
                                'Proje giderlerini kategorilere göre izleyin',
                            icon: Icons.account_balance_wallet_rounded,
                            onTap: () =>
                                _open(context, const CostTrackingScreen()),
                          ),
                          FeatureTile(
                            title: 'Tedarikçiler',
                            subtitle: 'Borç ve ödeme durumlarını takip edin',
                            icon: Icons.local_shipping_rounded,
                            onTap: () => _open(context, const SupplierScreen()),
                          ),
                          FeatureTile(
                            title: 'Çalışanlar',
                            subtitle: 'Yevmiye ve ödeme kayıtlarını yönetin',
                            icon: Icons.engineering_rounded,
                            onTap: () => _open(context, const WorkerScreen()),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 28),
                  Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(18),
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFFEAF0FE),
                        child: Icon(
                          Icons.cloud_outlined,
                          color: ConstructlyColors.blue,
                        ),
                      ),
                      title: Text(
                        isDemo
                            ? 'Demo verileri görüntüleniyor'
                            : 'Firebase bağlantısı etkin',
                      ),
                      subtitle: Text(
                        isDemo
                            ? 'Gerçek Authentication ve Firestore bağlantısını denemek için oluşturulan kullanıcıyla giriş yapın.'
                            : 'Kullanıcı Firebase Authentication ile doğrulandı. Sıradaki adım ekran verilerini Firestore koleksiyonlarına bağlamaktır.',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
