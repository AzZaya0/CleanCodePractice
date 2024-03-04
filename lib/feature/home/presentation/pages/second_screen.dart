import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_color.dart';
import '../../domain/entity/home_entity.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  HomeDataEntity? homeDataEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadedState) {
              homeDataEntity = state.homeDataEntity;
              return _mainSection(state.itemCount);
            } else {
              return const Center(
                child: Text('Error loading Page'),
              );
            }
          },
        ));
  }

  ListView _mainSection(int itemCount) {
    var homeMembersData = homeDataEntity?.data?.members;
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        // Future.delayed(Duration(seconds: 30)).;
        return ListTile(
          title: Text(
            homeMembersData?[index].name ?? '',
            style: TextStyle(color: AppColor.black),
          ),
        );
      },
    );
  }
}
