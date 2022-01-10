import 'package:bashir_village/src/UI/MainWidgets/customCard.dart';
import 'package:bashir_village/src/UI/MainWidgets/customWidgetBody.dart';
import 'package:bashir_village/src/UI/SupScreens/News/newsDetails.dart';
import 'package:bashir_village/src/provider/unPinNews.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnPinNewsScreen extends StatefulWidget {
  @override
  _UnPinNewsScreenState createState() => _UnPinNewsScreenState();
}

class _UnPinNewsScreenState extends State<UnPinNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('جميع الاخبار'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: CustomWidgetBody(
        service: Provider.of<UnPinNewsProvider>(context, listen: false)
            .getUnPinNews(),
        body: Consumer<UnPinNewsProvider>(
          builder: (context, unPinNewsProvider,child) {
            return ListView(
              children: <Widget>[
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: unPinNewsProvider.model.data.length,
                    itemBuilder: (BuildContext cont, index) {
                      return CustomCard(
                        image: unPinNewsProvider.model.data[index].photos.length == 0
                            ? ""
                            : unPinNewsProvider.model.data[index].photos[0].photo,
                        title: unPinNewsProvider.model.data[index].title,
                        createdAt: unPinNewsProvider.model.data[index].createdAt,
                        numComment: unPinNewsProvider.model.data[index].comments.length,
                        seen: unPinNewsProvider.model.data[index].seen,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctxt) => NewsDetails(
                                        title: unPinNewsProvider.model.data[index].title,
                                        content: unPinNewsProvider.model.data[index].content,
                                        images: unPinNewsProvider.model.data[index].photos,
                                        createAt: DateTime.now(),
                                        comments: unPinNewsProvider.model.data[index].comments,
                                        newsId: unPinNewsProvider.model.data[index].id,
                                        seen: unPinNewsProvider.model.data[index].seen,
                                      )));
                        },
                      );
                    }),
              ],
            );
          }
        ),
      ),
    );
  }
}
