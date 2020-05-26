import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:imd_weather/values/MyColors.dart';
import 'package:imd_weather/values/MyTextStyles.dart';
import 'package:imd_weather/services/ApiCall.dart';
//import 'package:imd_weather/values/Forecast-data.dart';
import 'package:intl/intl.dart';

class Stations extends StatefulWidget {
  @override
  _StationsState createState() => _StationsState();
}

class _StationsState extends State<Stations> {
  Forecast forecast = new Forecast();
  bool flag = false;
  String current_city = 'AHMD';
  List st_id = ['42647', '43003', '43057', '43192'];
  List<Map> city_data = [];
  List city_forecast = [];
  List current_forecast = [];
  Color c1, c2, c3;
  @override
  void initState() {
    super.initState();
    c1 = Colors.lightBlueAccent;
    c2 = Colors.lightBlueAccent;
    c3 = Colors.lightBlueAccent;
  }

  @override
  Widget build(BuildContext context) {
    if (flag) {
      if (current_city == 'AHMD')
        current_forecast = city_forecast[0];
      else if (current_city == 'MUM')
        current_forecast = city_forecast[2];
      else
        current_forecast = city_forecast[3];
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff97D9E1),
        title: Text(
          'Meterological Data',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      // child: SafeArea(
      //   child: SingleChildScrollView(
      //     physics: const AlwaysScrollableScrollPhysics(),
      //   ),
      // ),
      // TODO: Add ScrollView
      body: flag
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
             
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Text("Observation Recorded on ${current_forecast[0]['date']}"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 25.0, right: 5.0, left: 5.0, bottom: 5.0),
                  padding: EdgeInsets.all(10.0),
                  //width: 100,
            decoration: BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
   // colors: [Color(0xff8EC5FC), Color(0x72E0C3FC)]
    colors: [Color(0xdd74ebd5), Color(0xffacb6e5)])),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      child: Column(children: <Widget>[
                        SizedBox(height:15),
                        Text("Data Observed on",
//                            style: MyTextStyles.stationHead
                            style: MyTextStyles.stationtext
                        ),

                        SizedBox(height:5),
                        Text( DateFormat('h:mm a E, d MMM y').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      city_data[2]['updatedAt'] * 1000)),
//                            style: MyTextStyles.stationHead1
                            style: MyTextStyles.stationtext
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left :10.0,right: 10.0,top: 4.0),
                        child: Divider(
                                                    height: 10.0,
                                                    color: MyColors.tp3,
                                                    thickness: 2,
                                                  ),
                      ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 25.0, right: 5.0, left: 5.0, bottom: 5.0),
                      padding: EdgeInsets.all(10.0),
                      //width: 100,
/*
                decoration: BoxDecoration(
                    border:Border.all(width: 1)
                ),
                s
*/

//  decoration: BoxDecoration(
//   gradient: LinearGradient(
//     begin: Alignment.topLeft,
//     end: Alignment.topRight,
//     colors: [Color(0xffFAD961), Color(0x72F76B1C)])),
                      color: Color(0xff0093E9),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'Stations',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.stationtext,
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'Ahemdabad ',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.stationtext,
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(' Mumbai \n (SCZ)',
                                    textAlign: TextAlign.center,
                                    style: MyTextStyles.stationtext)),
                            Expanded(
                                flex: 1,
                                child: Text('Mumbai \n (CLB)',
                                    textAlign: TextAlign.center,
                                    style: MyTextStyles.stationtext)),
                            Expanded(
                                flex: 1,
                                child: Text('Goa Panjim',
                                    textAlign: TextAlign.center,
                                    style: MyTextStyles.stationtext)),
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      color: Colors.lightBlueAccent,
                      //width: 100,
                      /*decoration: BoxDecoration(border:Border.all(width: 2),
                color: Color(0x3773)

                ),*/

                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Text('Min Temp',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.stationtext)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[0]['minTemp'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[1]['minTemp'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[2]['minTemp'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[3]['minTemp'],
                                  textAlign: TextAlign.center)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      //width: 100,

                      color: Colors.lightBlueAccent,
                      /*BoxDecoration(
                    border:Border.all(width: 2)
                ),*/

                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Text('Max Temp',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.stationtext)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[0]['maxTemp'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[1]['maxTemp'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[2]['maxTemp'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[3]['maxTemp'],
                                  textAlign: TextAlign.center)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      //width: 100,
                      /*decoration: BoxDecoration(
                    border:Border.all(width: 2)
                ),
*/
                      color: Colors.lightBlueAccent,

                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Text('Humidity',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.stationtext)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[0]['humidity'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[1]['humidity'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[2]['humidity'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[3]['humidity'],
                                  textAlign: TextAlign.center)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      //width: 100,
                      /*decoration: BoxDecoration(
                    border:Border.all(width: 2)
                ),
                */
                      color: Colors.lightBlueAccent,

                      child: Row(
                        children: <Widget>[
                          Expanded(
                              //flex: 1,
                              child: Text('Rainfall',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.stationtext)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[0]['rainfall'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[1]['rainfall'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[2]['rainfall'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(city_data[3]['rainfall'],
                                  textAlign: TextAlign.center)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      //width: 100,
                      /*decoration: BoxDecoration(
                    border:Border.all(width: 2)
                ),
                */

                      child: Row(
                        children: <Widget>[
                          RaisedButton(
                            child: Text("Mumbai"),
                            onPressed: () {
                              setState(() {
                                current_city = 'MUM';
                                c1 = Colors.blue[600];
                                c2 = Colors.lightBlueAccent;
                                c3 = Colors.lightBlueAccent;
                              });
                            },
                            color: c1,
                            textColor: Colors.black,
                            elevation: 5.0,
                            splashColor: Colors.white,
                            highlightColor: Colors.lightBlueAccent,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),),
 
                            //shape: Border.all(width:2.0 ,color: Colors.black),
                          ),
                          Spacer(flex: 2),
                          RaisedButton(
                            child: Text("Ahmedabad"),
                            onPressed: () {
                              setState(() {
                                current_city = 'AHMD';
                                c1 = Colors.lightBlueAccent;
                                c2 = Colors.blue[600];
                                c3 = Colors.lightBlueAccent;
                              });
                            },
                            color: c2,
                            textColor: Colors.black,
                            elevation: 5.0,
                            splashColor: Colors.white,
                            highlightColor: Colors.lightBlueAccent,
                             shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),),
                          ),
                          Spacer(flex: 2),
                          RaisedButton(
                            child: Text("Panjim"),
                            onPressed: () {
                              setState(() {
                                current_city = 'PJM';
                                c1 = Colors.lightBlueAccent;
                                c2 = Colors.lightBlueAccent;
                                c3 = Colors.blue[600];
                              });
                            },
                            color: c3,
                            textColor: Colors.black,
                            elevation: 5.0,
                            splashColor: Colors.white,
                            highlightColor: Colors.lightBlueAccent,
                             shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      //width: 100,
                      /*decoration: BoxDecoration(
                    border:Border.all(width: 2)
                ),
                */
                      color: Color(0xff0093E9),

                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Text("Today's Date :",
                                  textAlign: TextAlign.left,
                                  style: MyTextStyles.stationtext)),
                          Expanded(
                              flex: 6,
                              child: Text(
                                current_forecast[0]['date'],
                                textAlign: TextAlign.left,
                                style: MyTextStyles.stationtext,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      //width: 100,
                      /*decoration: BoxDecoration(
                    border:Border.all(width: 2)
                ),
                */       color: Color(0xff0093E9),

                      child: Row(
                        children: <Widget>[
                          Expanded(
                              //flex: 1,
                              child: Text('Valid for',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.stationtext)),
                          Expanded(
                              flex: 1,
                              child: Text('Min Temp  ',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.stationtext)),
                          Expanded(
                              flex: 1,
                              child: Text('Max Temp  ',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.stationtext)),
                          Expanded(
                              flex: 1,
                              child: Text('Forecast ',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.stationtext)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      //width: 100,
                      /*decoration: BoxDecoration(
                    border:Border.all(width: 2)
                ),
                */
                      color: Colors.lightBlueAccent,

                      child: Row(
                        children: <Widget>[
                          Expanded(
                              //flex: 1,
                              child: Text('24 hrs',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.stationtext)),
                          Expanded(
                              flex: 1,
                              child: Text(current_forecast[0]['minTemp'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(current_forecast[0]['maxTemp'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(current_forecast[0]['weather'],
                                  textAlign: TextAlign.center)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      //width: 100,
                      /*decoration: BoxDecoration(
                    border:Border.all(width: 2)
                ),
                */
                      color: Colors.lightBlueAccent,

                      child: Row(
                        children: <Widget>[
                          Expanded(
                              //flex: 1,
                              child: Text('48 hrs',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.stationtext)),
                          Expanded(
                              flex: 1,
                              child: Text(current_forecast[1]['minTemp'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(current_forecast[1]['maxTemp'],
                                  textAlign: TextAlign.center)),
                          Expanded(
                              flex: 1,
                              child: Text(current_forecast[0]['weather'],
                                  textAlign: TextAlign.center)),
                        ],
                      ),
                    ),
                  ],
                ),
            ),
        ]) : spinner(),
    );
  }

//  void fetching(String id, Forecast_data forecastD) async{
//    await forecastD.fetch(id);
//    print('counter:$counter');
//    if(counter== 4)
//    {
//      setState(() {
//        flag = true;
//      });
//    }
//    else {counter++;}
//  }
  void fetching() async {
    for (int i = 0; i < st_id.length; i++) {
      await forecast.getForecast(st_id[i]);
      city_data.add(forecast.data);
      city_forecast.add(forecast.forecasts);
      print(city_forecast);
      city_data[i]['rainfall'] = forecast.data['ranfall'].toString() == 'null'
          ? '0.0 mm'
          : forecast.data['ranfall'];
      var db = (double.parse(city_data[i]['relativeHumidity0830']) +
              double.parse(city_data[i]['relativeHumidity1730'])) /
          2;
      var humid = db.round().toString();
      city_data[i]['humidity'] = humid;
      print(city_data[i]['location']);
    }
    var element = city_forecast[0];
    print(element[0]['date'].runtimeType);
    var dt_element = new DateFormat("dd-MMMM").parse(element[0]['date']);
    var dt_element_2 = new DateFormat("dd-MMMM").parse(element[1]['date']);

    print('First Element:${dt_element}');
    print('Second Element:${dt_element_2}');
    var difference = dt_element.difference(dt_element_2).inHours;
    print('Difference between two dates are:${difference.abs()}');
    setState(() {
      flag = true;
    });
  }

  Widget spinner() {
    fetching();
    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        Center(
          child: SpinKitCircle(
            color: Colors.black,
            size: 80.0,
          ),
        ),
      ],
    );
  }
}
