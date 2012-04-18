require 'active_support/concern'
module GTIN
  module ActiveRecord
    module Validator
      extend ActiveSupport::Concern

      module ClassMethods
        def validates_gtin_format_of(*attrs)
          opts = attrs.last.is_a?(Hash) ? attrs.pop : {}
          validate do
            attrs.each do |attr|
              value = send(attr)
              unless (value.nil? && opts[:allow_nil] == true) ||
                (value.blank? && opts[:allow_blank] == true) ||
                value.valid_gtin_checksum?

                errors.add attr, "does not have a valid GTIN checksum" 
              end
            end
          end
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, GTIN::ActiveRecord::Validator
