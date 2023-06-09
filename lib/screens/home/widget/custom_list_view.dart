part of home_view;

class CustomListView extends StatelessWidget {
  const CustomListView({
    Key? key,
    required this.homeViewModel,
  }) : super(key: key);

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    const bosTxt = "Boş";
    return homeViewModel.productList!.isEmpty
        ? const Text(bosTxt)
        : Expanded(
            child: ListView.builder(
              itemCount: homeViewModel.productList?.length ?? 0,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 50,
                  child: ListTile(
                    onTap: () {
                      showBarModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return BottomBarMenu(
                            homeViewModel: homeViewModel,
                            index: index,
                            fun: () async {
                              final navigator = Navigator.of(context);
                              await homeViewModel.delProduct(homeViewModel.productList?[index].urunId);
                              navigator.pop();
                            },
                          );
                        },
                      );
                    },
                    title: Text(
                      '${homeViewModel.productList?[index].urunAd}',
                    ),
                  ),
                );
              },
            ),
          );
  }
}
