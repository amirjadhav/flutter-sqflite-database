import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'homepage_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static const TextStyle textStyle = TextStyle(fontSize: 20);

  Widget build(BuildContext context) {
    return ViewModelBuilder<HomepageViewModel>.reactive(
      builder: (context, model, child) {
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
                myRaisedButton(
                  model,
                  Colors.pink,
                  model.findAll,
                  "Find All",
                ),
                myRaisedButton(
                  model,
                  Colors.red[300],
                  model.querySpecific,
                  'Query Specific1',
                ),
                myRaisedButton(
                  model,
                  Colors.deepOrange[300],
                  model.insertData,
                  "Insert",
                ),
                myRaisedButton(
                    model, Colors.deepPurple[400], model.updateQuery, "Update"),
                myRaisedButton(
                  model,
                  Colors.red[400],
                  model.deleteQuery,
                  "Delete",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 20),
                  child: myRaisedButton(
                    model,
                    Colors.black45,
                    SystemNavigator.pop,
                    "Exit",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    model.result,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => HomepageViewModel(),
    );
  }

  Widget myRaisedButton(
      HomepageViewModel model, Color color, Function() fun, String text) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      color: color,
      elevation: 15.0,
      onPressed: fun,
      child: Text(text, style: textStyle),
    );
  }
}
