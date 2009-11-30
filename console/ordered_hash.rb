SEP = '  '
def pretty_inspect(objeto, ident)
  case objeto
    when Mongo::ObjectID then "Mongo::ObjectID(#{objeto.to_s.inspect})"
    when Mongo::DBRef then objeto.to_s
    when String then "\"#{objeto.gsub('"', '\\"')}\""
    when Array
      retorno = "[\n"
      objeto.each_with_index do |v, i|
        retorno += "#{SEP * ident}#{i} => "
        retorno += pretty_inspect(v, ident + 1)
        retorno += "\n"
      end
      retorno += "#{SEP * (ident - 1)}]"
      return retorno
    when OrderedHash
      retorno = "{\n"
      objeto.each_pair do |c, v|
        retorno += "#{SEP * ident}#{c.inspect} => "
        retorno += pretty_inspect(v, ident + 1)
        retorno += "\n"
      end
      retorno += "#{SEP * (ident - 1)}}"
      return retorno
    else objeto.inspect
  end
end

class OrderedHash
  def inspect
    pretty_inspect(self, 1)
  end
end

class Array
  def inspect
    pretty_inspect(self, 1)
  end
end

class Mongo::Cursor
  def inspect
    to_a.inspect
  end
end
