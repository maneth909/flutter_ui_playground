import 'package:flutter/material.dart';
import 'theme_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/send_money_header.dart';

class SendMoneyAmountPage extends StatefulWidget {
  final String name;
  final String imagePath;
  final String accountNumber;

  const SendMoneyAmountPage({
    super.key,
    required this.name,
    required this.imagePath,
    required this.accountNumber,
  });

  @override
  State<SendMoneyAmountPage> createState() => _SendMoneyAmountPageState();
}

class _SendMoneyAmountPageState extends State<SendMoneyAmountPage> {
  String _amount = "1500"; // Raw amount string

  // Simple formatter to add commas (e.g. 1500 -> 1,500) without extra packages
  String get _formattedAmount {
    if (_amount.isEmpty) return "0";
    return _amount.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  void _onKeyPressed(String value) {
    setState(() {
      if (value == 'back') {
        if (_amount.isNotEmpty) {
          _amount = _amount.substring(0, _amount.length - 1);
        }
      } else if (value == '.') {
        if (!_amount.contains('.')) {
          _amount += value;
        }
      } else {
        if (_amount == '0') {
          _amount = value;
        } else if (_amount.length < 10) {
          _amount += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SendMoneyHeader(onTapBack: () => Navigator.pop(context)),
                    const SizedBox(height: 20),
                    _buildRecipientInfo(context),
                    const SizedBox(height: 20),
                    _buildCardInfo(context),
                    const SizedBox(height: 20),
                    _buildInputAmountSection(context),
                  ],
                ),
              ),

              // --- BOTTOM SECTION (Keypad & Button) ---
              Column(
                children: [
                  _buildKeypad(context),
                  const SizedBox(height: 20),
                  _buildSendButton(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- PRESERVED WIDGETS (UNCHANGED) ---

  Widget _buildRecipientInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Hero(
            tag: widget.name,
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(widget.imagePath),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: context.textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.accountNumber,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  color: context.greyTextColor,
                  height: 1,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            "Change",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: context.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: context.primaryBlue,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'From wallet:  **** 1234',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                FontAwesomeIcons.chevronDown,
                size: 12,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            '\$12,895.00',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 2,
              height: 1,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildInputAmountSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Currency Dropdown Pill
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Flag placeholder
                const CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage('assets/images/usd.png'),
                ),
                const SizedBox(width: 8),
                Text(
                  "USD",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: context.textColor,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 18,
                  color: context.greyTextColor,
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\$ ",

                style: GoogleFonts.plusJakartaSans(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: context.greyTextColor,
                ),
              ),
              Text(
                _formattedAmount,

                style: GoogleFonts.plusJakartaSans(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: context.textColor,
                ),
              ),
              const SizedBox(width: 4),
              // The vertical cursor bar
              Container(height: 32, width: 2, color: context.primaryBlue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKeypad(BuildContext context) {
    return Column(
      children: [
        _buildKeyRow(context, ["1", "2", "3"]),
        const SizedBox(height: 12),
        _buildKeyRow(context, ["4", "5", "6"]),
        const SizedBox(height: 12),
        _buildKeyRow(context, ["7", "8", "9"]),
        const SizedBox(height: 12),
        _buildKeyRow(context, [".", "0", "back"]),
      ],
    );
  }

  Widget _buildKeyRow(BuildContext context, List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: keys.map((key) {
        return _buildKeyButton(context, key);
      }).toList(),
    );
  }

  Widget _buildKeyButton(BuildContext context, String value) {
    Widget content;
    if (value == 'back') {
      content = Icon(
        FontAwesomeIcons.deleteLeft,
        size: 20,
        color: context.textColor,
      );
    } else {
      content = Text(
        value,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: context.textColor,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _onKeyPressed(value),
      child: Container(
        // Calculate width to fit 3 buttons evenly with spacing
        width: (MediaQuery.of(context).size.width - 64) / 3,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: content,
      ),
    );
  }

  Widget _buildSendButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: context.primaryBlue,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: context.primaryBlue.withValues(alpha: .4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          "Send Money",
          style: GoogleFonts.plusJakartaSans(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
