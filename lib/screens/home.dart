import 'dart:ui';

// import 'package:ehospital/components/grid.dart';
import 'package:ehospital/components/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pluto_layout/pluto_layout.dart';

import 'package:ehospital/layout/screens.dart';
import 'package:ehospital/tabs/tabs.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int tabIndex = 0;
  String pageTitle = "";

  PlutoInsertTabItemResult newTabResolver({required List<PlutoLayoutTabItem> items}) {
    //final foundNew = items.where((e) => e.title.startsWith('New ')).map((e) => int.parse(e.title.replaceAll('New ', ''))).toList()..sort();
    //final int index = foundNew.isEmpty ? 1 : ++foundNew.last;
    tabIndex = tabIndex + 1;
    var pageName = GetStorage().read("menu");
    setState(() {
      pageTitle = pageName.toString();
    });
    Widget? showView;
    switch (pageName) {
      case "New":
        showView = _NewGrid(
          key: GlobalKey(),
          focusNode: FocusNode(),
        );
        break;
      case "Screen1":
        showView = Screen1(
          key: GlobalKey(),
          focusNode: FocusNode(),
        );
        break;
      case "Screen2":
        showView = Screen2(
          key: GlobalKey(),
        );
        break;
      case "Grid":
        showView = Screen2(
          key: GlobalKey(),
        );
        break;
    }

    return PlutoInsertTabItemResult(
      item: PlutoLayoutTabItem(
        id: '$tabIndex',
        title: '$pageName $tabIndex',
        enabled: true,
        icon: Icon(Icons.add),
        sizeResolver: PlutoLayoutTabItemSizeInitial(300),
        showRemoveButton: true,
        tabViewWidget: showView!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.constColor,
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
          scrollbars: true,
        ),
        child: PlutoLayout(
          body: PlutoLayoutContainer(
            // backgroundColor: Colors.red,
            child: HomeScreen(),
          ),
          top: PlutoLayoutContainer(
            child: TopTab(newTabResolver: newTabResolver),
          ),
          // left: PlutoLayoutContainer(
          //   child: LeftTab(newTabResolver: newTabResolver),
          // ),
          // right: PlutoLayoutContainer(
          //   child: RightTab(),
          // ),
          bottom: const PlutoLayoutContainer(
            child: BottomTab(),
          ),
        ),
      ),
    );
  }
}

class _NewGrid extends StatefulWidget implements PlutoLayoutTabViewWidgetHasFocusNode {
  const _NewGrid({
    required this.focusNode,
    super.key,
  });

  @override
  final FocusNode focusNode;

  @override
  State<_NewGrid> createState() => _NewGridState();
}

class _NewGridState extends State<_NewGrid> {
  late final PlutoGridStateManager stateManager;

  final List<PlutoColumn> columns = List.generate(20, (i) => i)
      .map(
        (e) => PlutoColumn(
          title: 'Title $e',
          field: '$e',
          type: PlutoColumnType.text(),
        ),
      )
      .toList();

  final List<PlutoRow> rows = [];

  @override
  void initState() {
    super.initState();

    rows.addAll(
      List.generate(100, (i) => i).map(
        (e) => PlutoRow(
          cells: Map.fromEntries(columns.map(
            (e) => MapEntry(
              e.field,
              PlutoCell(value: ''),
            ),
          )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Focus(
      focusNode: widget.focusNode,
      onFocusChange: (flag) {
        if (widget.focusNode.hasPrimaryFocus) {
          stateManager.setKeepFocus(flag);
        }
      },
      child: PlutoGrid(
        columns: columns,
        rows: rows,
        onLoaded: (e) {
          stateManager = e.stateManager;
          stateManager.setShowColumnFilter(true, notify: false);
          stateManager.setCurrentCell(stateManager.firstCell, 0);
        },
        configuration: PlutoGridConfiguration(
          shortcut: PlutoGridShortcut(
            actions: {
              ...PlutoGridShortcut.defaultActions,
              LogicalKeySet(LogicalKeyboardKey.escape): _SetParentFocus(context),
            },
          ),
          style: PlutoGridStyleConfig(
            gridBackgroundColor: AppStyles.c1,
            // borderColor: AppStyles.addBtnBg,
            rowColor: Colors.red,
            // activatedColor: theme.focusColor,
            activatedBorderColor: theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}

class _SetParentFocus extends PlutoGridShortcutAction {
  _SetParentFocus(this.context);

  final BuildContext context;

  @override
  void execute({
    required PlutoKeyManagerEvent keyEvent,
    required PlutoGridStateManager stateManager,
  }) {
    if (!stateManager.isEditing && !stateManager.mode.isPopup) {
      PlutoLayoutContainer.getFocusNode(context)?.requestFocus();
      return;
    }

    const PlutoGridActionDefaultEscapeKey().execute(
      keyEvent: keyEvent,
      stateManager: stateManager,
    );
  }
}
