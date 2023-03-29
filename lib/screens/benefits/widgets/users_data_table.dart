import 'package:flutter/material.dart';

class UsersDataTable extends StatelessWidget {
  final List<String>? columnsTitles;
  final List<DataTableRowData>? rows;

  const UsersDataTable({
    required this.columnsTitles,
    required this.rows,
    Key? key,
  })  : assert(columnsTitles != null || columnsTitles != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.grey[300]!.withOpacity(0.15),
        ),
        child: DataTable(
          columns: List.generate(
            columnsTitles!.length,
            (index) => DataColumn(label: Text(columnsTitles![index])),
          ).toList(),
          rows: List.generate(
            rows!.length,
            (index) => DataRow(
              cells: [
                DataCell(Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      child: Icon(Icons.person_rounded),
                    ),
                    const SizedBox(width: 10.0),
                    Text(rows![index].name!)
                  ],
                )),
                DataCell(Text(rows![index].type!)),
                DataCell(Text(rows![index].date!)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DataTableRowData {
  final String? name;
  final String? type;
  final String? date;

  DataTableRowData({
    required this.name,
    required this.type,
    required this.date,
  });
}
