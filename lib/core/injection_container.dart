import 'package:fantasy_store/features/base/presentation/view_models/storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/base/data/entities/base_state.dart';
import '../features/base/presentation/view_models/network_view_model.dart';
import '../features/general_management/data/data_sources/general_remote_data_source.dart';
import '../features/general_management/data/repositories/general_repository.dart';
import '../features/general_management/presentation/extensions/bottom_navigation_item_type.dart';
import '../features/general_management/presentation/view_models/settings_view_model.dart';
import '../features/store_management/data/entities/home_store_state.dart';
import '../features/store_management/presentation/view_models/home_view_model.dart';
import 'api/default_api_methods_impl.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final isConnectedProvider =
    StateNotifierProvider<NetworkViewModel, bool>((ref) {
  return NetworkViewModel();
});

final defaultApiMethodsProvider = Provider<DefaultApiMethodsImpl>((ref) {
  return DefaultApiMethodsImpl();
});
final appStorageProvider = Provider<StorageProvider>((ref) {
  return StorageProvider(ref.read(sharedPreferencesProvider));
});
// final userLocalDataSourceProvider = Provider<UserLocalDataSource>((ref) {
//   return UserLocalDataSource(ref.read(appStorageProvider));
// });
//
// final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
//   return UserRemoteDataSource(
//       defaultApiMethodsImpl: ref.read(defaultApiMethodsProvider));
// });
//
// final userRepositoryProvider = Provider<UserRepository>((ref) {
//   return UserRepository(
//     userRemoteDataSource: ref.read(userRemoteDataSourceProvider),
//     userLocalDataSource: ref.read(userLocalDataSourceProvider),
//   );
// });
// final userProvider = StateNotifierProvider<UserViewModel, UserData?>((ref) {
//   return UserViewModel(
//     ref.read(userRepositoryProvider),
//   );
// });
final generalRemoteDataSourceProvider =
    Provider<GeneralRemoteDataSource>((ref) {
  return GeneralRemoteDataSource(
      defaultApiMethodsImpl: ref.read(defaultApiMethodsProvider));
});
final generalRepositoryProvider = Provider<GeneralRepository>((ref) {
  return GeneralRepository(
      generalRemoteDataSource: ref.read(generalRemoteDataSourceProvider));
});



//
var selectedNavigationItemTypeProvider =
    StateProvider<BottomNavigationItemType>((ref) {
  return BottomNavigationItemType.home;
});

var homeProviderViewModel = StateNotifierProvider<HomeViewModel, BaseState<HomeStoreState>>(
      (ref) {
    return HomeViewModel(ref.read(generalRepositoryProvider));
  },
);

