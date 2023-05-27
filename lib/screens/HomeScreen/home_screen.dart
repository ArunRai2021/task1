import 'package:flutter/material.dart';
import 'package:task_1/screens/HomeScreen/components/name_widgets.dart';
import 'package:task_1/screens/HomeScreen/components/transaction_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    height: MediaQuery.of(context).size.height / 4,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(28),
                            bottomRight: Radius.circular(28))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/img.png"),
                            ),
                            Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                            )
                          ],
                        ),
                        const Text(
                          "Available balance",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "AED 16,846.25",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin:
                          const EdgeInsets.only(top: 140, left: 25, right: 25),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 25),
                                decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent.shade100,
                                    borderRadius: BorderRadius.circular(18)),
                                child: const Icon(Icons.add),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Add Money",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 25),
                                decoration: BoxDecoration(
                                    color: Colors.pink.shade100,
                                    borderRadius: BorderRadius.circular(18)),
                                child:
                                    const Icon(Icons.arrow_downward_outlined),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Send Money",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 25),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(18)),
                                  child: const Icon(
                                    Icons.arrow_upward_rounded,
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Pay Money",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              nameList(context),
              transactionDetail(context)
            ],
          ),
        ),
      ),
    );
  }
}
