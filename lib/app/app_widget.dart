import 'package:crud/pages/carros_page.dart';
import 'package:crud/providers/carros.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Carros(),
      child: MaterialApp(
        routes: {
          "/" : (context) => const CarrosPage()
        },
      ),
    );
  }
}