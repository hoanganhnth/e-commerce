import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:t_store/features/personalization/controllers/bloc/address_bloc.dart';
import 'package:t_store/routes/app_routes.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/theme/theme.dart';

import 'bindings/general_binding.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddressBloc>(
          create: (context) => AddressBloc(),
        ),
      ],
      child: GetMaterialApp(
        title: TTexts.appName,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        getPages: AppRoutes.pages,
        initialBinding: GeneralBindings(),
        home: const Scaffold(backgroundColor: TColors.primary,body: Center(child: CircularProgressIndicator(color: TColors.white,),),),
      ),
    );
  }
}
