require 'active_support/concern'
module GTIN
  module ActiveRecord
    module Validator
      extend ActiveSupport::Concern

      module ClassMethods
        def validates_gtin_format_of(*attrs)
          validate do
            attrs.each do |attr|
              errors.add attr, "does not have a valid GTIN checksum" unless send(attr).valid_gtin_checksum?
            end
          end
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, GTIN::ActiveRecord::Validator
