import 'dart:io';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ExcelPage extends StatelessWidget {
  List<Map<String, dynamic>> persons = [
    {
      'id': 1,
      'name': "Ramón 1",
      "address": "Av Lima 123",
    },
    {
      'id': 2,
      'name': "Ramón 2",
      "address": "Av Lima 123",
    },
    {
      'id': 3,
      'name': "Ramón 3",
      "address": "Av Lima 123",
    },
    {
      'id': 4,
      'name': "Ramón 4",
      "address": "Av Lima 123",
    },
  ];

  _exportExcel() async {
    Excel excel = Excel.createExcel();
    Sheet? sheet = excel.sheets[excel.getDefaultSheet() as String];
    sheet!.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)).value =
        "Código";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0)).value =
        "Nombres";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0)).value =
        "Dirección";

    for (int i = 0; i < persons.length; i++) {
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 1)).value = persons[i]["id"];
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 1)).value = persons[i]["name"];
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 1)).value = persons[i]["address"];
    }

    List<int>? bytes = excel.save();
    Directory directory = await getApplicationDocumentsDirectory();
    File fileExcel = File("${directory.path}/prueba_excel.xlsx")
      ..createSync(recursive: true)
      ..writeAsBytesSync(bytes!);
    await OpenFile.open(fileExcel.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Excel Export"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Export"),
          onPressed: () {
            _exportExcel();
          },
        ),
      ),
    );
  }
}
