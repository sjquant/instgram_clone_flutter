import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/rounded_avatar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<bool> followings = List.generate(30, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
          itemBuilder: (context, index) {
            var color = followings[index] ? Colors.red : Colors.blue;
            return ListTile(
                onTap: () {
                  setState(() {
                    followings[index] = !followings[index];
                  });
                },
                leading: RoundedAvatar(),
                title: Text("username $index"),
                subtitle: Text("user bio number $index"),
                trailing: Container(
                    width: 80,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: color[50],
                        border: Border.all(color: color, width: 0.5),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      "following",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )));
          },
          separatorBuilder: (context, index) {
            return Divider(color: Colors.grey);
          },
          itemCount: followings.length),
    );
  }
}
