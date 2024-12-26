import 'package:ehospital/components/utilities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluto_grid/pluto_grid.dart';

// ignore: must_be_immutable
class ComponentGrid extends StatefulWidget {
  const ComponentGrid({super.key, required this.rows, required this.columns, required this.containerWidth});
  final List<PlutoRow> rows;
  final List<PlutoColumn> columns;
  final double containerWidth;
  @override
  // ignore: library_private_types_in_public_api
  _ComponentGridState createState() => _ComponentGridState();
}

class _ComponentGridState extends State<ComponentGrid> {
  // final List<PlutoColumn> columns = [];
  late final PlutoGridStateManager stateManager;

  // final List<PlutoRow> rows = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 7,
                  color: Color.fromRGBO(0, 0, 0, 0.11),
                ),
              ],
              color: AppStyles.c1,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0), bottomRight: Radius.circular(12.0)),
            ),
            constraints: BoxConstraints(
              maxWidth: widget.containerWidth,
            ),
            child: Theme(
                data: ThemeData.dark(),
                child: PlutoGrid(
                  columns: widget.columns,
                  rows: widget.rows,
                  onChanged: (PlutoGridOnChangedEvent event) {
                    print(event);
                  },
                  onLoaded: (e) {
                    stateManager = e.stateManager;

                    stateManager.setShowColumnFilter(true, notify: false);
                    // stateManager.setCurrentCell(stateManager.firstCell, 0);
                  },
                  createFooter: (stateManager) {
                    stateManager.setPageSize(20, notify: false); // default 40
                    return PlutoPagination(stateManager);
                  },
                  configuration: PlutoGridConfiguration(
                    style: PlutoGridStyleConfig(
                        gridBackgroundColor: AppStyles.c1,
                        gridBorderColor: Colors.transparent,
                        columnFilterHeight: 35,
                        columnHeight: 40,
                        enableColumnBorderVertical: false,
                        enableColumnBorderHorizontal: false,
                        enableCellBorderVertical: false,
                        enableCellBorderHorizontal: false,
                        columnTextStyle: GoogleFonts.lato(
                            textStyle: TextStyle(
                          color: AppStyles.textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        )),
                        dragTargetColumnColor: AppStyles.constColor,
                        menuBackgroundColor: AppStyles.c2,
                        // rowHeight: 30,
                        rowColor: AppStyles.c1,
                        evenRowColor: AppStyles.c3,
                        cellTextStyle: TextStyle(color: AppStyles.textColor, fontSize: 13, fontWeight: FontWeight.w100),
                        defaultCellPadding: EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                        activatedColor: AppStyles.c2,
                        borderColor: AppStyles.border1,
                        activatedBorderColor: AppStyles.textColor,
                        iconColor: AppStyles.liteColor,
                        disabledIconColor: HexColor('#555555'),
                        columnContextIcon: Icons.sort),
                  ),
                ))));
  }
}
