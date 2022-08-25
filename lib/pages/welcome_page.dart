import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/configs/colors.dart';
import 'package:travel_app/cubit/cubits.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                image: AssetImage('assets/images/welcome-${index + 1}.png'),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppLargeText(text: 'Trips'),
                      const AppText(
                        text: 'Mountain',
                        size: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: 250,
                        child: const AppText(
                          text:
                              'The mountain sat upon the plain In his eternal chair, His observation omnifold, His inquest everywhere.',
                          size: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).loadPlaces();
                        },
                        child: ResponsiveButton(width: 100),
                      ),
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
                                ? AppColor.primary
                                : AppColor.primary.withOpacity(0.3),
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
