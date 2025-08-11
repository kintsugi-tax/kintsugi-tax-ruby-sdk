# typed: true
# frozen_string_literal: true


class KintsugiSDK::Models::Shared::ValidationError
  extend ::Crystalline::MetadataFields::ClassMethods
end


class KintsugiSDK::Models::Shared::ValidationError
  def loc(); end
  def loc=(str_); end
  def msg(); end
  def msg=(str_); end
  def type(); end
  def type=(str_); end
end