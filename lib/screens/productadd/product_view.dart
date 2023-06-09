library product_view;

import 'package:flutter/material.dart';
import 'package:flutter_provider_crud/core/constants/constants.dart';
import 'package:flutter_provider_crud/core/models/product.dart';
import 'package:flutter_provider_crud/screens/home/home_view.dart';
import 'package:flutter_provider_crud/screens/home/home_view_model.dart';
import 'package:flutter_provider_crud/screens/productadd/product_view_model.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

part 'widget/custom_submit_btn.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final TextEditingController tec1 = TextEditingController();
  final TextEditingController tec2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    homeViewModel.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final productViewModel = Provider.of<ProductViewModel>(context);
    const urunIsmiTxt = 'Ürün İsmi';
    const adetTxt = 'Adet...';

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            CustomTextField(controller: tec1, hintText: urunIsmiTxt),
            Constants.defSizedH,
            ListTile(
              shape: const OutlineInputBorder(),
              title: Text(productViewModel.catName.toString()),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                showBarModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: homeViewModel.categoryList?.length ?? 0,
                      itemBuilder: (context, index) {
                        final list = homeViewModel.categoryList?[index];
                        return ListTile(
                          title: Text("${list?.kategoriAd}"),
                          onTap: () {
                            productViewModel.catName = list?.kategoriAd;
                            productViewModel.catId = list?.kategoriId;
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
            Constants.defSizedH,
            CustomTextField(controller: tec2, hintText: adetTxt),
            Constants.defSizedH,
            ProductSubmitBtn(productViewModel: productViewModel, tec1: tec1, tec2: tec2, homeViewModel: homeViewModel),
          ],
        ),
      ),
    );
  }
}
