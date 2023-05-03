// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../base/data/entities/base_api_result.dart';
// import '../../../base/data/entities/base_state.dart';
// import '../../../base/presentation/view_models/base_view_model.dart';
// import '../../data/repositories/general_repository.dart';
//
// class SettingsViewModel extends StateNotifier<BaseState<Settings>>
//     with BaseViewModel {
//   SettingsViewModel(this._generalRepository)
//       : super(BaseState(data: Settings()));
//
//   final GeneralRepository _generalRepository;
//
//   SettingsItems? get settings => state.data.settingsItems;
//
//   Future<BaseApiResult<Settings>> getSettings() async {
//     final result = await _generalRepository.getSettings();
//     if (result.data != null) {
//       state = state.copyWith(data: result.data);
//     }
//     return result;
//   }
//
// /*  Future<SettingsItems?> retryToGetSettings() async {
//     final result = await getSettings();
//     if (result.data != null) {
//       state = state.copyWith(data: result.data);
//       return result.data?.settingsItems;
//     } else {
//       handleError(errorType: result.errorType);
//     }
//     return null;
//   }*/
// }
