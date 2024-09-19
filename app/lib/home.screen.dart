// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/functionality/esewa.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(message),
        ),
        duration: Duration(seconds: 1),
        backgroundColor: message.toString() == "Payment successful!"
            ? Colors.green
            : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Esewa Integration'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
                width: 300,
                child: Image.asset('images/esewa.png'),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.red;
                      }
                      return Colors.green;
                    }),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    Esewa esewa = Esewa(showSnackbar: showSnackbar);
                    esewa.pay();
                  },
                  child: Text('Pay Now'))
            ],
          ),
        ),
      ),
    );
  }
}
