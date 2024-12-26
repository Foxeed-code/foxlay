import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CheckingInternet {
  static Future<int> checking() async {
    try {
      final url = Uri.https('google.com');
      var response = await http.head(url);
      if (response.statusCode == 200) {
        return 1;
      } else {
        Get.dialog(
          //barrierDismissible: false,
            Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red, width: 2),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('no_internet_connection'.tr,
                          style: const TextStyle(color: Colors.black87, fontSize: 18)),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    // Image.asset(AppImage.internetConnection,height:30),
                    Text('please_check_your_internet_connection'.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black87, fontSize: 15)),
                    const SizedBox(
                      height: 5,
                    ),
                    MaterialButton(
                      color: Colors.red,
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'try_again'.tr,
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ));
        return 0;
      }
    } catch (e) {
      Get.dialog(
        //barrierDismissible: false,
          Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red, width: 2),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text('no_internet_connection'.tr,
                        style: const TextStyle(color: Colors.black87, fontSize: 18)),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  // Image.asset(AppImage.internetConnection,height:30),
                  Text('please_check_your_internet_connection'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black87, fontSize: 15)),
                  const SizedBox(
                    height: 5,
                  ),
                  MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'try_again'.tr,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ));
      return 0;
    }
  }

  static Future<int> checkingWithoutWarning() async {
    // final List<ConnectivityResult> connectivityResult =
    // await (Connectivity().checkConnectivity());
    // if (connectivityResult.contains(ConnectivityResult.none)) {
    //   return 0;
    // } else {
    //   return 1;
    // }
    try {
      final url = Uri.https('google.com');
      var response = await http.head(url);
      if (response.statusCode == 200) {
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  static Future customDialog(String title, String msg) async {
    await Get.dialog(
        //barrierDismissible: false,
        Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.red, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(title,
                  style: const TextStyle(color: Colors.black87, fontSize: 18)),
            ),
            const SizedBox(
              height: 3,
            ),
            // Image.asset(AppImage.internetConnection,height:30),
            Text(msg,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black87, fontSize: 15)),
            const SizedBox(
              height: 5,
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                Get.back();
              },
              child: Text(
                'try_again'.tr,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ));
    
  }
}
