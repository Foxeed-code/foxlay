import 'package:ehospital/components/get_components.dart';
import 'package:flutter/material.dart';
import 'package:ehospital/tabs/example_text.dart';
import 'package:get/get.dart';

class Screen2 extends StatelessWidget {
  const Screen2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 300,
            maxWidth: 1200,
          ),
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Screen 2', style: TextStyle(fontSize: 20)),
                SizedBox(height: 15),
                Text(ExampleText.homeDesc1),
                SizedBox(height: 50),
                _FeatureContainer(
                  title: ExampleText.homeDraggableTab,
                  features: [
                    _Feature(description: ExampleText.homeDraggableTabDesc),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      GetComponents.dialog(
                          title: "TEST",
                          message: "message",
                          onPressed: () {
                            Get.back();
                          });
                    },
                    child: Text('Click'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 300,
            maxWidth: 1200,
          ),
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Screen 2', style: TextStyle(fontSize: 20)),
                SizedBox(height: 15),
                Text(ExampleText.homeDesc1),
                SizedBox(height: 50),
                _FeatureContainer(
                  title: ExampleText.homeDraggableTab,
                  features: [
                    _Feature(description: ExampleText.homeDraggableTabDesc),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      GetComponents.snackBar(title: 'Message', message: "Test Message");
                      GetComponents.dialog(
                          title: "TEST",
                          message: "message",
                          onPressed: () {
                            Get.back();
                          });
                      // GetComponents.bottomSheet(builder: bottomSheet());
                    },
                    child: Text('Click'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container bottomSheet() {
    return Container(
        height: 250,
        width: 1200,
        color: Colors.greenAccent,
        child: const Column(
          children: [
            Text('Hii 1'),
            Text('Hii 2'),
            Text('Hii 3'),
            Text('Hii 4'),
          ],
        ));
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
