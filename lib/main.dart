import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pauseguitare/providers/bottom_navbar_provider.dart';
import 'package:pauseguitare/services/router_service.dart';
import 'package:pauseguitare/theme/app_theme.dart';
import 'package:provider/provider.dart';

// main : démarrer l'application
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // initialiser l'internationalisation
  initializeDateFormatting('fr_FR');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavbarProvider()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pause Guitare',
      theme: AppTheme().getTheme(),
      routerConfig: RouterService().get(),
      // home: HomeScreen(),
    );
  }
}
