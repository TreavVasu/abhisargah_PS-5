import 'package:flutter/material.dart';
import 'package:hack/screens/welcome/welcome.dart';
import 'package:url_launcher/url_launcher.dart';
import 'theme.dart';

class RedirectTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String text;
  final String time;
  final Widget widgetToRedirect;
  final bool isRead;

  const RedirectTile(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.text,
      required this.time,
      required this.widgetToRedirect,
      this.isRead = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widgetToRedirect,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(children: [
          Image.asset(
            imageUrl,
            height: 55,
            width: 55,
          ),
          const SizedBox(
            width: 12,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name, style: titleTextStyle),
            Text(text,
                style: isRead
                    ? subtitleTextStyle
                    : subtitleTextStyle.copyWith(color: primaryColor, fontWeight: FontWeight.w500)),
          ]),
          const Spacer(),
          Text(
            time,
            style: subtitleTextStyle,
          )
        ]),
      ),
    );
  }
}
