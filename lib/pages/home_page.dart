import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _menu = ['New Transaction', 'Sales Report'];
  final List<String> _adminMenu = [
    'Store Info',
    'Products',
    'Employees',
    'New Transaction',
    'Sales Report'
  ];

  String user = 'Andi'; // Nama user sementara
  bool isAdmin = true; // Status user sementara

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TOKO SAKU'),
          leading: Image.asset('assets/images/logo.png'), //Belum ada logo cuy
          actions: [
            IconButton(
              onPressed: () {
                // logout
              },
              icon: const Icon(Icons.logout_sharp),
            ),
          ],
        ),
        body: Column(
          children: [
            Text('Welcome $user'),
            Expanded(
              child: SingleChildScrollView(
                child: GridView.count(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  children: List.generate(
                    isAdmin ? _adminMenu.length : _menu.length,
                    (index) => InkWell(
                      onTap: () {
                        if (isAdmin) {
                          if (index == 0) {
                            // logic untuk menu admin 1
                          } else if (index == 1) {
                            // logic untuk menu admin 2
                          } else if (index == 2) {
                            // logic untuk menu admin 1
                          }
                        } else {
                          if (index == 0) {
                            // menu pengguna biasa 1
                          } else if (index == 1) {
                            // menu pengguna biasa 2
                          } else if (index == 2) {
                            // menupengguna biasa 3
                          }
                        }
                      },
                      child: Card(
                        color: Colors.amber,
                        child: Center(
                          child: Text(
                            isAdmin ? _adminMenu[index] : _menu[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
