import 'package:flutter/material.dart';

Widget nameList(context){
  return   Container(
    padding: const EdgeInsets.all(16),
    margin:
    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height / 6.5,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18)),
    child: Row(
      children: [
        Column(
          children: const [
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 26,
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Search",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        const VerticalDivider(
          thickness: 2.0,
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Column(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 26,
                        backgroundImage:
                        AssetImage("assets/images/img.png"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Arun Rai",
                        style:
                        TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    ),
  );
}