import 'package:ecommerce_app/utilities/assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imgUrl;
  final int? discountValue;
  final String category;
  final double? rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
    this.discountValue,
    required this.category,
    this.rate,
  });
}

List<Product> dummyProducts = [
  Product(
      id: '1',
      title: 't-shirt nike',
      price: 20,
      imgUrl: AppAssets.tempProductAsset1,
      category: 'T-shirt',
      discountValue: 20),
  Product(
      id: '2',
      title: 't-shirt addidas',
      price: 20,
      imgUrl: AppAssets.tempProductAsset1,
      category: 'T-shirt',
      discountValue: 20),
  Product(
      id: '3',
      title: 't-shirt puma',
      price: 20,
      imgUrl: AppAssets.tempProductAsset1,
      category: 'T-shirt'),
  Product(
      id: '4',
      title: 't-shirt umbro',
      price: 20,
      imgUrl: AppAssets.tempProductAsset1,
      category: 'Clothes'),
];
