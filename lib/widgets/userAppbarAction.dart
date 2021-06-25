import 'package:flutter/material.dart';

class UserAppbarAction extends StatefulWidget {
  const UserAppbarAction({ Key? key }) : super(key: key);

  @override
  _UserAppbarActionState createState() => _UserAppbarActionState();
}

class _UserAppbarActionState extends State<UserAppbarAction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 10, 0, 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profileImage.png'),
          ),
          SizedBox(width: 10,),
          Text(
            "John Doe",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
        ],
      )
    );
  }
}