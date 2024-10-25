import 'package:fastfood/beaconUi/home_page_card.dart';
import 'package:fastfood/blocs/create_cart_bloc.dart';
import 'package:fastfood/blocs/get_cart_item_Bloc/get_cart_item_bloc.dart';
import 'package:fastfood/cart/src/db_repo.dart';
import 'package:fastfood/fast_food_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CreateCartBloc(
                  DbRepo()
              ),
        ),
        BlocProvider(
          create: (context) => GetCartItemBloc(
            DbRepo()
          ),
        ),

      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: FastFoodHome()
      ),
    );

  }
}
