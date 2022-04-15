import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/caracter.dart';
import '../providers/caracters_provider.dart';
import 'acid_circular_progress_indicator_widget.dart';
import 'caracter_item_gridview_widget.dart';

class CaractersGridviewWidget extends StatefulWidget {
  const CaractersGridviewWidget({Key? key}) : super(key: key);

  @override
  State<CaractersGridviewWidget> createState() =>
      _CaractersGridviewWidgetState();
}

class _CaractersGridviewWidgetState extends State<CaractersGridviewWidget> {
  List<Caracter> _caracters = [];

  final RefreshController _refreshController = RefreshController();

  bool _isLoad = true;
  bool _isErrorLoad = false;

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  void _refreshData() async {
    setState(() {
      _isErrorLoad = false;
    });
    final caractersProvider =
        Provider.of<CaractersProvider>(context, listen: false);

    try {
      await caractersProvider.loadCaracters(isRefresh: true).then((_) {
        setState(() {
          _isLoad = false;
        });
        _refreshController.refreshCompleted();
      });
    } catch (e) {
      setState(() {
        _isErrorLoad = true;
      });
    } finally {
      setState(() {
        _isLoad = false;
      });
      _refreshController.refreshCompleted();
    }
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
    _caracters =
        Provider.of<CaractersProvider>(context, listen: true).caracters;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(116, 212, 43, 1),
            Colors.white70,
            Colors.white60,
            // Colors.grey,
          ],
        ),
      ),
      child: SmartRefresher(
        controller: _refreshController,
        onRefresh: _refreshData,
        onLoading: _nextPageData,
        enablePullUp: true,
        child: _isLoad
            ? const Center(
                child: AcidCircularProgressIndicatorWidget(),
              )
            : _isErrorLoad && _caracters.isEmpty
                ? Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: const [
                          Text(
                            "💀",
                            style: TextStyle(fontSize: 60),
                          ),
                          Text(
                            "There was an error loading characters, drag down to try loading again !",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                : GridView.builder(
                    itemCount: _caracters.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                      value: _caracters[i],
                      child: CaracterItemGridViewWidget(
                        key: ValueKey(_caracters[i].id),
                        caracter: _caracters[i],
                      ),
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.42,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),
      ),
    );
  }
}
