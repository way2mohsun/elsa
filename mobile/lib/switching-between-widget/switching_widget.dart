import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Container(
          child: BodyWidgetState(),
        ),
      ),
    );
  }
}

class BodyWidgetState extends StatefulWidget {
  @override
  _BodyWidgetStateState createState() => _BodyWidgetStateState();
}

class _BodyWidgetStateState extends State<BodyWidgetState>
    with SingleTickerProviderStateMixin<BodyWidgetState> {
  WidgetMarker _selectedWidgetMarker = WidgetMarker.graph;
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween(begin: 0.0, end: 1.1).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlatButton(
              child: Text(
                'Graph',
                style: TextStyle(
                  color: _selectedWidgetMarker == WidgetMarker.graph
                      ? Colors.black
                      : Colors.black45,
                ),
              ),
              onPressed: () {
                print('hi');
                setState(() {
                  _selectedWidgetMarker = WidgetMarker.graph;
                });
              },
            ),
            FlatButton(
              child: Text(
                'Stats',
                style: TextStyle(
                  color: _selectedWidgetMarker == WidgetMarker.stats
                      ? Colors.black
                      : Colors.black45,
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedWidgetMarker = WidgetMarker.stats;
                });
              },
            ),
            FlatButton(
              child: Text(
                'Info',
                style: TextStyle(
                  color: _selectedWidgetMarker == WidgetMarker.info
                      ? Colors.black
                      : Colors.black45,
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedWidgetMarker = WidgetMarker.info;
                });
              },
            ),
          ],
        ),
        FutureBuilder(
          future: _playAnimation(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return get_selected_container();
          },
        ),
      ],
    );
  }

  _playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  Widget get_selected_container() {
    switch (_selectedWidgetMarker) {
      case WidgetMarker.graph:
        return get_graph();
      case WidgetMarker.stats:
        return get_stats();
      case WidgetMarker.info:
        return get_info();
    }
    return null;
  }

  Widget get_graph() {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        color: Colors.red,
        height: 200,
      ),
    );
  }

  Widget get_stats() {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        color: Colors.blue,
        height: 300,
      ),
    );
  }

  Widget get_info() {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        color: Colors.green,
        height: 400,
      ),
    );
  }
}

enum WidgetMarker {
  graph,
  stats,
  info,
}
