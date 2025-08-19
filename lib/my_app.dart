// import 'package:flutter_application_1/config/themes/exp.dart';
import 'package:flutter_application_1/core/imports/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubitCubit()),
        BlocProvider(create: (context) => TaskCubit()),
      ],
      child: MaterialApp(
        title: 'login page ',
        theme: ThemeLight.lightTheme,
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
