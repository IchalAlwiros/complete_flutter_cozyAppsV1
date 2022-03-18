import 'package:bwa_cozy/models/city.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/provider/space_provider.dart';
import 'package:bwa_cozy/theme/theme.dart';
import 'package:bwa_cozy/widgets/bottom_navbar_items.dart';
import 'package:bwa_cozy/widgets/city_card.dart';
import 'package:bwa_cozy/widgets/space_card.dart';
import 'package:bwa_cozy/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // var spaceProvider = Provider.of<SpaceProvider>(context);
    var spaceProvider = Provider.of<SpaceProvider>(context);
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: ListView(
            children: [
              SizedBox(
                height: edge,
              ),
              //NOTE: TITLE/HEADER
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Explore Now',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Mencari kosan yang cozy',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //NOTE: POPULAR CITIES
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Popular Cities',
                  style: regulerTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/images/city1.png',
                      isPopular: false,
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                      id: 1,
                      name: 'Bandung',
                      imageUrl: 'assets/images/city2.png',
                      isPopular: true,
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/images/city3.png',
                      isPopular: false,
                    )),
                    const SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Recomended Space',
                  style: regulerTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: FutureBuilder<List<Space>>(
                  future: spaceProvider.getRecomendedSpace(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      int index = 0;
                      return Column(
                        children:
                            // data!.map((items) => SpaceCard(items)).toList(),
                            data!.map((items) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30,
                            ),
                            child: SpaceCard(items),
                          );
                        }).toList(),
                      );

                      // ListView.builder(
                      //     itemCount: data.id,
                      //     itemBuilder: (context, index) {
                      //       return SpaceCard(
                      //         Space(
                      //           id: data.id,
                      //           name: data.name,
                      //           imageUrl: data.imageUrl,
                      //           price: data.price,
                      //           city: data.city,
                      //           country: data.country,
                      //           rating: data.rating,
                      //         ),
                      //       );
                      //     });

                      // Column(
                      //   children:
                      //   //[
                      //   //   SpaceCard(
                      //   //     Space(
                      //   //       id: 1,
                      //   //       name: 'Kuretakeso Hott',
                      //   //       imageUrl: 'assets/images/space1.png',
                      //   //       price: 52,
                      //   //       city: 'Bandung',
                      //   //       country: 'Germany',
                      //   //       rating: 4,
                      //   //     ),
                      //   //   ),
                      //   //   const SizedBox(
                      //   //     height: 30,
                      //   //   ),
                      //   //   SpaceCard(
                      //   //     Space(
                      //   //       id: 2,
                      //   //       name: 'Roemah Nenek',
                      //   //       imageUrl: 'assets/images/space1.png',
                      //   //       price: 52,
                      //   //       city: 'Bandung',
                      //   //       country: 'Germany',
                      //   //       rating: 4,
                      //   //     ),
                      //   //   ),
                      //   //   const SizedBox(
                      //   //     height: 30,
                      //   //   ),
                      //   //   SpaceCard(
                      //   //     Space(
                      //   //       id: 3,
                      //   //       name: 'Darrling How',
                      //   //       imageUrl: 'assets/images/space1.png',
                      //   //       price: 52,
                      //   //       city: 'Bandung',
                      //   //       country: 'Germany',
                      //   //       rating: 4,
                      //   //     ),
                      //   //   ),
                      //   //],
                      // );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //NOTE: TIPS & GUAIDNES
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Tips & Guidance',
                  style: regulerTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                child: Column(
                  children: [
                    TipsCard(
                      Tips(
                        id: 1,
                        title: 'City Guidelines',
                        imageUrl: 'assets/images/tips1.png',
                        updatedAt: '20 Apr',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TipsCard(
                      Tips(
                        id: 1,
                        title: 'Jakarta Fairship',
                        imageUrl: 'assets/images/tips2.png',
                        updatedAt: '12 Dec',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 65 + edge,
              ),
            ],
          )),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavBarItem(
              'assets/images/icon_home.png',
              true,
            ),
            BottomNavBarItem(
              'assets/images/icon_message.png',
              false,
            ),
            BottomNavBarItem(
              'assets/images/Icon_card_solid.png',
              false,
            ),
            BottomNavBarItem(
              'assets/images/Icon_love_solid.png',
              false,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
