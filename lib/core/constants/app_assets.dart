enum AppAssets {
  successAction,
  wifiIc,
  placeholder,
  noData,
  splash,
  background,
  logo,
  registerLogo,
  cow,
  bgCurve,
  userFrame,
  orangeCow,
  orangeFood,
  orangeExcavator,
  orangeInjection,
  storeLine,
  sheep,
  cows,
  camel,
  buffalo,
  selectedSheep,
  selectedCows,
  selectedCamel,
  selectedBuffalo,
  onlineVisit,
  homeVisit,
  doctorPlaceholder,
  uploadImage,
  addUser,
  success,
  wait,
  cowsPattern,
  visaIc,
  walletIc,
  storeLineWhite,
  star,
}

extension AppAssetsData on AppAssets {
  static const String _baseAssetPath = 'assets/images/';

  String get imagePath {
    switch (this) {
      case AppAssets.doctorPlaceholder:
        return "${_baseAssetPath}doctor_placeholder.png";
      case AppAssets.successAction:
        return "${_baseAssetPath}success.png";
      case AppAssets.wifiIc:
        return "${_baseAssetPath}no_network.png";
      case AppAssets.noData:
        return "${_baseAssetPath}no_data.png";
      case AppAssets.registerLogo:
        return "${_baseAssetPath}logoc.png";
      case AppAssets.placeholder:
        return "${_baseAssetPath}logo_loading.png";
      case AppAssets.splash:
        return "${_baseAssetPath}splash.png";
      case AppAssets.background:
        return "${_baseAssetPath}background.png";
      case AppAssets.logo:
        return "${_baseAssetPath}logo.png";
      case AppAssets.cow:
        return "${_baseAssetPath}cow.png";
      case AppAssets.bgCurve:
        return "${_baseAssetPath}bg_curve.png";
      case AppAssets.userFrame:
        return "${_baseAssetPath}frame.png";
      case AppAssets.orangeCow:
        return "${_baseAssetPath}orange_cow.png";
      case AppAssets.orangeFood:
        return "${_baseAssetPath}orange_food.png";
      case AppAssets.orangeExcavator:
        return "${_baseAssetPath}orange_excavator.png";
      case AppAssets.orangeInjection:
        return "${_baseAssetPath}orange_injection.png";
      case AppAssets.storeLine:
        return "${_baseAssetPath}store_line.png";
      case AppAssets.cows:
        return "${_baseAssetPath}cows.png";
      case AppAssets.sheep:
        return "${_baseAssetPath}sheep.png";
      case AppAssets.camel:
        return "${_baseAssetPath}camel.png";
      case AppAssets.buffalo:
        return "${_baseAssetPath}buffalo.png";
      case AppAssets.selectedCows:
        return "${_baseAssetPath}selected_cows.png";
      case AppAssets.selectedSheep:
        return "${_baseAssetPath}selected_sheep.png";
      case AppAssets.selectedCamel:
        return "${_baseAssetPath}selected_camel.png";
      case AppAssets.selectedBuffalo:
        return "${_baseAssetPath}selected_buffalo.png";
      case AppAssets.homeVisit:
        return "${_baseAssetPath}home_visit.png";
      case AppAssets.onlineVisit:
        return "${_baseAssetPath}online_visit.png";
      case AppAssets.uploadImage:
        return "${_baseAssetPath}upload_image.png";
      case AppAssets.addUser:
        return "${_baseAssetPath}add_user.png";
      case AppAssets.success:
        return "${_baseAssetPath}success.png";
      case AppAssets.wait:
        return "${_baseAssetPath}wait.png";
      case AppAssets.cowsPattern:
        return "${_baseAssetPath}pattern.png";
      case AppAssets.visaIc:
        return "${_baseAssetPath}visa_ic.png";
      case AppAssets.walletIc:
        return "${_baseAssetPath}wallet_ic.png";
      case AppAssets.storeLineWhite:
        return "${_baseAssetPath}store_line_white.png";
      case AppAssets.star:
        return "${_baseAssetPath}star.png";
      default:
        return "";
    }
  }
}
