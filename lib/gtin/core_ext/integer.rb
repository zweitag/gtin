module GTIN
  module CoreExt
    module Integer
      def odd?
        self & 1 != 0
      end

      def even?
        self & 1 == 0
      end
    end
  end
end

Integer.send :include, GTIN::CoreExt::Integer
