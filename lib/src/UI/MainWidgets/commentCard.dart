import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  final String name;
  final String img;
  final String comment;
  final int index;
  final String data;

  const CommentCard(
      {Key key, this.name, this.img, this.comment, this.index, this.data})
      : super(key: key);

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 1.5),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(widget.data),
                            Text(
                              widget.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Wrap(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text(
                                widget.comment,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                        Container(
                                  height: 30,
                                  width: 30,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: CachedNetworkImage(
                                      imageUrl: widget.img== null ? "":widget.img,
                                      errorWidget: (context, url, error) =>
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.asset(
                                                  'assets/avatar.jpg',
                                                  fit: BoxFit.fill)),
                                      fadeInDuration: Duration(seconds: 2),
                                      placeholder: (context, url) => ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.asset(
                                              'assets/avatar.jpg',
                                              fit: BoxFit.fill)),
                                      imageBuilder: (context, provider) {
                                        return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image(
                                              image: provider,
                                              fit: BoxFit.cover,
                                            ));
                                      },
                                    ),
                                  ),
                                ),
                        
                // CircleAvatar(
                //     backgroundImage: widget.img == null
                //         ? AssetImage('assets/avatar.jpg')
                //         : FadeInImage(
                //             fit: BoxFit.cover,
                //             placeholder: AssetImage('assets/placeholder.png'),
                //             image: CacheImage(widget.img)),
                //     radius: 15),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Divider(
                height: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
