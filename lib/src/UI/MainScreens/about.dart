
import 'package:bashir_village/src/UI/Basics/Terms/aboutVillage.dart';
import 'package:bashir_village/src/UI/Basics/Terms/villageWelcome.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  _launchURL() async {
    const url = 'https://tqnee.com.sa';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("عن التطبيق"),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 30),
            Image.asset(
              'assets/logo.png',
              width: 200,
              height: 200,
            ),
            Text("أهلا بكم في تطبيق قرية بشير الباحة.",
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: MaterialButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutVillage())),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'حول قرية بشير',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.info,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: MaterialButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VillageWelcome())),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'ترحيب عريفة القرية',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.info,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: InkWell(
                onTap: _launchURL,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'تصميم وتنفيذ تقني لتقنية المعلومات',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blueAccent, fontSize: 12),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
