import 'package:flutter/material.dart';
import 'package:online_product_app/views/shared/stagger_tile.dart';
import 'package:online_product_app/views/ui/product_page.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../../models/sneaker_model.dart';

class latestShoes extends StatelessWidget {
  const latestShoes({
    super.key,
    required Future<List<Products>> male,
  }) : _male = male;

  final Future<List<Products>> _male;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Products>>(
        future: _male,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          } else {
            final male = snapshot.data;
            return StaggeredGridView.countBuilder(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 16,
                itemCount: male!.length,
                scrollDirection: Axis.vertical,
                staggeredTileBuilder: (index) => StaggeredTile.extent(
                    (index % 2 == 0) ? 1 : 1,
                    (index % 4 == 1 || index % 4 == 3)
                        ? MediaQuery.of(context).size.height * 0.35
                        : MediaQuery.of(context).size.height * 0.3),
                itemBuilder: (context, index) {
                  final shoe = snapshot.data![index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductPage(bracelets: shoe)));
                    },
                    child: StaggerTile(
                        imageUrl: shoe.imageUrl[1],
                        name: shoe.name,
                        price: "\$${shoe.price}"),
                  );
                });
          }
        });
  }
}
