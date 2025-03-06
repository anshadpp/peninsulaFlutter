import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
      color: Colors.white,             
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
  width: MediaQuery.of(context).size.width,
  child: Image.asset(
              'assets/images/aa.png', 
            ),
),



            // Container(
            //   width: widthRatio * 393,
            //   height: heightRatio * 48,
            //   decoration: BoxDecoration(
            //     border: Border(
            //       top: BorderSide(
            //         color: const Color.fromARGB(255, 141, 64, 64),
            //       ),
            //     ),
            //     color: Colors.white,
            //   ),
            //   child: Stack(
            //     children: [
            //       Positioned(
            //         left: widthRatio * 11,
            //         child: CircleAvatar(
            //           backgroundColor: Colors.blue,
            //           radius: widthRatio * 20,
            //         ),
            //       ),
            //       Positioned(
            //         // top: heightRatio * 224,
            //         left: widthRatio * 54,
            //           child: Container(
            //             // alignment: Alignment.center,
            //             height: heightRatio * 48,
            //             width: widthRatio * 393,
            //             child: Text(
            //                                 "data",
            //                                 style: TextStyle(color: Colors.black26),
            //                               ),
            //           )),
            //       Positioned(
            //         left: widthRatio * 376,
            //         child: Icon(Icons.more_vert_rounded)),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
