class ApiConstant {
  //Live Base URL

  // static const String baseUrl = "https://api.dipendranath.com.np/api/v1/";

  // Stagging Base URL
  static const String baseUrl =
      "https://api-soori-ims-staging.dipendranath.com.np/api/v1/";

//login
  static const String login = "user-app/login";

//refresh token
  static const String refreshToken = "user-app/login/refresh";

//logout
  static const String logout = "user-app/logout";

//user data
  static const String user = "user-app/users/";

//branch
  static const String branch = "branches";

//customer Order
  static const String customerList = "chalan-app/customer-list?limit=0";
  static const String itemList = "customer-order-app/item-list?limit=0";
  static const String allCustomer =
      "customer-app/customer?limit=0&ordering=-id&search=";
  static const String orderMaster =
      "customer-order-app/order-master?limit=0&ordering=-id&search=";
  static const String orderSummary = "customer-order-app/order-summary/";

  static const String cancelOrder = "customer-order-app/cancel-order/";
  static const String cancelSingleOrder =
      "customer-order-app/cancel-single-order/";
  static const String saveCustomerOrder =
      "customer-order-app/save-customer-order";
  static const String createCustomer = "customer-app/customer";

  //Notification
  static const String notificationCount =
      "notification-app/user-notification/count";
  static const String notificationReceive =
      "notification-app/user-notification/receive";

  static const String allNotification =
      "notification-app/user-notification?limit=0&ordering=-created_date_ad";

//Stock Analysis
  static const String stockListLocation =
      "warehouse-location-app/location-items?limit=0&ordering=-id&search=";
  static const String stockListBatch =
      "stock-analysis-app/stock-by-batch?limit=0&ordering=-id&search=";
  static const String stockList =
      "stock-analysis-app/stock-analysis?limit=0&ordering=-id&search=";

//Party Payment
  static const String partyPaymentSupplier =
      "party-payment-app/supplier-list?limit=0";

  static const String partyPayment =
      "party-payment-app/party-payment?limit=0&ordering=-id";

  static const String getPartyInvoice =
      "party-payment-app/get-party-invoice?&limit=0&supplier=";

  static const String clearPartyInvoice =
      "party-payment-app/clear-party-invoice";

//Credit Clearance
  static const String allCreditClearance =
      "credit-management-app/credit-clearance?limit=0&ordering=-id&search=";
  static const String getCreditInvoice =
      "credit-management-app/get-credit-invoice?limit=0&customer=";

  static const String creditCustomer =
      "credit-management-app/customer-list?&limit=0";

  static const String paymentMethod = "credit-management-app/payment-mode-list";

  static const String clearCreditInvoice =
      "credit-management-app/clear-credit-invoice";

  static const String postPaymentMode = 'core-app/payment-mode';
}
