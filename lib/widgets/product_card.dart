import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 360,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(alignment: Alignment.topRight, children: [
          ProductImage(picture: product.picture),
          PriceBadge(price: product.price),
          ProductName(
            id: product.id,
            name: product.name,
          ),
          const AvailabilityBadge(),
        ]),
      ),
    );
  }
}

class AvailabilityBadge extends StatelessWidget {
  const AvailabilityBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      child: Container(
        height: 40,
        width: 100,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(15)),
        ),
        child: const FittedBox(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "not available",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductName extends StatelessWidget {
  final String name;
  final String? id;
  const ProductName({
    super.key,
    this.id,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        height: 80,
        width: 270,
        decoration: const BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  name,
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Text(
                id ?? "not id to show",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PriceBadge extends StatelessWidget {
  final double price;
  const PriceBadge({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      alignment: Alignment.center,
      height: 60,
      width: 130,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
      ),
      child: FittedBox(
        child: Text(
          "\$ $price",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 21,
          ),
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final String? picture;
  const ProductImage({super.key, this.picture});

  @override
  Widget build(BuildContext context) {
    return picture != null
        ? FadeInImage(
            width: double.infinity,
            image: NetworkImage(picture!),
            placeholder: const AssetImage("assets/jar-loading.gif"),
            fit: BoxFit.cover,
            height: double.maxFinite,
          )
        : Image.asset("assets/no-image.png");
  }
}
