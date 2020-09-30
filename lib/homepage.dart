import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite_flutter/db.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();
  String result = "";

  TextStyle textStyle = TextStyle(fontSize: 20);

  final dbhelper = DatabaseHelper.instance;

  void insertData() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: "sanjay",
      DatabaseHelper.columnAge: 12
    };
    final id = await dbhelper.insert(row);
    print(id);
    setState(() {
      result = "Inserted " + " row is \n" + row.toString();
    });
  }

  void findAll() async {
    var allrows = await dbhelper.findall();
    allrows.forEach((row) {
      print(row);
    });
    setState(() {
      result = "Found " +
          allrows.length.toString() +
          " rows \n" +
          allrows.toString();
    });
  }

  void querySpecific() async {
    var allrows = await dbhelper.querySpecific(12);
    allrows.forEach((row) {
      print(row);
    });
    setState(() {
      result = "Found " +
          allrows.length.toString() +
          " row /rows \n " +
          allrows.toString();
    });
  }

//* update query with id =2
  void updateQuery() async {
    var updateresult = await dbhelper.updateQuery(2);
    print(updateresult);
    setState(() {
      result = "Updated " + updateresult.toString() + " row.\n";
    });
  }

  void deleteQuery() async {
    var deleteResult = await dbhelper.deleteQuery(12);
    print(deleteResult);
    setState(() {
      result = "Deleted " + deleteResult.toString() + " row.\n";
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Database"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 40, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              color: Colors.pink,
              elevation: 15.0,
              onPressed: findAll,
              child: Text("Find all", style: textStyle),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              color: Colors.red[300],
              elevation: 15.0,
              onPressed: querySpecific,
              child: Text("Query Specific", style: textStyle),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              color: Colors.deepOrange[300],
              elevation: 15.0,
              onPressed: insertData,
              child: Text("Insert", style: textStyle),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              color: Colors.deepPurple[400],
              elevation: 15.0,
              onPressed: updateQuery,
              child: Text("Update", style: textStyle),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              color: Colors.red[400],
              elevation: 15.0,
              onPressed: deleteQuery,
              child: Text("Delete", style: textStyle),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 20),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                color: Colors.black45,
                elevation: 15.0,
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text("Exit", style: textStyle),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                result,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
