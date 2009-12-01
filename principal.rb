require 'mongo'
require 'Qt4'
require 'buscar_lazy'
require 'ui/principal'

def __(string, classe = '')
  return Qt::Application.translate('', string, nil, Qt::Application::UnicodeUTF8)
end

class Principal < Qt::MainWindow
  def initialize
    super
    @mongo = Mongo::Connection.new

    @ui = Ui::Principal.new
    @ui.setup_ui(self)

    #Popular os BDs
    @ui.banco_dados.add_item '<Selecione o banco de dados>'
    @ui.banco_dados.add_items @mongo.database_names.sort

    @ui.banco_dados.connect( SIGNAL('currentIndexChanged(QString)') ) do |texto|
      carregar_banco_dados(texto)
    end

    @ui.documentos.connect SIGNAL('itemClicked(QTreeWidgetItem *, int)') do |item, coluna|
      carregar_documentos(item.text(0))
    end

    @ui.anterior.connect( SIGNAL('clicked()') ) { mudar_elemento -1 }
    @ui.proximo.connect( SIGNAL('clicked()') ) { mudar_elemento 1 }

    @ui.consultar.connect( SIGNAL('clicked()') ) { consultar(@ui.consulta.text) }
  end

  def consultar(texto)
    texto.strip!
    texto = "{#{texto}}" unless texto[0] == ?{
    begin
      hash = eval(texto)
    rescue Exception => e
      Qt::MessageBox.critical self, 'Erro de sintaxe', "Ocorreu um erro de sintaxe em sua busca: #{e.message}"
    end

    @elementos = BuscarLazy.new(@collection, hash)
    @ui.dados_documento.clear
    popular_arvore(@ui.dados_documento, nil, @elementos[0])
    @ui.contador.text = @elementos.msg
  end

  def mudar_elemento(contador)
    @elementos.mudar(contador)

    @ui.contador.text = @elementos.msg
    @ui.dados_documento.clear
    popular_arvore(@ui.dados_documento, nil, @elementos.elemento_atual)
  end

  def carregar_banco_dados(texto)
    @ui.documentos.clear
    @db = @mongo.db(texto) rescue return
    @db.collection_names.each do |documento|
      Qt::TreeWidgetItem.new(@ui.documentos, [documento])
    end
  end

  def carregar_documentos(collection)
    @collection = @db.collection(collection)
    @elementos = BuscarLazy.new(@collection, {})

    @ui.dados_documento.clear
    popular_arvore(@ui.dados_documento, nil, @elementos[0])
    @ui.contador.text = @elementos.msg
  end

  private
  def popular_arvore(pai, chave, elemento)
    case(elemento)
      when Hash, OrderedHash
        e = Qt::TreeWidgetItem.new(pai, [__(chave), "{}"]) unless chave.nil?
        elemento.each_pair do |ch, valor|
          popular_arvore(e || pai, ch, valor)
        end
      when Array
        e = Qt::TreeWidgetItem.new(pai, [chave, "[]"])
        elemento.each_with_index do |valor, indice|
          popular_arvore(e, indice.to_s, __(valor))
        end
      else
        Qt::TreeWidgetItem.new(pai, [__(chave), __(elemento.to_s)])
    end
  end
end

if $0 == __FILE__
  app = Qt::Application.new ARGV

  Qt::TextCodec.codec_for_tr = Qt::TextCodec.codec_for_name("UTF-8")
  Qt::TextCodec::setCodecForTr(Qt::TextCodec::codecForName("UTF-8"));
  Qt::TextCodec::setCodecForCStrings(Qt::TextCodec::codecForName("UTF-8"));
  Qt::TextCodec::setCodecForLocale(Qt::TextCodec::codecForName("UTF-8"));

  principal = Principal.new
  principal.show
  app.exec
end
