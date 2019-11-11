import 'package:flutter/material.dart';
import 'Choice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: choices.length,
            child: Scaffold(
              appBar: AppBar(
                title: Text('TabBar'),
                bottom: new TabBar(
                    tabs: choices.map((Choice choice) {
                  return new Tab(
                    text: choice.title,
                    icon: new Icon(choice.icon),
                  );
                }).toList()),
              ),
              body: new TabBarView(
                  children: choices.map((Choice choice) {
                    return new Padding(
                        padding: EdgeInsets.all(16.0),
                    child:new ChoiceCard(choice: choice,) ,);
                  }).toList()),
            )));
  }
}

const List<Choice> choices = <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_subway),
  const Choice(title: 'Walk', icon: Icons.directions_walk)
];

class ChoiceCard extends StatelessWidget {
  final Choice choice;

  const ChoiceCard({Key key, this.choice}) : super(key: key);

  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(
              choice.icon,
              size: 128.0,
              color: textStyle.color,
            ),
            new Text(choice.title, style: textStyle)
          ],
        ),
      ),
    );
  }
}
