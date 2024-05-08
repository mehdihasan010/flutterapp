import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce/src/data/repository/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  ProductRepository repository = ProductRepository();

  Future<void> startSplash() async {
    await repository.createProduct();
    Future.delayed(const Duration(seconds: 3), () {
      emit(SplashEnd());
    });
  }
}
