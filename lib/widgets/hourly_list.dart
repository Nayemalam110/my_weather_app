import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HourlyList extends StatelessWidget {
  const HourlyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Time'),
          Image.asset('assets/icons/clouds.png'),
          Text('Time'),
        ],
      ),
    );
  }
}
