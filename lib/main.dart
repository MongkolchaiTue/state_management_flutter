import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String txtdata = 'Top Secret Data';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      builder: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Level1(txtdata),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  Level1(this.txtdata);
  final String txtdata;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(txtdata),
    );
  }
}

class Level2 extends StatelessWidget {
  Level2(this.txtdata);
  final String txtdata;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3(txtdata),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  Level3(this.txtdata);
  final String txtdata;
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context, listen: false).data);
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        Provider.of<Data>(context).changeString(newText);
      },
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'Some data';

  void changeString(String newString) {
    data = newString;
    notifyListeners();
  }
}
