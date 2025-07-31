# typed: true
# frozen_string_literal: true


class KintsugiSDK::Models::Shared::File
  extend ::Crystalline::MetadataFields::ClassMethods
end


class KintsugiSDK::Models::Shared::File
  def file_name(); end
  def file_name=(str_); end
  def content(); end
  def content=(str_); end
end