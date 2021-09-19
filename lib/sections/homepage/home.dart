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
    _getValue();
    super.initState();
  }

  String useId;
  bool isUserIdFetched = false;

  _getValue() async {
    useId = await getUserID();

    setState(() {
      isUserIdFetched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: TextButton(
              child:
                  isUserIdFetched ? Text(useId) : CircularProgressIndicator(),
              onPressed: () {
                setState(() async {
                  useId = await getUserID();
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
