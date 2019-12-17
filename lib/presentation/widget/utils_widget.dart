import 'package:flutter/material.dart';

Widget getLoader(BuildContext context, String message) {
  return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(4.0),
      color: Colors.transparent,
      child: Card(
        color: Colors.transparent,
        elevation: 8,
        child: Wrap(
          direction: Axis.vertical,
          children: <Widget>[
            Center(
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .apply(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      )
  );
}

Widget getErrorWidget(BuildContext context, String message) {
  return Container(
    height: 100,
    margin: EdgeInsets.all(8.0),
    padding: EdgeInsets.all(4.0),
    color: Colors.transparent,
    child: Card(
        color: Colors.redAccent,
        elevation: 6.0,
        child: Wrap(
          direction: Axis.vertical,
          children: <Widget>[
            Center(
              child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    Icons.error,
                    color: Colors.white,
                  )),
            ),
            Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .apply(color: Colors.white),
                  ),
                )),
          ],
        )),
  );
}
