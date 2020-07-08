import 'package:flutter/material.dart';
import 'profilepicture.dart';
import 'editprofile.dart';
import 'package:SetLink/Screens/constants.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

//class defining Raised Buttons Promote and Editprofile
class _MyRaisedButton extends StatelessWidget {
  final String text;
  final Color buttonbackgroundcolor;
  final Color buttontextcolor;
  final Function onTap;

  _MyRaisedButton(
      {this.text,
      this.onTap,
      this.buttonbackgroundcolor,
      this.buttontextcolor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: MediaQuery.of(context).size.width * .30,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: buttontextcolor),
        ),
        decoration: BoxDecoration(
          color: buttonbackgroundcolor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 3), blurRadius: 6.0),
          ],
        ),
      ),
    );
  }
}

//class defining followers, following and sets counts
class _MyDisplayCount extends StatelessWidget {
  final int count;
  final String title;

  _MyDisplayCount(this.count, this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: Text(
            '$count',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: kinsideBackgroundColor),
          ),
        ),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: kinsideBackgroundHintColor),
        ),
      ],
    );
  }
}

class _ProfilePageState extends State<ProfilePage> {
  int _followersCount = 0;
  int _setsCount = 0;
  int _followingCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          backgroundColor: kprimaryColor,
          title: Text(
            'Profile',
            style: TextStyle(color: kinsidePrimaryColor),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: kinsidePrimaryColor,
              ),
              onPressed: () => print(
                'pressed more',
              ),
            )
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: kbackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(
                flex: 10,
              ),
              //container with profile picture
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePicture()));
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, 3),
                          blurRadius: 6.0),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profileimage.jpg'),
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
              // the profile name text
              Text(
                'Alison Brie',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kinsideBackgroundColor,
                    letterSpacing: 1),
              ),
              Spacer(flex: 1,),
              Text('Artist/Painter',style: TextStyle(color: kinsideBackgroundHintColor,fontWeight: FontWeight.w600),),
              Spacer(
                flex: 4,
              ),
              // Row that contains counts of followers,sets and following
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Spacer(
                    flex: 2,
                  ),
                  _MyDisplayCount(_followersCount, 'Followers'),
                  Spacer(
                    flex: 2,
                  ),
                  _MyDisplayCount(_followingCount, 'Sets'),
                  Spacer(
                    flex: 2,
                  ),
                  _MyDisplayCount(_setsCount, 'Following'),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
              Spacer(
                flex: 4,
              ),
              //row that contain raised buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _MyRaisedButton(
                    text: 'Promote',
                    onTap: () => print('Promote'),
                    buttonbackgroundcolor: kbackgroundColor,
                    buttontextcolor: kprimaryColor,
                  ),
                  _MyRaisedButton(
                    text: 'Edit Profile',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile()));
                    },
                    buttonbackgroundcolor: kprimaryColor,
                    buttontextcolor: kinsidePrimaryColor,
                  )
                ],
              ),
              Spacer(
                flex: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
