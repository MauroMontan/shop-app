import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/services/product_service.dart';
import 'package:shop_app/widget_style/input_style.dart';

class EditProductFormView extends StatelessWidget {
  static const String routeName = "EditProductForm";

  const EditProductFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductService>(context);
    final currentProduct = provider.selectedproduct;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Productimage(picture: currentProduct.picture),
              const EditButton(),
            ]),
            ProductForm(product: currentProduct)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save_outlined), onPressed: () {}),
    );
  }
}

class ProductForm extends StatelessWidget {
  final Product product;
  const ProductForm({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.all(2),
        height: 300,
        width: double.infinity,
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              initialValue: product.name,
              decoration: WidgetStyle.inputDecoration(
                  label: "Product name", hint: "Enter your product name"),
            ),
            TextFormField(
              initialValue: "${product.price}",
              decoration: WidgetStyle.inputDecoration(
                  label: "Product price", hint: "Enter your pruduct price"),
              keyboardType: TextInputType.number,
            ),
            SwitchListTile.adaptive(
              title: const Text("Is available"),
              value: false,
              onChanged: (val) {},
            )
          ],
        )),
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 22,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black38,
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Productimage extends StatelessWidget {
  final String? picture;
  const Productimage({super.key, this.picture});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
          width: double.infinity,
          height: 350,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: picture != null
              ? FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: const AssetImage("assets/jar-loading.gif"),
                  image: NetworkImage(picture ?? ""))
              : Image.asset(
                  "assets/no-image.png",
                  fit: BoxFit.cover,
                )),
    );
  }
}
