import 'package:flutter/material.dart';

import '../../../core/theme/constructly_theme.dart';
import '../../dashboard/presentation/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _openDemo() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const DashboardScreen()),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _openDemo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= 900;
            return Row(
              children: [
                if (wide) const Expanded(child: _LoginHero()),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(28),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 430),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (!wide) const _CompactLogo(),
                              Text(
                                'Tekrar hoş geldiniz',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Şantiye ve proje bilgilerinizi tek yerden yönetin.',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 32),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: 'E-posta',
                                  prefixIcon: Icon(Icons.mail_outline_rounded),
                                ),
                                validator: (value) {
                                  if (value == null || !value.contains('@')) {
                                    return 'Geçerli bir e-posta girin.';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: _hidePassword,
                                decoration: InputDecoration(
                                  labelText: 'Şifre',
                                  prefixIcon: const Icon(
                                    Icons.lock_outline_rounded,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () => setState(
                                      () => _hidePassword = !_hidePassword,
                                    ),
                                    icon: Icon(
                                      _hidePassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.length < 6) {
                                    return 'Şifre en az 6 karakter olmalı.';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 22),
                              FilledButton(
                                onPressed: _submit,
                                child: const Text('Giriş yap'),
                              ),
                              const SizedBox(height: 12),
                              OutlinedButton(
                                onPressed: _openDemo,
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(52),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: const Text('Demo ile devam et'),
                              ),
                              const SizedBox(height: 18),
                              const Text(
                                'Gerçek kullanıcı girişi Firebase projesi bağlandıktan sonra etkinleştirilecektir.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LoginHero extends StatelessWidget {
  const _LoginHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ConstructlyColors.navy,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _BrandMark(),
              const SizedBox(height: 32),
              Text(
                'İnşaat yönetimini\ndaha anlaşılır hale getirin.',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Daireleri, maliyetleri, tedarikçileri ve çalışan ödemelerini tek panelden takip edin.',
                style: TextStyle(
                  color: Color(0xFFB9C6D8),
                  fontSize: 17,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompactLogo extends StatelessWidget {
  const _CompactLogo();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 28),
      child: _BrandMark(dark: true),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark({this.dark = false});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final foreground = dark ? ConstructlyColors.navy : Colors.white;
    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: ConstructlyColors.orange,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.apartment_rounded, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            'Constructly',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: foreground,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
