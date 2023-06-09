part of home_view;

class CustomFloatActionBtn extends StatefulWidget {
  const CustomFloatActionBtn({Key? key}) : super(key: key);

  @override
  State<CustomFloatActionBtn> createState() => _CustomFloatActionBtnState();
}

class _CustomFloatActionBtnState extends State<CustomFloatActionBtn> {
  final TextEditingController tec1 = TextEditingController();
  final TextEditingController tec2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    const kategoriEkle = 'Kategori Ekle';
    const urunEkle = 'Ürün Ekle';
    const addTxt = 'Add';
    return SpeedDial(
      tooltip: addTxt,
      childPadding: const EdgeInsets.all(8),
      children: [
        SpeedDialChild(
          child: const Text(kategoriEkle),
          onTap: () {
            showBarModalBottomSheet(
              enableDrag: true,
              context: context,
              builder: (context) {
                return AddCategoryBottom(tec1: tec1, homeViewModel: homeViewModel);
              },
            );
          },
        ),
        SpeedDialChild(
          child: const Text(urunEkle),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProductView(),
              ),
            );
          },
        )
      ],
      child: const Icon(Icons.add),
    );
  }
}

class AddCategoryBottom extends StatelessWidget {
  const AddCategoryBottom({
    Key? key,
    required this.tec1,
    required this.homeViewModel,
  }) : super(key: key);

  final TextEditingController tec1;
  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    const ekleTxt = "Ekle!";
    const kategoriTxt = 'Kategori...';
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(controller: tec1, hintText: kategoriTxt),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text(ekleTxt),
              onPressed: () async {
                final model = Category(
                  kategoriAd: tec1.text,
                );
                await homeViewModel.postCategory(model);
                await homeViewModel.getCategory();

                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
