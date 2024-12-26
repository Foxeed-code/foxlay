import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HttpApi {
  HttpApi._();

  static Future<Map> put(String url, Map<String, dynamic> body) async {
    String baseUrl = "https://foxeed.in/safe-lab-api/test-api.php?";
    Map data = {};
    await http
        .put(
      Uri.parse(baseUrl + url),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        //"Accept" : "application/json"
      },
      body: jsonEncode(body),
    )
        .then((response) async {
      if (response.statusCode == 200) {
        var data1 = jsonDecode(response.body);
        if (data1["success"] == 1) {
          //print("Rdata: $data");
          data = data1;
        } else {
          Get.snackbar("Your Data Not Updated?", "Please Recheck Your Data.",
              duration: const Duration(seconds: 5),
              icon: const Icon(
                Icons.dataset,
                color: Colors.black54,
              ),
              snackPosition: SnackPosition.BOTTOM,
              padding: const EdgeInsets.all(15),
              backgroundColor: Colors.cyanAccent,
              colorText: Colors.black);
          data = {};
        }
      } else {
        Get.snackbar("Check Internet Connection?", "Please Check Your Mobile Data or Wifi Internet Connection.",
            duration: const Duration(seconds: 5),
            icon: const Icon(
              Icons.signal_cellular_connected_no_internet_0_bar_sharp,
              color: Colors.black54,
            ),
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(15),
            backgroundColor: Colors.cyanAccent,
            colorText: Colors.black);
        data = {};
      }
    });
    return data;
  }

  static Future<http.Response> get(String url) async {
    String baseUrl = "https://foxeed.in/safe-lab-api/test-api.php?";
    return await http.get(Uri.parse(baseUrl + url));
  }

  static Future<http.Response> post(String url, Map<String, dynamic> body) async {
    String baseUrl = "https://foxeed.in/safe-lab-api/test-api.php?";
    return await http.post(Uri.parse(baseUrl + url), body: body);
  }

  static Future<http.Response> delete(String url) async {
    String baseUrl = "https://foxeed.in/safe-lab-api/test-api.php?";
    return await http.delete(Uri.parse(baseUrl + url));
  }
}
