import 'package:abhisargah_health_app/screens/home/profile_screen.dart';
import 'package:flutter/material.dart';
import '../loading/loading.dart';
import 'card/reusablecard.dart';
import 'dashboard/dashboard.dart';

enum PopupValues{
  TestPage,
  ChatBot,
  ProfilePage
}
class MyHomePage extends StatefulWidget {
  String route='/home/home.dart';
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
      appBar: AppBar(

        backgroundColor: Colors.transparent, actions: [
        PopupMenuButton(
          onSelected: (value){
            if(value==PopupValues.TestPage){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LoadingQusScreen().getScreen(context)),
              );
            }
            else if(value==PopupValues.ChatBot){

            }
            else{
              Navigator.of(context).pushNamed(ProfileScreen().route);
            }
          },
          icon: Icon(Icons.more_vert),
          itemBuilder: (_)=>[
            const PopupMenuItem(

              padding: EdgeInsets.all(5),
              child: SizedBox(
                height:60,
                width: 140,
                child: Card(
                  elevation: 5,

                    child:Center(child:Text("Test Page"))),
              ),value: PopupValues.TestPage,),
            const PopupMenuItem(
              padding: EdgeInsets.all(5),
              child: SizedBox(
                height:60,width: 140,
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),

                    child:Center(child:Text("Chat Bot"))),
              ),value: PopupValues.ChatBot,),
            const PopupMenuItem(

              padding: EdgeInsets.all(5),
              child: SizedBox(
                height: 60,width: 140,
                child: Card(
elevation: 5,
                    child:Center(child:Text("Profile Screen"))),
              ),value: PopupValues.ProfilePage,),
            

          ],
        ),
      ],),
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
              flex: 3,
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
                    Flexible(
                      child: const Text(
                        'What is your current feeling?',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Flexible(
                      child:Row(
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
                    ),
                    
                    Flexible(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFF212F45),
                          overlayColor: Color(0x29caf0f8),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 50.0),
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
                                size:80,
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
                    ),
                  ],
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
