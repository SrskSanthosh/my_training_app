import 'package:flutter/cupertino.dart';
import 'package:training_app/bloc/blocs.dart';
import 'package:training_app/models/models.dart';
import 'package:training_app/pages/pages.dart';
import 'package:training_app/styles/styles.dart';
import 'package:training_app/widgets/widget.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TrainingBloc trainingBloc = TrainingBloc();
  final List<TrainingList> _trainingList = <TrainingList>[];

  @override
  void initState() {
    super.initState();
    trainingBloc.add(const FetchCourseEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: BlocBuilder<TrainingBloc, TrainingState>(
              bloc: trainingBloc,
              builder: (context, state) {
                if (state is TrainingCourseLoaded) {
                  _trainingList.clear();
                  _trainingList
                      .addAll(state.trainingModelResponse.trainingList!);
                }
                return LoadingIndicator(
                  isLoading: state is TrainingLoading ? true : false,
                  widget: body(),
                );
              }),
        ),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        Expanded(
          child: carouselDetailsWidget(),
        ),
        Expanded(
          child: trainingListDetailsWidget(),
        ),
      ],
    );
  }

  CarouselController buttonCarouselController = CarouselController();
  Widget carouselDetailsWidget() {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: redColor,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          appTitleText,
                          style: titleTextStyle,
                        ),
                        const Icon(
                          Icons.menu,
                          color: whiteColor,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 35),
                      child: Text(
                        highlightsText,
                        style: subTitleTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: whiteColor,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: filterBtn(),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 80,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 25,
                  color: Colors.black26,
                  child: IconButton(
                    onPressed: () => previousPage(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: whiteColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 170,
                    child: _trainingList.isNotEmpty
                        ? CarouselSlider.builder(
                            carouselController: buttonCarouselController,
                            options: CarouselOptions(
                                initialPage: 0,
                                viewportFraction: 1,
                                aspectRatio: MediaQuery.of(context).size.width,
                                height: 180),
                            itemCount: _trainingList.length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                    int pageViewIndex) =>
                                CarouselCardWidget(
                                    data: _trainingList[itemIndex]),
                          )
                        : const SizedBox(),
                  ),
                ),
                Container(
                  height: 70,
                  width: 25,
                  color: Colors.black26,
                  child: IconButton(
                    onPressed: () => nextPage(),
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  int pageIndex = 0;
  void nextPage() {
    if (pageIndex < _trainingList.length) {
      pageIndex++;
      buttonCarouselController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void previousPage() {
    if (pageIndex > 0) {
      pageIndex--;
      buttonCarouselController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  Widget filterBtn() {
    return TextButton(
        onPressed: () => showFilterDialog(),
        child: Container(
          width: 100,
          margin: const EdgeInsets.only(left: 15, bottom: 7),
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.black38,
                width: 1,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                CupertinoIcons.slider_horizontal_3,
                color: Colors.black38,
              ),
              Text(
                filterText,
                style: textStyle,
              )
            ],
          ),
        ));
  }

  void showFilterDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const FilterDialogPopup(),
    );
  }

  Widget trainingListDetailsWidget() {
    return Container(
      color: lightWhiteColor,
      child: courseListviewWidget(),
    );
  }

  Widget courseListviewWidget() {
    return _trainingList.isNotEmpty
        ? ListView.builder(
            itemCount: _trainingList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return TrainingInfoCardWidget(data: _trainingList[index]);
            },
          )
        : const Center(
            child: Text("No course found"),
          );
  }
}
