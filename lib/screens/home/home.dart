import 'package:flutter/material.dart';
import 'card/reusablecard.dart';
import 'dashboard/dashboard.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  int height = 0;
  Icon icon1 = const Icon(
    Icons.compare_arrows_outlined,
    color: Colors.yellow,
    size: 80.0,
  );

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.red,
          ],
        )),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 5,
              child: (currentIndex == 0)
                  ? Dashboard()
                  : (currentIndex == 1)
                      ? Dashboard()
                      : (currentIndex == 2)
                          ? Dashboard()
                          : Dashboard(),
            ),
            Flexible(
              flex: 4,
              child: ReusableCard(
                colour: Color(0xff144552),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text(
                      'What is your current feeling?',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 32, 8, 0),
                          child: icon1,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFF212F45),
                        overlayColor: Color(0x29caf0f8),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 50.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        label: height > 20
                            ? height < 60
                                ? 'Neutral'
                                : 'Happy'
                            : 'Sad',
                        min: 0,
                        max: 100,
                        divisions: 2,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                            Icon iconSad = Icon(
                              Icons.sentiment_dissatisfied_outlined,
                              color: Colors.yellow,
                              size: 80.0,
                            );
                            Icon iconHappy = Icon(
                              Icons.sentiment_satisfied_outlined,
                              color: Colors.yellow,
                              size: 80.0,
                            );
                            Icon iconNeutral = Icon(
                              Icons.sentiment_neutral_outlined,
                              color: Colors.yellow,
                              size: 80.0,
                            );
                            icon1 = height > 20
                                ? height < 60
                                    ? iconNeutral
                                    : iconHappy
                                : iconSad;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  //! TODO LoadingScreen Link
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) =>
                  //   LoadingQusScreen().getScreen(context)),
                  // );
                },
                child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'Take Test',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                  decoration: BoxDecoration(color: Color(0xff0B525B)),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xff212f45),
    );
  }
}
