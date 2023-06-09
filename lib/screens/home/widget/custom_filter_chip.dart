part of home_view;

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip({
    Key? key,
    required this.homeViewModel,
  }) : super(key: key);

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: homeViewModel.categoryList?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: Constants.defPadding,
            child: InkWell(
              hoverColor: Constants.transparentC,
              onLongPress: () {
                showBarModalBottomSheet(
                  context: context,
                  builder: (context) => BottomBarMenu(
                    homeViewModel: homeViewModel,
                    index: index,
                    fun: () async {
                      final navigator = Navigator.of(context);
                      await homeViewModel.delCategory(homeViewModel.categoryList?[index].kategoriId);
                      navigator.pop();
                    },
                  ),
                );
              },
              child: FilterChip(
                label: Text('${homeViewModel.categoryList?[index].kategoriAd}'),
                selected: homeViewModel.page == homeViewModel.categoryList?[index].kategoriId,
                onSelected: (value) async {
                  homeViewModel.page = homeViewModel.categoryList?[index].kategoriId;
                  await homeViewModel.getProduct(homeViewModel.page);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
