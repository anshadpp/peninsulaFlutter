import 'package:flutter/material.dart';
import 'package:peninsula_app/utils.dart';
import 'providers/registrationProviders.dart';
import 'package:provider/provider.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final formkey = GlobalKey<FormState>();

  // Future<void> registration() async {
  //   debugPrint("working");
  // }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    // final registrationProvider = Provider.of<Registrationprovider>(context);

    final effectiveWidth = deviceWidth > 600 ? 600.0 : deviceWidth;
    final effectiveHeight = deviceHeight > 852 ? 852.0 : deviceHeight;

    double widthRatio = effectiveWidth / 393.0;
    double heightRatio = effectiveHeight / 852.0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 600,
        ),
        child: Consumer<Registrationprovider>(
          builder: (context, registrationProvider, child) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: registrationAndLoginBackground(),
              child: Stack(
                children: [
                  Positioned(
                    top: heightRatio * 137,
                    left: widthRatio * 160,
                    child: Container(
                      alignment: Alignment(100.0, 100.0),
                      width: widthRatio * 85,
                      height: heightRatio * 97.81,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/logo_registration.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Positioned(
                    top: heightRatio * 372,
                    child: Container(
                      width: widthRatio * 393,
                      height: heightRatio * 800,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(8, 55, 60, 0.65),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            // top: heightRatio * 372,
                            child: Container(
                              width: widthRatio * 393,
                              height: heightRatio * 55,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(8, 55, 60, 0.65),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Registration",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Form(
                      key: formkey,
                      child: Stack(
                        children: [
                          regField(
                            heightRatio: heightRatio,
                            widthRatio: widthRatio,
                            left: 32,
                            top: 477,
                            width: 329,
                            textField: labelNameUtil(
                                labelName: "First Name",
                                opacity: 0.3,
                                textController: registrationProvider
                                    .firstName_text_controller),
                          ),
                          regField(
                            heightRatio: heightRatio,
                            widthRatio: widthRatio,
                            left: 32,
                            top: 541,
                            width: 329,
                            textField: labelNameUtil(
                                labelName: "Last Name",
                                opacity: 0.3,
                                textController: registrationProvider
                                    .lastName_text_controller),
                          ),
                          regField(
                            heightRatio: heightRatio,
                            widthRatio: widthRatio,
                            left: 32,
                            top: 605,
                            width: 329,
                            textField: labelNameUtil(
                                labelName: "Email ID",
                                opacity: 0.3,
                                textController:
                                    registrationProvider.email_text_controller),
                          ),
                          regField(
                            heightRatio: heightRatio,
                            widthRatio: widthRatio,
                            left: 32,
                            top: 669,
                            width: 329,
                            textField: labelNameUtil(
                                labelName: "Phone Number",
                                opacity: 0.3,
                                textController: registrationProvider
                                    .phoneNumber_text_controller),
                          ),
                        ],
                      )),
                  registrationProvider.loading
                      ? Positioned(
                          top: heightRatio * 484,
                          left: widthRatio * 180,
                          child: CircularProgressIndicator(
                            color: Color(0xFF11998E),
                          ),
                        )
                      : button(
                          heightRatio: heightRatio,
                          widthRatio: widthRatio,
                          formkey: formkey,
                          top: 757,
                          width: 329,
                          left: 32,
                          radius: 25,
                          title: "Signup",
                          functionName: registrationProvider.registration,
                          snackbar: () => registrationProvider.success
                              ? ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(registrationProvider.message),
                                  backgroundColor: Colors.green,
                                ))
                              : ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(registrationProvider.message),
                                  backgroundColor:
                                      const Color.fromARGB(255, 241, 63, 23),
                                )),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
