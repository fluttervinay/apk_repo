import 'package:flutter/material.dart';

// Custom DataSource class
class MyData extends DataTableSource {
  final List<Map<String, dynamic>> data;

  MyData(this.data);

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;
    final item = data[index];
    return DataRow(cells: [
      DataCell(Text(item['name'])),
      DataCell(Text(item['age'].toString())),
      DataCell(Text(item['city'])),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}

class PaginatedDataTableExample extends StatefulWidget {
  @override
  _PaginatedDataTableExampleState createState() => _PaginatedDataTableExampleState();
}

class _PaginatedDataTableExampleState extends State<PaginatedDataTableExample> {
  final List<Map<String, dynamic>> _data = List.generate(
    100,
        (index) => {
      'name': 'Name $index',
      'age': 20 + (index % 30),
      'city': 'City $index',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Paginated DataTable Example')),
      body: SingleChildScrollView(
        child: PaginatedDataTable(
          showFirstLastButtons: true,
          header: Text('User Information'),
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Age')),
            DataColumn(label: Text('City')),
          ],
          source: MyData(_data),
          rowsPerPage: 10,  // Number of rows per page
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: PaginatedDataTableExample(),
));
