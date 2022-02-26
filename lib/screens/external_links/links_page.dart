import 'package:flutter/material.dart';
import 'package:hack/screens/Profile/profile.dart/profile.dart';
import 'package:hack/screens/chatbot/chatbot.dart';
import 'package:hack/screens/meditation/meditation.dart';
import 'package:hack/screens/welcome/helper/redirect_tile.dart';
import 'helper/chattile.dart';
import 'helper/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> urlLinks = ["fwres", "sef", " ds", " ds", "dsf "];
    List<String> urlTitle = [];
    List<String> urlDesc = [];

    return Scaffold(
      backgroundColor: blueColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: greenColor,
            onPressed: () {
              //! Refdirect to Chat
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            child: const Icon(
              Icons.chat,
              size: 28,
            ),
          ),
          FloatingActionButton(
            backgroundColor: greenColor,
            onPressed: () {
              //! Refdirect to Home
            },
            child: const Icon(
              Icons.home_filled,
              size: 28,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/images/yes/q13yes.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Important Links ',
              style: TextStyle(fontSize: 20, color: whiteColor),
            ),
            Text(
              'For Calming the mind',
              style: TextStyle(fontSize: 16, color: mutedColor),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(40),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Breathe, Relax',
                    style: titleTextStyle,
                  ),
                  const RedirectTile(
                    imageUrl: 'assets/images/yes/q13yes.png',
                    name: 'Yoga',
                    text: 'Try Yoga Poses and stay fir',
                    time: ': )',
                    isRead: true,
                    widgetToRedirect: MeditationPage(),
                  ),
                  const RedirectTile(
                    widgetToRedirect: MeditationPage(),
                    imageUrl: 'assets/images/yes/q13yes.png',
                    name: 'Meditate',
                    text: 'Breathe and Enjoy',
                    time: '; )',
                  ),
                  const RedirectTile(
                    widgetToRedirect: MeditationPage(),
                    imageUrl: 'assets/images/yes/q13yes.png',
                    name: 'Zen Music',
                    text: 'Be Calm and Enjoy',
                    time: ':}',
                    isRead: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Vital Links',
                    style: titleTextStyle,
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: urlLinks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ChatTile(
                          redirectUrl: urlLinks[index],
                          imageUrl: 'assets/images/yes/q13yes.png',
                          name: 'Link h ye',
                          text: 'Link click kar loi please',
                          time: ':P',
                          isRead: true,
                        );
                      }),
                ],
              ),
            )
          ]),
        ),
      )),
    );
  }
}
