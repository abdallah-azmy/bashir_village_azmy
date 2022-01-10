import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  _launchURL() async {
    const url = 'https://tqnee.com.sa';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("عن التطبيق"),
          centerTitle: true,
          leading: InkWell(
            child: Icon(Icons.arrow_back_ios),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Center(
              child: Text('عن التطبيق'),
            ),
            InkWell(
              onTap: _launchURL,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'تصميم وتنفيذ تقني لتقنية المعملومات',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blueAccent, fontSize: 12),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}