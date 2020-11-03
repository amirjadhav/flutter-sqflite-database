import 'package:sqflite_flutter/entity/db.dart';
import 'package:stacked/stacked.dart';

class HomepageViewModel extends BaseViewModel {
  final dbhelper = DatabaseHelper.instance;
  String result = "";

  void insertData() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: "sanjay",
      DatabaseHelper.columnAge: 12
    };
    final id = await dbhelper.insert(row);
    print(id);
    result = "Inserted " + " row is \n" + row.toString();
    notifyListeners();
  }

  void findAll() async {
    var allrows = await dbhelper.findall();
    allrows.forEach((row) {
      print(row);
    });
    result =
        "Found " + allrows.length.toString() + " rows \n" + allrows.toString();

    notifyListeners();
  }

  void querySpecific() async {
    var allrows = await dbhelper.querySpecific(12);
    allrows.forEach((row) {
      print(row);
    });
  }

//* update query with id =2
  void updateQuery() async {
    var updateresult = await dbhelper.updateQuery(2);
    print(updateresult);
    result = "Updated " + updateresult.toString() + " row.\n";
    notifyListeners();
  }

  void deleteQuery() async {
    var deleteResult = await dbhelper.deleteQuery(12);
    print(deleteResult);
    result = "Deleted " + deleteResult.toString() + " row.\n";
    notifyListeners();
  }
}
