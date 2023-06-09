library home_view;

import 'package:flutter/material.dart';
import 'package:flutter_provider_crud/core/constants/constants.dart';
import 'package:flutter_provider_crud/core/models/category.dart';
import 'package:flutter_provider_crud/screens/home/home_view_model.dart';
import 'package:flutter_provider_crud/screens/productadd/product_view.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

part '../../core/widget/custom_text_field.dart';
part 'widget/custom_float_btn.dart';
part 'widget/custom_list_view.dart';
part 'widget/custom_filter_chip.dart';
part 'widget/custom_bottom_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    homeViewModel.getCategory();
    homeViewModel.getProduct(homeViewModel.page);
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: const CustomFloatActionBtn(),
      body: RefreshIndicator(
        onRefresh: () async {
          await homeViewModel.refresh(homeViewModel.page);
        },
        child: HomeBody(homeViewModel: homeViewModel),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
    required this.homeViewModel,
  }) : super(key: key);

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return homeViewModel.isLoading == false
        ? Column(
            children: [
              CustomFilterChip(homeViewModel: homeViewModel),
              CustomListView(homeViewModel: homeViewModel),
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}
