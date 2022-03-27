import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/theme/theme.dart';
import 'package:bwa_cozy/widgets/error_screen.dart';
import 'package:bwa_cozy/widgets/facility_items.dart';
import 'package:bwa_cozy/widgets/ratings_items.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final Space space;
  DetailScreen(this.space);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isClick = false;

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

    Future<void> showModalConfirmation() async {
      return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        )),
        builder: (context) => Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: 20,
                height: 10,
                decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        '\$22.800',
                        style: regulerTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      subtitle: Text(
                        'data',
                        style: regulerTextStyle,
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Coba Dulu'),
              ),
            ],
          ),
        ),
      );
    }

    Future<void> showConfirmation() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: ListTile(
                title: Text(
                  'Logout Account?',
                  style: blackTextStyle,
                ),
                leading: Icon(
                  Icons.warning,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              content: Text(
                'Anda Akan Keluar Account',
                style: regulerTextStyle,
              ),
              actions: [
                Column(
                  children: [
                    Divider(thickness: 2, color: Colors.grey.withOpacity(0.2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                              fixedSize: Size(140, 40)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.black,
                          ),
                          label: Text(
                            'Cancel',
                            style:
                                regulerTextStyle.copyWith(color: Colors.black),
                          ),
                        ),
                        SizedBox(width: 10),
                        TextButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.greenAccent,
                              fixedSize: Size(140, 40)),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            launchTelUrl('tel:${widget.space.phone!}');
                          },
                          icon: Icon(Icons.call, color: Colors.black),
                          label: Text(
                            'Hubungi',
                            style:
                                regulerTextStyle.copyWith(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            );
          });

      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         title: Text('Konfirmasi'),
      //         content: SingleChildScrollView(
      //             child: ListBody(
      //           children: [
      //             Text(
      //               'Apakah anda ingin menghubungi pemilik kost? ',
      //             )
      //           ],
      //         )),
      //         actions: [
      //           TextButton(
      //               onPressed: () {
      //                 Navigator.of(context).pop();
      //               },
      //               child: Text('Batal')),
      //           TextButton(
      //               onPressed: () {
      //                 Navigator.of(context).pop();
      //                 launchTelUrl('tel:${widget.space.phone!}');
      //               },
      //               child: Text(
      //                 'Hubungi',
      //               ))
      //         ],
      //       );
      //     });
    }

    int index = 0;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl!,
              // 'assets/images/thumnail.png',
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                color: Colors.black.withOpacity(10),
                axisDirection: AxisDirection.down,
                child: ListView(
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
                                      widget.space.name!,
                                      // 'Kuretakeso Hott',
                                      style:
                                          blackTextStyle.copyWith(fontSize: 22),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                          text: '${widget.space.price!}',
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
                                      widget.space.rating!,
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
                                  widget.space.numberOfKitchens!,
                                ),
                                FacilityItems(
                                  "Bedroom",
                                  'assets/images/bed_room_icon.png',
                                  widget.space.numberOfBedrooms!,
                                ),
                                FacilityItems(
                                  "Big Lemari",
                                  'assets/images/lemari_icon.png',
                                  widget.space.numberOfCupboards!,
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
                                children: widget.space.photos!.map((items) {
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
                                  '${widget.space.address!} \n${widget.space.city}',
                                  // 'Jln. Kappan Sukses No. 20 \n Palembang',
                                  style: greyTextStyle,
                                ),
                                InkWell(
                                  onTap: () {
                                    showModalConfirmation();
                                    // launchUrl(widget.space
                                    //     .mapUrl! /*'https://goo.gl/maps/SyZx2yjWB1yR6AeH8'*/);
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
                            width:
                                MediaQuery.of(context).size.width - (2 * edge),
                            margin: EdgeInsets.symmetric(
                              horizontal: edge,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                // launchUrl('tel:+1-555-010-999');
                                // launchTelUrl('tel:${widget.space.phone!}');
                                showConfirmation();
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
              ),
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
                  InkWell(
                      onTap: () {
                        setState(() {
                          isClick = !isClick;
                        });
                      },
                      child: isClick
                          ? Image.asset(
                              'assets/images/btn_wishlist.png',
                              width: 40,
                            )
                          : Image.asset(
                              'assets/images/btn_wishlist.png',
                              width: 40,
                              color: Colors.orange,
                            ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
