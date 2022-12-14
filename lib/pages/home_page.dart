import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/configs/colors.dart';
import 'package:travel_app/cubit/cubits.dart';
import 'package:travel_app/cubit/states.dart';
import 'package:travel_app/models/place_model.dart';
import 'package:travel_app/widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/200'),
              radius: 20,
            ),
          )
        ],
      ),
      drawer: Drawer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            padding: EdgeInsets.only(top: 50),
            child: CustomText(
              text: 'Travel App',
              size: 30,
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const CustomText(
              text: 'Logout',
              size: 20,
            ),
            onTap: () {
              BlocProvider.of<AppCubits>(context).logout();
            },
          ),
        ],
      )),
      body: SafeArea(child: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            List<PlaceModel> places = state.places;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomText(
                    text: 'Discover',
                    size: 30,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    labelPadding: const EdgeInsets.only(left: 0, right: 10),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const CircleTabIndicator(
                      color: AppColor.primary,
                      radius: 3,
                    ),
                    tabs: const [
                      Tab(
                        text: 'Places',
                      ),
                      Tab(
                        text: 'Inspirations',
                      ),
                      Tab(
                        text: 'Emotions',
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 280,
                  child: TabBarView(
                    controller: _tabController,
                    children: List.generate(
                      3,
                      (index) => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context)
                                  .loadDetails(places[index]);
                            },
                            child: Container(
                              width: 190,
                              height: 300,
                              margin: const EdgeInsets.only(right: 20, top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'http://mark.bslmeiyu.com/uploads/${places[index].img}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 70,
                                width: double.infinity,
                                padding: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.9),
                                      Colors.black.withOpacity(0.0),
                                    ],
                                  ),
                                ),
                                alignment: Alignment.bottomCenter,
                                child: CustomText(
                                  text: places[index].name,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: places.length,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomText(
                        text: 'Explore More',
                        size: 18,
                      ),
                      CustomText(
                        text: 'See All',
                        size: 14,
                        color: AppColor.primary,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              image: const DecorationImage(
                                image: AssetImage('assets/images/hiking.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text('Hiking'),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  const CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    Offset circleOffset = Offset(configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - 5 - radius / 2);

    canvas.drawCircle(
      offset + circleOffset,
      radius,
      _paint,
    );
  }
}
