import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluto_layout/pluto_layout.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';
import 'package:window_manager/window_manager.dart';
import '../components/utilities.dart';

//import 'package:ehospital/components/launch_url.dart';

class TopTab extends StatefulWidget {
  const TopTab({required this.newTabResolver, super.key});

  final PlutoLayoutActionInsertTabItemResolver newTabResolver;

  @override
  State<TopTab> createState() => _TopTabState();
}

class _TopTabState extends State<TopTab> {
  final List<PlutoMenuItem> menuItems = [];

  @override
  void initState() {
    super.initState();

    final PlutoLayoutEventStreamController? eventStreamController = PlutoLayout.getEventStreamController(context);

    menuItems.addAll(
      [
        PlutoMenuItem(title: '', icon: Icons.web, enable: true),
        PlutoMenuItem(
          title: 'Tabs',
          children: [
            PlutoMenuItem(
                title: 'Screen 1',
                icon: Icons.ac_unit,
                onTap: () async {
                  GetStorage().write("menu", "Screen1");
                  eventStreamController?.add(
                    PlutoInsertTabItemEvent(
                      layoutId: PlutoLayoutId.body,
                      itemResolver: widget.newTabResolver,
                    ),
                  );
                }),
            PlutoMenuItem(
                title: 'Screen 2',
                onTap: () async {
                  GetStorage().write("menu", "Screen2");
                  eventStreamController?.add(
                    PlutoInsertTabItemEvent(
                      layoutId: PlutoLayoutId.body,
                      itemResolver: widget.newTabResolver,
                    ),
                  );
                }),
            PlutoMenuItem(
                title: 'Grid',
                onTap: () async {
                  GetStorage().write("menu", "Grid");
                  eventStreamController?.add(
                    PlutoInsertTabItemEvent(
                      layoutId: PlutoLayoutId.body,
                      itemResolver: widget.newTabResolver,
                    ),
                  );
                }),
            PlutoMenuItem(
                title: 'New Tab (Shift + N)',
                onTap: () {
                  GetStorage().write("menu", "New");
                  eventStreamController?.add(
                    PlutoInsertTabItemEvent(
                      layoutId: PlutoLayoutId.body,
                      itemResolver: widget.newTabResolver,
                    ),
                  );
                }),
            PlutoMenuItem(
              title: 'Rotate',
              children: [
                PlutoMenuItem(
                  title: 'Left (Alt + 1)',
                  onTap: () => eventStreamController?.add(const PlutoRotateTabViewEvent(PlutoLayoutId.left)),
                ),
                PlutoMenuItem(
                  title: 'Right (Alt + 2)',
                  onTap: () => eventStreamController?.add(const PlutoRotateTabViewEvent(PlutoLayoutId.right)),
                ),
                PlutoMenuItem(
                  title: 'Body',
                  onTap: () => eventStreamController?.add(const PlutoRotateTabViewEvent(PlutoLayoutId.body)),
                ),
              ],
            ),
          ],
        ),
        PlutoMenuItem(
          title: 'Appointment',
        ),
        PlutoMenuItem(title: 'Staffs'),
        PlutoMenuItem(title: 'Doctors'),
        PlutoMenuItem(title: 'Rooms'),
        PlutoMenuItem(title: 'Report'),
        PlutoMenuItem(title: 'Patients'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppStyles.textColor,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.width * 0.8,
              height: 40,
              child: PlutoMenuBar(
                height: 40,
                mode: PlutoMenuBarMode.tap,
                menus: menuItems,
                backgroundColor: AppStyles.textColor,
                borderColor: Colors.transparent,
                itemStyle: PlutoMenuItemStyle(
                  indicatorColor: Colors.deepOrange,
                  activatedColor: AppStyles.textColor,
                  textStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                    color: AppStyles.c1,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  )),
                  iconColor: AppStyles.c1,
                  moreIconColor: AppStyles.textColor,
                ),
              ),
            ),
            SizedBox(
              width: Get.width * 0.2,
              height: 40,
              child: WindowCaption(
                brightness: Brightness.dark,
                backgroundColor: Colors.transparent,
              ),
            )
          ],
        ));
  }
}
