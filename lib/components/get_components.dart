import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetComponents {
  GetComponents._();

  // GetX Controller
  static Widget getxController({
    required Widget Function(BuildContext context) builder,
  }) {
    return GetBuilder(
      builder: builder,
    );
  }

  // Bottom Sheet
  static Future bottomSheet({
    required Container builder,
    bool isScrollControlled = true,
    bool isDismissible = true,
  }) {
    return Get.bottomSheet<void>(
      builder,

      backgroundColor: Colors.transparent,
      //barrierColor: Colors.red[50],
      isScrollControlled: isScrollControlled,
      isDismissible: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35), side: const BorderSide(width: 5, color: Colors.black)),
      enableDrag: false,
    );
  }

  static Future dialog({
    required String title,
    required String message,
    required VoidCallback onPressed,
    // bool isScrollControlled = true,
    // bool isDismissible = true,
  }) {
    return Get.dialog<void>(
      barrierDismissible: false,
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: Get.height,
            width: 350,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(0, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text(
                              'NO',
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(0, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: onPressed,
                            child: const Text(
                              'YES',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Snack Bar
  static SnackbarController snackBar({
    required String title,
    required String message,
    Color? textColor = Colors.white,
    Color? backgroundColor = Colors.blueAccent,
    IconData? icon = Icons.person,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
  }) {
    return Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: textColor,
      icon: Icon(icon, color: textColor),
      snackPosition: snackPosition,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      duration: const Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.elasticIn,
      reverseAnimationCurve: Curves.elasticOut,
      showProgressIndicator: false,
      snackStyle: SnackStyle.FLOATING,
      animationDuration: const Duration(milliseconds: 500),
    );
  }
}
