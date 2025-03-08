import 'package:flutter/material.dart';
import 'package:peninsula_app/providers/communityProviders.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    final effectiveWidth = deviceWidth > 600 ? 600.0 : deviceWidth;
    final effectiveHeight = deviceHeight > 852 ? 852.0 : deviceHeight;
    double widthRatio = effectiveWidth / 393.0;
    double heightRatio = effectiveHeight / 852.0;
    return ChangeNotifierProvider<Communityprovider>(
      create: (context) {
        final provider = Communityprovider();
        provider.getPosts();
        return provider;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Consumer<Communityprovider>(
          builder: (context, communityprovider, child) {
            return SingleChildScrollView(
              child: Column(
                children: posts(
                    heightRatio: heightRatio,
                    widthRatio: widthRatio,
                    deviceWidth: deviceWidth,
                    posts: communityprovider.posts),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<Widget> posts(
    {required double heightRatio,
    required double widthRatio,
    required double deviceWidth,
    required List<dynamic> posts}) {
  List<Widget> postsWidget = posts
      .map((post) => Column(children: [
            Container(
              height: heightRatio * 48,
              width: widthRatio * 393,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: const Color.fromARGB(112, 0, 0, 0))),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      post['user']['profileImage'].toString(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    post['user']['firstName'].toString() + post['user']['lastName'].toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: deviceWidth,
              child: Image.network(
                post['locationPath'].toString(),
              ),
            ),
            Container(
              width: deviceWidth,
              // height: heightRatio * 53,
              decoration: BoxDecoration(
                // border: Border(bottom: BorderSide(color: Colors.black)),
                color: Colors.white,
              ),
              padding: const EdgeInsets.only(left: 17),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(post['caption'].toString().trimRight()), Text(postedDateTime(post['createdTime'].toString()))],
                ),
              ),
            ),
          ]))
      .toList();
  return postsWidget;
}
