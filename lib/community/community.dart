import 'package:flutter/material.dart';
import 'package:peninsula_app/providers/communityProviders.dart';
import 'package:provider/provider.dart';

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
          builder: (context, Communityprovider, child) {
            return SingleChildScrollView(
              child: Column(
                children: posts(
                    heightRatio: heightRatio,
                    widthRatio: widthRatio,
                    deviceWidth: deviceWidth,
                    posts: Communityprovider.posts),
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
  // List<Widget> posts = posts.map((posts)
  
  // );

  List<Widget> posts = [];


  // int numberOfPosts = posts.length;
  int numberOfPosts = 10;

  while (numberOfPosts-- > 0) {
    Widget eachPost = Column(children: [
      Container(
        height: heightRatio * 48,
        width: widthRatio * 393,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(
                'assets/images/facebookLogo.png',
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Facebook',
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
        child: Image.asset(
          'assets/images/aa.png',
        ),
      ),
      Container(
        width: deviceWidth,
        height: heightRatio * 47,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("Caption"), Text("date")],
        ),
      ),
    ]);
    posts.add(eachPost);
  }

  return posts;
}
