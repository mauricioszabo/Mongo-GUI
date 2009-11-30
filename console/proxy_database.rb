class ProxyDatabase
  def initialize(database)
    @database = Mongo::Connection.new.db(database)
  end

  def method_missing(method)
    ProxyDatabase.__send__ :define_method, method do
      @database.collection(method.to_s)
    end

    __send__ method
  end
end

m = ProxyDatabase.instance_methods.collect { |x| x.to_s }
m.delete_if { |x| x =~ /^_/ }
m -= ['initialize', 'method_missing', 'methods', 'define_method', 'inspect']

m.each { |method| ProxyDatabase.send(:undef_method, method) }
