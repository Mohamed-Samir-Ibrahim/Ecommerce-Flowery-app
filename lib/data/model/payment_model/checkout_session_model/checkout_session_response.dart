import 'package:json_annotation/json_annotation.dart';

part 'checkout_session_response.g.dart';

@JsonSerializable()
class CheckoutSessionResponse {
  String ?message;
  SessionBean? session;

  CheckoutSessionResponse({this.message, this.session});

  factory CheckoutSessionResponse.fromJson(Map<String, dynamic> json) => _$CheckoutSessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutSessionResponseToJson(this);
}

@JsonSerializable()
class SessionBean {
  String ?id;
  String ?object;
  Adaptive_pricingBean? adaptive_pricing;
  dynamic after_expiration;
  dynamic allow_promotion_codes;
  num? amount_subtotal;
  num? amount_total;
  Automatic_taxBean? automatic_tax;
  dynamic billing_address_collection;
  String ?cancel_url;
  String ?client_reference_id;
  dynamic client_secret;
  Collected_informationBean? collected_information;
  dynamic consent;
  dynamic consent_collection;
  num ?created;
  String? currency;
  dynamic currency_conversion;
  dynamic custom_fields;
  Custom_textBean? custom_text;
  dynamic customer;
  String ?customer_creation;
  Customer_detailsBean ?customer_details;
  String? customer_email;
  dynamic discounts;
  num ?expires_at;
  dynamic invoice;
  Invoice_creationBean? invoice_creation;
  bool ?livemode;
  dynamic locale;
  MetadataBean? metadata;
  String ?mode;
  dynamic payment_intent;
  dynamic payment_link;
  String ?payment_method_collection;
  Payment_method_configuration_detailsBean? payment_method_configuration_details;
  Payment_method_optionsBean? payment_method_options;
  List<String>? payment_method_types;
  String ?payment_status;
  dynamic permissions;
  Phone_number_collectionBean ?phone_number_collection;
  dynamic recovered_from;
  dynamic saved_payment_method_options;
  dynamic setup_intent;
  dynamic shipping_address_collection;
  dynamic shipping_cost;
  dynamic shipping_details;
  dynamic shipping_options;
  String ?status;
  dynamic submit_type;
  dynamic subscription;
  String ?success_url;
  Total_detailsBean? total_details;
  String ?ui_mode;
  String ?url;
  dynamic wallet_options;

  SessionBean({this.id, this.object, this.adaptive_pricing, this.after_expiration, this.allow_promotion_codes, this.amount_subtotal, this.amount_total, this.automatic_tax, this.billing_address_collection, this.cancel_url, this.client_reference_id, this.client_secret, this.collected_information, this.consent, this.consent_collection, this.created, this.currency, this.currency_conversion, this.custom_fields, this.custom_text, this.customer, this.customer_creation, this.customer_details, this.customer_email, this.discounts, this.expires_at, this.invoice, this.invoice_creation, this.livemode, this.locale, this.metadata, this.mode, this.payment_intent, this.payment_link, this.payment_method_collection, this.payment_method_configuration_details, this.payment_method_options, this.payment_method_types, this.payment_status, this.permissions, this.phone_number_collection, this.recovered_from, this.saved_payment_method_options, this.setup_intent, this.shipping_address_collection, this.shipping_cost, this.shipping_details, this.shipping_options, this.status, this.submit_type, this.subscription, this.success_url, this.total_details, this.ui_mode, this.url, this.wallet_options});

  factory SessionBean.fromJson(Map<String, dynamic> json) => _$SessionBeanFromJson(json);

  Map<String, dynamic> toJson() => _$SessionBeanToJson(this);
}

@JsonSerializable()
class Total_detailsBean {
  num ?amount_discount;
  num ?amount_shipping;
  num ?amount_tax;

  Total_detailsBean({this.amount_discount, this.amount_shipping, this.amount_tax});

  factory Total_detailsBean.fromJson(Map<String, dynamic> json) => _$Total_detailsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Total_detailsBeanToJson(this);
}

@JsonSerializable()
class Phone_number_collectionBean {
  bool ?enabled;

  Phone_number_collectionBean({this.enabled});

  factory Phone_number_collectionBean.fromJson(Map<String, dynamic> json) => _$Phone_number_collectionBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Phone_number_collectionBeanToJson(this);
}

@JsonSerializable()
class Payment_method_optionsBean {
  CardBean ?card;

  Payment_method_optionsBean({this.card});

  factory Payment_method_optionsBean.fromJson(Map<String, dynamic> json) => _$Payment_method_optionsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Payment_method_optionsBeanToJson(this);
}

@JsonSerializable()
class CardBean {
  String? request_three_d_secure;

  CardBean({this.request_three_d_secure});

  factory CardBean.fromJson(Map<String, dynamic> json) => _$CardBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CardBeanToJson(this);
}

@JsonSerializable()
class Payment_method_configuration_detailsBean {
  String? id;
  dynamic parent;

  Payment_method_configuration_detailsBean({this.id, this.parent});

  factory Payment_method_configuration_detailsBean.fromJson(Map<String, dynamic> json) => _$Payment_method_configuration_detailsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Payment_method_configuration_detailsBeanToJson(this);
}

@JsonSerializable()
class MetadataBean {
  String ?city;
  String ?lat;
  String ?long;
  String ?phone;
  String ?street;

  MetadataBean({this.city, this.lat, this.long, this.phone, this.street});

  factory MetadataBean.fromJson(Map<String, dynamic> json) => _$MetadataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataBeanToJson(this);
}

@JsonSerializable()
class Invoice_creationBean {
  bool? enabled;
  Invoice_dataBean? invoice_data;

  Invoice_creationBean({this.enabled, this.invoice_data});

  factory Invoice_creationBean.fromJson(Map<String, dynamic> json) => _$Invoice_creationBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Invoice_creationBeanToJson(this);
}

@JsonSerializable()
class Invoice_dataBean {
  dynamic account_tax_ids;
  dynamic custom_fields;
  dynamic description;
  dynamic footer;
  dynamic issuer;
  dynamic metadata;
  dynamic rendering_options;

  Invoice_dataBean({this.account_tax_ids, this.custom_fields, this.description, this.footer, this.issuer, this.metadata, this.rendering_options});

  factory Invoice_dataBean.fromJson(Map<String, dynamic> json) => _$Invoice_dataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Invoice_dataBeanToJson(this);
}

@JsonSerializable()
class Customer_detailsBean {
  dynamic address;
  String?email;
  dynamic name;
  dynamic phone;
  String ?tax_exempt;
  dynamic tax_ids;

  Customer_detailsBean({this.address, this.email, this.name, this.phone, this.tax_exempt, this.tax_ids});

  factory Customer_detailsBean.fromJson(Map<String, dynamic> json) => _$Customer_detailsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Customer_detailsBeanToJson(this);
}

@JsonSerializable()
class Custom_textBean {
  dynamic after_submit;
  dynamic shipping_address;
  dynamic submit;
  dynamic terms_of_service_acceptance;

  Custom_textBean({this.after_submit, this.shipping_address, this.submit, this.terms_of_service_acceptance});

  factory Custom_textBean.fromJson(Map<String, dynamic> json) => _$Custom_textBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Custom_textBeanToJson(this);
}

@JsonSerializable()
class Collected_informationBean {
  dynamic shipping_details;

  Collected_informationBean({this.shipping_details});

  factory Collected_informationBean.fromJson(Map<String, dynamic> json) => _$Collected_informationBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Collected_informationBeanToJson(this);
}

@JsonSerializable()
class Automatic_taxBean {
  bool ?enabled;
  dynamic liability;
  dynamic provider;
  dynamic status;

  Automatic_taxBean({this.enabled, this.liability, this.provider, this.status});

  factory Automatic_taxBean.fromJson(Map<String, dynamic> json) => _$Automatic_taxBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Automatic_taxBeanToJson(this);
}

@JsonSerializable()
class Adaptive_pricingBean {
  bool ?enabled;

  Adaptive_pricingBean({this.enabled});

  factory Adaptive_pricingBean.fromJson(Map<String, dynamic> json) => _$Adaptive_pricingBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Adaptive_pricingBeanToJson(this);
}

