// @dart=2.9
import 'dart:async';

import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_advert.dart';
import 'gestu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  static const String _title = 'Mental Health AR';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await ArFlutterPlugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: Column(children: [
          Text('Running on: $_platformVersion\n'),
          Expanded(
            child: ExampleList(),
          ),
        ]),
      ),
    );
  }
}

class ExampleList extends StatelessWidget {
  ExampleList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final examples = [
      Example(
          'See Our Mental Health App With AI Diagnose!!',
          'Visualize with amazing features and game like experience',
          () => Navigator.push(context, MaterialPageRoute(builder: (context) => AdToApp()))),
      Example(
          'Start the Game',
          'Rotate and Pan Objects in the View',
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => ObjectGesturesWidget()))),
      // Example(
      //     'Screenshots',
      //     'Place 3D objects on planes and take screenshots',
      //     () =>
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenshotWidget()))),
      // // Example(
      //     'Cloud Anchors',
      //     'Place and retrieve 3D objects using the Google Cloud Anchor API',
      //     () => Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => CloudAnchorWidget()))),
      // Example(
      //     'External Model Management',
      //     'Similar to Cloud Anchors example, but uses external database to choose from available 3D models',
      //     () => Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => ExternalModelManagementWidget())))
    ];
    return ListView(
      children: examples.map((example) => ExampleCard(example: example)).toList(),
    );
  }
}

class ExampleCard extends StatelessWidget {
  ExampleCard({Key key, this.example}) : super(key: key);
  final Example example;

  @override
  build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          example.onTap();
        },
        child: ListTile(
          title: Text(example.name),
          subtitle: Text(example.description),
        ),
      ),
    );
  }
}

class Example {
  const Example(this.name, this.description, this.onTap);
  final String name;
  final String description;
  final Function onTap;
}
