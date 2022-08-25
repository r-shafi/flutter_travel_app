import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/cubits.dart';
import 'package:travel_app/widgets/custom_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/welcome-${index + 1}.jpg'),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        width: 350,
                        child: CustomText(
                          text: index == 0
                              ? 'Explore the Beauty of Journey.'
                              : index == 1
                                  ? 'Find the Best Place to Visit.'
                                  : 'Book Your Trip.',
                          color: Colors.white,
                          size: 40,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 250,
                        margin: const EdgeInsets.only(bottom: 100),
                        child: const CustomText(
                          text:
                              'Journey is the best way to find the best place to visit.',
                          color: Colors.white,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      index == 2
                          ? ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<AppCubits>(context)
                                    .loadPlaces();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                              ),
                              child: const Text('Get Started'),
                            )
                          : Container(),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      3,
                      (sliderIndex) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          width: 8,
                          height: index == sliderIndex ? 25 : 8,
                          decoration: BoxDecoration(
                            color: index == sliderIndex
                                ? Colors.white
                                : Colors.white30,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
