import 'package:acadarena_semcomp_app/api/firebase_api.dart';
import 'package:acadarena_semcomp_app/firebase_options.dart';
import 'package:acadarena_semcomp_app/pages/notification_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:acadarena_semcomp_app/pages/home_page.dart';

// token: fx_FYeRlQ9WeCDcOUNiahI:APA91bGQ0Pm4FqnaokF6mxXmwD_vm1es85rkmIt-XLNy2x1JPFVg0glyC79TKuz8P8mW7U44R7_v9q8__cdNbIqYKknx_UtYVnHohOVeVCoAYKBGhwgk8kCdbEwJyv1B-1YlRR35lFV3
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Create an instance of FirebaseApi
  FirebaseApi firebaseApi = FirebaseApi();
  await firebaseApi.initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        navigatorKey: navigatorKey,
        routes: {
          '/notification_screen': (context) => const NotificationPage(),
        });
  }
}
