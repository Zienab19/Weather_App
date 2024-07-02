import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There is no weather!',
            style: TextStyle(
                fontFamily: 'Handlee-Regular',
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Start searching Now 🔍',
            style: TextStyle(
                fontFamily: 'Handlee-Regular',
                fontSize: 32,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
