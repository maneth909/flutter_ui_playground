import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main_banking_app.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryPurple = Color(0xFF5E5CE5);

    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(
          primary: primaryPurple,
          surface: Colors.white,
          onSurface: const Color(0xFF1F2029),
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          Theme.of(context).textTheme,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: false,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          hintStyle: GoogleFonts.plusJakartaSans(
            color: Colors.grey[400],
            fontSize: 14,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: primaryPurple, width: 2),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryPurple,
            foregroundColor: Colors.white,
            elevation: 10,
            shadowColor: primaryPurple.withValues(alpha: 0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
            textStyle: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
      child: const LoginScreenContent(),
    );
  }
}

class LoginScreenContent extends StatefulWidget {
  const LoginScreenContent({super.key});

  @override
  State<LoginScreenContent> createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<LoginScreenContent> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textColor = Theme.of(context).colorScheme.onSurface;
    double padding = MediaQuery.of(context).size.width * 0.1;

    return Scaffold(
      body: SafeArea(
        //USE LAYOUT BUILDER to get available height
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              //CONSTRAINED BOX forces the content to be AT LEAST screen height
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                //INTRINSIC HEIGHT allows 'Spacer' or 'Expanded' to work inside ScrollView
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // This pushes the footer to the bottom
                        const Spacer(flex: 1),
                        Text(
                          'Hello,',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          'Welcome Back',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 48),

                        // Email
                        _buildLabel('Email', textColor),
                        const TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Enter Email Address',
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Password
                        _buildLabel('Password', textColor),
                        TextField(
                          obscureText: isPasswordVisible,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () => setState(
                                () => isPasswordVisible = !isPasswordVisible,
                              ),
                              color: Colors.grey,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        Text(
                          'Forgot Password?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),

                        const SizedBox(height: 18),

                        // Login Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BankingApp(),
                              ),
                            );
                          },
                          child: Text('LOGIN'),
                        ),

                        // Footer
                        const SizedBox(height: 30),

                        // Divider Row
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: padding),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(color: Colors.grey.shade300),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  'OR LOGIN WITH',
                                  style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(color: Colors.grey.shade300),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Social Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _socialButton(FontAwesomeIcons.facebookF),
                            const SizedBox(width: 16),
                            _socialButton(FontAwesomeIcons.google),
                            const SizedBox(width: 16),
                            _socialButton(FontAwesomeIcons.apple),
                          ],
                        ),
                        // This pushes the footer to the bottom
                        const Spacer(flex: 2),

                        // Sign Up Text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(color: textColor, fontSize: 12),
                            ),
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // --- HELPER METHODS ---

  Widget _buildLabel(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _socialButton(IconData iconData) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Icon(iconData, color: Colors.grey, size: 20),
    );
  }
}
