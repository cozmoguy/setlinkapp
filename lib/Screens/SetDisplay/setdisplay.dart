import 'package:SetLink/Screens/SetDisplay/displaytile.dart';
import 'package:flutter/material.dart';
import 'package:SetLink/Screens/constants.dart';
import 'package:SetLink/Screens/setList.dart';

class SetDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: kprimaryColor,
        title: Text(
          'SetLink',
          style: TextStyle(color: kinsidePrimaryColor),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        height: double.infinity,
        width: double.infinity,
        color: kbackgroundColor,
        child: ListView.builder(
          itemCount: sets.length,
          itemBuilder: (context, index) {
            return DisplayTile(set: sets[index],
            );
          },
        ),
      ),
    );
  }
}
