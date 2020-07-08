import 'package:SetLink/Screens/SetSearch/searchtile.dart';
import 'package:flutter/material.dart';
import 'package:SetLink/Screens/constants.dart';
import 'package:SetLink/Screens/setList.dart';

class SetSearch extends StatefulWidget {
  
  @override
  _SetSearchState createState() => _SetSearchState();
}

class _SetSearchState extends State<SetSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: IconButton(
                icon: Icon(Icons.add, size: 27),
                onPressed: () => print('add Set'),
                color: kinsidePrimaryColor),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView.builder(
          itemCount: sets.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: kbackgroundColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 5),
                        blurRadius: 6.0)
                  ],
                ),
                child: TextField(
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.2,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 12),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    hintText: 'Search...',
                  ),
                ),
              );
            }
            if (index == 1) {
              return SizedBox(height: 20);
            }
            return SearchTile(set: sets[index - 2],
            );
          },
        ),
      ),
    );
  }
}
