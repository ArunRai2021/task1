
import 'package:flutter/material.dart';

Widget transactionDetail(context){
  return  Container(
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.all(16),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Transactions",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text("See all")
          ],
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: const EdgeInsets.only(bottom: 8),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blueGrey.shade100,
                  child: const Icon(
                    Icons.home_outlined,
                    color: Colors.blueAccent,
                  ),
                ),
                title: const Text(
                  "Home",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("25 Sep 2022"),
                trailing: Container(
                  height: 50,
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "AED 450",
                        style:
                        TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_upward)
                    ],
                  ),
                ),
              );
            })
      ],
    ),
  );
}
