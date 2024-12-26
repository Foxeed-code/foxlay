import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
//import 'package:google_fonts/google_fonts.dart';

bool isDark = Get.isDarkMode ? true : false;

class AppStyles {
  static Color c1 = isDark ? HexColor('202020') : HexColor('FFFFFF');
  static Color c2 = isDark ? HexColor('272727') : HexColor('e7f0f6');
  static Color c3 = isDark ? HexColor('#1c2731') : HexColor('#f5f5f5');
  static Color textColor = isDark ? HexColor('FFFFFF') : HexColor('333333');
  static Color liteColor = isDark ? HexColor('999999') : HexColor('AAAAAA');
  static Color constColor = isDark ? HexColor('141218') : HexColor('F8F8F8');
  static Color tableHeadColor = isDark ? HexColor('#F8F8F8') : HexColor('#353148');

  static Color border1 = isDark ? HexColor('424348') : HexColor('#E8ECD6');
  static Color border2 = isDark ? HexColor('424348') : HexColor('#cfcbcb');
  static Color border3 = isDark ? HexColor('#979494') : HexColor('#979494');

  static Color addBtnBg = isDark ? HexColor('0bb587') : HexColor('2b997b');
  static Color addBtnColor = isDark ? HexColor('FFFFFF') : HexColor('FFFFFF');
  static Color editBtnBg = isDark ? HexColor('ebb47b') : HexColor('e98100');
  static Color editBtnColor = isDark ? HexColor('FFFFFF') : HexColor('FFFFFF');
  static Color viewBtnBg = isDark ? HexColor('65a8e3') : HexColor('057de7');
  static Color viewBtnColor = isDark ? HexColor('FFFFFF') : HexColor('FFFFFF');
  static Color deleteBtnBg = isDark ? HexColor('ff6767') : HexColor('df2626');
  static Color deleteBtnColor = isDark ? HexColor('defade') : HexColor('defade');

  static Color thColor = isDark ? HexColor('23303C') : HexColor('e7f0f6');

  static const baseurl = 'http://mrmilkman.foxeed.com/phpapi/';
  static const TextStyle myStyle = TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: Colors.black);
  static Shader linearGradient = LinearGradient(
    colors: <Color>[
      HexColor("0C6660"),
      HexColor("05A09E"),
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}

class AppUtils {
  static screenWidth() {
    return WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
  }

  static screenHeight() {
    return WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height;
  }

  static userDateFormat(String date) {
    return DateFormat("dd-MM-yyyy").format(DateTime.parse(date)).toString();
  }

  static sqlDateFormat(String date) {
    return DateFormat("yyyy-MM-dd").format(DateTime.parse(date));
  }

  static userDateTimeFormat(String dateTime) {
    return DateFormat("dd-MM-yyyy hh:mm a").format(DateTime.parse(dateTime));
  }

  static readMonth() {
    List<Map<String, dynamic>> monthItems = [];
    var now = DateTime.now();
    if (int.parse(now.month.toString()) == 1) {
      monthItems = [
        {"id": int.parse(now.month.toString()), "value": '${DateFormat('MMM').format(DateTime(0, now.month))} - ${now.year}'},
        {"id": 12, "value": '${DateFormat('MMM').format(DateTime(0, 12))} - ${int.parse(now.year.toString()) - 1}'},
        {"id": 11, "value": '${DateFormat('MMM').format(DateTime(0, 11))} - ${int.parse(now.year.toString()) - 1}'},
        {"id": 10, "value": '${DateFormat('MMM').format(DateTime(0, 10))} - ${int.parse(now.year.toString()) - 1}'},
        {"id": 9, "value": '${DateFormat('MMM').format(DateTime(0, 9))} - ${int.parse(now.year.toString()) - 1}'},
        {"id": 8, "value": '${DateFormat('MMM').format(DateTime(0, 8))} - ${int.parse(now.year.toString()) - 1}'},
      ];
    } else if (int.parse(now.month.toString()) == 2) {
      monthItems = [
        {"id": int.parse(now.month.toString()), "value": '${DateFormat('MMM').format(DateTime(0, now.month))} - ${now.year}'},
        {"id": int.parse(now.month.toString()) - 1, "value": '${DateFormat('MMM').format(DateTime(0, now.month - 1))} - ${now.year}'},
        {"id": 12, "value": '${DateFormat('MMM').format(DateTime(0, 12))} - ${int.parse(now.year.toString()) - 1}'},
        {"id": 11, "value": '${DateFormat('MMM').format(DateTime(0, 11))} - ${int.parse(now.year.toString()) - 1}'},
        {"id": 10, "value": '${DateFormat('MMM').format(DateTime(0, 10))} - ${int.parse(now.year.toString()) - 1}'},
        {"id": 9, "value": '${DateFormat('MMM').format(DateTime(0, 9))} - ${int.parse(now.year.toString()) - 1}'},
      ];
    } else if (int.parse(now.month.toString()) == 3) {
      monthItems = [
        {"id": int.parse(now.month.toString()), "value": '${DateFormat('MMM').format(DateTime(0, now.month))} - ${now.year}'},
        {"id": int.parse(now.month.toString()) - 1, "value": '${DateFormat('MMM').format(DateTime(0, now.month - 1))} - ${now.year}'},
        {"id": int.parse(now.month.toString()) - 2, "value": '${DateFormat('MMM').format(DateTime(0, now.month - 2))} - ${now.year}'},
        {"id": 12, "value": '${DateFormat('MMM').format(DateTime(0, 12))} - ${int.parse(now.year.toString()) - 1}'},
        {"id": 11, "value": '${DateFormat('MMM').format(DateTime(0, 11))} - ${int.parse(now.year.toString()) - 1}'},
        {"id": 10, "value": '${DateFormat('MMM').format(DateTime(0, 10))} - ${int.parse(now.year.toString()) - 1}'},
      ];
    } else if (int.parse(now.month.toString()) == 4) {
      monthItems = [
        {"id": int.parse(now.month.toString()), "value": '${DateFormat('MMM').format(DateTime(0, now.month))} - ${now.year}'},
        {"id": int.parse(now.month.toString()) - 1, "value": '${DateFormat('MMM').format(DateTime(0, now.month - 1))} - ${now.year}'},
        {"id": int.parse(now.month.toString()) - 2, "value": '${DateFormat('MMM').format(DateTime(0, now.month - 2))} - ${now.year}'},
        {"id": int.parse(now.month.toString()) - 3, "value": '${DateFormat('MMM').format(DateTime(0, now.month - 3))} - ${now.year}'},
        {"id": 12, "value": '${DateFormat('MMM').format(DateTime(0, 12))} - ${int.parse(now.year.toString()) - 1}'},
        {"id": 11, "value": '${DateFormat('MMM').format(DateTime(0, 11))} - ${int.parse(now.year.toString()) - 1}'},
      ];
    } else if (int.parse(now.month.toString()) == 5) {
      monthItems = [
        {"id": int.parse(now.month.toString()), "value": '${DateFormat('MMM').format(DateTime(0, now.month))} - ${now.year}'},
        {"id": int.parse(now.month.toString()) - 1, "value": '${DateFormat('MMM').format(DateTime(0, now.month - 1))} - ${now.year}'},
        {"id": int.parse(now.month.toString()) - 2, "value": '${DateFormat('MMM').format(DateTime(0, now.month - 2))} - ${now.year}'},
        {"id": int.parse(now.month.toString()) - 3, "value": '${DateFormat('MMM').format(DateTime(0, now.month - 3))} - ${now.year}'},
        {"id": int.parse(now.month.toString()) - 4, "value": '${DateFormat('MMM').format(DateTime(0, now.month - 4))} - ${now.year}'},
        {"id": 12, "value": '${DateFormat('MMM').format(DateTime(0, 12))} - ${int.parse(now.year.toString()) - 1}'},
      ];
    } else {
      monthItems = [
        {"id": int.parse(now.month.toString()), "value": '${DateFormat('MMM').format(DateTime(0, now.month))} - ${now.year}'},
        {"id": int.parse(now.month.toString()) - 1, "value": '${DateFormat('MMM').format(DateTime(0, now.month - 1))} - ${now.year}'},
        {"id": int.parse(now.month.toString()) - 2, "value": '${DateFormat('MMM').format(DateTime(0, now.month - 2))} - ${now.year}'},
        {"id": int.parse(now.month.toString()) - 3, "value": '${DateFormat('MMM').format(DateTime(0, now.month - 3))} - ${now.year}'},
        {"id": int.parse(now.month.toString()) - 4, "value": '${DateFormat('MMM').format(DateTime(0, now.month - 4))} - ${now.year}'},
        {"id": int.parse(now.month.toString()) - 5, "value": '${DateFormat('MMM').format(DateTime(0, now.month - 5))} - ${now.year}'},
      ];
    }

    return monthItems;
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }
}
