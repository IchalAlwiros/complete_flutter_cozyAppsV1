import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/theme/theme.dart';
import 'package:bwa_cozy/widgets/error_screen.dart';
import 'package:bwa_cozy/widgets/facility_items.dart';
import 'package:bwa_cozy/widgets/ratings_items.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final Space space;
  DetailScreen(this.space);

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(
          url,
          //forceWebView: true,
          enableJavaScript: true,
        );
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorScreen()));
      }
    }

    launchTelUrl(String telephoneUrl) async {
      if (await canLaunch(telephoneUrl)) {
        await launch(telephoneUrl);
      } else {
        throw "Error occured trying to call that number.";
      }
    }

    int index = 0;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl!,
              // 'assets/images/thumnail.png',
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),

                  // NOTE : TITLE
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name!,
                                  // 'Kuretakeso Hott',
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                Text.rich(
                                  TextSpan(
                                      text: '${space.price!}',
                                      // '52',
                                      style: purpleTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' / mounth',
                                          style: greyTextStyle.copyWith(
                                            fontSize: 16,
                                          ),
                                        )
                                      ]),
                                ),
                              ],
                            ),
                            Row(
                                children: [1, 2, 3, 4, 5].map((index) {
                              print('ini index ke $index');
                              return Container(
                                margin: EdgeInsets.only(
                                  left: 2,
                                ),
                                child: RatingItem(
                                  index,
                                  space.rating!,
                                ),
                              );
                            }).toList()
                                // [
                                // Image.asset(
                                //   'assets/images/Icon_star_solid.png',
                                //   width: 20,
                                // ),
                                // Image.asset(
                                //   'assets/images/Icon_star_solid.png',
                                //   width: 20,
                                // ),
                                // Image.asset(
                                //   'assets/images/Icon_star_solid.png',
                                //   width: 20,
                                // ),
                                // Image.asset(
                                //   'assets/images/Icon_star_solid.png',
                                //   width: 20,
                                // ),
                                // Image.asset(
                                //   'assets/images/Icon_star_solid.png',
                                //   width: 20,
                                //   color: Colors.grey,
                                // ),
                                // ],
                                )
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      // NOTE : MAIN FACILITI
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Main Facility',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItems(
                              "Kitchen",
                              'assets/images/kitchen_icon.png',
                              space.numberOfKitchens!,
                            ),
                            FacilityItems(
                              "Bedroom",
                              'assets/images/bed_room_icon.png',
                              space.numberOfBedrooms!,
                            ),
                            FacilityItems(
                              "Big Lemari",
                              'assets/images/lemari_icon.png',
                              space.numberOfCupboards!,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // NOTE : PHOTO
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            children: space.photos!.map((items) {
                              index++;
                              return Container(
                                margin: EdgeInsets.only(
                                  left: index == 0 ? 1 : 24,
                                  // right: index == 1 ? 0 : 24,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    items,
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList()
                            //  [
                            //   SizedBox(
                            //     width: edge,
                            //   ),
                            //   Image.asset(
                            //     'assets/images/pic1.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(
                            //     width: 18,
                            //   ),
                            //   Image.asset(
                            //     'assets/images/pic1.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(
                            //     width: 18,
                            //   ),
                            //   Image.asset(
                            //     'assets/images/pic1.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(
                            //     width: edge,
                            //   ),
                            // ],
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Location',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${space.address!} \n${space.city}',
                              // 'Jln. Kappan Sukses No. 20 \n Palembang',
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(space
                                    .mapUrl! /*'https://goo.gl/maps/SyZx2yjWB1yR6AeH8'*/);
                              },
                              child: Image.asset(
                                'assets/images/btn_location.png',
                                width: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // launchUrl('tel:+1-555-010-999');
                            launchTelUrl('tel:${space.phone!}');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: purpelColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                          child: Text(
                            'Explore Now',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                )
              ],
            ),

            // Top Buttons
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40,
                    ),
                  ),
                  Image.asset(
                    'assets/images/btn_wishlist.png',
                    width: 40,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
