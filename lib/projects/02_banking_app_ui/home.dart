import 'package:flutter/material.dart';
import 'theme_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _avatar('cyanide.jpg'),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back,',
                        style: TextStyle(
                          color: context.greyTextColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                      Text(
                        'Paul Muadhib',
                        style: TextStyle(
                          color: context.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          // height: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.solidBell,
                        size: 22,
                        color: context.textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Add your home page content here
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatar(String imagePath) {
    return CircleAvatar(
      radius: 24,
      backgroundImage: AssetImage('assets/images/$imagePath'),
    );
  }
}
