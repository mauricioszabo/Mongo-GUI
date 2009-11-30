=begin
** Form generated from reading ui file 'principal.ui'
**
** Created: dom nov 29 11:26:33 2009
**      by: Qt User Interface Compiler version 4.5.3
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_Principal
    attr_reader :actionSair
    attr_reader :centralwidget
    attr_reader :verticalLayout
    attr_reader :horizontalLayout_2
    attr_reader :consulta
    attr_reader :consultar
    attr_reader :horizontalLayout_3
    attr_reader :anterior
    attr_reader :contador
    attr_reader :proximo
    attr_reader :dados_documento
    attr_reader :menubar
    attr_reader :menu_Arquivo
    attr_reader :status
    attr_reader :dockWidget
    attr_reader :dockWidgetContents
    attr_reader :verticalLayout_2
    attr_reader :banco_dados
    attr_reader :documentos

    def setupUi(principal)
    if principal.objectName.nil?
        principal.objectName = "principal"
    end
    principal.resize(754, 450)
    @actionSair = Qt::Action.new(principal)
    @actionSair.objectName = "actionSair"
    @centralwidget = Qt::Widget.new(principal)
    @centralwidget.objectName = "centralwidget"
    @verticalLayout = Qt::VBoxLayout.new(@centralwidget)
    @verticalLayout.objectName = "verticalLayout"
    @horizontalLayout_2 = Qt::HBoxLayout.new()
    @horizontalLayout_2.objectName = "horizontalLayout_2"
    @consulta = Qt::LineEdit.new(@centralwidget)
    @consulta.objectName = "consulta"

    @horizontalLayout_2.addWidget(@consulta)

    @consultar = Qt::PushButton.new(@centralwidget)
    @consultar.objectName = "consultar"

    @horizontalLayout_2.addWidget(@consultar)


    @verticalLayout.addLayout(@horizontalLayout_2)

    @horizontalLayout_3 = Qt::HBoxLayout.new()
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @anterior = Qt::PushButton.new(@centralwidget)
    @anterior.objectName = "anterior"
    icon = Qt::Icon.new
    icon.addPixmap(Qt::Pixmap.new("../../../../../usr/share/icons/oxygen/32x32/actions/arrow-left.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @anterior.icon = icon

    @horizontalLayout_3.addWidget(@anterior)

    @contador = Qt::Label.new(@centralwidget)
    @contador.objectName = "contador"
    @sizePolicy = Qt::SizePolicy.new(Qt::SizePolicy::Expanding, Qt::SizePolicy::Preferred)
    @sizePolicy.setHorizontalStretch(0)
    @sizePolicy.setVerticalStretch(0)
    @sizePolicy.heightForWidth = @contador.sizePolicy.hasHeightForWidth
    @contador.sizePolicy = @sizePolicy
    @contador.alignment = Qt::AlignCenter

    @horizontalLayout_3.addWidget(@contador)

    @proximo = Qt::PushButton.new(@centralwidget)
    @proximo.objectName = "proximo"
    icon1 = Qt::Icon.new
    icon1.addPixmap(Qt::Pixmap.new("../../../../../usr/share/icons/oxygen/32x32/actions/arrow-right.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @proximo.icon = icon1

    @horizontalLayout_3.addWidget(@proximo)


    @verticalLayout.addLayout(@horizontalLayout_3)

    @dados_documento = Qt::TreeWidget.new(@centralwidget)
    @dados_documento.objectName = "dados_documento"

    @verticalLayout.addWidget(@dados_documento)

    principal.centralWidget = @centralwidget
    @menubar = Qt::MenuBar.new(principal)
    @menubar.objectName = "menubar"
    @menubar.geometry = Qt::Rect.new(0, 0, 754, 26)
    @menu_Arquivo = Qt::Menu.new(@menubar)
    @menu_Arquivo.objectName = "menu_Arquivo"
    principal.setMenuBar(@menubar)
    @status = Qt::StatusBar.new(principal)
    @status.objectName = "status"
    principal.statusBar = @status
    @dockWidget = Qt::DockWidget.new(principal)
    @dockWidget.objectName = "dockWidget"
    @dockWidgetContents = Qt::Widget.new(@dockWidget)
    @dockWidgetContents.objectName = "dockWidgetContents"
    @verticalLayout_2 = Qt::VBoxLayout.new(@dockWidgetContents)
    @verticalLayout_2.objectName = "verticalLayout_2"
    @verticalLayout_2.setContentsMargins(0, 0, 0, 0)
    @banco_dados = Qt::ComboBox.new(@dockWidgetContents)
    @banco_dados.objectName = "banco_dados"

    @verticalLayout_2.addWidget(@banco_dados)

    @documentos = Qt::TreeWidget.new(@dockWidgetContents)
    @documentos.objectName = "documentos"
    @documentos.editTriggers = Qt::AbstractItemView::NoEditTriggers

    @verticalLayout_2.addWidget(@documentos)

    @dockWidget.setWidget(@dockWidgetContents)
    principal.addDockWidget((1), @dockWidget)

    @menubar.addAction(@menu_Arquivo.menuAction())
    @menu_Arquivo.addAction(@actionSair)

    retranslateUi(principal)

    Qt::MetaObject.connectSlotsByName(principal)
    end # setupUi

    def setup_ui(principal)
        setupUi(principal)
    end

    def retranslateUi(principal)
    principal.windowTitle = Qt::Application.translate("Principal", "MainWindow", nil, Qt::Application::UnicodeUTF8)
    @actionSair.text = Qt::Application.translate("Principal", "Sai&r", nil, Qt::Application::UnicodeUTF8)
    @consultar.text = Qt::Application.translate("Principal", "Consultar", nil, Qt::Application::UnicodeUTF8)
    @anterior.text = ''
    @contador.text = ''
    @proximo.text = ''
    @dados_documento.headerItem.setText(0, Qt::Application.translate("Principal", "Chave", nil, Qt::Application::UnicodeUTF8))
    @dados_documento.headerItem.setText(1, Qt::Application.translate("Principal", "Valor", nil, Qt::Application::UnicodeUTF8))
    @menu_Arquivo.title = Qt::Application.translate("Principal", "&Arquivo", nil, Qt::Application::UnicodeUTF8)
    @dockWidget.windowTitle = Qt::Application.translate("Principal", "Documentos", nil, Qt::Application::UnicodeUTF8)
    @documentos.headerItem.setText(0, Qt::Application.translate("Principal", "1", nil, Qt::Application::UnicodeUTF8))
    end # retranslateUi

    def retranslate_ui(principal)
        retranslateUi(principal)
    end

end

module Ui
    class Principal < Ui_Principal
    end
end  # module Ui

