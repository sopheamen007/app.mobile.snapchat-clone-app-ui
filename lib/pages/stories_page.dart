import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:snapchat_ui/data/discover_json.dart';
import 'package:snapchat_ui/data/stories_json.dart';
import 'package:snapchat_ui/pages/story_detail_page.dart';
import 'package:snapchat_ui/theme/colors.dart';
import 'package:page_transition/page_transition.dart';

class StoriesPage extends StatefulWidget {
  @override
  _StoriesPageState createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          color: white),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
              child: Text(
                "For You",
                style: TextStyle(
                    fontSize: 16, color: black, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(stories_data.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.scale,
                              alignment: Alignment.bottomCenter,
                              child: StoryDetailPage(
                                videoUrl: stories_data[index]['videoUrl'],
                              )));
                    },
                    child: Container(
                      width: (size.width - 30) / 2,
                      height: 250,
                      child: Stack(
                        children: [
                          Container(
                            width: (size.width - 30) / 2,
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        (stories_data[index]['img'])),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: (size.width - 15) / 2,
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      black.withOpacity(0.25),
                                      black.withOpacity(0),
                                    ],
                                    end: Alignment.topCenter,
                                    begin: Alignment.bottomCenter)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    stories_data[index]['name'],
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 10, bottom: 10),
                                  child: Text(
                                    stories_data[index]['date'],
                                    style: TextStyle(
                                        color: white.withOpacity(0.7),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
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
            "Stories",
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
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
              SizedBox(
                width: 10,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: black.withOpacity(0.1)),
                child: Icon(
                  Entypo.dots_three_horizontal,
                  color: darkGrey,
                  size: 20,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
