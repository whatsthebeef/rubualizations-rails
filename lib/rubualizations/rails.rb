module Rubualizations
   module Rails
      module Tableable
         include Rubualizations::Tableable
         attr_accessor :cols_def

         def tablize(models, params)
            return tablize_hashes(models.map!{|m| m.attributes}, params)
         end

      end
   end
end
