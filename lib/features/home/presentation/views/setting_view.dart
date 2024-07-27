import 'package:breeze_forecast/core/theme/language_manager.dart';
import 'package:breeze_forecast/core/theme/theme_manager.dart';
import 'package:breeze_forecast/features/home/presentation/views/widgets/settings_view_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          S.of(context).settings,
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SettingViewBody(
            themeProvider: themeProvider, languageProvider: languageProvider),
      ),
    );
  }
}
