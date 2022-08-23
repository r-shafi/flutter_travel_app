import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/custom_button.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final int rating = 3;
  int selectedPeople = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/mountain.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 250,
                child: Container(
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            AppLargeText(text: 'Yosemite', size: 27),
                            AppLargeText(text: '\$ 250', size: 20),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: const [
                            Icon(Icons.location_on,
                                size: 15, color: Colors.black54),
                            SizedBox(width: 5),
                            AppLargeText(
                              text: 'USA, California',
                              size: 15,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              index < rating ? Icons.star : Icons.star_border,
                              size: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const AppLargeText(text: 'People', size: 20),
                        const SizedBox(height: 5),
                        const AppLargeText(
                          text: 'Number of People in Your Group',
                          size: 14,
                          color: Colors.black54,
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  selectedPeople = index;
                                });
                              },
                              child: CustomButton(
                                text: (index + 1).toString(),
                                color: selectedPeople == index
                                    ? Colors.white
                                    : Colors.black87,
                                backgroundColor: selectedPeople == index
                                    ? Colors.black
                                    : Colors.black12,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const AppLargeText(text: 'Description', size: 20),
                        const SizedBox(height: 5),
                        const AppLargeText(
                            text:
                                'Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.',
                            size: 14,
                            color: Colors.black54),
                        const SizedBox(height: 20),
                        Row(
                          children: const [
                            CustomButton(
                              icon: Icons.favorite_border_rounded,
                              color: Colors.black,
                            ),
                            SizedBox(width: 10),
                            ResponsiveButton(
                              text: 'Book Trip Now',
                              width: 300,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
