# typed: true
# frozen_string_literal: true


class KintsugiSDK::Models::Shared::TransactionItemBuilder
  extend ::Crystalline::MetadataFields::ClassMethods
end


class KintsugiSDK::Models::Shared::TransactionItemBuilder
  def organization_id(); end
  def organization_id=(str_); end
  def date(); end
  def date=(str_); end
  def external_product_id(); end
  def external_product_id=(str_); end
  def external_id(); end
  def external_id=(str_); end
  def description(); end
  def description=(str_); end
  def product(); end
  def product=(str_); end
  def product_id(); end
  def product_id=(str_); end
  def product_name(); end
  def product_name=(str_); end
  def product_description(); end
  def product_description=(str_); end
  def original_currency(); end
  def original_currency=(str_); end
  def destination_currency(); end
  def destination_currency=(str_); end
  def converted_amount(); end
  def converted_amount=(str_); end
  def converted_taxable_amount(); end
  def converted_taxable_amount=(str_); end
  def converted_tax_amount_imported(); end
  def converted_tax_amount_imported=(str_); end
  def converted_tax_amount_calculated(); end
  def converted_tax_amount_calculated=(str_); end
  def converted_total_discount(); end
  def converted_total_discount=(str_); end
  def converted_subtotal(); end
  def converted_subtotal=(str_); end
  def tax_exemption(); end
  def tax_exemption=(str_); end
  def tax_items(); end
  def tax_items=(str_); end
  def discount_builder(); end
  def discount_builder=(str_); end
  def quantity(); end
  def quantity=(str_); end
  def amount(); end
  def amount=(str_); end
  def tax_amount_imported(); end
  def tax_amount_imported=(str_); end
  def tax_rate_imported(); end
  def tax_rate_imported=(str_); end
  def tax_amount_calculated(); end
  def tax_amount_calculated=(str_); end
  def tax_rate_calculated(); end
  def tax_rate_calculated=(str_); end
  def taxable_amount(); end
  def taxable_amount=(str_); end
  def exempt(); end
  def exempt=(str_); end
end