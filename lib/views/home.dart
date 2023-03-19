import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/services/product_service.dart';
import 'package:shop_app/views/views.dart';
import 'package:shop_app/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "HomeView";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductService>(context);
    List<Product> products = provider.products;
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          provider.loadProducs();
        },
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (contex, index) {
              return GestureDetector(
                  onTap: () {
                    provider.selectedproduct = products[index].copy();
                    Navigator.pushNamed(context, EditProductFormView.routeName);
                  },
                  child: ProductCard(product: products[index]));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
