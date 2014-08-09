# -*- encoding : utf-8 -*-
require 'active_model'

module ActiveModelUniqueErrors

  def self.included(base)
    base.alias_method_chain :"[]=", :unique_check
    base.alias_method_chain :add, :unique_check
  end

  define_method "[]_with_unique_check=" do |attribute, error|
    unless self.added?(attribute, error)
      self.send("[]_without_unique_check=", attribute, error)
    end
  end

  def add_with_unique_check(attribute, message = :invalid, options = {})
    unless self.added?(attribute, message, options)
      add_without_unique_check(attribute, message, options)
    end
  end

end


if defined? ActiveModel::Errors
  ActiveModel::Errors.send(:include,ActiveModelUniqueErrors)
end