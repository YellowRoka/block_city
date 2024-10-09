import 'package:block_city/features/home/cubit/home_ui_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefreshButton extends StatefulWidget {
  const RefreshButton({super.key});

  @override
  State<RefreshButton> createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton> {

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeUICubit, HomeUIState>(
      builder: (context, state) {
        state.maybeWhen(
          orElse:  () => isLoading = false,
          loading: () => isLoading = true,
        );
      
        return ElevatedButton(
          style: const ButtonStyle().copyWith(
            animationDuration: const Duration(seconds: 4),
            foregroundColor:   const WidgetStatePropertyAll(Colors.purple),
            elevation:         const WidgetStatePropertyAll(10),
            overlayColor:      WidgetStatePropertyAll(Colors.blue.shade400),
            backgroundColor:   WidgetStatePropertyAll( 
              ( isLoading )?( Colors.blue.shade400 ):( Colors.white )
            ),
          ),
          onPressed: 
            ( isLoading )?
            ( null      ):
            ( () => context.read<HomeUICubit>().refreshData() ),
          child: const Text('Refresh')
        );
      },
    );
  }
}
