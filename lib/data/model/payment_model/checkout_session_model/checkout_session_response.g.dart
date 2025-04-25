// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutSessionResponse _$CheckoutSessionResponseFromJson(
  Map<String, dynamic> json,
) => CheckoutSessionResponse(
  message: json['message'] as String?,
  session:
      json['session'] == null
          ? null
          : SessionBean.fromJson(json['session'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CheckoutSessionResponseToJson(
  CheckoutSessionResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'session': instance.session,
};

SessionBean _$SessionBeanFromJson(Map<String, dynamic> json) => SessionBean(
  id: json['id'] as String?,
  object: json['object'] as String?,
  adaptive_pricing:
      json['adaptive_pricing'] == null
          ? null
          : Adaptive_pricingBean.fromJson(
            json['adaptive_pricing'] as Map<String, dynamic>,
          ),
  after_expiration: json['after_expiration'],
  allow_promotion_codes: json['allow_promotion_codes'],
  amount_subtotal: json['amount_subtotal'] as num?,
  amount_total: json['amount_total'] as num?,
  automatic_tax:
      json['automatic_tax'] == null
          ? null
          : Automatic_taxBean.fromJson(
            json['automatic_tax'] as Map<String, dynamic>,
          ),
  billing_address_collection: json['billing_address_collection'],
  cancel_url: json['cancel_url'] as String?,
  client_reference_id: json['client_reference_id'] as String?,
  client_secret: json['client_secret'],
  collected_information:
      json['collected_information'] == null
          ? null
          : Collected_informationBean.fromJson(
            json['collected_information'] as Map<String, dynamic>,
          ),
  consent: json['consent'],
  consent_collection: json['consent_collection'],
  created: json['created'] as num?,
  currency: json['currency'] as String?,
  currency_conversion: json['currency_conversion'],
  custom_fields: json['custom_fields'],
  custom_text:
      json['custom_text'] == null
          ? null
          : Custom_textBean.fromJson(
            json['custom_text'] as Map<String, dynamic>,
          ),
  customer: json['customer'],
  customer_creation: json['customer_creation'] as String?,
  customer_details:
      json['customer_details'] == null
          ? null
          : Customer_detailsBean.fromJson(
            json['customer_details'] as Map<String, dynamic>,
          ),
  customer_email: json['customer_email'] as String?,
  discounts: json['discounts'],
  expires_at: json['expires_at'] as num?,
  invoice: json['invoice'],
  invoice_creation:
      json['invoice_creation'] == null
          ? null
          : Invoice_creationBean.fromJson(
            json['invoice_creation'] as Map<String, dynamic>,
          ),
  livemode: json['livemode'] as bool?,
  locale: json['locale'],
  metadata:
      json['metadata'] == null
          ? null
          : MetadataBean.fromJson(json['metadata'] as Map<String, dynamic>),
  mode: json['mode'] as String?,
  payment_intent: json['payment_intent'],
  payment_link: json['payment_link'],
  payment_method_collection: json['payment_method_collection'] as String?,
  payment_method_configuration_details:
      json['payment_method_configuration_details'] == null
          ? null
          : Payment_method_configuration_detailsBean.fromJson(
            json['payment_method_configuration_details']
                as Map<String, dynamic>,
          ),
  payment_method_options:
      json['payment_method_options'] == null
          ? null
          : Payment_method_optionsBean.fromJson(
            json['payment_method_options'] as Map<String, dynamic>,
          ),
  payment_method_types:
      (json['payment_method_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  payment_status: json['payment_status'] as String?,
  permissions: json['permissions'],
  phone_number_collection:
      json['phone_number_collection'] == null
          ? null
          : Phone_number_collectionBean.fromJson(
            json['phone_number_collection'] as Map<String, dynamic>,
          ),
  recovered_from: json['recovered_from'],
  saved_payment_method_options: json['saved_payment_method_options'],
  setup_intent: json['setup_intent'],
  shipping_address_collection: json['shipping_address_collection'],
  shipping_cost: json['shipping_cost'],
  shipping_details: json['shipping_details'],
  shipping_options: json['shipping_options'],
  status: json['status'] as String?,
  submit_type: json['submit_type'],
  subscription: json['subscription'],
  success_url: json['success_url'] as String?,
  total_details:
      json['total_details'] == null
          ? null
          : Total_detailsBean.fromJson(
            json['total_details'] as Map<String, dynamic>,
          ),
  ui_mode: json['ui_mode'] as String?,
  url: json['url'] as String?,
  wallet_options: json['wallet_options'],
);

Map<String, dynamic> _$SessionBeanToJson(SessionBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'adaptive_pricing': instance.adaptive_pricing,
      'after_expiration': instance.after_expiration,
      'allow_promotion_codes': instance.allow_promotion_codes,
      'amount_subtotal': instance.amount_subtotal,
      'amount_total': instance.amount_total,
      'automatic_tax': instance.automatic_tax,
      'billing_address_collection': instance.billing_address_collection,
      'cancel_url': instance.cancel_url,
      'client_reference_id': instance.client_reference_id,
      'client_secret': instance.client_secret,
      'collected_information': instance.collected_information,
      'consent': instance.consent,
      'consent_collection': instance.consent_collection,
      'created': instance.created,
      'currency': instance.currency,
      'currency_conversion': instance.currency_conversion,
      'custom_fields': instance.custom_fields,
      'custom_text': instance.custom_text,
      'customer': instance.customer,
      'customer_creation': instance.customer_creation,
      'customer_details': instance.customer_details,
      'customer_email': instance.customer_email,
      'discounts': instance.discounts,
      'expires_at': instance.expires_at,
      'invoice': instance.invoice,
      'invoice_creation': instance.invoice_creation,
      'livemode': instance.livemode,
      'locale': instance.locale,
      'metadata': instance.metadata,
      'mode': instance.mode,
      'payment_intent': instance.payment_intent,
      'payment_link': instance.payment_link,
      'payment_method_collection': instance.payment_method_collection,
      'payment_method_configuration_details':
          instance.payment_method_configuration_details,
      'payment_method_options': instance.payment_method_options,
      'payment_method_types': instance.payment_method_types,
      'payment_status': instance.payment_status,
      'permissions': instance.permissions,
      'phone_number_collection': instance.phone_number_collection,
      'recovered_from': instance.recovered_from,
      'saved_payment_method_options': instance.saved_payment_method_options,
      'setup_intent': instance.setup_intent,
      'shipping_address_collection': instance.shipping_address_collection,
      'shipping_cost': instance.shipping_cost,
      'shipping_details': instance.shipping_details,
      'shipping_options': instance.shipping_options,
      'status': instance.status,
      'submit_type': instance.submit_type,
      'subscription': instance.subscription,
      'success_url': instance.success_url,
      'total_details': instance.total_details,
      'ui_mode': instance.ui_mode,
      'url': instance.url,
      'wallet_options': instance.wallet_options,
    };

Total_detailsBean _$Total_detailsBeanFromJson(Map<String, dynamic> json) =>
    Total_detailsBean(
      amount_discount: json['amount_discount'] as num?,
      amount_shipping: json['amount_shipping'] as num?,
      amount_tax: json['amount_tax'] as num?,
    );

Map<String, dynamic> _$Total_detailsBeanToJson(Total_detailsBean instance) =>
    <String, dynamic>{
      'amount_discount': instance.amount_discount,
      'amount_shipping': instance.amount_shipping,
      'amount_tax': instance.amount_tax,
    };

Phone_number_collectionBean _$Phone_number_collectionBeanFromJson(
  Map<String, dynamic> json,
) => Phone_number_collectionBean(enabled: json['enabled'] as bool?);

Map<String, dynamic> _$Phone_number_collectionBeanToJson(
  Phone_number_collectionBean instance,
) => <String, dynamic>{'enabled': instance.enabled};

Payment_method_optionsBean _$Payment_method_optionsBeanFromJson(
  Map<String, dynamic> json,
) => Payment_method_optionsBean(
  card:
      json['card'] == null
          ? null
          : CardBean.fromJson(json['card'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Payment_method_optionsBeanToJson(
  Payment_method_optionsBean instance,
) => <String, dynamic>{'card': instance.card};

CardBean _$CardBeanFromJson(Map<String, dynamic> json) =>
    CardBean(request_three_d_secure: json['request_three_d_secure'] as String?);

Map<String, dynamic> _$CardBeanToJson(CardBean instance) => <String, dynamic>{
  'request_three_d_secure': instance.request_three_d_secure,
};

Payment_method_configuration_detailsBean
_$Payment_method_configuration_detailsBeanFromJson(Map<String, dynamic> json) =>
    Payment_method_configuration_detailsBean(
      id: json['id'] as String?,
      parent: json['parent'],
    );

Map<String, dynamic> _$Payment_method_configuration_detailsBeanToJson(
  Payment_method_configuration_detailsBean instance,
) => <String, dynamic>{'id': instance.id, 'parent': instance.parent};

MetadataBean _$MetadataBeanFromJson(Map<String, dynamic> json) => MetadataBean(
  city: json['city'] as String?,
  lat: json['lat'] as String?,
  long: json['long'] as String?,
  phone: json['phone'] as String?,
  street: json['street'] as String?,
);

Map<String, dynamic> _$MetadataBeanToJson(MetadataBean instance) =>
    <String, dynamic>{
      'city': instance.city,
      'lat': instance.lat,
      'long': instance.long,
      'phone': instance.phone,
      'street': instance.street,
    };

Invoice_creationBean _$Invoice_creationBeanFromJson(
  Map<String, dynamic> json,
) => Invoice_creationBean(
  enabled: json['enabled'] as bool?,
  invoice_data:
      json['invoice_data'] == null
          ? null
          : Invoice_dataBean.fromJson(
            json['invoice_data'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$Invoice_creationBeanToJson(
  Invoice_creationBean instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'invoice_data': instance.invoice_data,
};

Invoice_dataBean _$Invoice_dataBeanFromJson(Map<String, dynamic> json) =>
    Invoice_dataBean(
      account_tax_ids: json['account_tax_ids'],
      custom_fields: json['custom_fields'],
      description: json['description'],
      footer: json['footer'],
      issuer: json['issuer'],
      metadata: json['metadata'],
      rendering_options: json['rendering_options'],
    );

Map<String, dynamic> _$Invoice_dataBeanToJson(Invoice_dataBean instance) =>
    <String, dynamic>{
      'account_tax_ids': instance.account_tax_ids,
      'custom_fields': instance.custom_fields,
      'description': instance.description,
      'footer': instance.footer,
      'issuer': instance.issuer,
      'metadata': instance.metadata,
      'rendering_options': instance.rendering_options,
    };

Customer_detailsBean _$Customer_detailsBeanFromJson(
  Map<String, dynamic> json,
) => Customer_detailsBean(
  address: json['address'],
  email: json['email'] as String?,
  name: json['name'],
  phone: json['phone'],
  tax_exempt: json['tax_exempt'] as String?,
  tax_ids: json['tax_ids'],
);

Map<String, dynamic> _$Customer_detailsBeanToJson(
  Customer_detailsBean instance,
) => <String, dynamic>{
  'address': instance.address,
  'email': instance.email,
  'name': instance.name,
  'phone': instance.phone,
  'tax_exempt': instance.tax_exempt,
  'tax_ids': instance.tax_ids,
};

Custom_textBean _$Custom_textBeanFromJson(Map<String, dynamic> json) =>
    Custom_textBean(
      after_submit: json['after_submit'],
      shipping_address: json['shipping_address'],
      submit: json['submit'],
      terms_of_service_acceptance: json['terms_of_service_acceptance'],
    );

Map<String, dynamic> _$Custom_textBeanToJson(Custom_textBean instance) =>
    <String, dynamic>{
      'after_submit': instance.after_submit,
      'shipping_address': instance.shipping_address,
      'submit': instance.submit,
      'terms_of_service_acceptance': instance.terms_of_service_acceptance,
    };

Collected_informationBean _$Collected_informationBeanFromJson(
  Map<String, dynamic> json,
) => Collected_informationBean(shipping_details: json['shipping_details']);

Map<String, dynamic> _$Collected_informationBeanToJson(
  Collected_informationBean instance,
) => <String, dynamic>{'shipping_details': instance.shipping_details};

Automatic_taxBean _$Automatic_taxBeanFromJson(Map<String, dynamic> json) =>
    Automatic_taxBean(
      enabled: json['enabled'] as bool?,
      liability: json['liability'],
      provider: json['provider'],
      status: json['status'],
    );

Map<String, dynamic> _$Automatic_taxBeanToJson(Automatic_taxBean instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'liability': instance.liability,
      'provider': instance.provider,
      'status': instance.status,
    };

Adaptive_pricingBean _$Adaptive_pricingBeanFromJson(
  Map<String, dynamic> json,
) => Adaptive_pricingBean(enabled: json['enabled'] as bool?);

Map<String, dynamic> _$Adaptive_pricingBeanToJson(
  Adaptive_pricingBean instance,
) => <String, dynamic>{'enabled': instance.enabled};
