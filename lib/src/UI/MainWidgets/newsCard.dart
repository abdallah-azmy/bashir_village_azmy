import 'package:bashir_village/src/UI/SupScreens/News/newsDetails.dart';
import 'package:bashir_village/src/models/momentModel.dart';
// import 'package:cache_image/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class NewsCard extends StatefulWidget {
  final String title;
  final List<Photo> images;
  final List<Comment> comments;
  final String content;
  final DateTime createAt;
  final int newsId;
  final int seen;
  const NewsCard(
      {Key key,
      this.title,
      this.images,
      this.content,
      this.createAt,
      this.comments,
      this.newsId,
      this.seen})
      : super(key: key);
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 5, left: 5, bottom: 5),
        child: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsDetails(
                        title: widget.title,
                        content: widget.content,
                        images: widget.images,
                        createAt: widget.createAt,
                        comments: widget.comments,
                        newsId: widget.newsId,
                        seen: widget.seen,
                      ))),
          child: Card(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: <Widget>[
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 17),
                    textAlign: TextAlign.right,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: FadeInImage(
                          fit: BoxFit.cover,
                          placeholder: AssetImage('assets/placeholder.png'),
                          image: NetworkImage(
                            widget.images.length == 0
                                ? "assets/placeholder.png"
                                : widget.images[0].photo,
                          )),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("${widget.comments.length}"),
                          SizedBox(width: 5),
                          Icon(
                            Icons.comment,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: <Widget>[
                          Text(widget.seen.toString()),
                          SizedBox(width: 5),
                          Icon(
                            Icons.remove_red_eye,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      SizedBox(width: 20),
                      Text(
                          "${intl.DateFormat.d().format(widget.createAt)}/${intl.DateFormat.M().format(widget.createAt)}/${intl.DateFormat.y().format(widget.createAt)}",
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.right),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
