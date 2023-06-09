part of product_view;

class ProductSubmitBtn extends StatelessWidget {
  const ProductSubmitBtn({
    Key? key,
    required this.productViewModel,
    required this.tec1,
    required this.tec2,
    required this.homeViewModel,
  }) : super(key: key);

  final ProductViewModel productViewModel;
  final TextEditingController tec1;
  final TextEditingController tec2;
  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    const ekleTxt = "Ekle!";
    return ElevatedButton(
      onPressed: productViewModel.isLoading == false && productViewModel.catId != 0
          ? () async {
              final model = Product(
                urunAd: tec1.text,
                adet: int.parse(tec2.text),
                kategoriId: productViewModel.catId,
              );
              await productViewModel.postProduct(model);
              await homeViewModel.getProduct(homeViewModel.page);

              Navigator.of(context).pop();
            }
          : null,
      child: productViewModel.isLoading == false ? const Text(ekleTxt) : const CircularProgressIndicator(),
    );
  }
}
