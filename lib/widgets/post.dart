import 'package:api_app/widgets/header_button_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget headerbutton({
  required String buttontext,
  required IconData buttonicon,
  required void Function() buttonaction,
  required Color buttoncolor,
}) {
  return FlatButton.icon(
      onPressed: buttonaction,
      icon: Icon(
        buttonicon,
        color: buttoncolor,
      ),
      label: Text(buttontext));
}

class Post extends StatelessWidget {
  final String name;
  final String time;
  final String postTitle;
  final String like;
  final String comments;
  final String share;
  Post({
    required this.name,
    required this.time,
    required this.share,
    required this.postTitle,
    required this.like,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        postCardHeader(),
        titleSection(),
        footerSection(),
        Divider(
          thickness: 1,
          color: Colors.grey[300],
        ),
        HeaderButtonSection(
            buttonOne: headerbutton(
                buttontext: "Like",
                buttonicon: Icons.thumb_up_alt_outlined,
                buttonaction: () {},
                buttoncolor: Colors.grey),
            buttonTwo: headerbutton(
                buttontext: "comment",
                buttonicon: Icons.message_outlined,
                buttonaction: () {
                  Navigator.pushNamed(context, '/comment');
                },
                buttoncolor: Colors.grey),
            buttonThree: headerbutton(
                buttontext: "share",
                buttonicon: Icons.share_outlined,
                buttonaction: () {},
                buttoncolor: Colors.grey))
      ],
    ));
  }

  Widget titleSection() {
    return postTitle != null && postTitle != ""
        ? Container(
            padding: EdgeInsets.only(bottom: 15, right: 150),
            child: Text(
              postTitle == null ? "N/A" : postTitle,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          )
        : SizedBox();
  }

  Widget footerSection() {
    return Container(
      height: 30,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  child: Icon(
                    Icons.thumb_up,
                    color: Colors.white,
                    size: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 1,
                ),
                displayText(label: like),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                displayText(label: comments),
                SizedBox(
                  width: 5,
                ),
                displayText(label: "Comments"),
                SizedBox(
                  width: 10,
                ),
                displayText(label: share),
                SizedBox(
                  width: 5,
                ),
                displayText(label: "Share"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget displayText({required String label}) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.grey[700],
      ),
    );
  }

  Widget postCardHeader() {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        child: Icon(
          Icons.person,
          size: 32,
          color: Colors.white,
        ),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          shape: BoxShape.circle,
        ),
      ),
      title: Row(
        children: [
          Text(
            name,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(width: 10),
        ],
      ),
      subtitle: Row(
        children: [
          Text(time != null ? time : "N/A"),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.public,
            color: Colors.grey[700],
            size: 15,
          )
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.more_horiz,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
