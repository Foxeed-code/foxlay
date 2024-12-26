// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ehospital/components/utilities.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class PageAppBar extends StatelessWidget implements PreferredSizeWidget {
  //int currentPage;
  final String pName;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const PageAppBar({
    super.key,
    required this.pName,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: AppBar(
        automaticallyImplyLeading: false,
        primary: false,
        titleSpacing: 0.00,
        toolbarHeight: Get.height * 0.15,
        // backgroundColor: Colors.transparent,
        backgroundColor: AppStyles.c1,
        elevation: 0,
        leading: Transform.translate(
            offset: const Offset(10, 20),
            child: IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 32,
              ),
              //icon: const Image(image: AssetImage("assets/icons/bell1.png"), color: Colors.white,height: 25,width: 24),
              onPressed: () async {
                Get.toNamed('/language_settings');
                //await DataSynchronise.onlineToOffline(1);
                // String? language;
                // String? languageCon;
                // final box = GetStorage();
                //
                // if(box.read("language") == "en"){
                //   language= "ta";
                //   languageCon = "IN";
                //   box.write("language", "ta");
                // }
                // else{
                //   language = "en";
                //   languageCon = "US";
                //   box.write("language", "en");
                // }
                //
                // var locale = Locale(language, languageCon);
                // Get.updateLocale(locale);
                // Navigator.pushReplacementNamed(context, '/eventList');
              },
            )),
        leadingWidth: 48,
        title: Transform.translate(
            offset: const Offset(0, 16),
            child: Image.asset(
              'assets/logo/milk_master.png',
              width: 150,
            )),
        centerTitle: true,
        actions: <Widget>[
          Transform.translate(
              offset: const Offset(-10, 20),
              child: IconButton(
                  icon: const Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () async {
                    var urlLink = await GetStorage().read("yLink");
                    await launchUrl(Uri.parse(urlLink));

                    //AutoRunData().offlineToOnline();
                    // print("test");
                    // Get.toNamed("/login");
                    // Get.showSnackbar(
                    //     GetSnackBar(
                    //       title: "customer_added".tr,
                    //       message: "customer_added_msg".tr,
                    //       snackPosition: SnackPosition.BOTTOM,
                    //       duration: const Duration(seconds: 3),
                    //       backgroundColor: HexColor('2AAAFF'),
                    //       icon: const Icon(Icons.check, color: Colors.white,),
                    //     )
                    // );
                  })),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.085);
}
