import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/cubits.dart';
import 'package:travel_app/cubit/states.dart';
import 'package:travel_app/models/place_model.dart';
import 'package:travel_app/widgets/custom_button.dart';
import 'package:travel_app/widgets/custom_text.dart';

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
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailsState detailsState = state as DetailsState;
        PlaceModel place = detailsState.place;

        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'http://mark.bslmeiyu.com/uploads/${place.img}'),
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
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goBack();
                      },
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
                          children: [
                            CustomText(text: place.name, size: 27),
                            CustomText(text: '\$ ${place.price}', size: 20),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                size: 15, color: Colors.black54),
                            const SizedBox(width: 5),
                            CustomText(
                              text: place.location,
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
                              index < place.stars
                                  ? Icons.star
                                  : Icons.star_border,
                              size: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const CustomText(text: 'People', size: 20),
                        const SizedBox(height: 5),
                        const CustomText(
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
                        const CustomText(text: 'Description', size: 20),
                        const SizedBox(height: 5),
                        CustomText(
                            text: place.description,
                            size: 14,
                            color: Colors.black54),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const CustomButton(
                              icon: Icons.favorite_border_rounded,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 10),
                            ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(
                                width: 300,
                                height: 50,
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.purple),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                child: const Text('Book Now'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
