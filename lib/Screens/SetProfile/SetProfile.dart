import 'package:flutter/material.dart';

class SetProfile extends StatefulWidget {
  final Map set;
  SetProfile({this.set});

  @override
  _SetProfileState createState() => _SetProfileState();
}

Widget _builtScrollableView(BuildContext context,Map set) {
  return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.width /2,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              set['title'],
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            background: Image.asset(set['image'], fit: BoxFit.fitWidth),
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate((context,index) {
          if (index == 0){
            return Container(color: Colors.red,width: double.infinity,height: 400);
          }
          else{
            return Container(color: Colors.blue,width: double.infinity,height: 400);
          }
        },
        childCount: 5),),
      ],
    );
}
class _SetProfileState extends State<SetProfile> {
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: _builtScrollableView(context, widget.set),
    );
  }
}
