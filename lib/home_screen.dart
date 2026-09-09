import 'dart:developer';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({super.key, required String title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  void incrementCounter() {
    setState(() {
      counter++;
    });

    log("Increment button clicked");
    log("Counter Value: $counter");
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });

    log("Decrement button clicked");
    log("Counter Value: $counter");
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        child: Icon(Icons.add),
      ),
    
    appBar: AppBar(
      title: Text("Home Screen"),
      centerTitle: true,

      leading: Icon(
        Icons.settings,
        color:  Color.fromARGB(255, 67, 65, 57),
      ),

      actions: [
        IconButton(
            onPressed: decrementCounter,
            icon: Icon(Icons.remove),
          ),
      ],
    ),

    body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Container(
          height: 100,
          width: 100,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Increment Value",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.add,
                size: 20,
                color: Colors.black,
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 100,
          width: 100,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Counter",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$counter",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 100,
          width: 100,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Decrement Value",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.remove,
                size: 20,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ],
      
    ),
    
  );
  
}
}
              