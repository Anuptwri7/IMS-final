import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fl_chart/fl_chart.dart';
import 'package:easycare/Login/login_screen.dart';
import 'package:easycare/model/userModel.dart';
import 'package:easycare/service/user_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constant/ApiConstant.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  _ProfileTabPageState createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  String? userId;
  String? username;
  String? email;
  String? address;
  String? mobilenumber;
  int? gender;
  String? created_date_bs;

  List<User> user = [];

  File? imageFile;
  @override
  void initState() {
    fetchUserData().then((result) {
      setState(() {
        user = result;
        username = user[0].userName.toString();
        email = user[0].email.toString();
        address = user[0].address.toString();
        mobilenumber = user[0].mobileNo.toString();
        gender = user[0].gender;
        created_date_bs = user[0].createdDateBs;
        log(user[0].userName.toString());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        color: Colors.white,
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    gradient: LinearGradient(
                      begin: Alignment(-1.0, -0.94),
                      end: Alignment(0.968, 1.0),
                      colors: [Color(0xff2c51a4), Color(0xff6b88e8)],
                      stops: [0.0, 1.0],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(65),
                            child: imageFile == null
                                ? Image.network(
                                    "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png",
                                    fit: BoxFit.fill,
                                  )
                                : Image.file(
                                    imageFile!,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            _showImageDialog();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                shape: BoxShape.circle,
                                color: Colors.red),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "$username",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '$email',
              style: const TextStyle(color: Colors.blueGrey, fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 90,
              margin: const EdgeInsets.only(right: 10, left: 10),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x155665df),
                    spreadRadius: 5,
                    blurRadius: 17,
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(18.0),
                ),
                color: Color(0x155665df),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              address == '' ? "Anonymous" : "$address",
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              gender == 1 ? "Male" : "Female",
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.date_range_rounded,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "$created_date_bs",
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                mobilenumber == '' ? "+97712345678" : "$mobilenumber",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            LineCharts(),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                final response = await http.post(
                  Uri.parse(ApiConstant.baseUrl + ApiConstant.logout),
                  headers: {
                    'Content-type': 'application/json',
                    'Accept': 'application/json',
                  },
                  body: json.encode({
                    'refresh':
                        sharedPreferences.get("refresh_token").toString(),
                  }),
                );
                try {
                  if (response.statusCode == 200) {
                    sharedPreferences.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Error while logging out!')));
                  }
                } catch (e) {
                  throw Exception(e);
                }
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                     color: const Color(0xff2658D3).withOpacity(0.5),
                   ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      FaIcon(FontAwesomeIcons.rightFromBracket),
                      Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Please choose an option"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    _getFromCamera();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.camera,
                          color: Colors.purple,
                        ),
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(color: Colors.purple),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _getFromGallery();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.image,
                          color: Colors.purple,
                        ),
                      ),
                      Text(
                        "gallery",
                        style: TextStyle(color: Colors.purple),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
    // _cropImage(pickedFile!.path);
    Navigator.pop(context);
  }

  void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
    // _cropImage(pickedFile!.path);
    Navigator.pop(context);
  }

  // void _cropImage(filePath) async {
  //   File? croppedImage = await ImageCropper.cropImage(
  //     sourcePath: filePath,
  //     maxHeight: 1080,
  //     maxWidth: 1080,
  //   );
  //   if (croppedImage != null) {
  //     imageFile = croppedImage;
  //   }
  // }
}
class LineCharts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const cutOffYValue = 0.0;
    const yearTextStyle =
    TextStyle(fontSize: 12, color: Colors.black);

    return Padding(
      padding: const EdgeInsets.only(right:20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 190,
        child: LineChart(
          LineChartData(
            borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.white30, width: 1)),

            lineTouchData: LineTouchData(enabled: false),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 1),
                  FlSpot(1, 1),
                  FlSpot(2, 3),
                  FlSpot(3, 4),
                  FlSpot(3, 6),
                  FlSpot(4, 4)
                ],
                isCurved: true,
                barWidth: 2,
                isStrokeCapRound: true,

                colors: [
                  Colors.blue,
                ],



                dotData: FlDotData(

                  show: true,
                ),
              ),
            ],

            minY: 0,
            titlesData: FlTitlesData(
              bottomTitles: SideTitles(
                  showTitles: true,

                  getTitles: (value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'week 1';
                      case 1:
                        return 'week 2';
                      case 2:
                        return 'week 3';
                      case 3:
                        return 'week 4';
                      case 4:
                        return 'week 5';
                      default:
                        return '';
                    }
                  }),
              leftTitles: SideTitles(
                showTitles: true,
                getTitles: (value) {
                  return ' ${value + 0}';
                },
              ),
            ),
            axisTitleData: FlAxisTitleData(
                leftTitle: AxisTitle(showTitle: true,
                    // titleText: 'Value', margin: 10
                ),
                bottomTitle: AxisTitle(
                    showTitle: true,
                    margin: 10,
                    // titleText: 'Year',
                    textStyle: yearTextStyle,
                    textAlign: TextAlign.right)),
            gridData: FlGridData(
              show: true,
              checkToShowHorizontalLine: (double value) {
                return value == 1 || value == 2 || value == 3 || value == 4|| value == 5|| value == 6|| value == 7|| value == 8;
              },
            ),
          ),
        ),
      ),
    );
  }
}