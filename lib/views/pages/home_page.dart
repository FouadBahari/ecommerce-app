import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/utilities/assets.dart';
import 'package:ecommerce_app/views/widgets/list_item_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildHeaderOFList(
    BuildContext context, {
    required String title,
    VoidCallback? onTap,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: onTap,
                child: Text(
                  'View all',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
            ],
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(AppAssets.topBannerHomePage,
                  width: double.infinity,
                  height: size.height * 0.3,
                  fit: BoxFit.cover),
              Opacity(
                opacity: 0.3,
                child: Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: size.height * 0.3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Street clothes',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildHeaderOFList(context,
              title: 'Sale', description: 'Super summer sale!!'),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: dummyProducts
                  .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListItemHome(product: e)))
                  .toList(),
            ),
          ),
          const SizedBox(height: 20),
          _buildHeaderOFList(context,
              title: 'New', description: 'Super new sale!!'),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: dummyProducts
                  .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListItemHome(product: e)))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
