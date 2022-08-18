

import 'package:flutter/material.dart';

class ExcelPage extends StatelessWidget {

  _exportExcel(){

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
          onPressed: (){
            _exportExcel();
          },
        ),
      ),
    );
  }
}
