import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlulaScreen extends StatefulWidget {
  const AlulaScreen({super.key});

  @override
  State<AlulaScreen> createState() => _AlulaScreenState();
}

class _AlulaScreenState extends State<AlulaScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final scale = (screenWidth / 390).clamp(0.82, 1.10).toDouble();

    final imageHeight = screenHeight < 700 ? 340 * scale : 400 * scale;

    final cardPadding = 21 * scale;

    final titleSize = 36 * scale;

    final bodySize = 13.5 * scale;

    return Scaffold(
      backgroundColor: const Color(0xFFF5EFE6),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              SizedBox(
                width: screenWidth,
                height: imageHeight,

                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/our-habitas-alula-al-ula-pic-32.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,

                            colors: [
                              Colors.black.withOpacity(0.25),
                              Colors.transparent,
                              Colors.black.withOpacity(0.12),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 18 * scale,
                      left: 18 * scale,

                      child: CircleButton(
                        size: 50 * scale,
                        icon: Icons.arrow_back,
                        iconColor: Color.fromARGB(255, 1, 79, 3),

                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),

                    Positioned(
                      top: 18 * scale,
                      right: 18 * scale,

                      child: CircleButton(
                        size: 50 * scale,

                        icon: isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,

                        iconColor: isFavorite
                            ? Color.fromARGB(255, 1, 79, 3)
                            : Color.fromARGB(255, 1, 79, 3),

                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,

                padding: EdgeInsets.fromLTRB(
                  cardPadding,
                  24 * scale,
                  cardPadding,
                  20 * scale,
                ),

                decoration: BoxDecoration(
                  color:  Color(0xFFF5EFE6),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 20 * scale,
                      offset: Offset(0, 8 * scale),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'AlUla',

                            style: GoogleFonts.playfairDisplay(
                              color: Color.fromARGB(255, 1, 79, 3),
                              fontSize: titleSize,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 11 * scale,
                            vertical: 7 * scale,
                          ),

                          decoration: BoxDecoration(
                            color: const Color(0xFF655D32),

                            borderRadius: BorderRadius.circular(23 * scale),
                          ),

                          child: Row(
                            mainAxisSize: MainAxisSize.min,

                            children: [
                              Icon(
                                Icons.star,
                                color: const Color(0xFFE0B85C),
                                size: 16 * scale,
                              ),

                              SizedBox(width: 4 * scale),

                              Text(
                                '4.8',

                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 13 * scale,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5 * scale),

                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: const Color(0xFFD4AA4F),
                          size: 19 * scale,
                        ),

                        SizedBox(width: 5 * scale),

                        Text(
                          'Al Madinah Region',

                          style: GoogleFonts.poppins(
                            color: Color.fromARGB(
                              255,
                              1,
                              79,
                              3,
                            ).withOpacity(0.78),
                            fontSize: 13 * scale,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 21 * scale),

                    Text(
                      "AlUla is one of Saudi Arabia's most "
                      "breathtaking destinations, known for its "
                      "ancient heritage, stunning rock formations, "
                      "and rich cultural history.",

                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 1, 79, 3).withOpacity(0.87),
                        fontSize: bodySize,
                        height: 1.55,
                      ),
                    ),

                    SizedBox(height: 7 * scale),

                    GestureDetector(
                      onTap: () {},

                      child: Text(
                        'Read more',

                        style: GoogleFonts.poppins(
                          color: const Color(0xFFD4AA4F),
                          fontSize: 13 * scale,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 27 * scale),

                    Text(
                      'Highlights',

                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 1, 79, 3),
                        fontSize: 17 * scale,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 14 * scale),

                    Row(
                      children: [
                        Expanded(
                          child: HighlightItem(
                            scale: scale,
                            icon: Icons.account_balance_outlined,
                            title: 'Heritage',
                            subtitle: 'Sites',
                          ),
                        ),

                        SizedBox(width: 7 * scale),

                        Expanded(
                          child: HighlightItem(
                            scale: scale,
                            icon: Icons.landscape_outlined,
                            title: 'Desert',
                            subtitle: 'Adventures',
                          ),
                        ),

                        SizedBox(width: 7 * scale),

                        Expanded(
                          child: HighlightItem(
                            scale: scale,
                            icon: Icons.museum_outlined,
                            title: 'Local',
                            subtitle: 'Culture',
                          ),
                        ),

                        SizedBox(width: 7 * scale),

                        Expanded(
                          child: HighlightItem(
                            scale: scale,
                            icon: Icons.camera_alt_outlined,
                            title: 'Photography',
                            subtitle: 'Spots',
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 25 * scale),

                    Container(
                      width: double.infinity,

                      padding: EdgeInsets.all(7 * scale),

                      decoration: BoxDecoration(
                        color: const Color(0xFF174D3B),

                        borderRadius: BorderRadius.circular(28 * scale),
                      ),

                      child: Row(
                        children: [
                          // PRICE
                          Padding(
                            padding: EdgeInsets.only(
                              left: 11 * scale,
                              top: 2 * scale,
                              bottom: 2 * scale,
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  'From',

                                  style: GoogleFonts.poppins(
                                    color: Colors.white70,
                                    fontSize: 11 * scale,
                                  ),
                                ),

                                Text(
                                  'SAR 450',

                                  style: GoogleFonts.playfairDisplay(
                                    color: Colors.white,
                                    fontSize: 20 * scale,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Spacer(),

                          // BOOK NOW
                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Booking AlUla...'),
                                ),
                              );
                            },

                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20 * scale,
                                vertical: 14 * scale,
                              ),

                              decoration: BoxDecoration(
                                color: const Color(0xFFD0A84F),

                                borderRadius: BorderRadius.circular(26 * scale),
                              ),

                              child: Row(
                                mainAxisSize: MainAxisSize.min,

                                children: [
                                  Text(
                                    'Book Now',

                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 13 * scale,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(width: 6 * scale),

                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 18 * scale,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final double size;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  const CircleButton({
    super.key,
    required this.size,
    required this.icon,
    required this.onTap,
    this.iconColor = const Color(0xFF222222),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        borderRadius: BorderRadius.circular(size / 2),

        onTap: onTap,

        child: Container(
          width: size,
          height: size,

          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.93),

            shape: BoxShape.circle,
          ),

          child: Icon(icon, color: iconColor, size: size * 0.46),
        ),
      ),
    );
  }
}

class HighlightItem extends StatelessWidget {
  final double scale;
  final IconData icon;
  final String title;
  final String subtitle;

  const HighlightItem({
    super.key,
    required this.scale,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105 * scale,

      decoration: BoxDecoration(
        color: const Color(0xFF104936),

        borderRadius: BorderRadius.circular(18 * scale),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(icon, color: const Color(0xFFD4AA4F), size: 25 * scale),

          SizedBox(height: 7 * scale),

          FittedBox(
            fit: BoxFit.scaleDown,

            child: Text(
              title,

              textAlign: TextAlign.center,

              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 10 * scale,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          FittedBox(
            fit: BoxFit.scaleDown,

            child: Text(
              subtitle,

              textAlign: TextAlign.center,

              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 10 * scale,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
