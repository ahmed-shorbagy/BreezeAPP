import 'dart:developer';

import 'package:breeze_forecast/features/home/presentation/managers/current_weather_cubit/current_weather_cubit.dart';
import 'package:breeze_forecast/features/home/presentation/views/widgets/current_weather_tab.dart';
import 'package:breeze_forecast/features/home/presentation/views/widgets/daily_forecast_tab.dart';
import 'package:breeze_forecast/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:breeze_forecast/features/home/presentation/views/widgets/hourly_forecast_tab.dart';
import 'package:breeze_forecast/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: HomeAppBar()),
      body: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
        builder: (context, state) {
          log('Current state: $state');
          if (state is CurrentWeatherLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          } else if (state is CurrentWeatherSuccess) {
            log("${state.currentWeatherModel.current?.apparentTemperature ?? ""} °");
            return PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [
                CurrentWeatherTab(
                  currentWeatherModel: state.currentWeatherModel,
                ),
                const HourlyForecastTab(),
                const DailyForecastTab(),
              ],
            );
          } else if (state is CurrentWeatherError) {
            return Center(child: Text(state.errMessage));
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.today,
            ),
            label: S.of(context).currentweather,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.hourglass_empty),
            label: S.of(context).hourly,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_today),
            label: S.of(context).daily,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
