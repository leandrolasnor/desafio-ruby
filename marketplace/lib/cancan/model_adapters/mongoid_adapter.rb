module CanCan
    module ModelAdapters
      class MongoidAdapter < AbstractAdapter
        def self.for_class?(model_class)
          model_class <= Mongoid::Document
        end
  
        def database_records
          if @rules.size == 0  
            @model_class.where(:_id => {'$exists' => false, '$type' => 7}) # return no records in Mongoid
          else
            @rules.inject(@model_class.all) do |records, rule|
              if rule.base_behavior
                records.or(rule.conditions)
              else
                records.excludes(rule.conditions)
              end
            end
          end
        end
      end
    end
  end
  
  module Mongoid::Document::ClassMethods
    include CanCan::ModelAdditions::ClassMethods
  end