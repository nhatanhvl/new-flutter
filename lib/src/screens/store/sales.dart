import 'package:flutter/material.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  final header = ['STT', 'SKU', 'Lốc', 'Thùng', 'Tổng'];
  final total = ['', '', 34, 56, 100];
  final dataTable = [
    {'name': 'Coca', 'pack': 10, 'box': 2, 'total': 12},
    {'name': 'Coca', 'pack': 10, 'box': 2, 'total': 12},
    {'name': 'Coca', 'pack': 10, 'box': 2, 'total': 12},
    {'name': 'Coca', 'pack': 10, 'box': 2, 'total': 12},
    {'name': 'Coca', 'pack': 10, 'box': 2, 'total': 12},
    {'name': 'Coca', 'pack': 10, 'box': 2, 'total': 12},
    {'name': 'Coca', 'pack': 10, 'box': 2, 'total': 12}
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Positioned(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Table(
                  border: TableBorder.all(
                      width: 1.5,
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10)),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      children: buildSpecialRow(
                          header, Colors.white, FontWeight.w700),
                    ),
                    ...buildTableData(),
                    TableRow(
                      children:
                          buildSpecialRow(total, Colors.black, FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                child: Container(
                    alignment: Alignment.center,
                    width: (screenWidth / 5) * 2 - 30,
                    margin: const EdgeInsets.only(left: 16, bottom: 1.5),
                    padding:
                        const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text('Tổng cộng')))
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  List<Widget> buildSpecialRow(
      List<dynamic> data, Color color, FontWeight fontWeight) {
    return data
        .map(
          (item) => Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              item.toString(),
              style: TextStyle(color: color, fontWeight: fontWeight),
            ),
          ),
        )
        .toList();
  }

  List<TableRow> buildTableData() {
    return dataTable
        .asMap()
        .entries
        .map((item) => TableRow(
              children: [
                buildDataRow(item.key + 1),
                buildDataRow(item.value['name']),
                buildDataRow(item.value['pack']),
                buildDataRow(item.value['box']),
                buildDataRow(item.value['total'])
              ],
            ))
        .toList();
  }

  Widget buildDataRow<T>(T data) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Text(
        '$data',
      ),
    );
  }
}
