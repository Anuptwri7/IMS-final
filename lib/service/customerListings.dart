import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Constant/ApiConstant.dart';

class CustomerListingsService {
  Future fetchCustomerListFromUrl(String search) async {
    // CustomerList? custom erList;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final response = await http.get(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.allCustomer + search),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
        });

    log(response.body);

    try {
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
