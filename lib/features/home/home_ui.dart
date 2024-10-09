import 'package:block_city/features/home/cubit/home_ui_cubit.dart';
import 'package:block_city/features/home/home_ui_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => GetIt.I<HomeUICubit>(),
        child:  const Scaffold(
          body: HomeUIBody()
        )
      ),
    );
  }
}
