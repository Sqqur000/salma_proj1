import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/destinations_model.dart';
import 'alulaScreen.dart';
import '../service/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DestinationsModel> destinations = [];

 

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final scale =
        (screenWidth / 390).clamp(0.82, 1.10).toDouble();

    final horizontalPadding = 16 * scale;
    final topSpace = 20 * scale;

    final titleSize = 30 * scale;
    final subtitleSize = 14 * scale;
    final sectionTitleSize = 18 * scale;

    final cardHeight = 165 * scale;

    final imageWidth = screenWidth * 0.40;
    final imageHeight =
        cardHeight - (12 * scale);

    return Scaffold(
      backgroundColor: const Color(0xFFF5EFE6),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80 * scale,
        centerTitle: true,

        leading: IconButton(
          onPressed: () {},

          icon: Icon(
            Icons.menu,
            color: const Color.fromARGB(
              255,
              1,
              79,
              3,
            ),
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
              color: const Color.fromARGB(
                255,
                1,
                79,
                3,
              ),
              size: 27 * scale,
            ),
          ),
        ],
      ),

      body: FutureBuilder<List<DestinationsModel>>(
  future: Database().getAllDestinations(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (snapshot.hasError) {
      return Center(
        child: Text(
          'ERROR:\n${snapshot.error}',
          textAlign: TextAlign.center,
        ),
      );
    }

    if (!snapshot.hasData) {
      return const Center(
        child: Text('No data'),
      );
    }

    if (snapshot.data!.isEmpty) {
      return const Center(
        child: Text('Supabase returned 0 rows'),
      );
    }

    final destinations = snapshot.data!;

    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: topSpace,
      ),
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        final destination = destinations[index];

        return DestinationCard(
          destination: destination,
          scale: scale,
          imageWidth: imageWidth,
          imageHeight: imageHeight,
        );
      },
    );
  },
),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final DestinationsModel destination;
  final double scale;
  final double imageWidth;
  final double imageHeight;

  const DestinationCard({
    super.key,
    required this.destination,
    required this.scale,
    required this.imageWidth,
    required this.imageHeight,
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
              topLeft: Radius.circular(
                20 * scale,
              ),
              bottomLeft: Radius.circular(
                20 * scale,
              ),
            ),
            child: Image.asset(
              destination.image,
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
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 19 * scale,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(
                        255,
                        1,
                        79,
                        3,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 2 * scale,
                  ),

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

                      SizedBox(
                        width: 2 * scale,
                      ),

                      Expanded(
                        child: Text(
                          destination.location,
                          maxLines: 1,
                          overflow:
                              TextOverflow.ellipsis,
                          style:
                              GoogleFonts.poppins(
                            fontSize:
                                10.5 * scale,
                            color:
                                const Color.fromARGB(
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

                  SizedBox(
                    height: 3 * scale,
                  ),

                  Expanded(
                    child: Text(
                      destination.description,
                      maxLines: 3,
                      overflow:
                          TextOverflow.ellipsis,
                      style:
                          GoogleFonts.poppins(
                        fontSize:
                            10.5 * scale,
                        color: Colors.grey,
                        height: 1.3,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 31 * scale,
                    child: ElevatedButton(
                      onPressed:
                          destination.enabled
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              AlulaScreen(
                                        destination:
                                            destination,
                                      ),
                                    ),
                                  );
                                }
                              : null,

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(
                          255,
                          1,
                          79,
                          3,
                        ),
                        disabledBackgroundColor:
                            Colors.grey.shade300,
                        foregroundColor:
                            Colors.white,
                        padding:
                            EdgeInsets.symmetric(
                          horizontal:
                              15 * scale,
                        ),
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                            8 * scale,
                          ),
                        ),
                        elevation: 0,
                      ),

                      child: Text(
                        'Explore',
                        style:
                            GoogleFonts.poppins(
                          fontSize:
                              10 * scale,
                          fontWeight:
                              FontWeight.bold,
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