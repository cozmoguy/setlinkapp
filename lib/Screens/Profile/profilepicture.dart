import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(height: double.infinity,
        width: double.infinity,
        color: Colors.black,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 7,horizontal: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.close,color: Colors.white70,size: 30,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
              Spacer(flex: 1,),
              Container(
                child: Image.asset('assets/images/profileimage.jpg',
                    fit: BoxFit.fitWidth),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
