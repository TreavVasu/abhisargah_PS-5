import 'package:abhisargah_health_app/screens/yoga/yoga_card.dart';
import 'package:flutter/material.dart';

class YogaScreen extends StatefulWidget {
  YogaScreen({Key? key}) : super(key: key);

  @override
  State<YogaScreen> createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> yogaContent = [];
    List<Icon> yogaImages = [];

    String imageAssetFile = "assets/images/yoga.jpeg";

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(
            flex: 4,
            child: CircularBorderedCard(
                height: 400,
                width: double.infinity,
                widget: Image.asset('assets/images/yoga.jpeg'),
                elevate: 4.0,
                clr: Colors.amber),
          ),
          Flexible(
            flex: 2,
            child: ListView.builder(
                itemCount: yogaContent.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                          title: Text(yogaContent[index]),
                          subtitle: Text(yogaContent[index]),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(yogaContent[index]),
                          ),
                          trailing: Icon(Icons.abc_sharp)));
                }),
          ),
        ],
      ),
    );
  }
}
