import 'package:breeze_forecast/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

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
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          CurrentWeatherTab(),
          HourlyForecastTab(),
          DailyForecastTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.today,
            ),
            label: 'Current',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_empty),
            label: 'Hourly',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Daily',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CurrentWeatherTab extends StatelessWidget {
  const CurrentWeatherTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Current Weather'));
  }
}

class HourlyForecastTab extends StatelessWidget {
  const HourlyForecastTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Hourly Forecast'));
  }
}

class DailyForecastTab extends StatelessWidget {
  const DailyForecastTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Daily Forecast'));
  }
}
