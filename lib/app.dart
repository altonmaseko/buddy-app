import 'package:buddy_app/pages/buddyChat.dart';
import 'package:buddy_app/pages/buddyRequestMake.dart';
import 'package:buddy_app/pages/home.dart';
import 'package:buddy_app/pages/login.dart';
import 'package:buddy_app/pages/notification_page.dart';
import 'package:buddy_app/pages/receiver_accept_reject_page.dart';
import 'package:buddy_app/pages/request_buddy_page.dart';
import 'package:buddy_app/pages/requester_pending_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'Theme/theme.dart';
import 'constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'pages/signup.dart';
import 'pages/login.dart';
import 'pages/home.dart';

final navigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: navigatorKey,
      routes: {
        'signup': (context) => SignupScreen(),
        'login': (context) => Login(),
        'requester_pending_page': (context) => RequesterPendingPage(),
        'receiver_accept_reject_page': (context) => ReceiverAcceptRejectPage(),
        'app': (context) => MyHomePage(),
        'notification': (context) => NotificationPage(),
        'requestForm': (context) => buddyRequestForm(),
        'chat': (context) => Chat(),
        // 'aiChat': (context) => AiChat(),
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
  int _selectedIndex = 3;

  final List<Widget> _pages = [
    Home(),
    SignupScreen(),
    Chat(),
    Login(),
    RequestBuddyPage(),
    ReceiverAcceptRejectPage()
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
          Icon(
            Iconsax.send,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Iconsax.receipt,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Iconsax.receipt,
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
