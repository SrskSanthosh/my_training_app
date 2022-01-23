import 'package:training_app/bloc/blocs.dart';
import 'package:training_app/models/models.dart';
import 'package:training_app/styles/styles.dart';
import 'package:training_app/widgets/widget.dart';

class FilterDialogPopup extends StatefulWidget {
  const FilterDialogPopup({Key? key}) : super(key: key);

  @override
  _FilterDialogPopupState createState() => _FilterDialogPopupState();
}

class _FilterDialogPopupState extends State<FilterDialogPopup> {
  final List<FilterList> _filterList = <FilterList>[];
  TrainingBloc trainingBloc = TrainingBloc();
  @override
  void initState() {
    super.initState();
    trainingBloc.add(const FetchFiltersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingBloc, TrainingState>(
        bloc: trainingBloc,
        builder: (context, state) {
          if (state is FiltersLoaded) {
            _filterList.clear();
            _filterList.addAll(state.filterModelResponse.filterList!);
          }
          return LoadingIndicator(
            isLoading: state is TrainingLoading ? true : false,
            widget: body(),
          );
        });
  }

  Widget body() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 5,
          alignment: Alignment.bottomCenter,
          backgroundColor: whiteColor,
          insetPadding: const EdgeInsets.all(15),
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 400,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sortFilterText,
                      style: dateTextStyle,
                    ),
                    IconButton(
                      onPressed: () => navigatorKey.currentState!.pop(),
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: black12Color,
                        height: 55,
                        child: Center(
                          child: Text(
                            sortByText,
                            style: sortBoldTextStyle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: black26Color,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: const BorderSide(
                                    color: black12Color, width: 1)),
                            filled: true,
                            hintStyle: const TextStyle(color: black26Color),
                            hintText: "Search",
                            fillColor: Colors.white70),
                      ),
                    ),
                  ],
                ),
                filterListWidget(),
              ],
            ),
          ),
        );
      },
    );
  }

  int selectedIndex = 0;
  Widget filterListWidget() {
    return _filterList.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: sortListWidget(),
                ),
                const SizedBox(
                  width: 3,
                ),
                Expanded(
                  flex: 2,
                  child: filterSubListWidget(selectedIndex),
                ),
              ],
            ),
          )
        : const Center(
            child: Text("No filter found"),
          );
  }

  Widget sortListWidget() {
    List<Widget> list = <Widget>[];
    for (var item in _filterList) {
      list.add(
        Container(
          color: item.id == "${selectedIndex + 1}" ? whiteColor : black12Color,
          height: 65,
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              if (item.id == "1") {
                setState(() {
                  selectedIndex = 0;
                });
              } else if (item.id == "2") {
                setState(() {
                  selectedIndex = 1;
                });
              } else {
                setState(() {
                  selectedIndex = 2;
                });
              }
            },
            child: Text(
              item.sortName.toString(),
              style: sortBoldTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }

  Widget filterSubListWidget(int index) {
    List<Widget> list = <Widget>[];
    for (var item in _filterList[index].filterSubList!) {
      list.add(
        CheckboxListTile(
          value: item.isSelected,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (value) {
            setState(() {
              item.isSelected = value;
            });
          },
          checkColor: whiteColor,
          title: Text(
            item.filterName.toString(),
            style: sortTextStyle,
          ),
        ),
      );
    }
    return Column(
      children: list,
    );
  }
}
