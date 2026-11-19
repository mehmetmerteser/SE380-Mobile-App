import 'package:flutter/material.dart';

class ConstructlyScaffold extends StatelessWidget {
  const ConstructlyScaffold({
    required this.title,
    required this.child,
    super.key,
    this.actions,
    this.floatingActionButton,
  });

  final String title;
  final Widget child;
  final List<Widget>? actions;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 960),
            child: child,
          ),
        ),
      ),
    );
  }
}
