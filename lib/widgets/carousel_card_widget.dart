import 'package:training_app/bloc/blocs.dart';
import 'package:training_app/models/models.dart';
import 'package:training_app/styles/styles.dart';

class CarouselCardWidget extends StatelessWidget {
  final TrainingList data;
  const CarouselCardWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: black26Color,
          image: DecorationImage(
              image: NetworkImage(data.authorProfileImg.toString()),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            data.courseTitle.toString(),
            style: whiteTitleTextStyle,
          ),
          Text(
            data.location.toString() + " - " + data.courseTime.toString(),
            style: whiteTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ 825",
                style: priceTextStyle,
              ),
              GestureDetector(
                  onTap: () {
                    TrainingBloc().add(ViewDetailsEvent(trainingList: data));
                  },
                  child: Text(
                    viewDetailsText,
                    style: whiteTextStyle,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
