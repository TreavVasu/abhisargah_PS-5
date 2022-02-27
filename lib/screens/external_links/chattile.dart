import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'links_page.dart';
import 'theme.dart';

class ChatTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String text;
  final String time;
  final String redirectUrl;
  final bool isRead;

  const ChatTile(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.text,
      required this.time,
      required this.redirectUrl,
      this.isRead = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String url = redirectUrl;
        if (await canLaunch(url))
          await launch(url);
        else
          throw HomePage();
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
                    : subtitleTextStyle.copyWith(
                        color: primaryColor, fontWeight: FontWeight.w500)),
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
