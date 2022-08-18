import 'dart:io';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ExcelPage extends StatelessWidget {
  _exportExcel() async {
    Excel excel = Excel.createExcel();
    Sheet? sheet = excel.sheets[excel.getDefaultSheet() as String];
    sheet!.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)).value =
        "Prueba 1";
    List<int>? bytes = excel.save();
    Directory directory = await getApplicationDocumentsDirectory();
    File fileExcel = File("${directory.path}/prueba_excel.xlsx")
      ..createSync(recursive: true)
      ..writeAsBytesSync(bytes!);
    print(fileExcel);
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
