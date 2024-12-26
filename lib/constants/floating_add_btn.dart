import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FloatingAddBtn extends StatefulWidget implements PreferredSizeWidget{
  const FloatingAddBtn({super.key});

  @override
  createState() => _FloatingAddBtn();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _FloatingAddBtn extends State<FloatingAddBtn> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {

      },
      foregroundColor: Colors.white,
      backgroundColor: Colors.green,
      child: const Icon(Icons.add),
    );
  }
}
