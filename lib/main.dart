import 'package:training_app/bloc/blocs.dart';
import 'package:training_app/pages/pages.dart';
import 'package:training_app/styles/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TrainingBloc>(
          create: (_) => TrainingBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Trainings',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        routes: <String, WidgetBuilder>{
          HomePage.routeName: (BuildContext _) => const HomePage(),
          TrainingDetailPage.routeName: (BuildContext _) =>
              TrainingDetailPage(),
        },
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            },
          );
        },
      ),
    );
  }
}
