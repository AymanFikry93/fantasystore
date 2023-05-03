class ApiUrls {
  static const webUrl = 'https://livestock.objectsdev.com/'; //dev
  static const baseUrl = 'https://fantasy-store-default-rtdb.firebaseio.com/'; //dev
  static const imageBaseUrl = 'https://livestock.objectsdev.com/wp-json'; //dev



  static const products = '/products.json';











  static const termsAndConditions = '/terms-and-conditions/';//live

  static const refreshToken = '/v1/refresh_token';
  static const login = '/v1/login-by-mobile';
  static const phoneCheck = '/v1/phone-check';
  static const registerCustomer = '/v1/register/customer';
  static const registerVet = '/v1/register/vet';

  static const city = '/v1/city';
  static const region = '/v1/region';

  static const wcProfile = '/v1/users/me';

  static const getAds = '/v1/ads';
  static const getMyAds = '/v1/ads/my-ads';

  static const getAdInfo = '/v1/ads/';
  static const uploadImage = '/wp/v2/media';

  static String updateAdStatus({required String adId}) =>
      "/v1/ads/$adId/change-status-to-sold";

  static String updateCurrentAd({required String adId}) => "/v1/ads/$adId/edit";

  static const addAd = "/v1/ads/add-to-cart";
  static const settings = "/v1/settings";

  static const getVets = '/v1/vets';

  static String getCheckOuUrl(
          {required String checkoutType, required String userToken}) =>
      "mobile-app-checkout-page/?checkout_type=$checkoutType&user_token=$userToken";

  static const visits = '/v1/visits';
  static const onlineConsult = '/v1/online-cons/add-to-cart';
  static const getServices = '/v1/services';
  static String cancelOnlineRequest({required String serviceId}) =>
      "/v1/online-cons/$serviceId/cancel";
  static String autoCancelOnlineRequest({required String serviceId}) =>
      "/v1/online-cons/$serviceId/auto-reject-call";


  static String editVisitRequest({required String visitId}) =>
      "/v1/visits/$visitId/edit";

  static String deleteVisitRequest({required String visitId}) =>
      "/v1/visits/$visitId";

  static const wallet = '/v1/wallet';
  static const rechargeWallet = '/v1/wallet/recharge';
}
