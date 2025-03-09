import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color hexToColor(String hex) {
  hex = hex.replaceAll("#", "");

  if (hex.length == 6) {
    hex = "FF$hex";
  }

  return Color(int.parse(hex, radix: 16));
}

BoxDecoration registrationAndLoginBackground() {
  return BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/images/loginbg.png"), fit: BoxFit.cover));
}

Positioned regField(
    {required top,
    required Widget textField,
    required double heightRatio,
    required double widthRatio,
    required double left,
    required double width}) {
  return Positioned(
    top: heightRatio * top,
    left: widthRatio * left,
    child: Container(
      alignment: Alignment.center,
      width: widthRatio * width,
      height: heightRatio * 52.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: const Color.fromARGB(63, 88, 86, 86))),
      child: textField,
    ),
  );
}

TextFormField labelNameUtil(
    {required String labelName,
    required double opacity,
    required TextEditingController textController}) {
  return TextFormField(
    controller: textController,
    validator: (value) {
      if (value != null) {
        if (value.isNotEmpty) {
          return null;
        } else {
          return "You must Enter a $labelName";
        }
      } else {
        return "You Have not enter any value";
      }
    },
    decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        filled: true,
        fillColor: Color(0xFF11998E).withOpacity(opacity),
        labelText: labelName,
        labelStyle: TextStyle(color: Colors.white)),
  );
}

Positioned button({
  required double heightRatio,
  required double widthRatio,
  required double top,
  required double left,
  required double width,
  required double radius,
  required String title,
  required GlobalKey<FormState> formkey,
  required Future<void> Function() functionName,
  required void Function() snackbar,
}) {
  return Positioned(
    top: heightRatio * top,
    left: widthRatio * left,
    child: GestureDetector(
      onTap: () async {
        if (formkey.currentState!.validate()) {
          await functionName();

          snackbar();
        }
      },
      child: Container(
        width: widthRatio * width,
        height: heightRatio * 52,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            gradient: LinearGradient(
                colors: [hexToColor("#38EF7D"), hexToColor("#11998E")])),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

//posted date calculation

String postedDateTime(String postDateTime) {
  DateTime postTime = DateTime.parse(postDateTime);
  DateTime nowTime = DateTime.now();
  Duration difference = nowTime.difference(postTime);

  if (difference.inSeconds < 60) {
    return "${difference.inSeconds} sec ago";
  }
  if (difference.inMinutes < 60) {
    return "${difference.inMinutes} min ago";
  }

  if (difference.inHours < 24) {
    return "${difference.inHours} hours ago";
  }

  if (difference.inDays < 7) {
    return "${difference.inDays} days ago";
  }

  if (postTime.year == nowTime.year) {
    return DateFormat("MMMM d").format(postTime);
  }

  return DateFormat("yyyy MMMM d").format(postTime);
}

List<Widget> backButton(
    {required double heightRatio,
    required double widthRatio,
    required BuildContext context}) {
  List<Widget> backButton = [
    Positioned(
      top: heightRatio * 37,
      left: widthRatio * 2,
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    Positioned(
      top: heightRatio * 50,
      left: widthRatio * 30,
      child: Text(
        "Back",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ];
  return backButton;
}
