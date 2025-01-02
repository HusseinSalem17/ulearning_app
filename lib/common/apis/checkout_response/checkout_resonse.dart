import 'dart:convert';

CheckoutResponse checkoutResponseFromJson(String str) {
  final jsonData = json.decode(str);
  return CheckoutResponse.fromJson(jsonData);
}

String checkoutResponseToJson(CheckoutResponse data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class CheckoutResponse {
  Data? data;
  String? detail;

  CheckoutResponse({
    this.data,
    this.detail,
  });

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) =>
      CheckoutResponse(
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "detail": detail,
      };
}

class Data {
  String? id;
  String? object;
  AdaptivePricing? adaptivePricing;
  dynamic afterExpiration;
  dynamic allowPromotionCodes;
  int? amountSubtotal;
  int? amountTotal;
  AutomaticTax? automaticTax;
  dynamic billingAddressCollection;
  String? cancelUrl;
  dynamic clientReferenceId;
  dynamic clientSecret;
  dynamic consent;
  dynamic consentCollection;
  int? created;
  String? currency;
  dynamic currencyConversion;
  List<dynamic>? customFields;
  CustomText? customText;
  dynamic customer;
  String? customerCreation;
  dynamic customerDetails;
  dynamic customerEmail;
  int? expiresAt;
  dynamic invoice;
  InvoiceCreation? invoiceCreation;
  bool? livemode;
  dynamic locale;
  Metadata? metadata;
  String? mode;
  dynamic paymentIntent;
  dynamic paymentLink;
  String? paymentMethodCollection;
  dynamic paymentMethodConfigurationDetails;
  PaymentMethodOptions? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  String? paymentStatus;
  AdaptivePricing? phoneNumberCollection;
  dynamic recoveredFrom;
  dynamic savedPaymentMethodOptions;
  dynamic setupIntent;
  dynamic shippingAddressCollection;
  dynamic shippingCost;
  dynamic shippingDetails;
  List<dynamic>? shippingOptions;
  String? status;
  dynamic submitType;
  dynamic subscription;
  String? successUrl;
  TotalDetails? totalDetails;
  String? uiMode;
  String? url;

  Data({
    this.id,
    this.object,
    this.adaptivePricing,
    this.afterExpiration,
    this.allowPromotionCodes,
    this.amountSubtotal,
    this.amountTotal,
    this.automaticTax,
    this.billingAddressCollection,
    this.cancelUrl,
    this.clientReferenceId,
    this.clientSecret,
    this.consent,
    this.consentCollection,
    this.created,
    this.currency,
    this.currencyConversion,
    this.customFields,
    this.customText,
    this.customer,
    this.customerCreation,
    this.customerDetails,
    this.customerEmail,
    this.expiresAt,
    this.invoice,
    this.invoiceCreation,
    this.livemode,
    this.locale,
    this.metadata,
    this.mode,
    this.paymentIntent,
    this.paymentLink,
    this.paymentMethodCollection,
    this.paymentMethodConfigurationDetails,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.paymentStatus,
    this.phoneNumberCollection,
    this.recoveredFrom,
    this.savedPaymentMethodOptions,
    this.setupIntent,
    this.shippingAddressCollection,
    this.shippingCost,
    this.shippingDetails,
    this.shippingOptions,
    this.status,
    this.submitType,
    this.subscription,
    this.successUrl,
    this.totalDetails,
    this.uiMode,
    this.url,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        object: json["object"],
        adaptivePricing: json["adaptive_pricing"] != null
            ? AdaptivePricing.fromJson(json["adaptive_pricing"])
            : null,
        afterExpiration: json["after_expiration"],
        allowPromotionCodes: json["allow_promotion_codes"],
        amountSubtotal: json["amount_subtotal"],
        amountTotal: json["amount_total"],
        automaticTax: json["automatic_tax"] != null
            ? AutomaticTax.fromJson(json["automatic_tax"])
            : null,
        billingAddressCollection: json["billing_address_collection"],
        cancelUrl: json["cancel_url"],
        clientReferenceId: json["client_reference_id"],
        clientSecret: json["client_secret"],
        consent: json["consent"],
        consentCollection: json["consent_collection"],
        created: json["created"],
        currency: json["currency"],
        currencyConversion: json["currency_conversion"],
        customFields: json["custom_fields"] != null
            ? List<dynamic>.from(json["custom_fields"].map((x) => x))
            : null,
        customText: json["custom_text"] != null
            ? CustomText.fromJson(json["custom_text"])
            : null,
        customer: json["customer"],
        customerCreation: json["customer_creation"],
        customerDetails: json["customer_details"],
        customerEmail: json["customer_email"],
        expiresAt: json["expires_at"],
        invoice: json["invoice"],
        invoiceCreation: json["invoice_creation"] != null
            ? InvoiceCreation.fromJson(json["invoice_creation"])
            : null,
        livemode: json["livemode"],
        locale: json["locale"],
        metadata: json["metadata"] != null
            ? Metadata.fromJson(json["metadata"])
            : null,
        mode: json["mode"],
        paymentIntent: json["payment_intent"],
        paymentLink: json["payment_link"],
        paymentMethodCollection: json["payment_method_collection"],
        paymentMethodConfigurationDetails:
            json["payment_method_configuration_details"],
        paymentMethodOptions: json["payment_method_options"] != null
            ? PaymentMethodOptions.fromJson(json["payment_method_options"])
            : null,
        paymentMethodTypes: json["payment_method_types"] != null
            ? List<String>.from(json["payment_method_types"].map((x) => x))
            : null,
        paymentStatus: json["payment_status"],
        phoneNumberCollection: json["phone_number_collection"] != null
            ? AdaptivePricing.fromJson(json["phone_number_collection"])
            : null,
        recoveredFrom: json["recovered_from"],
        savedPaymentMethodOptions: json["saved_payment_method_options"],
        setupIntent: json["setup_intent"],
        shippingAddressCollection: json["shipping_address_collection"],
        shippingCost: json["shipping_cost"],
        shippingDetails: json["shipping_details"],
        shippingOptions: json["shipping_options"] != null
            ? List<dynamic>.from(json["shipping_options"].map((x) => x))
            : null,
        status: json["status"],
        submitType: json["submit_type"],
        subscription: json["subscription"],
        successUrl: json["success_url"],
        totalDetails: json["total_details"] != null
            ? TotalDetails.fromJson(json["total_details"])
            : null,
        uiMode: json["ui_mode"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "adaptive_pricing": adaptivePricing?.toJson(),
        "after_expiration": afterExpiration,
        "allow_promotion_codes": allowPromotionCodes,
        "amount_subtotal": amountSubtotal,
        "amount_total": amountTotal,
        "automatic_tax": automaticTax?.toJson(),
        "billing_address_collection": billingAddressCollection,
        "cancel_url": cancelUrl,
        "client_reference_id": clientReferenceId,
        "client_secret": clientSecret,
        "consent": consent,
        "consent_collection": consentCollection,
        "created": created,
        "currency": currency,
        "currency_conversion": currencyConversion,
        "custom_fields": customFields != null
            ? List<dynamic>.from(customFields!.map((x) => x))
            : null,
        "custom_text": customText?.toJson(),
        "customer": customer,
        "customer_creation": customerCreation,
        "customer_details": customerDetails,
        "customer_email": customerEmail,
        "expires_at": expiresAt,
        "invoice": invoice,
        "invoice_creation": invoiceCreation?.toJson(),
        "livemode": livemode,
        "locale": locale,
        "metadata": metadata?.toJson(),
        "mode": mode,
        "payment_intent": paymentIntent,
        "payment_link": paymentLink,
        "payment_method_collection": paymentMethodCollection,
        "payment_method_configuration_details":
            paymentMethodConfigurationDetails,
        "payment_method_options": paymentMethodOptions?.toJson(),
        "payment_method_types": paymentMethodTypes != null
            ? List<dynamic>.from(paymentMethodTypes!.map((x) => x))
            : null,
        "payment_status": paymentStatus,
        "phone_number_collection": phoneNumberCollection?.toJson(),
        "recovered_from": recoveredFrom,
        "saved_payment_method_options": savedPaymentMethodOptions,
        "setup_intent": setupIntent,
        "shipping_address_collection": shippingAddressCollection,
        "shipping_cost": shippingCost,
        "shipping_details": shippingDetails,
        "shipping_options": shippingOptions != null
            ? List<dynamic>.from(shippingOptions!.map((x) => x))
            : null,
        "status": status,
        "submit_type": submitType,
        "subscription": subscription,
        "success_url": successUrl,
        "total_details": totalDetails?.toJson(),
        "ui_mode": uiMode,
        "url": url,
      };
}

class AdaptivePricing {
  bool? enabled;

  AdaptivePricing({
    this.enabled,
  });

  factory AdaptivePricing.fromJson(Map<String, dynamic> json) =>
      AdaptivePricing(
        enabled: json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "enabled": enabled,
      };
}

class AutomaticTax {
  bool? enabled;
  dynamic liability;
  dynamic status;

  AutomaticTax({
    this.enabled,
    this.liability,
    this.status,
  });

  factory AutomaticTax.fromJson(Map<String, dynamic> json) => AutomaticTax(
        enabled: json["enabled"],
        liability: json["liability"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "enabled": enabled,
        "liability": liability,
        "status": status,
      };
}

class CustomText {
  dynamic afterSubmit;
  dynamic shippingAddress;
  dynamic submit;
  dynamic termsOfServiceAcceptance;

  CustomText({
    this.afterSubmit,
    this.shippingAddress,
    this.submit,
    this.termsOfServiceAcceptance,
  });

  factory CustomText.fromJson(Map<String, dynamic> json) => CustomText(
        afterSubmit: json["after_submit"],
        shippingAddress: json["shipping_address"],
        submit: json["submit"],
        termsOfServiceAcceptance: json["terms_of_service_acceptance"],
      );

  Map<String, dynamic> toJson() => {
        "after_submit": afterSubmit,
        "shipping_address": shippingAddress,
        "submit": submit,
        "terms_of_service_acceptance": termsOfServiceAcceptance,
      };
}

class InvoiceCreation {
  bool? enabled;
  InvoiceData? invoiceData;

  InvoiceCreation({
    this.enabled,
    this.invoiceData,
  });

  factory InvoiceCreation.fromJson(Map<String, dynamic> json) =>
      InvoiceCreation(
        enabled: json["enabled"],
        invoiceData: json["invoice_data"] != null
            ? InvoiceData.fromJson(json["invoice_data"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "enabled": enabled,
        "invoice_data": invoiceData?.toJson(),
      };
}

class InvoiceData {
  dynamic accountTaxIds;
  dynamic customFields;
  dynamic description;
  dynamic footer;
  dynamic issuer;
  Metadata? metadata;
  dynamic renderingOptions;

  InvoiceData({
    this.accountTaxIds,
    this.customFields,
    this.description,
    this.footer,
    this.issuer,
    this.metadata,
    this.renderingOptions,
  });

  factory InvoiceData.fromJson(Map<String, dynamic> json) => InvoiceData(
        accountTaxIds: json["account_tax_ids"],
        customFields: json["custom_fields"],
        description: json["description"],
        footer: json["footer"],
        issuer: json["issuer"],
        metadata: json["metadata"] != null
            ? Metadata.fromJson(json["metadata"])
            : null,
        renderingOptions: json["rendering_options"],
      );

  Map<String, dynamic> toJson() => {
        "account_tax_ids": accountTaxIds,
        "custom_fields": customFields,
        "description": description,
        "footer": footer,
        "issuer": issuer,
        "metadata": metadata?.toJson(),
        "rendering_options": renderingOptions,
      };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata();

  Map<String, dynamic> toJson() => {};
}

class PaymentMethodOptions {
  Card? card;

  PaymentMethodOptions({
    this.card,
  });

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) =>
      PaymentMethodOptions(
        card: json["card"] != null ? Card.fromJson(json["card"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "card": card?.toJson(),
      };
}

class Card {
  String? requestThreeDSecure;

  Card({
    this.requestThreeDSecure,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        requestThreeDSecure: json["request_three_d_secure"],
      );

  Map<String, dynamic> toJson() => {
        "request_three_d_secure": requestThreeDSecure,
      };
}

class TotalDetails {
  int? amountDiscount;
  int? amountShipping;
  int? amountTax;

  TotalDetails({
    this.amountDiscount,
    this.amountShipping,
    this.amountTax,
  });

  factory TotalDetails.fromJson(Map<String, dynamic> json) => TotalDetails(
        amountDiscount: json["amount_discount"],
        amountShipping: json["amount_shipping"],
        amountTax: json["amount_tax"],
      );

  Map<String, dynamic> toJson() => {
        "amount_discount": amountDiscount,
        "amount_shipping": amountShipping,
        "amount_tax": amountTax,
      };
}
