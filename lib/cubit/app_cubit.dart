import 'package:bloc/bloc.dart';
import 'package:vacation_tour_app/cubit/app_cubit_state.dart';
import 'package:vacation_tour_app/model/data_model.dart';
import 'package:vacation_tour_app/navpages/detail_page.dart';
import 'package:vacation_tour_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) : super(InitiaState()){
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData()async{
    try{
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    }catch(e){
      print(e);
    }
  }
  detailPage(DataModel data){
    emit(DetailState(data));
  }
  goHome(){
    emit(LoadedState(places));
  }

}