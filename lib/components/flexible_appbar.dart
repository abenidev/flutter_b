import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyFlexiableAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;

  const MyFlexiableAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Text('Monday, September 26, 2022'),
            // Text('Data Collection Status'),

            Container(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(
                    child: Text("Balance", style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 28.0)),
                  ),
                  SizedBox(
                    child: Text("\u002420,914.33", style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontWeight: FontWeight.w800, fontSize: 36.0)),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text("\u002B24.93\u0025", style: TextStyle(color: Colors.white70, fontFamily: 'Poppins', fontSize: 20.0)),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Icon(
                        FontAwesomeIcons.upLong,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.0, left: 8.0),
                      child: Text("Currency", style: TextStyle(color: Colors.white70, fontFamily: 'Poppins', fontSize: 16.0)),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
                      child: SizedBox(
                          child: Row(
                        children: const <Widget>[
                          SizedBox(
                            child: Icon(
                              FontAwesomeIcons.calendarDays,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            child: Text(
                              'Janaury 2019',
                              style: TextStyle(color: Colors.white70, fontFamily: 'Poppins', fontSize: 16.0),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
