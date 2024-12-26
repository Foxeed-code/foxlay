import 'package:ehospital/components/grid.dart';
import 'package:ehospital/components/src/helpers.dart';
import 'package:flutter/material.dart';
//import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pluto_layout/pluto_layout.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../components/form_components.dart';
import '../components/src/widgets/layout_grid.dart';
import '../components/utilities.dart';
import '../components/flutter_bootstrap.dart';
import '../components/validators.dart';
//import 'package:drop_down_search_field/drop_down_search_field.dart';
//import 'package:desktop_application/components/form_components.dart';
//import 'package:desktop_application/components/flutter_layout_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final _userEditTextController = TextEditingController();
  final GlobalKey<FormFieldState<dynamic>> keyDropdown = GlobalKey<FormFieldState<dynamic>>();
  final GlobalKey<FormFieldState<dynamic>> keyDropdown2 = GlobalKey<FormFieldState<dynamic>>();
  String selectedValue = "";

  void onChanged(value) {
    setState(() {
      selectedValue = value;
    });
  }

  final TextEditingController _dropdownSearchFieldController = TextEditingController();

  String? _selectedFruit;

  static final List<String> fruits = [
    'Apple',
    'Avocado',
    'Banana',
    'Blueberries',
    'Blackberries',
    'Cherries',
    'Grapes',
    'Grapefruit',
    'Guava',
    'Kiwi',
    'Lychee',
    'Mango',
    'Orange',
    'Papaya',
    'Passion fruit',
    'Peach',
    'Pears',
    'Pineapple',
    'Raspberries',
    'Strawberries',
    'Watermelon',
  ];
  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(fruits);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  List errorText = ["-", "-"];

  List<PlutoColumn> columns = [
    /// Text Column definition
    PlutoColumn(title: 'TEXT COLUMN', backgroundColor: AppStyles.c2, field: 'text_field', type: PlutoColumnType.text(), suppressedAutoSize: true),

    /// Number Column definition
    PlutoColumn(
      title: 'NUMBER COLUMN',
      field: 'number_field',
      backgroundColor: AppStyles.c2,
      textAlign: PlutoColumnTextAlign.right,
      type: PlutoColumnType.currency(symbol: "₹"),
      footerRenderer: (rendererContext) {
        return PlutoAggregateColumnFooter(
          rendererContext: rendererContext,
          type: PlutoAggregateColumnType.sum,
          format: '#,###',
          alignment: Alignment.centerRight,
          titleSpanBuilder: (text) {
            return [
              WidgetSpan(
                  child: Icon(
                Icons.currency_rupee,
                size: 18,
                color: AppStyles.textColor,
              )),
              TextSpan(text: text),
            ];
          },
        );
      },
    ),

    /// Select Column definition
    PlutoColumn(title: 'SELECT COLUMN', backgroundColor: AppStyles.c2, field: 'select_field', type: PlutoColumnType.select(['item1', 'item2', 'item3'])),

    /// Datetime Column definition
    PlutoColumn(title: 'DATE COLUMN', backgroundColor: AppStyles.c2, field: 'date_field', type: PlutoColumnType.date()),

    /// Time Column definition
    PlutoColumn(title: 'TIME COLUMN', backgroundColor: AppStyles.c2, field: 'time_field', type: PlutoColumnType.time()),
  ];

  List<PlutoRow> rows = [
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value1Text cell value1 Text cell value1'),
        'number_field': PlutoCell(value: 2020),
        'select_field': PlutoCell(value: 'item1'),
        'date_field': PlutoCell(value: '2020-08-06'),
        'time_field': PlutoCell(value: '12:30'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value2'),
        'number_field': PlutoCell(value: 2021),
        'select_field': PlutoCell(value: 'item2'),
        'date_field': PlutoCell(value: '2020-08-07'),
        'time_field': PlutoCell(value: '18:45'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value3'),
        'number_field': PlutoCell(value: 2022),
        'select_field': PlutoCell(value: 'item3'),
        'date_field': PlutoCell(value: '2020-08-08'),
        'time_field': PlutoCell(value: '23:59'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value1Text cell value1 Text cell value1'),
        'number_field': PlutoCell(value: 2020),
        'select_field': PlutoCell(value: 'item1'),
        'date_field': PlutoCell(value: '2020-08-06'),
        'time_field': PlutoCell(value: '12:30'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value2'),
        'number_field': PlutoCell(value: 2021),
        'select_field': PlutoCell(value: 'item2'),
        'date_field': PlutoCell(value: '2020-08-07'),
        'time_field': PlutoCell(value: '18:45'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value3'),
        'number_field': PlutoCell(value: 2022),
        'select_field': PlutoCell(value: 'item3'),
        'date_field': PlutoCell(value: '2020-08-08'),
        'time_field': PlutoCell(value: '23:59'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value1Text cell value1 Text cell value1'),
        'number_field': PlutoCell(value: 2020),
        'select_field': PlutoCell(value: 'item1'),
        'date_field': PlutoCell(value: '2020-08-06'),
        'time_field': PlutoCell(value: '12:30'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value2'),
        'number_field': PlutoCell(value: 2021),
        'select_field': PlutoCell(value: 'item2'),
        'date_field': PlutoCell(value: '2020-08-07'),
        'time_field': PlutoCell(value: '18:45'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value3'),
        'number_field': PlutoCell(value: 2022),
        'select_field': PlutoCell(value: 'item3'),
        'date_field': PlutoCell(value: '2020-08-08'),
        'time_field': PlutoCell(value: '23:59'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value1Text cell value1 Text cell value1'),
        'number_field': PlutoCell(value: 2020),
        'select_field': PlutoCell(value: 'item1'),
        'date_field': PlutoCell(value: '2020-08-06'),
        'time_field': PlutoCell(value: '12:30'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value2'),
        'number_field': PlutoCell(value: 2021),
        'select_field': PlutoCell(value: 'item2'),
        'date_field': PlutoCell(value: '2020-08-07'),
        'time_field': PlutoCell(value: '18:45'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value3'),
        'number_field': PlutoCell(value: 2022),
        'select_field': PlutoCell(value: 'item3'),
        'date_field': PlutoCell(value: '2020-08-08'),
        'time_field': PlutoCell(value: '23:59'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value1Text cell value1 Text cell value1'),
        'number_field': PlutoCell(value: 2020),
        'select_field': PlutoCell(value: 'item1'),
        'date_field': PlutoCell(value: '2020-08-06'),
        'time_field': PlutoCell(value: '12:30'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value2'),
        'number_field': PlutoCell(value: 2021),
        'select_field': PlutoCell(value: 'item2'),
        'date_field': PlutoCell(value: '2020-08-07'),
        'time_field': PlutoCell(value: '18:45'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value3'),
        'number_field': PlutoCell(value: 2022),
        'select_field': PlutoCell(value: 'item3'),
        'date_field': PlutoCell(value: '2020-08-08'),
        'time_field': PlutoCell(value: '23:59'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value1Text cell value1 Text cell value1'),
        'number_field': PlutoCell(value: 2020),
        'select_field': PlutoCell(value: 'item1'),
        'date_field': PlutoCell(value: '2020-08-06'),
        'time_field': PlutoCell(value: '12:30'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value2'),
        'number_field': PlutoCell(value: 2021),
        'select_field': PlutoCell(value: 'item2'),
        'date_field': PlutoCell(value: '2020-08-07'),
        'time_field': PlutoCell(value: '18:45'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value3'),
        'number_field': PlutoCell(value: 2022),
        'select_field': PlutoCell(value: 'item3'),
        'date_field': PlutoCell(value: '2020-08-08'),
        'time_field': PlutoCell(value: '23:59'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value1Text cell value1 Text cell value1'),
        'number_field': PlutoCell(value: 2020),
        'select_field': PlutoCell(value: 'item1'),
        'date_field': PlutoCell(value: '2020-08-06'),
        'time_field': PlutoCell(value: '12:30'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value2'),
        'number_field': PlutoCell(value: 2021),
        'select_field': PlutoCell(value: 'item2'),
        'date_field': PlutoCell(value: '2020-08-07'),
        'time_field': PlutoCell(value: '18:45'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value3'),
        'number_field': PlutoCell(value: 2022),
        'select_field': PlutoCell(value: 'item3'),
        'date_field': PlutoCell(value: '2020-08-08'),
        'time_field': PlutoCell(value: '23:59'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value1Text cell value1 Text cell value1'),
        'number_field': PlutoCell(value: 2020),
        'select_field': PlutoCell(value: 'item1'),
        'date_field': PlutoCell(value: '2020-08-06'),
        'time_field': PlutoCell(value: '12:30'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value2'),
        'number_field': PlutoCell(value: 2021),
        'select_field': PlutoCell(value: 'item2'),
        'date_field': PlutoCell(value: '2020-08-07'),
        'time_field': PlutoCell(value: '18:45'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value3'),
        'number_field': PlutoCell(value: 2022),
        'select_field': PlutoCell(value: 'item3'),
        'date_field': PlutoCell(value: '2020-08-08'),
        'time_field': PlutoCell(value: '23:59'),
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PlutoLayoutTabsOrChild(
      child: Container(
          constraints: BoxConstraints(
            minWidth: 300,
            maxWidth: 1000,
          ),
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: [
              Container(
                  width: Get.width,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(color: AppStyles.c1, border: Border.all(width: 1, color: AppStyles.border2)),
                  child: Column(
                    children: [
                      LayoutGrid(
                        columnSizes: [1.fr, auto],
                        rowSizes: const [auto],
                        rowGap: 1,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 12),
                            child: Wrap(
                              children: [
                                Text(
                                  'Home',
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  ' / ',
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  'Appointment',
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(width: 1.0, color: AppStyles.border2),
                              ),
                              color: AppStyles.c2,
                            ),
                            child: TextButton(
                              onPressed: () {
                                showDialog<void>(
                                    context: context,
                                    barrierDismissible: false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return Dialog(
                                          backgroundColor: AppStyles.c1,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
                                          child: Container(
                                            width: 900,
                                            constraints: BoxConstraints(maxWidth: Get.width),
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(top: 7, bottom: 7, left: 10, right: 10),
                                                  decoration: BoxDecoration(
                                                    color: AppStyles.c2,
                                                  ),
                                                  child: LayoutGrid(
                                                      columnSizes: [50.px, 1.fr],
                                                      rowSizes: const [auto],
                                                      columnGap: 3,
                                                      children: [
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              minimumSize: const Size(0, 45),
                                                              padding: EdgeInsets.all(10),
                                                              backgroundColor: AppStyles.c2,
                                                              shadowColor: Colors.transparent),
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          child: Icon(
                                                            Icons.arrow_back,
                                                            color: AppStyles.textColor,
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            RichText(
                                                              textAlign: TextAlign.center,
                                                              text: TextSpan(
                                                                children: [
                                                                  WidgetSpan(
                                                                      child: Icon(
                                                                    Icons.person,
                                                                    size: 20,
                                                                    color: AppStyles.textColor,
                                                                  )),
                                                                  TextSpan(
                                                                    text: ' Add New Patient',
                                                                    style: TextStyle(
                                                                      color: AppStyles.textColor,
                                                                      fontSize: 18,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ]),
                                                ),
                                                Expanded(
                                                    child: SingleChildScrollView(
                                                  padding: EdgeInsets.all(15),
                                                  physics: ScrollPhysics(),
                                                  child: Form(
                                                    key: _formKey,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        /* BEGIN :: BOOTSTRAP CONTAINER  **/
                                                        BootstrapContainer(
                                                          fluid: true,
                                                          // decoration: BoxDecoration(color: AppStyles.c1),
                                                          children: <Widget>[
                                                            BootstrapCol(
                                                              sizes: 'col-12 col-sm-6 col-md-4 col-lg-3',
                                                              child: Forms.textbox(
                                                                labelText: "Name",
                                                                controller: nameController,
                                                                validator: Validators.textValidate,
                                                              ),
                                                            ),
                                                            BootstrapCol(
                                                              sizes: 'col-12 col-sm-6 col-md-4 col-lg-3',
                                                              child: Forms.textbox(
                                                                labelText: "Mobile",
                                                                controller: nameController,
                                                                validator: Validators.textValidate,
                                                              ),
                                                            ),
                                                            BootstrapCol(
                                                              sizes: 'col-12 col-sm-6 col-md-4 col-lg-3',
                                                              child: Forms.textbox(
                                                                labelText: "Mobile",
                                                                controller: nameController,
                                                                validator: Validators.textValidate,
                                                              ),
                                                            ),
                                                            BootstrapCol(
                                                                sizes: 'col-12 col-sm-6 col-md-4 col-lg-3',
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text('Type', style: TextStyle(color: AppStyles.textColor, fontSize: 14, decoration: TextDecoration.none)),
                                                                    SizedBox(
                                                                      height: 4,
                                                                    ),
                                                                    SizedBox(
                                                                      height: 35,
                                                                      child: DropdownSearch<String>(
                                                                        key: keyDropdown,
                                                                        selectedItem: "",
                                                                        validator: Validators.selectValidate,
                                                                        items: (filter, infiniteScrollProps) => ["Menu", "Dialog", "Modal", "BottomSheet"],
                                                                        decoratorProps: DropDownDecoratorProps(
                                                                          decoration: InputDecoration(
                                                                            isDense: true,
                                                                            contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                              borderSide: BorderSide(
                                                                                color: AppStyles.border3,
                                                                              ),
                                                                            ),
                                                                            focusedBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                              borderSide: BorderSide(
                                                                                color: AppStyles.viewBtnBg,
                                                                              ),
                                                                            ),
                                                                            errorStyle: TextStyle(
                                                                              color: AppStyles.deleteBtnBg,
                                                                              inherit: false,
                                                                              fontSize: 12,
                                                                              height: -.3,
                                                                              backgroundColor: AppStyles.c1,
                                                                            ),
                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                              borderSide: BorderSide(
                                                                                width: 1,
                                                                                color: AppStyles.deleteBtnBg,
                                                                              ),
                                                                            ),
                                                                            errorBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                              borderSide: BorderSide(
                                                                                width: 1,
                                                                                color: AppStyles.deleteBtnBg,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        popupProps: PopupProps.dialog(
                                                                          //onDismissed: () => _userEditTextController.clear(),

                                                                          //  onItemsLoaded: (List<String> data) => _userEditTextController.clear(),
                                                                          title: Container(
                                                                            decoration: BoxDecoration(color: Colors.deepPurple),
                                                                            alignment: Alignment.center,
                                                                            padding: EdgeInsets.symmetric(vertical: 16),
                                                                            child: Text(
                                                                              'Numbers 1..30',
                                                                              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white70),
                                                                            ),
                                                                          ),
                                                                          showSelectedItems: true,
                                                                          searchDelay: Duration.zero,
                                                                          itemClickProps: ClickProps(focusColor: Colors.red),
                                                                          //itemBuilder: userModelPopupItem,
                                                                          showSearchBox: true,
                                                                          searchFieldProps: TextFieldProps(
                                                                              controller: _userEditTextController,
                                                                              decoration: InputDecoration(
                                                                                suffixIcon: IconButton(
                                                                                  icon: Icon(Icons.clear),
                                                                                  onPressed: () => _userEditTextController.clear(),
                                                                                ),
                                                                              )),
                                                                          dialogProps: DialogProps(
                                                                            clipBehavior: Clip.antiAlias,
                                                                            shape: OutlineInputBorder(
                                                                              borderSide: BorderSide(width: 0),
                                                                              borderRadius: BorderRadius.circular(25),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )),
                                                            BootstrapCol(
                                                                sizes: 'col-12 col-sm-6 col-md-4 col-lg-3',
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text('Type', style: TextStyle(color: AppStyles.textColor, fontSize: 14, decoration: TextDecoration.none)),
                                                                    SizedBox(
                                                                      height: 4,
                                                                    ),
                                                                  ],
                                                                )),
                                                          ],
                                                        ),
                                                        /** END :: BOOTSTRAP CONTAINER */
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                                width: 120,
                                                                height: 40,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(4),
                                                                  color: AppStyles.addBtnBg,
                                                                ),
                                                                child: MaterialButton(
                                                                  height: 40,
                                                                  onPressed: () {
                                                                    final FormState? form = _formKey.currentState;
                                                                    if (form!.validate()) {
                                                                    } else {
                                                                      print('Form is invalid');
                                                                    }
                                                                  },
                                                                  child: Text(
                                                                    'SUBMIT',
                                                                    style: TextStyle(
                                                                      color: AppStyles.addBtnColor,
                                                                    ),
                                                                  ),
                                                                ))
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ))
                                              ],
                                            ),
                                          ));
                                      /*
                                      Dialog(
                                          backgroundColor: AppStyles.c1,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
                                          child: Container(
                                            width: 650,
                                            constraints: BoxConstraints(maxWidth: Get.width),
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(top: 7, bottom: 7, left: 10, right: 10),
                                                  decoration: BoxDecoration(
                                                    color: AppStyles.c2,
                                                  ),
                                                  child: LayoutGrid(
                                                      columnSizes: [50.px, 1.fr],
                                                      rowSizes: const [auto],
                                                      columnGap: 3,
                                                      children: [
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            minimumSize: const Size(0, 45),
                                                            padding: EdgeInsets.all(10),
                                                            backgroundColor: AppStyles.c1,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          child: Icon(Icons.arrow_back),
                                                        ),
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            RichText(
                                                              textAlign: TextAlign.center,
                                                              text: TextSpan(
                                                                children: [
                                                                  WidgetSpan(
                                                                      child: Icon(
                                                                    Icons.person,
                                                                    size: 20,
                                                                    color: AppStyles.textColor,
                                                                  )),
                                                                  TextSpan(
                                                                    text: ' Add New Patient',
                                                                    style: TextStyle(
                                                                      color: AppStyles.textColor,
                                                                      fontSize: 18,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ]),
                                                ),
                                                Expanded(
                                                    child: SingleChildScrollView(
                                                  padding: EdgeInsets.all(15),
                                                  physics: ScrollPhysics(),
                                                  child: Form(
                                                    key: _formKey,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        /* BEGIN :: BOOTSTRAP CONTAINER  **/
                                                        BootstrapContainer(
                                                          fluid: true,
                                                          // decoration: BoxDecoration(color: AppStyles.c1),
                                                          children: <Widget>[
                                                            BootstrapCol(
                                                              sizes: 'col-12 col-sm-6 col-md-4',
                                                              child: Forms.textbox(
                                                                labelText: "Name",
                                                                controller: nameController,
                                                                validator: Validators.textValidate,
                                                              ),
                                                            ),
                                                            BootstrapCol(
                                                              sizes: 'col-12 col-sm-6 col-md-4',
                                                              child: Forms.textbox(
                                                                labelText: "Mobile",
                                                                controller: nameController,
                                                                validator: Validators.textValidate,
                                                              ),
                                                            ),
                                                            BootstrapCol(
                                                                sizes: 'col-12 col-sm-6 col-md-4',
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text('Type', style: TextStyle(color: AppStyles.textColor, fontSize: 14, decoration: TextDecoration.none)),
                                                                    SizedBox(
                                                                      height: 4,
                                                                    ),
                                                                    SizedBox(
                                                                      height: 35,
                                                                      child: DropdownSearch<String>(
                                                                        key: keyDropdown,
                                                                        selectedItem: "Menu",
                                                                        items: (filter, infiniteScrollProps) => ["Menu", "Dialog", "Modal", "BottomSheet"],
                                                                        decoratorProps: DropDownDecoratorProps(
                                                                          decoration: InputDecoration(
                                                                            // hintText: hintText,
                                                                            // hintStyle: const TextStyle(
                                                                            //   color: Color.fromARGB(137, 82, 82, 82),
                                                                            // ),
                                                                            isDense: true,
                                                                            contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                              borderSide: BorderSide(
                                                                                color: AppStyles.border3,
                                                                              ),
                                                                            ),
                                                                            focusedBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                              borderSide: BorderSide(
                                                                                color: AppStyles.viewBtnBg,
                                                                              ),
                                                                            ),
                                                                            errorStyle: TextStyle(
                                                                              color: AppStyles.deleteBtnBg,
                                                                              inherit: false,
                                                                              fontSize: 12,
                                                                              height: -.3,
                                                                              backgroundColor: AppStyles.c1,
                                                                            ),
                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                              borderSide: BorderSide(
                                                                                width: 1,
                                                                                color: AppStyles.deleteBtnBg,
                                                                              ),
                                                                            ),
                                                                            errorBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                              borderSide: BorderSide(
                                                                                width: 1,
                                                                                color: AppStyles.deleteBtnBg,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        popupProps: PopupProps.menu(
                                                                          fit: FlexFit.loose,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )),
                                                          ],
                                                        ),
                                                        /** END :: BOOTSTRAP CONTAINER */
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                                width: 120,
                                                                height: 40,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(4),
                                                                  color: AppStyles.addBtnBg,
                                                                ),
                                                                child: MaterialButton(
                                                                  height: 40,
                                                                  onPressed: () {
                                                                    final FormState? form = _formKey.currentState;
                                                                    if (form!.validate()) {
                                                                    } else {
                                                                      print('Form is invalid');
                                                                    }
                                                                  },
                                                                  child: Text(
                                                                    'SUBMIT',
                                                                    style: TextStyle(
                                                                      color: AppStyles.addBtnColor,
                                                                    ),
                                                                  ),
                                                                ))
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ))
                                              ],
                                            ),
                                          ));
                                          */

                                      /**
                                      Dialog(
                                          backgroundColor: AppStyles.c1,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
                                          child: Container(
                                            width: 450,
                                            constraints: BoxConstraints(maxWidth: Get.width),
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(top: 7, bottom: 7, left: 10, right: 10),
                                                  decoration: BoxDecoration(
                                                    color: AppStyles.c2,
                                                  ),
                                                  child: LayoutGrid(
                                                      columnSizes: [50.px, 1.fr],
                                                      rowSizes: const [auto],
                                                      columnGap: 3,
                                                      children: [
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            minimumSize: const Size(0, 45),
                                                            padding: EdgeInsets.all(10),
                                                            backgroundColor: AppStyles.c1,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          child: Icon(Icons.arrow_back),
                                                        ),
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            RichText(
                                                              textAlign: TextAlign.center,
                                                              text: TextSpan(
                                                                children: [
                                                                  WidgetSpan(
                                                                      child: Icon(
                                                                    Icons.person,
                                                                    size: 20,
                                                                    color: AppStyles.textColor,
                                                                  )),
                                                                  TextSpan(
                                                                    text: ' Add New Patient',
                                                                    style: TextStyle(
                                                                      color: AppStyles.textColor,
                                                                      fontSize: 18,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ]),
                                                ),
                                                Expanded(
                                                    child: SingleChildScrollView(
                                                  padding: EdgeInsets.all(15),
                                                  physics: ScrollPhysics(),
                                                  child: Form(
                                                    key: _formKey,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        /* BEGIN :: BOOTSTRAP CONTAINER  **/
                                                        BootstrapContainer(
                                                          fluid: true,
                                                          // decoration: BoxDecoration(color: AppStyles.c1),
                                                          children: <Widget>[
                                                            BootstrapCol(
                                                              sizes: 'col-12 col-sm-6',
                                                              child: Forms.textbox(
                                                                labelText: "Name",
                                                                controller: nameController,
                                                                validator: Validators.textValidate,
                                                              ),
                                                            ),
                                                            BootstrapCol(
                                                                sizes: 'col-12 col-sm-6',
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text('Type', style: TextStyle(color: AppStyles.textColor, fontSize: 14, decoration: TextDecoration.none)),
                                                                    SizedBox(
                                                                      height: 4,
                                                                    ),
                                                                    SizedBox(
                                                                      height: 35,
                                                                      child: DropdownSearch<String>(
                                                                        key: keyDropdown,
                                                                        selectedItem: "Menu",
                                                                        items: (filter, infiniteScrollProps) => ["Menu", "Dialog", "Modal", "BottomSheet"],
                                                                        decoratorProps: DropDownDecoratorProps(
                                                                          decoration: InputDecoration(
                                                                            // hintText: hintText,
                                                                            // hintStyle: const TextStyle(
                                                                            //   color: Color.fromARGB(137, 82, 82, 82),
                                                                            // ),
                                                                            isDense: true,
                                                                            contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                              borderSide: BorderSide(
                                                                                color: AppStyles.border3,
                                                                              ),
                                                                            ),
                                                                            focusedBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                              borderSide: BorderSide(
                                                                                color: AppStyles.viewBtnBg,
                                                                              ),
                                                                            ),
                                                                            errorStyle: TextStyle(
                                                                              color: AppStyles.deleteBtnBg,
                                                                              inherit: false,
                                                                              fontSize: 12,
                                                                              height: -.3,
                                                                              backgroundColor: AppStyles.c1,
                                                                            ),
                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                              borderSide: BorderSide(
                                                                                width: 1,
                                                                                color: AppStyles.deleteBtnBg,
                                                                              ),
                                                                            ),
                                                                            errorBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                              borderSide: BorderSide(
                                                                                width: 1,
                                                                                color: AppStyles.deleteBtnBg,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        popupProps: PopupProps.menu(
                                                                          fit: FlexFit.loose,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )),
                                                          ],
                                                        ),
                                                        /** END :: BOOTSTRAP CONTAINER */
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                                width: 120,
                                                                height: 40,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(4),
                                                                  color: AppStyles.addBtnBg,
                                                                ),
                                                                child: MaterialButton(
                                                                  height: 40,
                                                                  onPressed: () {
                                                                    final FormState? form = _formKey.currentState;
                                                                    if (form!.validate()) {
                                                                    } else {
                                                                      print('Form is invalid');
                                                                    }
                                                                  },
                                                                  child: Text(
                                                                    'SUBMIT',
                                                                    style: TextStyle(
                                                                      color: AppStyles.addBtnColor,
                                                                    ),
                                                                  ),
                                                                ))
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ))
                                              ],
                                            ),
                                          ));
                                      */
                                      /*
                                      Dialog.fullscreen(
                                        backgroundColor: AppStyles.c1,
                                        child: Column(
                                          children: [
                                            Container(
                                              width: Get.width,
                                              color: AppStyles.c2,
                                              padding: EdgeInsets.only(top: 7, bottom: 7, left: 10, right: 10),
                                              child: LayoutGrid(
                                                  columnSizes: [50.px, 1.fr],
                                                  rowSizes: const [auto],
                                                  columnGap: 3,
                                                  children: [
                                                    ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        minimumSize: const Size(0, 45),
                                                        padding: EdgeInsets.all(10),
                                                        backgroundColor: AppStyles.c1,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(8),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: Icon(Icons.arrow_back),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        RichText(
                                                          textAlign: TextAlign.center,
                                                          text: TextSpan(
                                                            children: [
                                                              WidgetSpan(
                                                                  child: Icon(
                                                                Icons.person,
                                                                size: 20,
                                                                color: AppStyles.textColor,
                                                              )),
                                                              TextSpan(
                                                                text: ' Add New Patient',
                                                                style: TextStyle(
                                                                  color: AppStyles.textColor,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ]),
                                            ),
                                            Expanded(
                                                child: SingleChildScrollView(
                                              padding: EdgeInsets.all(15),
                                              physics: ScrollPhysics(),
                                              child: Form(
                                                key: _formKey,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    /* BEGIN :: BOOTSTRAP CONTAINER  **/
                                                    BootstrapContainer(
                                                      fluid: true,
                                                      // decoration: BoxDecoration(color: AppStyles.c1),
                                                      children: <Widget>[
                                                        BootstrapCol(
                                                          sizes: 'col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2',
                                                          child: Forms.textbox(
                                                            labelText: "Name",
                                                            controller: nameController,
                                                            validator: Validators.textValidate,
                                                          ),
                                                        ),
                                                        /*
                                                        BootstrapCol(
                                                          sizes: 'col-12 col-sm-12 col-md-6 col-lg-3 col-xl-2',
                                                          child: Forms.dropDownField(
                                                            labelText: "Select",
                                                            selectedValue: selectedValue,
                                                            sendKey: keyDropdown,
                                                            onChanged: onChanged,
                                                            listOfValue: ['item1', 'item2'],
                                                            validator: Validators.selectValidate,
                                                          ),
                                                        ),
                                                        **/
                                                        BootstrapCol(
                                                            sizes: 'col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2',
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text('Type', style: TextStyle(color: AppStyles.textColor, fontSize: 14, decoration: TextDecoration.none)),
                                                                SizedBox(
                                                                  height: 4,
                                                                ),
                                                                SizedBox(
                                                                  height: 35,
                                                                  child: DropdownSearch<String>(
                                                                    key: keyDropdown,
                                                                    selectedItem: "Menu",
                                                                    items: (filter, infiniteScrollProps) => ["Menu", "Dialog", "Modal", "BottomSheet"],
                                                                    decoratorProps: DropDownDecoratorProps(
                                                                      decoration: InputDecoration(
                                                                        // hintText: hintText,
                                                                        // hintStyle: const TextStyle(
                                                                        //   color: Color.fromARGB(137, 82, 82, 82),
                                                                        // ),
                                                                        isDense: true,
                                                                        contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(5.0),
                                                                          borderSide: BorderSide(
                                                                            color: AppStyles.border3,
                                                                          ),
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(5.0),
                                                                          borderSide: BorderSide(
                                                                            color: AppStyles.viewBtnBg,
                                                                          ),
                                                                        ),
                                                                        errorStyle: TextStyle(
                                                                          color: AppStyles.deleteBtnBg,
                                                                          inherit: false,
                                                                          fontSize: 12,
                                                                          height: -.3,
                                                                          backgroundColor: AppStyles.c1,
                                                                        ),
                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(5.0),
                                                                          borderSide: BorderSide(
                                                                            width: 1,
                                                                            color: AppStyles.deleteBtnBg,
                                                                          ),
                                                                        ),
                                                                        errorBorder: OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(5.0),
                                                                          borderSide: BorderSide(
                                                                            width: 1,
                                                                            color: AppStyles.deleteBtnBg,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    popupProps: PopupProps.menu(
                                                                      fit: FlexFit.loose,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                    /** END :: BOOTSTRAP CONTAINER */
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                            width: 120,
                                                            height: 40,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(4),
                                                              color: AppStyles.addBtnBg,
                                                            ),
                                                            child: MaterialButton(
                                                              height: 40,
                                                              onPressed: () {
                                                                final FormState? form = _formKey.currentState;
                                                                if (form!.validate()) {
                                                                } else {
                                                                  print('Form is invalid');
                                                                }
                                                              },
                                                              child: Text(
                                                                'SUBMIT',
                                                                style: TextStyle(
                                                                  color: AppStyles.addBtnColor,
                                                                ),
                                                              ),
                                                            ))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ))
                                          ],
                                        ),
                                      );
                                      */
                                    });
                              },
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.add,
                                      size: 15,
                                      color: AppStyles.textColor,
                                    )),
                                    TextSpan(
                                      text: ' Add',
                                      style: TextStyle(
                                        color: AppStyles.textColor,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: Get.width,
                        height: 35,
                        margin: EdgeInsets.only(top: 0),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1.0, color: AppStyles.border2),
                          ),
                        ),
                        child: LayoutGrid(
                          columnSizes: [1.fr, 1.fr],
                          rowSizes: const [auto],
                          rowGap: 1,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    height: 34,
                                    padding: EdgeInsets.only(top: 8, right: 15, left: 15, bottom: 7),
                                    color: AppStyles.c1,
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                              child: Icon(
                                            Icons.remove_red_eye_outlined,
                                            size: 15,
                                            color: AppStyles.textColor,
                                          )),
                                          TextSpan(
                                            text: ' Column',
                                            style: TextStyle(
                                              color: AppStyles.textColor,
                                              fontSize: 13,
                                            ),
                                          ),
                                          WidgetSpan(
                                              child: Icon(
                                            Icons.arrow_drop_down,
                                            size: 15,
                                            color: AppStyles.textColor,
                                          )),
                                        ],
                                      ),
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    Get.dialog<void>(
                                      barrierDismissible: true,
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: Get.height,
                                            width: Get.width * .8,
                                            padding: EdgeInsets.all(4),
                                            constraints: BoxConstraints(maxWidth: 400),
                                            decoration: BoxDecoration(
                                              color: AppStyles.c1,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(0),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: Get.width,
                                                  color: AppStyles.c2,
                                                  child: LayoutGrid(
                                                      columnSizes: [50.px, 1.fr],
                                                      rowSizes: const [auto],
                                                      columnGap: 3,
                                                      children: [
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              minimumSize: const Size(0, 45),
                                                              padding: EdgeInsets.all(10),
                                                              backgroundColor: AppStyles.c2,
                                                              shadowColor: Colors.transparent),
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          child: Icon(
                                                            Icons.arrow_back,
                                                            color: AppStyles.textColor,
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              'Patient Detail',
                                                              style: TextStyle(color: AppStyles.textColor, fontSize: 16, decoration: TextDecoration.none),
                                                            ),
                                                          ],
                                                        )
                                                      ]),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(20),
                                                  child: Expanded(
                                                      child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets.only(bottom: 10),
                                                          margin: EdgeInsets.only(bottom: 10),
                                                          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppStyles.border1))),
                                                          child: LayoutGrid(
                                                              columnSizes: [85.px, 10.px, 1.fr],
                                                              rowSizes: const [auto],
                                                              columnGap: 20,
                                                              children: [
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: 'Name',
                                                                        style: TextStyle(color: AppStyles.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  textAlign: TextAlign.center,
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: ':',
                                                                        style: TextStyle(color: AppStyles.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: 'K.Sheik Abdullah',
                                                                        style: TextStyle(
                                                                          color: AppStyles.textColor,
                                                                          fontSize: 14,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.only(bottom: 10),
                                                          margin: EdgeInsets.only(bottom: 10),
                                                          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppStyles.border1))),
                                                          child: LayoutGrid(
                                                              columnSizes: [85.px, 10.px, 1.fr],
                                                              rowSizes: const [auto],
                                                              columnGap: 20,
                                                              children: [
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: 'Age',
                                                                        style: TextStyle(color: AppStyles.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  textAlign: TextAlign.center,
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: ':',
                                                                        style: TextStyle(color: AppStyles.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: '34',
                                                                        style: TextStyle(
                                                                          color: AppStyles.textColor,
                                                                          fontSize: 14,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.only(bottom: 10),
                                                          margin: EdgeInsets.only(bottom: 10),
                                                          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppStyles.border1))),
                                                          child: LayoutGrid(
                                                              columnSizes: [85.px, 10.px, 1.fr],
                                                              rowSizes: const [auto],
                                                              columnGap: 20,
                                                              children: [
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: 'Phone',
                                                                        style: TextStyle(color: AppStyles.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  textAlign: TextAlign.center,
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: ':',
                                                                        style: TextStyle(color: AppStyles.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: '+91 9791381108',
                                                                        style: TextStyle(
                                                                          color: AppStyles.textColor,
                                                                          fontSize: 14,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.only(bottom: 10),
                                                          margin: EdgeInsets.only(bottom: 10),
                                                          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppStyles.border1))),
                                                          child: LayoutGrid(
                                                              columnSizes: [85.px, 10.px, 1.fr],
                                                              rowSizes: const [auto],
                                                              columnGap: 20,
                                                              children: [
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: 'Address',
                                                                        style: TextStyle(color: AppStyles.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  textAlign: TextAlign.center,
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: ':',
                                                                        style: TextStyle(color: AppStyles.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: '24, Balaji Avenue, 4th Cross Street, West Chinthamani, Trichy-2.',
                                                                        style: TextStyle(color: AppStyles.textColor, fontSize: 14, height: 1.4),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.only(bottom: 10),
                                                          margin: EdgeInsets.only(bottom: 10),
                                                          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppStyles.border1))),
                                                          child: LayoutGrid(
                                                              columnSizes: [85.px, 10.px, 1.fr],
                                                              rowSizes: const [auto],
                                                              columnGap: 20,
                                                              children: [
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: 'Name',
                                                                        style: TextStyle(color: AppStyles.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  textAlign: TextAlign.center,
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: ':',
                                                                        style: TextStyle(color: AppStyles.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: '',
                                                                        style: TextStyle(
                                                                          color: AppStyles.textColor,
                                                                          fontSize: 14,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.only(bottom: 10),
                                                          margin: EdgeInsets.only(bottom: 10),
                                                          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppStyles.border1))),
                                                          child: LayoutGrid(
                                                              columnSizes: [85.px, 10.px, 1.fr],
                                                              rowSizes: const [auto],
                                                              columnGap: 20,
                                                              children: [
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: 'Name',
                                                                        style: TextStyle(color: AppStyles.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  textAlign: TextAlign.center,
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: ':',
                                                                        style: TextStyle(color: AppStyles.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: '',
                                                                        style: TextStyle(
                                                                          color: AppStyles.textColor,
                                                                          fontSize: 14,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.only(bottom: 10),
                                                          margin: EdgeInsets.only(bottom: 10),
                                                          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppStyles.border1))),
                                                          child: LayoutGrid(
                                                              columnSizes: [85.px, 10.px, 1.fr],
                                                              rowSizes: const [auto],
                                                              columnGap: 20,
                                                              children: [
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: 'Name',
                                                                        style: TextStyle(color: AppStyles.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  textAlign: TextAlign.center,
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: ':',
                                                                        style: TextStyle(color: AppStyles.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: '',
                                                                        style: TextStyle(
                                                                          color: AppStyles.textColor,
                                                                          fontSize: 14,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Container(
                                      height: 34,
                                      padding: EdgeInsets.only(top: 8, right: 15, left: 15, bottom: 7),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(width: 1.0, color: AppStyles.border2),
                                        ),
                                        color: AppStyles.c1,
                                      ),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                                child: Icon(
                                              Icons.download,
                                              size: 13,
                                              color: AppStyles.textColor,
                                            )),
                                            TextSpan(
                                              text: 'Download',
                                              style: TextStyle(
                                                color: AppStyles.textColor,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                )
                              ],
                            ),
                            Container(
                              height: 34,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(width: 1.0, color: AppStyles.border2),
                                  bottom: BorderSide(width: 2.0, color: AppStyles.border2),
                                ),
                                color: AppStyles.c1,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  floatingLabelStyle: TextStyle(fontSize: 12),
                                  labelStyle: TextStyle(fontSize: 13),
                                  labelText: 'Search Here...',
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(top: 75),
                  child: ComponentGrid(
                    columns: columns,
                    containerWidth: 1000,
                    rows: rows,
                  ))
            ],
          )),
    );
  }
}
