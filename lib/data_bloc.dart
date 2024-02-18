// data_bloc.dart
import 'dart:async';
import 'package:mysql1/mysql1.dart';

class DataBloc {
  final _dataController = StreamController<String>();
  Stream<String> get dataStream => _dataController.stream;

  Future<void> getDataFromMySQL() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'your_host',
      port: 3306,
      user: 'your_user',
      password: 'your_password',
      db: 'your_database',
    ));

    Results results = await conn.query('SELECT * FROM your_table');
    for (var row in results) {
      _dataController.sink.add(row.toString());
    }

    await conn.close();
  }

  void dispose() {
    _dataController.close();
  }
}
