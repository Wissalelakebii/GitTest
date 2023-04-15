import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buvapp/entity/entity.dart';
import 'package:buvapp/repository/foodsdao_repo.dart';

class HomePageCubit extends Cubit<List<Foods>> {
  HomePageCubit() : super(<Foods>[]);

  var foodrepo = FoodsDaoRepository();

  Future<void> getFoods() async {
    var liste = await foodrepo.getAllFoods();
    emit(liste);
  }
}