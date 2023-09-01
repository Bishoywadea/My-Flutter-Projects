import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:code_forces_spectator/utilities/graphs.dart';
import 'package:code_forces_spectator/utilities/passed_object.dart';

class FriendInfoScreen extends StatefulWidget {
  static const String id = "friendinfo_screen";

  @override
  State<FriendInfoScreen> createState() => _FriendInfoScreenState();
}

//${info['result'][0]['handle']}
class _FriendInfoScreenState extends State<FriendInfoScreen> {
  List<Rank> chartdata = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var object = ModalRoute.of(context)?.settings.arguments as passedObject;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundImage:
                      CachedNetworkImageProvider(object.info['result'][0]['titlePhoto']),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${object.info['result'][0]['handle'].substring(0,1)}',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: getfirstColor(object.info['result'][0]['rating'])),
                    ),
                    Text(
                      '${object.info['result'][0]['handle'].substring(1, object.info['result'][0]['handle'].length)}',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: getSecondColor(object.info['result'][0]['rating'])),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  'Current rank : ${object.info['result'][0]['rank']}',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade400,
                      letterSpacing: 2.5),
                ),
              ),
              Center(
                child: Text(
                  'Max rank : ${object.info['result'][0]['maxRank']}',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade400,
                      letterSpacing: 2.5),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: SfCartesianChart(
                  tooltipBehavior: TooltipBehavior(enable: true),
                  primaryXAxis: DateTimeAxis(
                    interval: 0.5,
                  ),
                  series: <ChartSeries<Rank, DateTime>>[
                    SplineSeries<Rank, DateTime>(
                        dataSource: getData(object.history['result']),
                        xValueMapper: (Rank data, _) => data.date,
                        yValueMapper: (Rank data, _) => data.rank),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Rank> getData(List<dynamic> history) {
    final List<Rank> historyList = [];
    for (var map in history) {
      var time = map["ratingUpdateTimeSeconds"];
      var rate = map["newRating"];
      historyList.add(Rank(rank: rate, date: DateTime(Graph.unixToNormal(time).year, Graph.unixToNormal(time).month)));
    }
    return historyList;
  }

  Color getfirstColor(int rate){
    print(rate);
    if(rate<1200) return Colors.grey;
    else if(rate<1400) return Colors.green;
    else if(rate<1600) return Colors.cyan;
    else if(rate<1900) return Colors.blue.shade800;
    else if(rate<2100) return Colors.purple;
    else if(rate<2300) return Colors.orange;
    else if(rate<2600) return Colors.red;
    else return Colors.black;
  }
  Color getSecondColor(int rate){
    if(rate<1200) return Colors.grey;
    else if(rate<1400) return Colors.green;
    else if(rate<1600) return Colors.cyan;
    else if(rate<1900) return Colors.blue.shade800;
    else if(rate<2100) return Colors.purple;
    else if(rate<2300) return Colors.orange;
    else if(rate<2600) return Colors.red;
    else return Colors.red;
  }
}


