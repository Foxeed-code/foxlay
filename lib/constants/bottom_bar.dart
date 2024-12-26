import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BottomBar extends StatefulWidget implements PreferredSizeWidget {
  const BottomBar({super.key});

  @override
  createState() => _BottomBar();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _BottomBar extends State<BottomBar> with TickerProviderStateMixin {
  int cIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        setState(() {
          cIndex = index;
        });
        if (index == 0) {
          //Get.offNamed("/home");
          Get.toNamed("/home");
        } else if (index == 1) {
          Get.toNamed("/purchase");
        } else if (index == 2) {
          Get.toNamed("/area_sales");
        } else if (index == 3) {
          Get.toNamed("/borrowed_milk");
        }
        // print("cIndex: $cIndex");
      },
      type: BottomNavigationBarType.fixed,
      currentIndex: cIndex,

      // selectedIconTheme: const IconThemeData(color: Colors.green),
      // selectedItemColor: Colors.green,
      //showUnselectedLabels: true,
      //backgroundColor: Colors.white,
      unselectedIconTheme: const IconThemeData(color: Colors.black87),
      unselectedItemColor: Colors.black87,
      fixedColor: Colors.black87,

      items: [
        BottomNavigationBarItem(
          label: 'home'.tr,
          icon: const Icon(Icons.home_outlined),
          // backgroundColor: cIndex==0 ? Colors.green : Colors.white38,
        ),
        BottomNavigationBarItem(
          label: 'purchase'.tr,
          icon: const Icon(Icons.wallet_outlined),
          // backgroundColor: cIndex==1 ? Colors.green : Colors.white38,
        ),
        BottomNavigationBarItem(
          label: 'sales'.tr,
          icon: const Icon(Icons.water_drop_outlined),
          // backgroundColor: cIndex==2 ? Colors.green : Colors.white38,
        ),
        BottomNavigationBarItem(
          label: 'Borrowed Milk'.tr,
          icon: const Icon(Icons.back_hand_outlined),
          // backgroundColor: cIndex==3 ? Colors.green : Colors.white38,
        ),
      ],
    );
  }
}
