import 'package:flutter/material.dart';
import '../theme_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SendMoneyHeader extends StatelessWidget {
  final VoidCallback? onTapBack;
  const SendMoneyHeader({super.key, required this.onTapBack});

  @override
  Widget build(BuildContext context) {
    // 1. Wrap everything in a Hero
    return Hero(
      tag: 'send_money_static_header', // Unique ID shared by both pages
      // 2. Wrap in Material to prevent text style glitches during animation
      child: Material(
        type: MaterialType.transparency,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onTapBack,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: 0.1,
                      ), // Fixed withValues
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  FontAwesomeIcons.chevronLeft,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              'Send Money',
              style: TextStyle(
                color: context.textColor,
                fontSize: 22,
                fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none, // Safety for Hero text
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .1),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                FontAwesomeIcons.ellipsis,
                size: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
