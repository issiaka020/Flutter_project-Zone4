import 'package:flutter/material.dart';
import 'package:zone4/repositories/data_repository.dart';
import 'package:zone4/ui/widgets/screens/home_screen.dart';
import 'package:zone4/utils/constant.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    await dataProvider.initData();
    // we unitialliaze the data before goimg to home Screen

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return const HomeScreen();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/Zone4.png'),
          SpinKitThreeInOut(
            color: kPrimaryColor1,
          ),
        ],
      ),
    );
  }
}
