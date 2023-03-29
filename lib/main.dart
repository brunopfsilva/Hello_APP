import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hello_app/core/http_client.dart';
import 'package:hello_app/core/theme.dart';
import 'package:hello_app/models/credentials.dart';
import 'package:hello_app/screens/index.dart';
import 'package:hello_app/screens/login/login_screen.dart';
import 'package:hello_app/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => Credentials()),
        Provider(create: (context) => Services(HttpClient())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hello App',
        theme: CustomTheme.darkTheme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/checkIn': (context) => CheckInScreen(),
          '/paycheck': (context) => PaycheckScreen(),
          '/benefits': (context) => BenefitsScreen(),
          '/mural': (context) => MuralScreen(),
          '/vacation': (context) => VacationScreen(),
          '/receipts': (context) => ReceiptsScreen(),
          '/trainings': (context) => TrainingsScreen(),
          '/config': (context) => ConfigScreen(),
          '/links': (context) => ListOfLinks(),
        },
      ),
    );
  }
}
