import 'package:ehospital/components/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pluto_layout/pluto_layout.dart';

class LeftTab extends StatefulWidget {
  LeftTab({required this.newTabResolver, super.key});
  final PlutoLayoutActionInsertTabItemResolver newTabResolver;

  @override
  State<LeftTab> createState() => _LeftTabState();
}

class _LeftTabState extends State<LeftTab> {
  @override
  Widget build(BuildContext context) {
    final PlutoLayoutEventStreamController? eventStreamController = PlutoLayout.getEventStreamController(context);
    return Container(
      width: 50,
      height: Get.height,
      color: AppStyles.c3,
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                GetStorage().write("menu", "Screen1");
                eventStreamController?.add(
                  PlutoInsertTabItemEvent(
                    layoutId: PlutoLayoutId.body,
                    itemResolver: widget.newTabResolver,
                  ),
                );
              },
              icon: Icon(
                Icons.add,
                size: 22,
                color: AppStyles.textColor,
              )),
          SizedBox(
            height: 5,
          ),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.local_hospital,
                size: 22,
                color: AppStyles.textColor,
              )),
          SizedBox(
            height: 5,
          ),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.edit,
                size: 22,
                color: AppStyles.textColor,
              )),
          SizedBox(
            height: 5,
          ),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.update,
                size: 22,
                color: AppStyles.textColor,
              )),
          SizedBox(
            height: 5,
          ),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.delete,
                size: 22,
                color: AppStyles.textColor,
              )),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
