import 'package:apps/services/storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  String useId;
  bool isUserIdFetched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "HomePage",
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  setEmail(null);
                  setPassword(null);
                },
                child: Text("Logout"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
