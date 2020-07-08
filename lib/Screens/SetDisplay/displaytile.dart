import 'package:SetLink/Screens/SetProfile/SetProfile.dart';
import 'package:flutter/material.dart';

class DisplayTile extends StatelessWidget {
  final Map set;

  DisplayTile({
    this.set,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SetProfile(
                    set: set,
                  ),
                ),
              );
            },
            leading: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black12,
                image: DecorationImage(
                  image: AssetImage(set['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              set['title'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              set['subject'],
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
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
        Divider(
          thickness: 0.5,
          height: 5,
          color: Colors.black26,
          indent: 92,
          endIndent: 20,
        )
      ],
    );
  }
}
