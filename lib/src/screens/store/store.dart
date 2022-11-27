import 'package:flutter/material.dart';

import 'check_in.dart';
import 'note.dart';
import 'sales.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  int pageIndex = 0;
  late PageController pageController;

  final listButton = [
    {'title': 'Check in', 'action': () => {}},
    {'title': 'Tổng quan', 'action': () => {}},
    {'title': 'Bên trong', 'action': () => {}},
    {'title': 'Checkout', 'action': () => {}},
    {'title': 'Doanh số', 'action': () => {}},
    {'title': 'Ghi chú', 'action': () => {}}
  ];

  _onChangeTab(index) {
    setState(() => pageIndex = index);
    pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
    pageIndex = 0;
    pageController = PageController(initialPage: pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const SizedBox(),
          flexibleSpace: Container(
            color: Colors.red,
            padding: const EdgeInsets.only(left: 10, bottom: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Store 1',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 5),
                Text(
                  '62 Hai Bà Trưng, Phường 7, Quận 1, Tp. Hồ Chí Minh',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            buildListButton(),
            Expanded(
                child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                const CheckIn(),
                Container(color: Colors.blue),
                Container(color: Colors.orange),
                Container(color: Colors.deepOrange),
                const Sales(),
                const Note(),
              ],
            ))
          ],
        ));
  }

  Widget buildListButton() {
    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 3,
      childAspectRatio: 3,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: listButton
          .asMap()
          .entries
          .map(
            (item) => Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () => _onChangeTab(item.key),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color:
                          pageIndex == item.key ? Colors.grey[500] : Colors.red,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    item.value['title'] as String,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
