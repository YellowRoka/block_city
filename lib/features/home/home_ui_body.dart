import 'package:block_city/features/home/cubit/home_ui_cubit.dart';
import 'package:block_city/features/home/parts/circular_progress.dart';
import 'package:block_city/features/home/parts/cloud_animation.dart';
import 'package:block_city/features/home/parts/refresh_button.dart';
import 'package:block_city/features/home/parts/show_weather_data.dart';
import 'package:block_city/features/home/parts/sun_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeUIBody extends StatelessWidget {
  const HomeUIBody({super.key});

  @override
  Widget build(BuildContext context) {
    

    return OrientationBuilder(  
      builder: (context, oriantation) {
        final isPortrai = oriantation == Orientation.portrait;

        return Container(
          width:      MediaQuery.of(context).size.width,
          height:     MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient( 
              begin: Alignment.topLeft,
              end:   Alignment.bottomRight,
              colors: [
                Colors.blue.shade100,
                Colors.blue.shade300,
                Colors.blue.shade600,
                Colors.blue.shade900,
              ],
            )
          ),
          child: Flex(
            direction: ( isPortrai )?( Axis.vertical ):( Axis.horizontal ),
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
          
              const SizedBox( height: 25 ),
              
              const Flexible(
                flex:  1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SunAnimation(),
                    CloudAnimation(),
                  ],
                ),
              ),
              
              Flexible(
                flex:  1,
                child: Column(
                  mainAxisAlignment:  MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex:  1,
                      child: Center(
                        child: BlocBuilder<HomeUICubit, HomeUIState>(
                          builder: (context, state) {
                            
                            return state.when(
                              initial: ()        => const Text('Just a moment!'),
                              loaded:  (weather) => ShowWeatherData(weather),
                              loading: ()        => const CircularProgress(),
                              error:   (error)   => Text(
                                error, 
                                style: const TextStyle(
                                  fontSize:   20,
                                  color:    Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox( height: 20 ),
                          
                    const Flexible(
                      flex:  1,
                      child: RefreshButton()
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
