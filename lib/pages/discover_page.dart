import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:snapchat_ui/data/discover_json.dart';
import 'package:snapchat_ui/theme/colors.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: white.withOpacity(0.9)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                getContact(),
                SizedBox(
                  height: 25,
                ),
                getPopularStar(),
                SizedBox(
                  height: 25,
                ),
                getTrendingLens(),
                SizedBox(
                  height: 25,
                ),
                getPopularShows(),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ));
  }

  Widget getContact() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick Add",
          style: TextStyle(
              fontSize: 16, color: black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: size.width - 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: darkGrey.withOpacity(0.05),
                  spreadRadius: 2.5,
                  blurRadius: 5,
                  // changes position of shadow
                ),
              ]),
          child: Column(
            children: [
              Column(
                children: List.generate(quick_add_data.length, (index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 12, bottom: 5),
                        child: Row(
                          children: [
                            Container(
                              width: (size.width - 44) * 0.65,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                quick_add_data[index]['img']),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          quick_add_data[index]['name'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          quick_add_data[index]['nickname'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: black.withOpacity(0.4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: (size.width - 44) * 0.35,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.grey.withOpacity(0.4)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          bottom: 8,
                                          top: 8),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Feather.user_plus,
                                            size: 14,
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3),
                                            child: Text(
                                              "Add",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.close,
                                    color: darkGrey.withOpacity(0.7),
                                    size: 16,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                      )
                    ],
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: Text(
                  "View More",
                  style: TextStyle(
                      fontSize: 14, color: black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget getPopularStar() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular Snap Stars",
          style: TextStyle(
              fontSize: 16, color: black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: size.width - 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: darkGrey.withOpacity(0.05),
                  spreadRadius: 2.5,
                  blurRadius: 5,
                  // changes position of shadow
                ),
              ]),
          child: Column(
            children: [
              Column(
                children: List.generate(popular_star_data.length, (index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 12, bottom: 5),
                        child: Row(
                          children: [
                            Container(
                              width: (size.width - 44) * 0.55,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 57,
                                    height: 57,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2, color: white),
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    popular_star_data[index]
                                                        ['img']),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          popular_star_data[index]['name'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          popular_star_data[index]['nickname'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: black.withOpacity(0.4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: (size.width - 44) * 0.45,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.grey.withOpacity(0.4)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          bottom: 8,
                                          top: 8),
                                      child: Row(
                                        children: [
                                          Icon(
                                            AntDesign.like2,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3),
                                            child: Text(
                                              "Subscribe",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                      )
                    ],
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: Text(
                  "View More",
                  style: TextStyle(
                      fontSize: 14, color: black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget getTrendingLens() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Trending Lenses",
              style: TextStyle(
                  fontSize: 16, color: black, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  "Explore Lenses",
                  style: TextStyle(
                      fontSize: 13,
                      color: black.withOpacity(0.5),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: black.withOpacity(0.5),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: size.width - 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: darkGrey.withOpacity(0.05),
                  spreadRadius: 2.5,
                  blurRadius: 5,
                  // changes position of shadow
                ),
              ]),
          child: Column(
            children: [
              Column(
                children: List.generate(trending_lense_data.length, (index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 12, bottom: 5),
                        child: Row(
                          children: [
                            Container(
                              width: (size.width - 44),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: black),
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 3, color: white),
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    trending_lense_data[index]
                                                        ['img']),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          trending_lense_data[index]['name'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          trending_lense_data[index]
                                              ['nickname'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            // color:
                                            // black.withOpacity(0.4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                      )
                    ],
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: Text(
                  "View More",
                  style: TextStyle(
                      fontSize: 14, color: black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget getPopularShows() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular Shows",
          style: TextStyle(
              fontSize: 16, color: black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: size.width - 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: darkGrey.withOpacity(0.05),
                  spreadRadius: 2.5,
                  blurRadius: 5,
                  // changes position of shadow
                ),
              ]),
          child: Column(
            children: [
              Column(
                children: List.generate(popular_show_data.length, (index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 12, bottom: 5),
                        child: Row(
                          children: [
                            Container(
                              width: (size.width - 44),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                popular_show_data[index]
                                                    ['img']),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          popular_show_data[index]['name'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          popular_show_data[index]['nickname'],
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                      )
                    ],
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: Text(
                  "View More",
                  style: TextStyle(
                      fontSize: 14, color: black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: black.withOpacity(0.1)),
                child: Icon(
                  Entypo.user,
                  color: primary,
                  size: 28,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: black.withOpacity(0.1)),
                child: Icon(
                  Feather.search,
                  color: darkGrey,
                  size: 23,
                ),
              )
            ],
          ),
          Text(
            "Discover",
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: black.withOpacity(0.1)),
            child: Icon(
              Feather.user_plus,
              color: darkGrey,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
