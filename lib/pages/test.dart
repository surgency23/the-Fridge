import 'package:flutter/material.dart';

class ExpandExample extends StatefulWidget {
  @override
  _ExpandExampleState createState() => _ExpandExampleState();
}

class _ExpandExampleState extends State<ExpandExample> {
  ///If the box is expanded
  bool _isExpanded = false;

  ///Toogle the box to expand or collapse
  void _toogleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Material(
                color: Colors.blue,
                child: InkWell(
                  onTap: _toogleExpand,
                  child: Container(
                    padding: EdgeInsets.all(25.0),
                    width: double.infinity,
                    child: Text(
                        'Click me to ' + (_isExpanded ? 'collapse' : 'expand')),
                  ),
                ),
              ),
              ExpandedSection(
                expand: _isExpanded,
                child: Container(
                  width: double.infinity,
                  color: Colors.red,
                  padding: EdgeInsets.all(25.0),
                  child: Text('Hello there'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandedSection extends StatefulWidget {
  final Widget child;
  final bool expand;
  ExpandedSection({this.expand = false, this.child});

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    Animation curve = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0, sizeFactor: animation, child: widget.child);
  }
}
