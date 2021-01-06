import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Pollution, String>> _seriesData;
  List<charts.Series<Sales, int>> _seriesSales;

  _generateData() {
    var data_1 = [
      new Pollution(place: 'Iran', quantity: 20, year: 2000),
      new Pollution(place: 'Turkey', quantity: 22, year: 2000),
      new Pollution(place: 'Iraq', quantity: 10, year: 2000),
    ];
    var data_2 = [
      new Pollution(place: 'Iran', quantity: 25, year: 2010),
      new Pollution(place: 'Turkey', quantity: 24, year: 2010),
      new Pollution(place: 'Iraq', quantity: 20, year: 2010),
    ];
    var data_3 = [
      new Pollution(place: 'Iran', quantity: 30, year: 2020),
      new Pollution(place: 'Turkey', quantity: 32, year: 2020),
      new Pollution(place: 'Iraq', quantity: 40, year: 2020),
    ];

    var pie = [
      new Task(name: 'SRV 1', value: 35, color: Colors.yellow),
      new Task(name: 'SRV 2', value: 30, color: Colors.red),
      new Task(name: 'SRV 3', value: 20, color: Colors.lightBlue),
      new Task(name: 'SRV 4', value: 10, color: Colors.green),
      new Task(name: 'SRV 5', value: 25, color: Colors.lightGreenAccent),
      new Task(name: 'SRV 6', value: 15, color: Colors.teal),
    ];

    var sales_1 = [
      new Sales(year: 1, value: 20),
      new Sales(year: 2, value: 10),
      new Sales(year: 3, value: 20),
      new Sales(year: 4, value: 30),
      new Sales(year: 5, value: 10),
    ];

    var sales_2 = [
      new Sales(year: 1, value: 10),
      new Sales(year: 2, value: 20),
      new Sales(year: 3, value: 30),
      new Sales(year: 4, value: 20),
      new Sales(year: 5, value: 20),
    ];

    _seriesSales.add(
      charts.Series(
        data: sales_1,
        id: "sales_1",
        domainFn: (Sales s, _) => s.year,
        measureFn: (Sales s, _) => s.value,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blue),
      ),
    );
    _seriesSales.add(
      charts.Series(
        data: sales_2,
        id: "sales_2",
        domainFn: (Sales s, _) => s.year,
        measureFn: (Sales s, _) => s.value,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red),
      ),
    );

    _seriesData.add(
      charts.Series(
        id: '2000',
        data: data_1,
        domainFn: (Pollution p, _) => p.place,
        measureFn: (Pollution p, _) => p.quantity,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution p, _) =>
            charts.ColorUtil.fromDartColor(Colors.red),
      ),
    );
    _seriesData.add(
      charts.Series(
        id: '2010',
        data: data_2,
        domainFn: (Pollution p, _) => p.place,
        measureFn: (Pollution p, _) => p.quantity,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution p, _) =>
            charts.ColorUtil.fromDartColor(Colors.purpleAccent),
      ),
    );
    _seriesData.add(
      charts.Series(
        id: '2020',
        data: data_2,
        domainFn: (Pollution p, _) => p.place,
        measureFn: (Pollution p, _) => p.quantity,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution p, _) =>
            charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        id: 'Task',
        data: pie,
        domainFn: (Task task, _) => task.name,
        measureFn: (Task task, _) => task.value,
        labelAccessorFn: (Task task, _) => '${task.value}',
        colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.color),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesData = List<charts.Series<Pollution, String>>();
    _seriesSales = List<charts.Series<Sales, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Monitoring'),
          backgroundColor: Colors.purple,
          bottom: TabBar(
            indicatorColor: Colors.deepOrange,
            tabs: [
              Tab(
                icon: Icon(FontAwesomeIcons.solidChartBar),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.chartPie),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.chartLine),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Time Spend',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: charts.PieChart(
                          _seriesPieData,
                          animate: true,
                          animationDuration: Duration(seconds: 1),
                          behaviors: [
                            new charts.DatumLegend(
                              outsideJustification:
                                  charts.OutsideJustification.endDrawArea,
                              horizontalFirst: true,
                              desiredMaxRows: 2,
                              cellPadding:
                                  new EdgeInsets.only(right: 4, bottom: 4),
                              entryTextStyle: charts.TextStyleSpec(
                                color:
                                    charts.MaterialPalette.purple.shadeDefault,
                                fontSize: 12,
                              ),
                            ),
                          ],
                          defaultRenderer: new charts.ArcRendererConfig(
                            arcWidth: 100,
                            arcRendererDecorators: [
                              new charts.ArcLabelDecorator(
                                labelPosition: charts.ArcLabelPosition.auto,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: charts.BarChart(
                          _seriesData,
                          animate: true,
                          animationDuration: Duration(seconds: 2),
                          barGroupingType: charts.BarGroupingType.grouped,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Text('Sales'),
                      Expanded(
                        child: charts.LineChart(
                          _seriesSales,
                          defaultRenderer: new charts.LineRendererConfig(
                            includeArea: true,
                            stacked: true,
                          ),
                          animate: true,
                          animationDuration: Duration(seconds: 3),
                          behaviors: [
                            new charts.ChartTitle(
                              'year',
                              behaviorPosition: charts.BehaviorPosition.bottom,
                              titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                            ),
                            new charts.ChartTitle(
                              'month',
                              behaviorPosition: charts.BehaviorPosition.bottom,
                              titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  String name;
  double value;
  Color color;

  Task({
    this.name,
    this.value,
    this.color,
  });
}

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution({
    this.place,
    this.year,
    this.quantity,
  });
}

class Sales {
  int year;
  int value;

  Sales({this.year, this.value});
}
