import 'package:flutter/material.dart';

import '../stock management/stockAnalysisByBatch.dart';
import '../stock management/stock_anaysis.dart';

class StockAnaysisTabPage extends StatefulWidget {
  const StockAnaysisTabPage({Key? key}) : super(key: key);

  @override
  _StockAnaysisTabPageState createState() => _StockAnaysisTabPageState();
}

class _StockAnaysisTabPageState extends State<StockAnaysisTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Stock Management',
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
                  width: MediaQuery.of(context).size.width,
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
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40.0, left: 10, right: 20),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 60,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        (context),
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const StockAnalysisPage())),
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
                                              "Stock ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Color(0xff2C51A4)),
                                            ),
                                            Text(
                                              "Analysis",
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
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        (context),
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const StockAnalysisByBatchPage())),
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
                                              "Analysis",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Color(0xff2C51A4)),
                                            ),
                                            Text(
                                              "By Batch",
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
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  GestureDetector(
                                    // onTap: () => Navigator.push(
                                    //     (context),
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const StockAnalysisByLocationPage())),
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
                                              "Analysis",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Color(0xff2C51A4)),
                                            ),
                                            Text(
                                              "Location",
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
                                  Container(
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
                                            "Pack",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff2C51A4)),
                                          ),
                                          Text(
                                            "Info",
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
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Container(
                //   padding: const EdgeInsets.all(30),
                //   child: Column(
                //     children: [
                //       Row(
                //         children: [
                //           GestureDetector(
                //             onTap:()=>Navigator.push((context), MaterialPageRoute(builder: (contetx)=>const StockAnaysisTabPage())),
                //             child: Container(
                //               height: 75,
                //               width: 75,
                //               child: const Padding(
                //                 padding: EdgeInsets.only(top:20,left: 10),
                //                 child: Text("Customer Order"
                //                 , style:  TextStyle(fontWeight: FontWeight.bold),
                //                 ),
                //               ),
                //               decoration: BoxDecoration(
                //                 color: Colors.grey.shade300,
                //                 borderRadius: BorderRadius.circular(22),
                //                 boxShadow: [
                //                   BoxShadow(
                //                     color: Colors.grey.shade500,
                //                     offset: const Offset(-4,-4),
                //                     spreadRadius: 1,
                //                     blurRadius: 10,
                //
                //                   ),
                //                 ],
                //               ),
                //
                //             ),
                //           ),
                //                const SizedBox(width: 30,),
                //
                //
                //                   Badge(
                //                    badgeContent: Text(
                //                        "$_counter"
                //                        ),
                //                    child: Container(
                //                      height: 75,
                //                      width: 75,
                //                      child: const Padding(
                //                        padding: EdgeInsets.only(top:15,left: 10),
                //                        child:  Text("Customer Order Verified"
                //                          , style: TextStyle(fontWeight: FontWeight.bold),
                //                        ),
                //                      ),
                //                      decoration: BoxDecoration(
                //                        color: Colors.grey.shade300,
                //                        borderRadius: BorderRadius.circular(22),
                //                        boxShadow: [
                //                          BoxShadow(
                //                              color: Colors.grey.shade500,
                //                              offset: const Offset(-4,-4),
                //                              spreadRadius: 1,
                //                            blurRadius: 10,
                //
                //                          ),
                //                        ],
                //                      ),
                //
                //                    ),
                //
                //                  ),
                //
                //
                //           const SizedBox(width: 30,),
                //           Badge(
                //             badgeContent: Text(
                //                 "$_counter"
                //             ),
                //             child: Container(
                //               height: 75,
                //               width: 75,
                //               child: const Padding(
                //                 padding: EdgeInsets.only(top:20,left: 10),
                //                 child: const Text("Pending Order"
                //                   , style: const TextStyle(fontWeight: FontWeight.bold),
                //                 ),
                //               ),
                //               decoration: BoxDecoration(
                //                 color: Colors.grey.shade300,
                //                 borderRadius: BorderRadius.circular(22),
                //                 boxShadow: [
                //                   BoxShadow(
                //                     color: Colors.grey.shade500,
                //                     offset: const Offset(-4,-4),
                //                     spreadRadius: 1,
                //                     blurRadius: 10,
                //
                //                   ),
                //                 ],
                //               ),
                //
                //             ),
                //           ),
                //         ],
                //
                //       ),
                //       const SizedBox(height: 25,),
                //       Row(
                //         children: [
                //           Container(
                //             height: 75,
                //             width: 75,
                //             child: const Padding(
                //               padding: EdgeInsets.only(top:20,left: 10),
                //               child: const Text("Xyz"
                //                 , style: TextStyle(fontWeight: FontWeight.bold),
                //               ),
                //             ),
                //             decoration: BoxDecoration(
                //               color: Colors.grey.shade300,
                //               borderRadius: BorderRadius.circular(22),
                //               boxShadow: [
                //                 BoxShadow(
                //                   color: Colors.grey.shade500,
                //                   offset: const Offset(-4,-4),
                //                   spreadRadius: 1,
                //                   blurRadius: 10,
                //
                //                 ),
                //               ],
                //             ),
                //
                //           ),
                //           const SizedBox(width: 30,),
                //           Container(
                //             height: 75,
                //             width: 75,
                //             child: const Padding(
                //               padding: EdgeInsets.only(top:20,left: 10),
                //               child: Text("ABC"
                //                 , style: TextStyle(fontWeight: FontWeight.bold),
                //               ),
                //             ),
                //             decoration: BoxDecoration(
                //               color: Colors.grey.shade300,
                //               borderRadius: BorderRadius.circular(22),
                //               boxShadow: [
                //                 BoxShadow(
                //                   color: Colors.grey.shade500,
                //                   offset: const Offset(-4,-4),
                //                   spreadRadius: 1,
                //                   blurRadius: 10,
                //
                //                 ),
                //               ],
                //             ),
                //
                //           ),
                //           const SizedBox(width: 30,),
                //           Container(
                //             height: 75,
                //             width: 75,
                //             child: const Padding(
                //               padding: EdgeInsets.only(top:20,left: 10),
                //               child: const Text("xYZ"
                //                 , style: TextStyle(fontWeight: FontWeight.bold),
                //               ),
                //             ),
                //             decoration: BoxDecoration(
                //               color: Colors.grey.shade300,
                //               borderRadius: BorderRadius.circular(22),
                //               boxShadow: [
                //                 BoxShadow(
                //                   color: Colors.grey.shade500,
                //                   offset: const Offset(-4,-4),
                //                   spreadRadius: 1,
                //                   blurRadius: 10,
                //
                //                 ),
                //               ],
                //             ),
                //
                //           ),
                //         ],
                //
                //       ),
                //
                //     ],
                //   ),
                // ),
                // Container(
                //   height: 200,
                //   width: MediaQuery.of(context).size.width,
                //   child: Padding(
                //     padding: const EdgeInsets.all(.0),
                //     child: Table(
                //       columnWidths: {
                //         0 : FlexColumnWidth(3),
                //         1 : FlexColumnWidth(1),
                //       },
                //       border: TableBorder(horizontalInside: BorderSide(width: 1,color: Colors.grey.withOpacity(0.5),style: BorderStyle.solid,)
                //       ),
                //       children: [
                //         TableRow(
                //             decoration: BoxDecoration(
                //               color: Colors.grey.shade400.withOpacity(0.4),
                //               borderRadius: BorderRadius.circular(10),
                //             ),
                //             children :[
                //
                //               Padding(
                //                 padding: EdgeInsets.all(8.0),
                //                 child: Text('Verified Order',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                //               ),
                //               Padding(
                //                 padding: EdgeInsets.all(8.0),
                //                 child: Text('2',style: TextStyle(fontWeight: FontWeight.bold)),
                //               ),
                //
                //
                //             ]),
                //         TableRow(
                //             decoration: BoxDecoration(
                //               color: Colors.grey.shade400.withOpacity(0.4),
                //               borderRadius: BorderRadius.circular(10),
                //             ),
                //             children :[
                //
                //               Padding(
                //                 padding: EdgeInsets.all(8.0),
                //                 child: Text('Pending Orders',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                //               ),
                //               Padding(
                //                 padding: EdgeInsets.all(8.0),
                //                 child: Text('5',style: TextStyle(fontWeight: FontWeight.bold)),
                //               ),
                //
                //
                //             ]),
                //         TableRow(
                //             decoration: BoxDecoration(
                //               color: Colors.grey.shade400.withOpacity(0.4),
                //               borderRadius: BorderRadius.circular(10),
                //             ),
                //             children :[
                //
                //               Padding(
                //                 padding: EdgeInsets.all(8.0),
                //                 child: Text('Verified Order',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                //               ),
                //               Padding(
                //                 padding: EdgeInsets.all(8.0),
                //                 child: Text('2',style: TextStyle(fontWeight: FontWeight.bold)),
                //               ),
                //
                //
                //             ]),
                //         TableRow(
                //             decoration: BoxDecoration(
                //               color: Colors.grey.shade400.withOpacity(0.4),
                //               borderRadius: BorderRadius.circular(10),
                //             ),
                //             children :[
                //
                //               Padding(
                //                 padding: EdgeInsets.all(8.0),
                //                 child: Text('Pending Orders',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                //               ),
                //               Padding(
                //                 padding: EdgeInsets.all(8.0),
                //                 child: Text('5',style: TextStyle(fontWeight: FontWeight.bold)),
                //               ),
                //
                //
                //             ]),
                //       ],
                //     ),
                //   ),
                //   decoration: BoxDecoration(
                //     color: Colors.grey.shade300,
                //     borderRadius: BorderRadius.circular(22),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.shade500,
                //         offset: Offset(-4,-4),
                //         spreadRadius: 1,
                //         blurRadius: 10,
                //
                //       ),
                //     ],
                //   ),
                //
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
