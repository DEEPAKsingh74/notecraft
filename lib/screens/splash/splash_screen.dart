import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notecraft/common/hide_statusbar.dart';
import 'package:notecraft/data/cubit/note_cubit.dart';
import 'package:notecraft/data/database/fetch_db_store_provider.dart';
import 'package:notecraft/data/local_storage/secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    StatusBarUtil.hideStatusBar();
    final noteCubit = BlocProvider.of<NoteCubit>(context);
    final UpdateBloc updateProvider = UpdateBloc(noteCubit);
    initializeData(updateProvider);

    navigateFromScreen();
  }

  Future<void> initializeData(UpdateBloc updateProvider) async {
    await updateProvider.updateBloc();
  }

  Future<void> navigateFromScreen() async {
    await SecureStorage().writeStorage("islogged", "true");
    if (await SecureStorage().readStorage("islogged") == "true") {
      navigateFromSplashScreen('/home');
    } else {
      navigateFromSplashScreen('/onboard');
    }
  }

  void navigateFromSplashScreen(String route) {
    Future.delayed(const Duration(seconds: 3), () {
      context.go(route);
    });
  }

  @override
  void dispose() {
    StatusBarUtil.showStatusBar();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
      ),
    );
  }
}
