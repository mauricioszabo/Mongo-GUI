class BuscarLazy
  NUM_BUSCAS = 50

  attr_reader :total, :atual

  def initialize(collection, query)
    @collection = collection
    @query = query

    cursor = @collection.find(@query)
    @atual = 0
    @total = cursor.count

    @array = cursor.limit(NUM_BUSCAS).to_a
  end

  def [](valor)
    return nil if valor >= @total

    if @array[valor].nil?
      @collection.find(@query, :skip => valor, :limit => NUM_BUSCAS).each_with_index do |v, i|
        @array[valor + i] = v
      end
    end
    
    return @array[valor]
  end

  def mudar(soma)
    @atual += soma
    @atual = 0 if(@atual < 0)
    @atual = @total - 1 if(@atual >= @total )
  end

  def elemento_atual
    self[@atual]
  end

  def msg
    "Documento #{@atual + 1} de #{@total}"
  end
end
