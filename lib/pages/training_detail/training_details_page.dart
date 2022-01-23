import 'package:training_app/models/models.dart';
import 'package:training_app/styles/styles.dart';

@immutable
class TrainingDetailPageArguments {
  const TrainingDetailPageArguments({
    required this.trainingModelResponse,
  });
  final TrainingList trainingModelResponse;
}

class TrainingDetailPage extends StatelessWidget {
  static const String routeName = '/trainingDetailPage';
  TrainingDetailPage({Key? key}) : super(key: key);
  late TrainingDetailPageArguments args;
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments
        as TrainingDetailPageArguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Training Details"),
      ),
      body: SafeArea(
        child: body(),
      ),
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          args.trainingModelResponse.authorProfileImg.toString(),
          fit: BoxFit.cover,
          width: MediaQuery.of(navigatorKey.currentContext!).size.width,
          height: 250,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trainingNameText,
                style: sortBoldTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Text(
                  args.trainingModelResponse.courseTitle.toString(),
                  style: sortTextStyle,
                ),
              ),
              Text(
                trainerText,
                style: sortBoldTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Text(
                  args.trainingModelResponse.courseAuthor.toString(),
                  style: sortTextStyle,
                ),
              ),
              Text(
                "Course Date",
                style: sortBoldTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Text(
                  args.trainingModelResponse.courseDate.toString(),
                  style: sortTextStyle,
                ),
              ),
              Text(
                "Course Time",
                style: sortBoldTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Text(
                  args.trainingModelResponse.courseTime.toString(),
                  style: sortTextStyle,
                ),
              ),
              Text(
                locationText,
                style: sortBoldTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Text(
                  args.trainingModelResponse.location.toString(),
                  style: sortTextStyle,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
