import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Constant/ApiConstant.dart';
import '../model/customer_order_list.dart';
import '../model/order_summary_list.dart';

class ListingServices {
  // List<OrderSummaryList> allOrder = <OrderSummaryList>[];

  Future fetchOrderListFromUrl(String search) async {
    // CustomerList? custom erList;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final response = await http.get(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.orderMaster + search),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
        });

    try {
      if (response.statusCode == 200) {
        return response.body;
      } else {
        log("${response.statusCode}");
        return <CustomerOrderList>[];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future fetchOrderSummaryListFromUrl(String id) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final response = await http.get(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.orderSummary + id),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
        });
    // log(response.body);

    try {
      if (response.statusCode == 200) {
        return response.body;
      } else {
        log("${response.statusCode}");
        return <OrderSummaryList>[];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future cancelOrderFromUrl(String id) async {
    log("This is cancel order id :::$id");
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final response = await http.patch(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.cancelOrder + id),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
        },
        body: json.encode({"status": 3}));

    try {
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future CancelSingleOrderFromUrl(String id) async {
    log("This is cancel single order id :::$id");
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final response = await http.patch(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.cancelSingleOrder + id),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
        },
        body: json.encode({"remarks": "Cancel", "cancelled": true}));

    try {
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future fetchOrderDetailsFromUrl(String id) async {
  //   // CustomerList? custom erList;
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   final response = await http.get(
  //       Uri.parse(
  //           "https://api-soori-ims-staging.dipendranath.com.np/api/v1/customer-order-app/order-detail/$id"),
  //       headers: {
  //         'Content-type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
  //       });

  //   try {
  //     if (response.statusCode == 200) {
  //       return response.body;
  //     }
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
}
