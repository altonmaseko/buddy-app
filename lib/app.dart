import 'package:buddy_app/pages/home.dart';
import 'package:buddy_app/pages/login.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'Theme/theme.dart';
import 'constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'pages/signup.dart';
import 'pages/login.dart';
import 'pages/home.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // 'calendarNew':(context) =>Calendarschedule(),
        // 'bmi': (context) => BmiCalc(),
        // 'links': (context) => HelpfulLinksPage(),
        // 'alarm': (context) => AlarmPage(),
        'signup': (context) => SignupScreen(),
        'login': (context) => Login(),
        // 'forgotPass': (context) => ForgetPassword(),
        // 'verifyEmail': (context) => VerifyEmail(),
        // 'profile': (context) => Profile(),
        // 'chat': (context) => UkuChat(),
        // 'addTask': (context) => EventForm(),
        // 'chat2': (context) => Chat(),
      },
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    SignupScreen(),
    Login(),
    // BmiCalc(),
    // Calendarschedule(),
    // HelpfulLinksPage(),
    // Login(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(
            Iconsax.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Iconsax.calendar,
            size: 30,
            color: Colors.white,
          ),
          Icon(
             Iconsax.user_octagon,
              size: 30,
             color: Colors.white,
          ),
        ],
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        color: TColors.AppBlue,
        buttonBackgroundColor: TColors.AppBlue,
      ),
    );
  }
}
