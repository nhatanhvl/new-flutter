import 'package:demo/src/screens/store/store.dart';
import 'package:flutter/material.dart';

class ListStore extends StatefulWidget {
  const ListStore({super.key});

  @override
  State<ListStore> createState() => _ListStoreState();
}

class _ListStoreState extends State<ListStore> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const SizedBox(),
        flexibleSpace: Container(
          color: Colors.red,
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(left: 5, bottom: 5),
          child: const Text(
            '20/10/2022',
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Container(
        width: screenWidth,
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: const Text(
                'Danh sách cửa hàng',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: buildListStore(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildListStore() {
    return List.generate(
      50,
      (index) => InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Store(),
          ),
        ),
        child: Container(
          color: index % 2 == 0 ? Colors.white : Colors.grey[200],
          padding:
              const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Store 1',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    SizedBox(height: 5),
                    Text('62 Hai Bà Trưng, Phường 7, Quận 1, Tp. Hồ Chí Minh')
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  'Làm việc',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
