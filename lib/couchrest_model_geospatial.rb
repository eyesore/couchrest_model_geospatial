require 'couchrest_model'

module CouchRest
  module Model
    module Designs
      class Design < ::CouchRest::Design

        # geocouch view
        def create_spatial(name, function)
          spatial = (self['spatial'] ||= {})
          spatial[name.to_s] = function
        end
      end
      module ClassMethods
        class DesignMapper

          # Add the specified spatial view to the design doc. (geocouch)
          def spatial(name, opts = {})
            design_doc.create_spatial(name, opts)
          end
        end
      end
    end

    # allow spatial searches of proxydb
    module Proxyable
      class ModelProxy

        # override to allow design doc saving outside of view execution
        def create_view_methods
          model.design_docs.each do |doc|
            doc.view_names.each do |name|
              class_eval <<-EOS, __FILE__, __LINE__ + 1
                def #{name}(opts = {})
                  model.#{name}({:proxy => self}.merge(opts))
                end
                def find_#{name}(*key)
                  #{name}.key(*key).first()
                end
              EOS
            end
            #syncing needs to take place here, in case a called view is not a View eg. spatial, fulltext
            doc.sync database
          end
        end
      end
    end
  end
end