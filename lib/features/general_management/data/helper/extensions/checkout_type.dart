
enum CheckoutType {
  ad, wallet,online
}

extension CheckoutTypeInfo on CheckoutType  {

  String get checkoutTypeKey {
    switch(this){
      case CheckoutType.ad:
        return "ad";
      case CheckoutType.wallet:
        return "recharge_wallet";
      case CheckoutType.online:
        return "online_cons";
    }
  }



}