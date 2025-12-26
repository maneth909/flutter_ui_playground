import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'theme_extension.dart';
import 'home.dart';
import 'report.dart';
import 'wallet.dart';
import 'account.dart';

class BankingApp extends StatelessWidget {
  const BankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF5465FF);
    const backgroundGrey = Color(0xFFF5F7FA);
    const darkText = Color(0xFF1E1E2D);
    const greyText = Color(0xFF7D8499);
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: backgroundGrey,
        colorScheme: ColorScheme.light(
          primary: primaryBlue,
          surface: Colors.white,
          onSurface: darkText,
          onSurfaceVariant: greyText,
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      child: BankingHomePageContent(),
    );
  }
}

class BankingHomePageContent extends StatefulWidget {
  const BankingHomePageContent({super.key});

  @override
  State<BankingHomePageContent> createState() => _BankingHomePageContentState();
}

class _BankingHomePageContentState extends State<BankingHomePageContent> {
  final List<Widget> _bankPages = [
    HomePage(),
    WalletPage(),
    ReportPage(),
    AccountPage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final primaryBlue = Theme.of(context).colorScheme.primary;
    // final backgroundGrey = Theme.of(context).scaffoldBackgroundColor;
    // final whiteColor = Theme.of(context).colorScheme.surface;
    // final textColor = Theme.of(context).colorScheme.onSurface;
    // final greyTextColor = Theme.of(context).colorScheme.onSurfaceVariant;
    return Scaffold(
      body: _bankPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: context.backgroundGrey,
        selectedItemColor: context.primaryBlue,
        unselectedItemColor: context.greyTextColor,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: context.textColor,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: context.greyTextColor,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidHouse, size: 22),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.wallet, size: 22),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.chartPie, size: 22),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidUser, size: 22),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
