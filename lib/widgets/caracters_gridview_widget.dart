import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../providers/caracters_provider.dart';
import 'caracter_item_gridview_widget.dart';

class CaractersGridviewWidget extends StatefulWidget {
  const CaractersGridviewWidget({Key? key}) : super(key: key);

  @override
  State<CaractersGridviewWidget> createState() =>
      _CaractersGridviewWidgetState();
}

class _CaractersGridviewWidgetState extends State<CaractersGridviewWidget> {
  final RefreshController _refreshController = RefreshController();

  bool _initialLoad = true;

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  void _refreshData() {
    final caractersProvider =
        Provider.of<CaractersProvider>(context, listen: false);
    caractersProvider.loadCaracters(isRefresh: true).then((_) {
      setState(() {
        _initialLoad = false;
      });
      _refreshController.refreshCompleted();
    });
  }

  void _nextPageData() {
    final caractersProvider =
        Provider.of<CaractersProvider>(context, listen: false);
    caractersProvider.loadCaracters().then((e) {
      if (e == null) _refreshController.loadComplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    final caracters =
        Provider.of<CaractersProvider>(context, listen: true).caracters;

    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _refreshData,
      onLoading: _nextPageData,
      enablePullUp: true,
      child: _initialLoad
          ?const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: caracters.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: caracters[i],
                child: CaracterItemGridViewWidget(
                  key: ValueKey(caracters[i].id),
                  caracter: caracters[i],
                ),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.35,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
    );
  }
}
