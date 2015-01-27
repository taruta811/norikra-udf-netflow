require 'java'
require "norikra/udf"

module Norikra
  module UDF
    class NFDirection < Norikra::UDF::SingleRow
      def self.init
        require 'norikra-udf-netflow.jar'
      end

      def definition
        ["nfdirection", "io.github.yokamaru.norikra.udf.NetFlow", "direction"]
      end
    end

    class NFRouter < Norikra::UDF::SingleRow
      def self.init
        require 'norikra-udf-netflow.jar'
      end

      def definition
        ["nfrouter", "io.github.yokamaru.norikra.udf.NetFlow", "router"]
      end
    end

    class NFCareer < Norikra::UDF::SingleRow
      def self.init
        require 'norikra-udf-netflow.jar'
      end

      def definition
        ["nfcareer", "io.github.yokamaru.norikra.udf.NetFlow", "career"]
      end
    end

    class NFOppositeASN < Norikra::UDF::SingleRow
      def self.init
        require 'norikra-udf-netflow.jar'
        require 'commons-net-3.3.jar'
      end

      def definition
        ["nfoppositeasn", "io.github.yokamaru.norikra.udf.NetFlow", "opposite_asn"]
      end
    end

  end
end
