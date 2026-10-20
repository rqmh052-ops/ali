import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import 'app_provider.dart';
import 'app_theme.dart';
import 'splash_screen.dart';
import 'telegram_fab.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HostingApp());
}

class HostingApp extends StatelessWidget {
  const HostingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..bootstrap()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MaterialApp(
        title: 'HOST PANEL',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        themeMode: ThemeMode.dark,
        home: const SplashScreen(),
        builder: (context, child) => Stack(children: [
          if (child != null) child,
          Positioned(
            left: 16,   // ← على اليسار
            bottom: 100,
            child: const TelegramFab(),
          ),
        ]),
      ),
    );
  }
}
