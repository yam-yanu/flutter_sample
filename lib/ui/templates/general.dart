import 'package:flutter_web/material.dart';

class General extends StatelessWidget {

  const General({
    Key key,
    @required this.header,
    @required this.left_bar,
    @required this.main
  }) : super(key: key);

  final AppBar header;
  final Widget left_bar;
  final Widget main;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.header,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          this.left_bar,
          Expanded(
            child: this.main,
          ),
        ],
      ),
    );
  }
}
