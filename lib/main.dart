import 'package:flutter/material.dart';

void main() => runApp(MyApp());

var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.black),
    Icon(Icons.star, color: Colors.black),
  ],
);

final ratings = Container(
  padding: EdgeInsets.all(10),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      stars,
      Text(
        '170 Reviews',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    ],
  ),
);

final descTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w800,
  fontFamily: 'Roboto',
  letterSpacing: 0.5,
  fontSize: 18,
  height: 2,
);

// DefaultTextStyle.merge() allows you to create a default text
// style that is inherited by its child and all subsequent children.
final iconList = DefaultTextStyle.merge(
  style: descTextStyle,
  child: Container(
    padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.kitchen, color: Colors.green[500]),
            Text('PREP:'),
            Text('25 min'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.timer, color: Colors.green[500]),
            Text('COOK:'),
            Text('1 hr'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.restaurant, color: Colors.green[500]),
            Text('FEEDS:'),
            Text('4-6'),
          ],
        ),
      ],
    ),
  ),
);

final leftColumn = Container(
  padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
  child: Column(
    children: [
      // titleText,
      // subTitle,
      ratings,
      iconList,
    ],
  ),
);

Widget _buildCard() => SizedBox(
      height: 210,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(
                '1625 Main Street',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('My City, CA 99984'),
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                '(408) 555-1212',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(Icons.contact_phone, color: Colors.blue[500]),
            ),
            ListTile(
              title: Text('costa@example.com'),
              leading: Icon(Icons.contact_mail, color: Colors.blue[500]),
            ),
          ],
        ),
      ),
    );

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}
  
class _FavoriteWidgetState extends State<FavoriteWidget>{
  bool _isFavourited = true;
  int _favouriteCount = 41;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavourited? Icon(Icons.star): Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavourite,
          ),
        ),
        SizedBox(
          width: 18,
          // child: _buildCard()
          child: Container(
            child: Text('$_favouriteCount'),
          ),
        ),
        // _buildCard()
      ],
    );
  }

  void _toggleFavourite() {
    setState(() {
      if (_isFavourited) {
        _favouriteCount -= 1;
        _isFavourited = false;
      } else {
        _favouriteCount += 1;
        _isFavourited = true;
      }
    });
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: Container(
            padding: EdgeInsets.all(8),
            child: _buildCard()
          ),
        // body: FavoriteWidget()
        // body: Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     // FavoriteWidget(),
        //     Container(
        //       padding: EdgeInsets.all(8),
        //       child: _buildCard(),
        //     ),
        //     // _buildCard(),
        //   ],
        // ),
      ),
    );
  }
}
