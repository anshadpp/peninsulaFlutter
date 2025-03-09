import 'package:flutter/material.dart';
import 'package:peninsula_app/providers/communityProviders.dart';
import 'package:peninsula_app/utils/actionHandling.dart';
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
                    posts: communityprovider.posts,
                    showSnackBar: (String message) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          message,
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 247, 251, 247),
                      ));
                    }),
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
    required List<dynamic> posts,
    required Function showSnackBar}) {
  List<Widget> postsWidget = posts
      .map((post) => Column(children: [
            Container(
              height: heightRatio * 48,
              width: widthRatio * 393,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: const Color.fromARGB(41, 0, 0, 0))),
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
                    post['user']['firstName'].toString() +
                        post['user']['lastName'].toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        ...(post['actions'] as List<dynamic>?)
                                ?.map(
                                  (action) => PopupMenuItem(
                                    value: action,
                                    child: Text(
                                      action['title'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                                .toList() ??
                            [],
                      ];
                    },
                    icon: Icon(Icons.more_vert),
                    color: Colors.black,
                    onSelected: (dynamic action) async {
                      String message = "";
                      switch (action['actionType'].toString()) {
                        case "request":
                          message =
                              requestAction(action['redirectTo'].toString());
                          break;
                        case "redirect":
                          message = await redirectAction(action);

                          break;
                        default:
                          break;
                      }
                      showSnackBar(message);
                    },
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
            Column(
              children: [
                Container(
                  width: deviceWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(left: 17),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(post['caption'].toString().trimRight().isNotEmpty)
                          Text(post['caption'].toString().trimRight().trimLeft()),
                        
                        Text(postedDateTime(post['createdTime'].toString()))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Container(
            //   width: deviceWidth,
            //   // height: heightRatio * 53,
            //   decoration: BoxDecoration(
            //     // border: Border(bottom: BorderSide(color: Colors.black)),
            //     color: Colors.white,
            //   ),
            //   padding: const EdgeInsets.only(left: 17),
            //   child: Expanded(
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(post['caption'].toString().trimRight()),
            //           Text(postedDateTime(post['createdTime'].toString()))
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ]))
      .toList();
  return postsWidget;
}
