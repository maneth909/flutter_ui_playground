import 'package:flutter/material.dart';
import 'theme_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model/contact_model.dart';
import 'send_money_amount_page.dart';
import 'components/send_money_header.dart';

class SendMoneyMain extends StatefulWidget {
  const SendMoneyMain({super.key});

  @override
  State<SendMoneyMain> createState() => _SendMoneyMainState();
}

class _SendMoneyMainState extends State<SendMoneyMain> {
  List<ContactModel> contactList = [
    ContactModel(
      name: 'Bob',
      imagePath: 'assets/images/users/user1.jpg',
      accountNumber: '**** **** **** 1234',
    ),
    ContactModel(
      name: 'Alice',
      imagePath: 'assets/images/users/user2.png',
      accountNumber: '**** **** **** 5678',
    ),
    ContactModel(
      name: 'Charlie',
      imagePath: 'assets/images/users/user3.jpg',
      accountNumber: '**** **** **** 9012',
    ),
    ContactModel(
      name: 'Diana',
      imagePath: 'assets/images/users/user4.jpg',
      accountNumber: '**** **** **** 3456',
    ),
    ContactModel(
      name: 'Ethan',
      imagePath: 'assets/images/users/user5.jpg',
      accountNumber: '**** **** **** 7890',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            children: [
              SendMoneyHeader(
                onTapBack: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 20),
              _buildSearchBar(context),
              SizedBox(height: 20),
              _buildRecentContactsSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 16,
            color: context.greyTextColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: context.greyTextColor,
                  fontSize: 16,
                  fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactAvatar(
    BuildContext context,
    String imagePath,
    String name,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Column(
          children: [
            Hero(
              tag: name, // Must be unique per user
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(imagePath),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: TextStyle(
                color: context.textColor,
                fontSize: 14,
                fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentContactsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Contacts',
            style: TextStyle(
              color: context.textColor,
              fontSize: 16,
              fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: contactList.length,
              separatorBuilder: (_, _) => const SizedBox(width: 0),
              itemBuilder: (context, index) {
                final contact = contactList[index];
                return _buildContactAvatar(
                  context,
                  contact.imagePath,
                  contact.name,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SendMoneyAmountPage(
                          name: contact.name,
                          imagePath: contact.imagePath,
                          accountNumber: contact.accountNumber,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
