import 'package:abhisargah_health_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() => runApp(MaterialApp(home: ProfileScreen()));

class ProfileScreen extends StatefulWidget {
  String route ="./home/profile_screen";
  @override
  ProfileScreenState createState() => new ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {

              Navigator.of(context).pop();
            },
          ),
          actions: [],
        ),
        body:ProfileWidget());
  }
}

class ProfileWidget extends StatelessWidget {
  String imagePath =
      "https://st2.depositphotos.com/1104517/11965/v/600/depositphotos_119659092-stock-illustration-male-avatar-profile-picture-vector.jpg";
  Map<String,dynamic>data={};


  Widget build(BuildContext context) {

    final size = MediaQuery
        .of(context)
        .size;
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Center(child: ImageWidget()),
        SizedBox(
          height: size.height * 0.03,
        ),
        Center(
          child: Text("Name",
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20)),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Center(
          child: Text("Email",
              style: TextStyle( color: Colors.grey, fontSize: 15,)),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),


        ListTile(leading: Icon(Icons.description),
            title:Text("description")),

        SizedBox(
          height: size.height * 0.1,
        ),
        Center(child: BuildUpgradeButton()),
        Center(child:BuildDirectToHomeScreenButton(context)),
      ],
    );
  }

  Widget ImageWidget() {
    final image = NetworkImage(imagePath);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          height: 120,
          width: 120,
          child: InkWell(onTap: (){print("yes");},),
        ),
      ),
    );
  }

  Widget BuildUpgradeButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
      onPressed: () {},
      child: Text("Upgrade User Information"),
    );
  }
  Widget BuildDirectToHomeScreenButton(BuildContext context) {

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
      onPressed: () {
        Navigator.of(context).pushNamed(MyHomePage().route);
      },
      child: Text("Go To Home Page"),
    );
  }
}




class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "Calendar",
      subtitle: "March, Wednesday",
      event: "3 Events",
      img: "assets/calendar.png");

  Items item2 = new Items(
    title: "Groceries",
    subtitle: "Bocali, Apple",
    event: "4 Items",
    img: "assets/food.png",
  );
  Items item3 = new Items(
    title: "Locations",
    subtitle: "Lucy Mao going to Office",
    event: "",
    img: "assets/map.png",
  );
  Items item4 = new Items(
    title: "Activity",
    subtitle: "Rose favirited your Post",
    event: "",
    img: "assets/festival.png",
  );
  Items item5 = new Items(
    title: "To do",
    subtitle: "Homework, Design",
    event: "4 Items",
    img: "assets/todo.png",
  );
  Items item6 = new Items(
    title: "Settings",
    subtitle: "",
    event: "2 Items",
    img: "assets/setting.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(0xff0B525B), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title="sd";
  String subtitle="fsdg";
  String event="vfzsd";
  String img="juicfbns";
  Items({this.title="fsdjvgn", this.subtitle="sdrbnf", this.event="fsdhjbf", this.img="sdhbfvch"});
}