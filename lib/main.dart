import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Weather',
      theme: ThemeData(primaryColor: Colors.white),
      home: MyHomePage(title: 'Bucharest, RO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void _onSearchPressed() {}

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: TabBarView(
          controller: _tabController,
          children: [
            ListView(
              children: <Widget>[
                BoxContainer(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Thursday, 23 May"),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Party Cloudy",
                                style: Theme.of(context).textTheme?.title,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Day 24°▴ | Night 12°▾"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "🌤",
                                style: TextStyle(fontSize: 64),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                BoxContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: Text("Hourly"),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 8.0),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 96.0),
                          child: ListView(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            scrollDirection: Axis.horizontal,
                            children: buildHourlyData(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BoxContainer(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(15.0),
                        margin: EdgeInsets.only(left: 20, right: 10),
                        child: Text(
                          "☔️",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      Center(
                        child: Text("30% change of precipitation"),
                      ),
                    ],
                  ),
                ),
                BoxContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            "Details",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DetailRow(
                          label: "Humidity",
                          value: "62%",
                        ),
                        DetailRow(
                          label: "UV Index",
                          value: "High, 7",
                        ),
                        DetailRow(
                          label: "Chance of rain",
                          value: "30%",
                        ),
                        DetailRow(
                          label: "Sunraise/Sunset",
                          value: "5:41 AM, 8:44 PM",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Text("TOMORROW"),
            ),
            Center(
              child: Text("3DAYS"),
            )
          ],
        ),
      ),
      drawer: Drawer(),
      appBar: buildCustomAppBar(context),
    );
  }

  List<Widget> buildHourlyData() {
    final List<dynamic> hourlyDatas = [
      {
        "icon": "🌤",
        "time": "8:00 AM",
        "temp": "16°",
      },
      {
        "icon": "🌤",
        "time": "9:00 AM",
        "temp": "18°",
      },
      {
        "icon": "🌤",
        "time": "10:00 AM",
        "temp": "19°",
      },
      {
        "icon": "🌤",
        "time": "11:00 AM",
        "temp": "20°",
      },
      {
        "icon": "☀️",
        "time": "12:00 AM",
        "temp": "21°",
      },
      {
        "icon": "☀️",
        "time": "1:00 PM",
        "temp": "23°",
      },
      {
        "icon": "☀️",
        "time": "2:00 PM",
        "temp": "23°",
      },
      {
        "icon": "☀️",
        "time": "3:00 PM",
        "temp": "24°",
      },
      {
        "icon": "☀️",
        "time": "4:00 PM",
        "temp": "23°",
      },
      {
        "icon": "🌤",
        "time": "5:00 pM",
        "temp": "22°",
      },
    ];
    return hourlyDatas.map((data) {
      return HourlyItem(
        iconText: data["icon"],
        time: data["time"],
        temperature: data["temp"],
      );
    }).toList();
  }

  PreferredSize buildCustomAppBar(BuildContext context) {
    return PreferredSize(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Material(
                child: LimitedBox(
                  maxHeight: 48,
                  child: NavigationToolbar(
                    leading: IconButton(
                      icon: Icon(Icons.dehaze),
                      onPressed: () {
                        print(_scaffoldKey.currentState.hasDrawer);
                        _scaffoldKey.currentState.openDrawer();
                      },
                    ),
                    middle: Text(
                      widget.title,
                      style: Theme.of(context).textTheme?.subtitle,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: _onSearchPressed,
                    ),
                  ),
                ),
                elevation: 4.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
              Container(
                constraints: BoxConstraints(maxHeight: 32),
                margin: EdgeInsets.only(top: 16),
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.black,
                  tabs: <Widget>[
                    Tab(text: "TODAY"),
                    Tab(text: "TOMORROW"),
                    Tab(text: "3DAYS"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      preferredSize: Size.fromHeight(kToolbarHeight * 2 - 8.0),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class HourlyItem extends StatelessWidget {
  HourlyItem({this.iconText, this.time, this.temperature});

  final String iconText;
  final String time;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          Text(
            iconText,
            style: TextStyle(fontSize: 40),
          ),
          Text(
            time,
            style: TextStyle(fontSize: 12.0),
          ),
          Text(
            temperature,
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  DetailRow({@required this.label, this.value});

  final String label;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(label),
          ),
          Expanded(
            child: Text(value.toString()),
          ),
        ],
      ),
    );
  }
}

class BoxContainer extends StatelessWidget {
  const BoxContainer({Key key, this.child, this.margin}) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 3),
            blurRadius: 10,
          ),
        ],
      ),
    );
  }
}
