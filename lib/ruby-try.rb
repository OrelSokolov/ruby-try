class Object
  def try(*a, &b)
    if a.empty? && block_given?
      yield self
    else
      public_send(*a, &b) if respond_to?(a.first)
    end
  end

  # Same as #try, but will raise a NoMethodError exception if the receiving is not nil and
  # does not implement the tried method.
  def try!(*a, &b)
    if a.empty? && block_given?
      yield self
    else
      public_send(*a, &b)
    end
  end

  def try?(*a, &b)
    if a.empty? && block_given?
      yield self
    else
      if respond_to?(a.first)
        public_send(*a, &b)
      else
        nil.try?(*a, &b)
      end
    end
  end

end

class NilClass
  # Calling +try+ on +nil+ returns +nil+
  # It becomes specially helpful when navigating through associations that may return +nil+.
  #
  #   nil.try(:name) # => nil
  #
  # Without +try+
  #   @person && !@person.children.blank? && @person.children.first.name
  #
  # With +try+
  #   @person.try(:children).try(:first).try(:name)
  #
  def try(*args)
    nil
  end

  # Calling +try?+ on +nil+ returns +false+
  # With +try?+
  #   @person.try(:children).try(:first).try?(:has_dark_hairs?)
  def try?(*args)
    if args.first =~ /[?]$/
     false
    else
      raise ArgumentError, "For non-boolean methods use only try()"
    end
  end

  def try!(*args)
    nil
  end
end
