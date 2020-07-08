import 'package:SetLink/Screens/SetProfile/SetProfile.dart';
import 'package:flutter/material.dart';
import 'package:SetLink/Screens/constants.dart';

class SearchTile extends StatelessWidget {
  final Map set;

  SearchTile({this.set});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Card(
        color: kbackgroundColor,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SetProfile(set: set)));
            },
            leading: Container(
              height: 60,
              width: 60,
              child: ClipOval(
                child: Image.asset(
                  set['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              set['title'], // title is used here
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              set['subject'], //subject is used here
              style: TextStyle(color: Colors.black54),
            ),
            trailing: set['region'] != 'Global'
                ? Icon(
                    Icons.gps_fixed,
                    size: 20,
                    color: Color(0xFF18de64),
                  )
                : Icon(
                    Icons.language,
                    size: 20,
                    color: Color(0xFF18de64),
                  ),
          ),
        ),
      ),
    );
  }
}
