import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pauseguitare/providers/bottom_navbar_provider.dart';
import 'package:pauseguitare/services/router_service.dart';
import 'package:pauseguitare/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// main : démarrer l'application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialiser l'internationalisation
  initializeDateFormatting('fr_FR');

  // créer l'entrée des favoris dans les préférences de l'application
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (!prefs.containsKey('favorites')) {
    await prefs.setStringList('favorites', []);
  }

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
