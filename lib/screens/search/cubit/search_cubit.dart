import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallpaper/screens/search/cubit/search_wallpaper_state.dart';
import '../../../data/repository/wallpaper_repository.dart';
import '../../../models/trending_wallpaper_model.dart';


class SearchCubit extends Cubit<SearchWallpaperState>{
  WallpaperRepository wallpaperRepository;
  SearchCubit({required this.wallpaperRepository}) : super(SearchInitialState());

  void getSearchWallpapers({required String query,String color = "", int page = 1}) async{

    emit(SearchLoadingState());

    try{
      var rawData = await wallpaperRepository.getSearchWallpapers(query,mColor: color,mPage: page);
      WallpaperDataModel wallpaperDataModel = WallpaperDataModel.fromJson(rawData);
        emit(SearchLoadedState(listPhotos: wallpaperDataModel.photos!,totalWallpapers: wallpaperDataModel.totalResults!));

     }catch(e){
      emit(SearchErrorState(errMsg: e.toString()));
    }
  }

}