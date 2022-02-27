import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/logic/mlprocess/mlprocess.dart';
import '../../logic/quiz/quiz_brain.dart';
import '../home/home.dart';
import '../../services/database.dart';

class ResultScreen extends StatefulWidget {
  String ?result;
  ResultScreen({this.result});


  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  Map<String,String>details={
    'Anxiety':"It’s normal to feel anxious "
        "about moving to a new place, starting a new job, or taking a test. This type of anxiety is unpleasant, "
        "but it may motivate you to work "
        "harder and to do a better job. Ordinary anxiety "
        "is a feeling that comes and goes, but does not "
        "interfere with your everyday life.",
    "Normal":"Hooray... Looks like everything is great with you,"
        "but wait these mental health problems can come like Vin Diesel "
        "(Fast and Furious)"
        "So be in touch with us for future guidance",
    "Loneliness":"Loneliness is an unpleasant emotional response to perceived isolation. Loneliness is also described as social pain—a psychological mechanism which motivates individuals to seek social connections. It is often associated with an "
        "unwanted lack of connection and intimacy.",
    "Depression":"Depression (major depressive disorder) is a common and serious medical illness that negatively affects how you feel, the way you think and how you act. Fortunately, it is also treatable. Depression causes feelings of sadness and/or a loss of interest in activities you once enjoyed. It can lead to a variety of emotional and physical problems and can decrease "
        "your ability to function at work and at home.",
    "Stress":"Stress is a feeling of emotional or physical tension. It can come from any event or thought that makes you feel frustrated, angry, or nervous. Stress is your body's reaction to a challenge or demand. In short bursts, stress can be positive,"
        " such as when it helps you avoid danger or meet a deadline"
  };
  bool resultPosted=false;
  @override
  void initState() {
    super.initState();

  }
  int length=0;
  List<dynamic>?myList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pushReplacementNamed(MyHomePage().route);
      }, child:Icon(Icons.home)),
      body: Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,80,0,60),
                  child: Text( "YOUR CURRENT RESULT IS ...\n" +"\t" +widget.result!,
                    style: TextStyle( fontSize: 25,color: Colors.white,),textAlign: TextAlign.center),
                ),
                if(myList==null )Text(details[widget.result]!),
                if(myList!=null)Column(
                  
                  children:[
                    Padding(padding: EdgeInsets.all(5), child: Text("Your Past Results are .."),),
                    Material(
                    elevation: 20,
                    child: Container(
                      height:MediaQuery.of(context).size.height/1.75,
                      decoration: BoxDecoration(
                        color: Color(0xff1B3A4B),
                      ),
                      child:ListView.builder(itemBuilder:(BuildContext ctx,int index){
                        
                        return ListTile(
                          title: Center(child: Text(index.toString() +" "  +   myList![index]['group'],style: TextStyle(color: Colors.white),)),
                        );
                      }, itemCount: myList!.length,)
                      ,),
                  ),] 
                ),
                if(myList==null)ElevatedButton(onPressed:() async{

                  myList=await Database().getPastResultOfUser();
                  setState(() {

                  });
    }, child: Text("Show Past Result")),
              ]
            )
          ],
        ),
      ),
    );
  }
}

class Result {
  getResult(List<double> prediction) {
    var mapping = {0: "Anxiety", 1: "Depression", 2: "Loneliness", 3: "Stress", 4: "Normal"};
    int pos = 0;
    double m = prediction[0];
    for (int i = 1; i < 5; i++) {
      if (prediction[i] >= m) {
        pos = i;
      }
    }
    // this is where the final prediction is stored
    var result = mapping[pos];
    return result;
  }
}
