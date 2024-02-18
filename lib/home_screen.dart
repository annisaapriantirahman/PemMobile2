// home_screen.dart
import 'package:flutter/material.dart';
import 'package:aaishop/data_bloc.dart';

class HomeScreen extends StatelessWidget {
  final DataBloc bloc = DataBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: bloc.dataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.toString());
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.getDataFromMySQL(); // Contoh pemanggilan fungsi BloC
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
