import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../Credit Managament/credit_clearance.dart';
import '../Financial Report/finanacialPdfDemo.dart';
import '../Notification/controller/notificationController.dart';
import '../Notification/notificationScreen.dart';
import '../Party Pament/party_payment.dart';
import 'AddCustomerOrder.dart';
import 'customerListings.dart';
import 'customerOrderList.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  void initState() {
    super.initState();
    final data = Provider.of<NotificationClass>(context, listen: false);
    data.fetchCount(context);
  }

  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final count = Provider.of<NotificationClass>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(
            Icons.search,
            color: Color(0xff2c51a4),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()));
            },
            child: Stack(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.grey,
                    size: 30,
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const NotificationPage()));
                  },
                ),
                if (count.notificationCountModel?.unreadCount!= null)
                  Positioned(
                    right: 11,
                    top: 11,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        "${count.notificationCountModel?.unreadCount}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                else
                  Container()
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
        leading: const Icon(
          Icons.person,
          color: Colors.orange,
        ),
        title: Column(
          children: const [
            Text(
              'Hello',
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Admin',
              style: TextStyle(color: Colors.blueGrey, fontSize: 20),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(-1.0, -0.94),
                        end: Alignment(0.968, 1.0),
                        colors: [Color(0xff2c51a4), Color(0xff6b88e8)],
                        stops: [0.0, 1.0],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100.0),
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                      ),
                      color: Colors.blue),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 200.0),
                      child: Text(
                        'Soori IMS',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
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
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      (context),
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddPropertyTabPage())),
                                  child: Container(
                                    height: 75,
                                    width: 75,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.person,
                                            color: Color(0xff2C51A4),
                                            size: 30,
                                          ),
                                          Text(
                                            "Create",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff2C51A4)),
                                          ),
                                          Text(
                                            "Order",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff2C51A4)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffeff3ff),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0xffeff3ff),
                                          offset: Offset(-2, -2),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                // Badge(
                                // badgeColor: Colors.white,
                                // badgeContent: Text(
                                //   "$_counter",
                                //   style: const TextStyle(color: Colors.white),
                                // ),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CustomerOrderListScreen())),
                                  child: Container(
                                    height: 75,
                                    width: 75,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.person,
                                            color: Color(0xff2C51A4),
                                            size: 30,
                                          ),
                                          Text(
                                            "Customer",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff2C51A4)),
                                          ),
                                          Text(
                                            "Order",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff2C51A4)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffeff3ff),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0xffeff3ff),
                                          offset: Offset(-2, -2),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // ),
                                const SizedBox(
                                  width: 30,
                                ),
                                // Badge(
                                //   badgeColor: const Color(0xff2C51A4),
                                //   badgeContent: Text(
                                //     "$_counter",
                                //     style: const TextStyle(color: Colors.white),
                                //   ),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CustomerListings())),
                                  child: Container(
                                    height: 75,
                                    width: 75,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.person,
                                            color: Color(0xff2C51A4),
                                            size: 30,
                                          ),
                                          Text(
                                            "Customer",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff2C51A4)),
                                          ),
                                          Text(
                                            "List",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff2C51A4)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffeff3ff),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0xffeff3ff),
                                          offset: Offset(-2, -2),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PartyPayment()));
                                  },
                                  child: Container(
                                    height: 75,
                                    width: 75,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.person,
                                            color: Color(0xff2C51A4),
                                            size: 30,
                                          ),
                                          Text(
                                            "Party",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff2C51A4)),
                                          ),
                                          Text(
                                            "Payment",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff2C51A4)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffEFF3FF),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0xffeff3ff),
                                          offset: Offset(-2, -2),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                // Container(
                                //   height: 75,
                                //   width: 75,
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(8.0),
                                //     child: Column(
                                //       children: const [
                                //         Icon(
                                //           Icons.person,
                                //           color: Color(0xff2C51A4),
                                //           size: 30,
                                //         ),
                                //         Text(
                                //           "Pickup",
                                //           style: TextStyle(
                                //               fontWeight: FontWeight.bold,
                                //               fontSize: 12,
                                //               color: Color(0xff2C51A4)),
                                //         ),
                                //         Text(
                                //           "Verify",
                                //           style: TextStyle(
                                //               fontWeight: FontWeight.bold,
                                //               fontSize: 12,
                                //               color: Color(0xff2C51A4)),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                //   decoration: BoxDecoration(
                                //     color: const Color(0xffeff3ff),
                                //     borderRadius: BorderRadius.circular(10),
                                //     boxShadow: const [
                                //       BoxShadow(
                                //         color: Color(0xffeff3ff),
                                //         offset: Offset(-2, -2),
                                //         spreadRadius: 1,
                                //         blurRadius: 10,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // const SizedBox(
                                //   width: 30,
                                // ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CreditClearance()));
                                  },
                                  child: Container(
                                    height: 75,
                                    width: 75,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.person,
                                            color: Color(0xff2C51A4),
                                            size: 30,
                                          ),
                                          Text(
                                            "Credit ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff2C51A4)),
                                          ),
                                          Text(
                                            "Clearance",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff2C51A4)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffeff3ff),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0xffeff3ff),
                                          offset: Offset(-2, -2),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            InkWell(
                              // onTap: generateInvoice,
                              onTap: () async {
                                final status =
                                    await Permission.storage.request();
                                if (status.isGranted) {
                                  generateInvoice();
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Permission Deined");
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 105,
                                child: const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      "View More",
                                      style:
                                          TextStyle(color: Color(0xff2C51A4)),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xffeff3ff),
                                      offset: Offset(5, 8),
                                      spreadRadius: 5,
                                      blurRadius: 12,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
