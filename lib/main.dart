import 'package:fic4_tugas_4_api/belajar/product_model.dart';
import 'package:fic4_tugas_4_api/crud_rest_api/network_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<ProductModel> productModel;
  // late Future<List<ProductModel>> listProductModel;

  @override
  void initState() {
    super.initState();

    productModel = NetworkManager().fetchProduct();
    // listProductModel = NetworkManager().fetchAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "FIC Rest API",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          body: FutureBuilder(
            future: productModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              NetworkImage(snapshot.data!.images[1])),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        snapshot.data!.title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        snapshot.data!.description,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Rp. ${snapshot.data!.price.toString()}",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text(
                  "${snapshot.hasError}",
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
