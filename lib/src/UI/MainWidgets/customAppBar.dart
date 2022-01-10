import 'package:bashir_village/src/UI/Notifications/notifications.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String label;
  final Function ctx;

  const CustomAppBar({Key key, @required this.label, this.ctx})
      : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.filter),
              onPressed: () => widget.ctx,
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.label),
        leading: InkWell(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => Notifications())),
          child: Icon(Icons.notifications),
        ),
      ),
    );
  }
}
