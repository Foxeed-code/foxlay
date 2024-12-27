import 'package:ehospital/components/form_components.dart';
import 'package:ehospital/components/src/flutter_bootstrap.dart';
import 'package:ehospital/components/validators.dart';
import 'package:flutter/material.dart';
import 'package:pluto_layout/pluto_layout.dart';

import 'package:ehospital/tabs/example_text.dart';

class Screen1 extends StatefulWidget implements PlutoLayoutTabViewWidgetHasFocusNode {
  const Screen1({
    super.key,
    required this.focusNode,
  });
  @override
  final FocusNode focusNode;

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with WidgetsBindingObserver {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  void onChanged(value) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    widget.focusNode.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
    switch (state) {
      case AppLifecycleState.resumed:
        // App is resumed from standby
        debugPrint('App resumed');

        // Perform actions when the app becomes active again
        break;
      case AppLifecycleState.inactive:
        // App is inactive (e.g., going into standby)
        debugPrint('App inactive');
        // Perform actions when the app goes into standby
        break;
      case AppLifecycleState.paused:
        debugPrint('App paused');
        break;
      case AppLifecycleState.detached:
        // App is detached
        debugPrint('App detached');
        break;
      case AppLifecycleState.hidden:
      // TODO: Handle this case.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: widget.focusNode,
      onFocusChange: (flag) {
        // if (widget.focusNode.hasPrimaryFocus) {
        //   stateManager.setKeepFocus(flag);
        // }
      },
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 300,
              maxWidth: 800,
            ),
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sheik Branch Test", style: TextStyle(fontSize: 20)),
                  Text(ExampleText.homeTitle, style: TextStyle(fontSize: 20)),
                  SizedBox(height: 15),
                  Text(ExampleText.homeDesc1),
                  SizedBox(height: 50),
                  _FeatureContainer(
                    title: ExampleText.homeDraggableTab,
                    features: [
                      _Feature(description: ExampleText.homeDraggableTabDesc),
                    ],
                  ),
                  SizedBox(height: 50),
                  _FeatureContainer(
                    title: ExampleText.homeShortcutsTitle,
                    features: [
                      _Feature(description: ExampleText.homeShortcutsDesc),
                      _Feature(
                        title: ExampleText.homeShortcutsAlt1Title,
                        description: ExampleText.homeShortcutsAlt1Desc,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          /* BEGIN :: BOOTSTRAP CONTAINER  **/
                          BootstrapContainer(
                            fluid: true,
                            // decoration: const BoxDecoration(color: Colors.white),
                            children: <Widget>[
                              BootstrapRow(
                                children: <BootstrapCol>[
                                  BootstrapCol(
                                      sizes: 'col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3',
                                      child: SizedBox(
                                        height: 40,
                                        child: Forms.textbox(
                                          labelText: "Name",
                                          hintText: "",
                                          controller: nameController,
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.next,
                                          validator: Validators.textValidate,
                                        ),
                                      )),
                                  // BootstrapCol(
                                  //   sizes: 'col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3',
                                  //   child: Forms.dropDownField(
                                  //     labelText: "Selet Value",
                                  //     selectedValue: 'item1',
                                  //     onChanged: onChanged,
                                  //     listOfValue: ['item1', 'item2'],
                                  //     //validator: Validators.selectValidate,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                          /** END :: BOOTSTRAP CONTAINER */
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Forms.elevatedButton2(text: 'Submit', onPressed: () {}),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureContainer extends StatelessWidget {
  const _FeatureContainer({
    required this.title,
    required this.features,
  });

  final String title;

  final List<_Feature> features;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final lastItem = features.last;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.dialogBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final feature in features)
                    if (lastItem != feature) ...[
                      feature,
                      const SizedBox(height: 15),
                    ] else
                      feature,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Feature extends StatelessWidget {
  const _Feature({
    this.title,
    required this.description,
  });

  final String? title;

  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Wrap(
      direction: Axis.horizontal,
      children: [
        if (title != null) ...[
          DecoratedBox(
            decoration: BoxDecoration(
              color: theme.secondaryHeaderColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(title!),
            ),
          ),
          const SizedBox(width: 10),
        ],
        Text(description),
      ],
    );
  }
}
