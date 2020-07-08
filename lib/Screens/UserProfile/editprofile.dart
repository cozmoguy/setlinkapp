import 'package:flutter/material.dart';
import 'package:SetLink/Screens/constants.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  String _name;

  String _username;

  String _email;

  String _bio;

  bool _changeMade = false;

  Widget _saveDialogue(context) {
    return Material(
      color: Colors.white70,
          child: AlertDialog(title: Text('Save Change'), content: Text('You have unsaved Changes.Want to save?'),actions: [
        FlatButton(
          child: Text('Yes'),
          onPressed: () {
            if (!_formKey.currentState.validate()) {
                  return;
                } else {
                  _formKey.currentState.save();
            Navigator.popUntil(context, ModalRoute.withName('/'),);
                }
          },
        ),
        FlatButton(
          child: Text('No'),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'),);
          },
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.close,
          ),
          iconSize: 27,
          color: kinsidePrimaryColor,
          onPressed: () {
            if (_changeMade) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> _saveDialogue(context)));
              
            } else {
              Navigator.pop(context);
            }
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            iconSize: 27,
            color: kinsidePrimaryColor,
            onPressed: () {
              if (!_formKey.currentState.validate()) {
                return;
              } else {
                _formKey.currentState.save();
                Navigator.pop(context);
                print(_name);
                print(_username);
                print(_email);
                print(_bio);
              }
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30),
            InkWell(
              onTap: () => print('Edit Image'),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 3),
                            blurRadius: 6.0),
                      ],
                      color: Colors.white,
                    ),
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profileimage.jpg'),
                    ),
                  ),
                  Icon(
                    Icons.edit,
                    size: 50,
                    color: Colors.white54,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Edit Profile Photo',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.blue[700],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        initialValue: 'Milan John',
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.black54),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Name is Required';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          _name = value;
                        },
                        onChanged: (value) {
                          _changeMade = true;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        initialValue: 'cozmoguy',
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.black54),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Username is Required';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          _username = value;
                        },
                        onChanged: (value) {
                          _changeMade = true;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        initialValue: 'mjmilanjohn@gmail.com',
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black54),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Email is Required';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          _email = value;
                        },
                        onChanged: (value) {
                          _changeMade = true;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        initialValue: 'Flutter Artist',
                        decoration: InputDecoration(
                          labelText: 'Bio',
                          labelStyle: TextStyle(color: Colors.black54),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Bio is Required';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          _bio = value;
                        },
                        onChanged: (value) {
                          _changeMade = true;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
