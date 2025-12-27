import 'package:flutter/material.dart';
import 'theme_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'transation_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TransactionModel> transactions = [
    TransactionModel(
      iconPath: 'assets/images/logo/netflix.jpg',
      title: 'Netflix',
      number: 12,
      amount: 54.89,
    ),
    TransactionModel(
      iconPath: 'assets/images/logo/google.jpg',
      title: 'Google',
      number: 8,
      amount: 32.50,
    ),
    TransactionModel(
      iconPath: 'assets/images/logo/spotify.png',
      title: 'Spotify',
      number: 11,
      amount: 2500.00,
    ),
    TransactionModel(
      iconPath: 'assets/images/logo/chatgpt.png',
      title: 'ChatGPT',
      number: 3,
      amount: 72.55,
    ),
    TransactionModel(
      iconPath: 'assets/images/logo/apple.jpg',
      title: 'Apple',
      number: 5,
      amount: 189.00,
    ),
    TransactionModel(
      iconPath: 'assets/images/logo/perplexity.jpg',
      title: 'Perplixity',
      number: 9,
      amount: 75.23,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Ensure background matches
      body: SafeArea(
        child: Column(
          children: [
            // 1. Fixed Header (Stays at the top)
            _buildHeader(context),
            // 2. Scrollable Content Area
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // Part A: The Top Cards (Scrolls normally)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          _buildCardSection(context),
                          _buildNavMenu(context),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: _buildTransactionList(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatar(BuildContext context, String imagePath) {
    return CircleAvatar(
      radius: 24,
      backgroundImage: AssetImage('assets/images/$imagePath'),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _avatar(context, 'cyanide.jpg'),
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
    );
  }

  Widget _buildCardSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 160,
      decoration: BoxDecoration(
        color: context.primaryBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Balance', style: TextStyle(color: Colors.white)),
              Text(
                '\$5,750.20',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Text('**** ***  2451', style: TextStyle(color: Colors.white)),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Image.asset(
                'assets/images/card-chip.png',
                width: 45,
                fit: BoxFit.contain,
              ),
              Spacer(),
              Image.asset(
                'assets/images/mastercard-logo.png',
                width: 50,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navMenuItem(
    BuildContext context, {
    required IconData icon,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, size: 24, color: context.primaryBlue),
        ),
        SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            color: context.textColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildNavMenu(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navMenuItem(
            context,
            icon: FontAwesomeIcons.arrowUpRightFromSquare,
            label: 'Send',
          ),
          _navMenuItem(context, icon: FontAwesomeIcons.qrcode, label: 'Scan'),
          _navMenuItem(
            context,
            icon: FontAwesomeIcons.creditCard,
            label: 'Cards',
          ),
          _navMenuItem(
            context,
            icon: FontAwesomeIcons.bookmark,
            label: 'Favourites',
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(
    BuildContext context,
    TransactionModel transaction,
  ) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(transaction.iconPath),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.title,
              style: TextStyle(
                color: context.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '${transaction.number} Transactions',
              style: TextStyle(
                color: context.greyTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          '\$${transaction.amount.toStringAsFixed(2)}',
          style: TextStyle(
            color: context.textColor,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionList(BuildContext context) {
    return Container(
      width: double.infinity,
      // constraints: BoxConstraints(
      //   minHeight: MediaQuery.of(context).size.height * 0.4,
      // ),
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                'Recent Transactions',
                style: TextStyle(
                  color: context.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                'See All',
                style: TextStyle(
                  color: context.primaryBlue,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          ListView.separated(
            shrinkWrap: true,
            // Disable scrolling here so the outer CustomScrollView handles it
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            separatorBuilder: (context, index) => const SizedBox(height: 22),

            // Corrected Signature: (context, index)
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return _buildTransactionItem(context, transaction);
            },
          ),
        ],
      ),
    );
  }
}
