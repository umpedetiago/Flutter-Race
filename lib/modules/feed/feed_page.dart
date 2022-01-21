import 'package:flutter/material.dart';
import 'package:meuapp/shared/theme/app_text.dart';
import 'package:meuapp/shared/widgets/card_chart/card_chart.dart';
import 'package:meuapp/shared/widgets/card_product/card_product.dart';
import 'package:meuapp/shared/widgets/list_tile/app_list_tile.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardChart(
                    value: 365.00,
                    percent: 0,
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  Text("Preço dos Produtos").label,
                  SizedBox(
                    height: 14,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 126,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CardProduct(
                  like: index % 2 == 0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 27,
                  ),
                  Text("Suas últimas compras").label,
                  SizedBox(
                    height: 14,
                  ),
                  AppListTile(),
                  AppListTile(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
