import 'package:block_city/features/home/cubit/home_ui_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CloudAnimation extends StatefulWidget {
  const CloudAnimation({super.key});

  @override
  State<CloudAnimation> createState() => _CloudAnimationState();
}

class _CloudAnimationState extends State<CloudAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync:    this,
    );
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeUICubit, HomeUIState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: (){},
          loaded: (weather){
            if( 
              (weather.weather.first.main == 'Rain')    || 
              (weather.weather.first.main == 'Clouds')  ||
              (weather.weather.first.main == 'Drizzle') ||
              (weather.weather.first.main == 'Thunderstorm')
            )
            {
              _controller.forward();
            }
          },
        );
      },
      child: SizedBox(
        width:  MediaQuery.of(context).size.width * 0.8,
        height: 150,
        child:  Icon(
          Icons.cloud, 
          size: 150,
          color: Colors.white.withOpacity(_controller.value * 0.7),
        ),
      )
    );
  }
}
