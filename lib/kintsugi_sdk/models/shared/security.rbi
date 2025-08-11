# typed: true
# frozen_string_literal: true


class KintsugiSDK::Models::Shared::Security
  extend ::Crystalline::MetadataFields::ClassMethods
end


class KintsugiSDK::Models::Shared::Security
  def api_key_header(); end
  def api_key_header=(str_); end
  def custom_header(); end
  def custom_header=(str_); end
end