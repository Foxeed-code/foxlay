import 'package:ehospital/components/utilities.dart';
import 'package:flutter/material.dart';

class Forms {
  Forms._();

  // Text Form Field
  static Widget textbox({
    required String labelText,
    String hintText = "",
    required TextEditingController controller,
    bool obscureText = false,
    FocusNode? txtFocus,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
    String? Function(String?)? validator,
    Widget? suffixIcon,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(labelText, style: TextStyle(color: AppStyles.textColor, fontSize: 14, decoration: TextDecoration.none)),
      SizedBox(
        height: 4,
      ),
      TextFormField(
        focusNode: txtFocus,
        controller: controller,
        obscureText: obscureText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        style: TextStyle(
          color: AppStyles.textColor,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(137, 82, 82, 82),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
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
        validator: validator,
      )
    ]);
  }

  static Widget autoComplete({
    required String labelText,
    required String selectedValue,
    required void Function(dynamic) onChanged,
    required List<String> listOfValue,
    bool obscureText = false,
    String hintText = "",
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
    String? Function(String?)? validator,
    Widget? suffixIcon,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(labelText, style: TextStyle(color: AppStyles.textColor, fontSize: 14, decoration: TextDecoration.none)),
      SizedBox(
        height: 4,
      ),
      SizedBox(
          height: 35,
          child: Autocomplete<String>(
            fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
              return TextFormField(
                validator: validator,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: AppStyles.border3,
                    ),
                  ),
                  suffixIcon: Focus(
                      descendantsAreFocusable: false,
                      canRequestFocus: false,
                      child: IconButton(
                          onPressed: () {
                            fieldTextEditingController.text = "";
                            selectedValue = "";
                          },
                          icon: Icon(
                            selectedValue == "" ? Icons.arrow_drop_down : Icons.close_outlined,
                            color: AppStyles.textColor,
                          ))),
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
                controller: fieldTextEditingController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                onFieldSubmitted: (String selection) {
                  if (!listOfValue.contains(selection)) {
                    fieldTextEditingController.text = selectedValue;
                  }
                  //FocusScope.of(context).nextFocus();
                  // nextFocus.requestFocus();
                  onFieldSubmitted();
                },
                focusNode: fieldFocusNode,
              );
            },
            initialValue: TextEditingValue(text: selectedValue),
            optionsBuilder: (TextEditingValue textEditingValue) {
              // if (textEditingValue.text == '') {
              //   return const Iterable<String>.empty();
              // }
              return listOfValue.where((String option) {
                return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
              });
            },
            optionsViewBuilder: ((context, onSelected, options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4.0,
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 200, maxWidth: 200), //RELEVANT CHANGE: added maxWidth
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final String option = options.elementAt(index);
                        return InkWell(
                          onTap: () {
                            onSelected(option);
                          },
                          child: Builder(builder: (
                            BuildContext context,
                          ) {
                            final bool highlight = AutocompleteHighlightedOption.of(context) == index;
                            return Container(
                              color: highlight ? AppStyles.c2 : null,
                              padding: const EdgeInsets.all(6.0),
                              child: Text(option),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ),
              );
            }),
            onSelected: (String selection) {
              selectedValue = selection;
              onChanged(selection);
              debugPrint('You just selected $selection');
            },
          )),
    ]);
  }

  static String _displayStringForOption(User option) => option.name;

  static Widget autoCompleteWithID({
    required String labelText,
    required String selectedValue,
    required void Function(User) onChanged,
    required List<User> listOfValue,
    bool obscureText = false,
    String hintText = "",
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
    String? Function(String?)? validator,
    Widget? suffixIcon,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(labelText, style: TextStyle(color: AppStyles.textColor, fontSize: 14, decoration: TextDecoration.none)),
      SizedBox(
        height: 4,
      ),
      SizedBox(
          height: 35,
          child: Autocomplete<User>(
            fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
              return TextFormField(
                validator: validator,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: AppStyles.border3,
                    ),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        fieldTextEditingController.text = "";
                      },
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppStyles.textColor,
                      )),
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
                controller: fieldTextEditingController,
                onFieldSubmitted: (String selection) {
                  print("Print : $selection");
                  fieldTextEditingController.text = selectedValue;

                  onFieldSubmitted();
                },
                focusNode: fieldFocusNode,
              );
            },
            initialValue: TextEditingValue(text: selectedValue),
            optionsBuilder: (TextEditingValue textEditingValue) {
              // if (textEditingValue.text == '') {
              //   return const Iterable<String>.empty();
              // }

              return listOfValue.where((option) {
                return option.name.toLowerCase().contains(textEditingValue.text.toLowerCase());
              });
            },
            optionsViewBuilder: ((context, onSelected, options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4.0,
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 200, maxWidth: 200), //RELEVANT CHANGE: added maxWidth
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final User option = options.elementAt(index);
                        return InkWell(
                          onTap: () {
                            onSelected(option);
                          },
                          child: Builder(builder: (
                            BuildContext context,
                          ) {
                            final bool highlight = AutocompleteHighlightedOption.of(context) == index;
                            return Container(
                              color: highlight ? AppStyles.c2 : null,
                              padding: const EdgeInsets.all(6.0),
                              child: Text(option.name),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ),
              );
            }),
            onSelected: (User selection) {
              selectedValue = _displayStringForOption(selection);
              onChanged(selection);
              debugPrint('You just selected ${_displayStringForOption(selection)}');
            },
          )),
    ]);
  }

  // Drop Down Field
  static Widget dropDownField({
    required String selectedValue,
    required String labelText,
    required GlobalKey<FormFieldState<dynamic>> sendKey,
    required void Function(dynamic) onChanged,
    void Function(String?)? onSaved,
    String? Function(String?)? validator,
    required List<String> listOfValue,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(labelText, style: TextStyle(color: AppStyles.textColor, fontSize: 14, decoration: TextDecoration.none)),
      SizedBox(
        height: 4,
      ),
      DropdownButtonFormField(
        value: selectedValue == "" ? null : selectedValue,
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
        hint: const Text(
          'choose one',
        ),
        isExpanded: true,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        items: listOfValue.map((String val) {
          return DropdownMenuItem(
            value: val,
            child: Text(
              val,
            ),
          );
        }).toList(),
      )
    ]);
  }

  // Drop Down Field
  static Widget dropDownFieldWithId({
    required String selectedValue,
    required String labelText,
    required void Function(dynamic) onChanged,
    void Function(dynamic)? onSaved,
    String? Function(dynamic)? validator,
    required List<Map<String, dynamic>> listOfValue,
  }) {
    return DropdownButtonFormField(
      value: selectedValue == "" ? null : selectedValue,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      hint: const Text(
        'choose one',
      ),
      isExpanded: true,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      items: listOfValue.map((val) {
        return DropdownMenuItem(
          value: val["id"],
          child: Text(
            val["name"],
          ),
        );
      }).toList(),
    );
  }

  // Elevated Button Style 1
  static Widget elevatedButton1({
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Text(text, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal)),
    );
  }

  // Elevated Button Style 2
  static Widget elevatedButton2({
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Text(text, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal)),
    );
  }

  // Text1
  static Widget text1({
    required String text,
    required TextAlign textAlign,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: const TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.normal),
    );
  }

  // Text2
  static Widget text2({
    required String text,
    required TextAlign textAlign,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: const TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  // Rich Text1
  static Widget richText1({
    required String text,
    required TextAlign textAlign,
  }) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      strutStyle: const StrutStyle(fontSize: 15.0),
      textAlign: textAlign,
      text: TextSpan(
        text: text,
        style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal),
      ),
    );
  }

  static Widget datePicker({
    required BuildContext context,
    required void Function(String?) onChanged,
    required String? labelText,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      //editing controller of this TextField
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      readOnly: true,
      //set it true, so that user will not able to edit text
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2100));
        onChanged(pickedDate.toString());
      },
    );
  }
}

@immutable
class User {
  const User({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  String toString() {
    return name;
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is User && other.name == name && other.id == id;
  }

  @override
  int get hashCode => Object.hash(id, name);
}
