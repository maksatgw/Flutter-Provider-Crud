part of home_view;

class BottomBarMenu extends StatelessWidget {
  const BottomBarMenu({
    Key? key,
    required this.homeViewModel,
    required this.index,
    required this.fun,
  }) : super(key: key);

  final HomeViewModel homeViewModel;
  final int index;
  final Function() fun;

  @override
  Widget build(BuildContext context) {
    const editTxt = 'Edit';
    const shareTxt = 'Share';
    const deleteTxt = 'Delete';
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
            title: const Text(editTxt),
            leading: const Icon(Icons.edit),
            onTap: () {
              Navigator.of(context).pop();
              showBarModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(),
                  );
                },
              );
            }),
        ListTile(
          title: const Text(shareTxt),
          leading: const Icon(Icons.share),
          onTap: () => Navigator.of(context).pop(),
        ),
        ListTile(
          title: const Text(deleteTxt),
          leading: const Icon(Icons.delete),
          onTap: fun,
        ),
      ],
    );
  }
}
