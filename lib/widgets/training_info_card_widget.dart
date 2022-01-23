import 'package:training_app/models/models.dart';
import 'package:training_app/styles/styles.dart';
import 'package:training_app/widgets/widget.dart';

class TrainingInfoCardWidget extends StatelessWidget {
  final TrainingList data;
  const TrainingInfoCardWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: const EdgeInsets.all(10),
      color: whiteColor,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.courseDate.toString(),
                  style: dateTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  child: Text(
                    data.courseTime.toString(),
                    style: timeTextStyle,
                  ),
                ),
                Text(
                  data.location.toString(),
                  style: mediumTextStyle,
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: DottedLine(
              dashLength: 3,
              dashGapLength: 4,
              lineThickness: 1,
              dashColor: Colors.black26,
              dashGapColor: Colors.white,
              direction: Axis.vertical,
              lineLength: 195,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.coursePromo.toString(),
                  style: promoTextStyle,
                ),
                Text(
                  data.courseTitle.toString(),
                  style: dateTextStyle,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(bottom: 20),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        NetworkImage(data.authorProfileImg.toString()),
                  ),
                  title: Text(
                    keyNoteSpeakerText,
                    style: mediumTextStyle,
                  ),
                  subtitle: Text(
                    data.courseAuthor.toString(),
                    style: timeTextStyle,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: enrolBtn(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget enrolBtn() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: redColor,
      ),
      child: Text(
        enrolNowText,
        style: whiteTextStyle,
      ),
    );
  }
}
