import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/localization_provider.dart';
import 'package:flutter_base_project/base/providers/theme_provider.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_bloc.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_event.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_state.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_page.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<HomeBloc, HomeEvent, HomeState>(
      listener: _onPageChanged,
      builder: _pageContent,
    );
  }

  Widget _pageContent(BuildContext context, HomeState state) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BaseText(
                text: context.strings.appName,
              ),
              const SizedBox(height: 100.0),
              ElevatedButton(
                onPressed: () {
                  final locale = context.getLocale() == Locale("pt", "BR")
                      ? Locale("en", "US")
                      : Locale("pt", "BR");
                  context.setLocale(locale);
                },
                child: BaseText(text: "Mudar idioma"),
              ),
              SizedBox(height: 100.0),
              ElevatedButton(
                onPressed: context.switchThemeMode,
                child: BaseText(text: "Mudar Tema"),
              ),
              SizedBox(height: 100.0),
              ElevatedButton(
                onPressed: () => context.read<HomeBloc>().add(HomeCountEvent()),
                child: BaseText(text: state.number.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void _onPageChanged(BuildContext context, HomeState state) {}
}
