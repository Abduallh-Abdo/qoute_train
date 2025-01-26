import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qoute_train/core/utils/app_colors.dart';
import 'package:qoute_train/core/utils/app_strings.dart';
import 'package:qoute_train/core/widgets/error_widget.dart';
import 'package:qoute_train/features/random_qoute/presentation/cubit/random_qoute_cubit.dart';
import 'package:qoute_train/features/random_qoute/presentation/widgets/qoute_content.dart';
import 'package:qoute_train/features/random_qoute/presentation/widgets/qoute_refresh.dart';

class QouteScreen extends StatefulWidget {
  const QouteScreen({super.key});

  @override
  State<QouteScreen> createState() => _QouteScreenState();
}

class _QouteScreenState extends State<QouteScreen> {
  // _getRandomQoute() =>
  //     BlocProvider.of<RandomQouteCubit>(context).getRandomQoute();
  // @override
  // void initState() {
  //   super.initState();
  //   _getRandomQoute();
  // }

  // Widget _buildContent() {
  //   return BlocBuilder<RandomQouteCubit, RandomQouteState>(
  //     builder: (context, state) {
  //       if (state is RandomQouteLoading) {
  //         return Center(
  //           child: SpinKitDoubleBounce(
  //             color: AppColors.primary,
  //           ),
  //         );
  //       } else if (state is RandomQouteError) {
  //         return const CircularProgressIndicator();
  //       } else if (state is RandomQouteLoaded) {
  //         return Column(
  //           children: [
  //             QouteContent(
  //               qoute: state.qoute,
  //             ),
  //             InkWell(
  //               onTap: () => _getRandomQoute(),
  //               child: const QouteRefresh(),
  //             ),
  //           ],
  //         );
  //       } else {
  //         return SpinKitDoubleBounce(
  //           color: AppColors.primary,
  //         );
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    //* AppBar
    final appBar = AppBar(
      title: const Text(
        AppStrings.appName,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
    
    return const Scaffold(
      body: ErrorScreen(),
    );
    // return RefreshIndicator(
    //   onRefresh: () => _getRandomQoute(),
    //   child: Scaffold(
    //     appBar: appBar,
    //     body: _buildContent(),
    //   ),
    // );
  }
}
