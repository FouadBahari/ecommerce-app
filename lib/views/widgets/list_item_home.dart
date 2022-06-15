import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/utilities/assets.dart';
import 'package:flutter/material.dart';

class ListItemHome extends StatelessWidget {
  final Product product;
  const ListItemHome({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: DecoratedBox(
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.imgUrl,
                    fit: BoxFit.cover,
                    width: 150,
                    height: 200,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                      width: 50,
                      height: 25,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '${product.discountValue}%',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              product.category,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 5),
             Text(
              product.title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.black,fontWeight: FontWeight.w600),

            ),
              const SizedBox(height: 5),
             Text(
              '${product.price} DZD',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
