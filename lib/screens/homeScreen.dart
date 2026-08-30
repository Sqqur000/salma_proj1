import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'alulaScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    

    final mediaQuery = MediaQuery.of(context);

    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // 390 is our reference Google phone width
    final scale = (screenWidth / 390).clamp(0.82, 1.10).toDouble();

    
    final horizontalPadding = 16 * scale;
    final topSpace = 20 * scale;

    final titleSize = 30 * scale;
    final subtitleSize = 14 * scale;

    final sectionTitleSize = 18 * scale;

    final cardHeight = 165 * scale;

    final imageWidth = screenWidth * 0.40;
    final imageHeight = cardHeight - (12 * scale);

    return Scaffold(
      backgroundColor:  Color(0xFFF5EFE6),

      

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        toolbarHeight: 80 * scale,

        centerTitle: true,

        leading: IconButton(
          onPressed: () {},

          icon: Icon(
            Icons.menu,
            color: const Color.fromARGB(255, 1, 79, 3),
            size: 26 * scale,
          ),
        ),

        title: Image.asset(
          'assets/saFlag.png',
          height: 65 * scale,
        ),

        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 12 * scale,
            ),

            child: Icon(
              Icons.notifications_none,
              color: const Color.fromARGB(255, 1, 79, 3),
              size: 27 * scale,
            ),
          ),
        ],
      ),

      

      body: SingleChildScrollView(
        physics:  BouncingScrollPhysics(),

        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              SizedBox(height: topSpace),

              
              Text(
                "Explore\nSaudi Arabia",

                style: GoogleFonts.playfairDisplay(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 1, 79, 3),
                ),
              ),

              SizedBox(height: 8 * scale),

              Text(
                "Discover the beauty, culture and heritage of\n"
                "our amazing country.",

                style: GoogleFonts.poppins(
                  fontSize: subtitleSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),

              SizedBox(height: 22 * scale),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text(
                    "Popular Destinations",

                    style: GoogleFonts.poppins(
                      fontSize: sectionTitleSize,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 1, 79, 3),
                    ),
                  ),

                  Text(
                    "See all",

                    style: GoogleFonts.poppins(
                      fontSize: 14 * scale,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 1, 79, 3),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 18 * scale),

              
              DestinationCard(
                context: context,

                image:
                    'assets/360_F_546176788_hK2bMAyjAYfkW6l37MynkXedIJ8NDNDl.jpg',

                title: 'AlUla',

                location: 'Al Madinah Region',

                description:
                    'Discover ancient civilizations and breathtaking deserts.',

                scale: scale,

                imageWidth: imageWidth,

                imageHeight: imageHeight,

                enabled: true,

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AlulaScreen(),
                    ),
                  );
                },
              ),

              

              DestinationCard(
                context: context,

                image:
                    'assets/jeddah-corniche-red-sea-saudi-arabia-d6ub_b.jpeg',

                title: 'Jeddah',

                location: 'Makkah Region',

                description:
                    'The beautiful Red Sea coast and rich history come together.',

                scale: scale,

                imageWidth: imageWidth,

                imageHeight: imageHeight,

                enabled: false,

                onPressed: () {},
              ),

              

              DestinationCard(
                context: context,

                image:
                    'assets/Kingdom-Centre-Riyadh-Saudi-Arabia.webp',

                title: 'Riyadh',

                location: 'Riyadh Region',

                description:
                    'Discover Saudis vibrant capital, where modern attractions meet historic landmarks, traditional markets, and rich cultural heritage.',

                scale: scale,

                imageWidth: imageWidth,

                imageHeight: imageHeight,

                enabled: false,

                onPressed: () {},
              ),

              

              DestinationCard(
                context: context,

                image:
                    'assets/b220510003___banner-size_1606_786.jpg',

                title: 'Abha',

                location: 'Aseer Region',

                description:
                    'Enjoy cool mountain air, green landscapes, scenic viewpoints, and the unique cultural charm of southern Saudi Arabia.',

                scale: scale,

                imageWidth: imageWidth,

                imageHeight: imageHeight,

                enabled: false,

                onPressed: () {},
              ),

              SizedBox(height: 20 * scale),
            ],
          ),
        ),
      ),

      
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,

        height: 70 * scale,

        indicatorColor: const Color.fromARGB(
          255,
          154,
          191,
          155,
        ),

        selectedIndex: 0,

        onDestinationSelected: (int index) {},

        destinations: const [

          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: Color.fromARGB(255, 0, 76, 4),
            ),

            selectedIcon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 0, 76, 4),
            ),

            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.explore_outlined,
              color: Color.fromARGB(255, 0, 76, 4),
            ),

            selectedIcon: Icon(
              Icons.explore,
              color: Color.fromARGB(255, 0, 76, 4),
            ),

            label: 'Explore',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.favorite_border,
              color: Color.fromARGB(255, 0, 76, 4),
            ),

            selectedIcon: Icon(
              Icons.favorite,
              color: Color.fromARGB(255, 0, 76, 4),
            ),

            label: 'Favorites',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
              color: Color.fromARGB(255, 0, 76, 4),
            ),

            selectedIcon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 0, 76, 4),
            ),

            label: 'Profile',
          ),
        ],
      ),
    );
  }
}




class DestinationCard extends StatelessWidget {

  final BuildContext context;

  final String image;
  final String title;
  final String location;
  final String description;

  final double scale;
  final double imageWidth;
  final double imageHeight;

  final bool enabled;

  final VoidCallback onPressed;

  const DestinationCard({
    super.key,

    required this.context,
    required this.image,
    required this.title,
    required this.location,
    required this.description,

    required this.scale,
    required this.imageWidth,
    required this.imageHeight,

    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 7 * scale,
      ),

      height: imageHeight + (12 * scale),

      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(
          20 * scale,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            spreadRadius: 1 * scale,
            blurRadius: 8 * scale,
            offset: Offset(
              0,
              4 * scale,
            ),
          ),
        ],
      ),

      child: Row(
        children: [

          

          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20 * scale),
              bottomLeft: Radius.circular(20 * scale),
            ),

            child: Image.asset(
              image,

              width: imageWidth,
              height: imageHeight,

              fit: BoxFit.cover,
            ),
          ),

            Expanded( 
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 7 * scale,
                vertical: 8 * scale,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // TITLE

                  Text(
                    title,

                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                    style: GoogleFonts.playfairDisplay(
                      fontSize: 19 * scale,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 1, 79, 3),
                    ),
                  ),

                  SizedBox(height: 2 * scale),

                  // LOCATION

                  Row(
                    children: [

                      Icon(
                        Icons.location_pin,

                        color: const Color.fromARGB(
                          255,
                          1,
                          79,
                          3,
                        ),

                        size: 16 * scale,
                      ),

                      SizedBox(width: 2 * scale),

                      Expanded(
                        child: Text(
                          location,

                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,

                          style: GoogleFonts.poppins(
                            fontSize: 10.5 * scale,
                            color: const Color.fromARGB(
                              255,
                              1,
                              79,
                              3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 3 * scale),

                  // DESCRIPTION

                  Expanded(
                    child: Text(
                      description,

                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,

                      style: GoogleFonts.poppins(
                        fontSize: 10.5 * scale,
                        color: Colors.grey,
                        height: 1.3,
                      ),
                    ),
                  ),

                  // BUTTON

                  SizedBox(
                    height: 31 * scale,

                    child: ElevatedButton(
                      onPressed: enabled
                          ? onPressed
                          : null,

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(
                          255,
                          1,
                          79,
                          3,
                        ),

                        disabledBackgroundColor:
                            Colors.grey.shade300,

                        foregroundColor: Colors.white,

                        padding: EdgeInsets.symmetric(
                          horizontal: 15 * scale,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8 * scale,
                          ),
                        ),

                        elevation: 0,
                      ),

                      child: Text(
                        'Explore',

                        style: GoogleFonts.poppins(
                          fontSize: 10 * scale,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          
          Padding(
            padding: EdgeInsets.only(
              right: 8 * scale,
              bottom: 100 * scale,
            ),

            child: Icon(
              Icons.favorite_border_outlined,
              size: 20 * scale,
            ),
          ),
        ],
      ),
    );
  }
}
