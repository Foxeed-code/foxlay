import 'package:ehospital/components/grid.dart';
import 'package:ehospital/components/src/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pluto_layout/pluto_layout.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../components/form_components.dart';
import '../components/src/widgets/layout_grid.dart';
import '../components/utilities.dart';
import '../components/flutter_bootstrap.dart';
import '../components/validators.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController _userEditTextController = TextEditingController();
  TextEditingController selectController = TextEditingController();
  final GlobalKey<FormFieldState<dynamic>> keyDropdown = GlobalKey<FormFieldState<dynamic>>();
  final GlobalKey<FormFieldState<dynamic>> keyDropdown2 = GlobalKey<FormFieldState<dynamic>>();
  String selectedValue = "";
  String selectName = "";
  int selectID = 0;

  void onChanged(value) {
    debugPrint('You selected $value');
    setState(() {
      selectedValue = value;
    });
  }

  void onChangedID(User value) {
    debugPrint('You selected ${value.id}');
    setState(() {
      selectID = value.id;
    });
  }

  List<User> users = <User>[
    User(name: "Adv", id: 5),
    User(name: 'Bob', id: 1),
    User(name: 'Charlie', id: 2),
    User(name: 'Dave', id: 3),
    User(name: 'Eve', id: 4),
  ];

  static const List<String> kOptions = <String>[
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
    'Watermelon pieces',
  ];

  List<PlutoColumn> columns = [
    /// Text Column definition
    PlutoColumn(title: 'TEXT COLUMN GitHub', backgroundColor: AppStyles.c2, field: 'text_field', type: PlutoColumnType.text(), readOnly: true, suppressedAutoSize: true),

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
                size: 14,
                color: AppStyles.textColor,
              )),
              TextSpan(text: text, style: TextStyle(fontSize: 14)),
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
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppStyles.tableHeadColor,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(12.0), topLeft: Radius.circular(12.0)),
                  ),
                  child: Column(
                    children: [
                      LayoutGrid(
                        columnSizes: [1.fr, auto],
                        rowSizes: const [auto],
                        rowGap: 1,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 3, bottom: 6, left: 10, right: 12),
                            child: Wrap(
                              children: [
                                Text(
                                  'Home',
                                  style: TextStyle(fontSize: 13, color: AppStyles.c1),
                                ),
                                Text(
                                  ' / ',
                                  style: TextStyle(fontSize: 13, color: AppStyles.c1),
                                ),
                                Text(
                                  'Appointment',
                                  style: TextStyle(fontSize: 13, color: AppStyles.c1),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                padding: EdgeInsets.only(top: 4),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(width: 1.0, color: AppStyles.border2),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppStyles.c2,
                                ),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                          child: Icon(
                                        Icons.download_outlined,
                                        size: 15,
                                        color: AppStyles.textColor,
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
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
                                                    padding: EdgeInsets.only(top: 7, bottom: 7, left: 15, right: 10),
                                                    decoration: BoxDecoration(
                                                      color: AppStyles.c2,
                                                    ),
                                                    child: LayoutGrid(
                                                        columnSizes: [1.fr, 50.px],
                                                        rowSizes: const [auto],
                                                        columnGap: 3,
                                                        children: [
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
                                                              Icons.close,
                                                              color: AppStyles.textColor,
                                                            ),
                                                          ),
                                                        ]),
                                                  ),
                                                  Expanded(
                                                      child: SingleChildScrollView(
                                                    padding: EdgeInsets.all(25),
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
                                                                  child: Forms.autoComplete(
                                                                      labelText: "Select Single Type",
                                                                      onChanged: onChanged,
                                                                      selectedValue: selectedValue,
                                                                      listOfValue: kOptions,
                                                                      validator: Validators.selectValidate)),
                                                              BootstrapCol(
                                                                  sizes: 'col-12 col-sm-6 col-md-4 col-lg-3',
                                                                  child: Forms.autoComplete(
                                                                      labelText: "Select Single",
                                                                      onChanged: onChanged,
                                                                      selectedValue: selectedValue,
                                                                      listOfValue: kOptions,
                                                                      validator: Validators.selectValidate)),
                                                              BootstrapCol(
                                                                sizes: 'col-12 col-sm-6 col-md-4 col-lg-3',
                                                                child: Forms.textbox(
                                                                  labelText: "Mobile",
                                                                  controller: dateController,
                                                                  validator: Validators.textValidate,
                                                                ),
                                                              ),
                                                              BootstrapCol(
                                                                  sizes: 'col-12 col-sm-6 col-md-4 col-lg-3',
                                                                  child: Forms.autoCompleteWithID(
                                                                      labelText: "Select With ID",
                                                                      onChanged: onChangedID,
                                                                      selectedValue: selectName,
                                                                      listOfValue: users,
                                                                      validator: Validators.selectValidate)),
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
                                      });
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  padding: EdgeInsets.only(top: 3),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(width: 1.0, color: AppStyles.border2),
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppStyles.c2,
                                  ),
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
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(top: 55),
                  padding: EdgeInsets.only(bottom: 15),
                  color: AppStyles.constColor,
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
