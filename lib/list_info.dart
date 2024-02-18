import 'package:flutter/material.dart';

class ListInfoPage extends StatefulWidget {
  @override
  _ListInfoPageState createState() => _ListInfoPageState();
}

class _ListInfoPageState extends State<ListInfoPage> {
  List<String> _infoList = [
    'Informasi 1',
    'Informasi 2',
    'Informasi 3',
    'Informasi 4',
    'Informasi 5',
    // Tambahkan data informasi lainnya di sini
  ];

  List<String> _filteredInfoList = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredInfoList = _infoList;
  }

  void _filterInfoList(String query) {
    setState(() {
      _filteredInfoList = _infoList
          .where((info) => info.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Informasi'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterInfoList,
              decoration: InputDecoration(
                labelText: 'Cari Informasi',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 1.0,
              ),
              itemCount: _filteredInfoList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Center(
                    child: Text(_filteredInfoList[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
