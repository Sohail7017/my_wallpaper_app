import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/data/repository/wallpaper_repository.dart';
import 'package:wallpaper/screens/home/cubit/wallpaper_state.dart';

import '../../../models/trending_wallpaper_model.dart';

class WallpaperCubit extends Cubit<WallpaperState>{
  WallpaperRepository wallpaperRepository;
  WallpaperCubit({required this.wallpaperRepository}) : super(WallpaperInitialState());

  void getTrendingWallpapers() async{
    emit(WallpaperLoadingState());

    try{
        var data = await wallpaperRepository.getTrendingWallpapers();
        var wallpaperModel =  WallpaperDataModel.fromJson(data);
        emit(WallpaperLoadedState(listPhotos: wallpaperModel.photos!));
    }catch(e){
      emit(WallpaperErrorState(errMsg: e.toString()));
    }
  }

}