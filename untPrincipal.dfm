object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'LaserPad'
  ClientHeight = 516
  ClientWidth = 964
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSuperior: TPanel
    Left = 0
    Top = 0
    Width = 964
    Height = 25
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 0
    object lblArquivo: TLabel
      Left = 0
      Top = 0
      Width = 50
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taCenter
      AutoSize = False
      Caption = 'Arquivo'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      OnClick = lblArquivoClick
      OnMouseEnter = OnMouseEnterChangeColor
      OnMouseLeave = OnMouseLeaveChangeColor
    end
    object lblEditar: TLabel
      Left = 52
      Top = 0
      Width = 40
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taCenter
      AutoSize = False
      Caption = 'Editar'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      WordWrap = True
      OnClick = lblEditarClick
      OnMouseEnter = OnMouseEnterChangeColor
      OnMouseLeave = OnMouseLeaveChangeColor
    end
    object lblFormatar: TLabel
      Left = 95
      Top = 0
      Width = 60
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taCenter
      AutoSize = False
      Caption = 'Formatar'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      WordWrap = True
      OnClick = lblFormatarClick
      OnMouseEnter = OnMouseEnterChangeColor
      OnMouseLeave = OnMouseLeaveChangeColor
    end
    object lblExibir: TLabel
      Left = 157
      Top = 0
      Width = 40
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taCenter
      AutoSize = False
      Caption = 'Exibir'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      WordWrap = True
      OnMouseEnter = OnMouseEnterChangeColor
      OnMouseLeave = OnMouseLeaveChangeColor
    end
    object lblAjudaa: TLabel
      Left = 234
      Top = 0
      Width = 40
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taCenter
      AutoSize = False
      Caption = 'Ajuda'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      WordWrap = True
      OnMouseEnter = OnMouseEnterChangeColor
      OnMouseLeave = OnMouseLeaveChangeColor
    end
    object lblQA: TLabel
      Left = 200
      Top = 0
      Width = 30
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taCenter
      AutoSize = False
      Caption = 'QA'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      WordWrap = True
      OnClick = lblQAClick
      OnMouseEnter = OnMouseEnterChangeColor
      OnMouseLeave = OnMouseLeaveChangeColor
    end
  end
  object pnlInferior: TPanel
    Left = 0
    Top = 496
    Width = 964
    Height = 20
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object pnlDadosInferiores: TPanel
      Left = 696
      Top = 0
      Width = 268
      Height = 20
      Align = alRight
      BevelOuter = bvNone
      Caption = '|  Len: cLen  |  Sel: cSelLen  |  Ln: cLn  |  Col: cCol  |'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object pnlValidacao: TPanel
      Left = 428
      Top = 0
      Width = 268
      Height = 20
      Align = alRight
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object mmoPrincipal: TMemo
    Left = 0
    Top = 25
    Width = 964
    Height = 471
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    ScrollBars = ssVertical
    TabOrder = 2
    OnChange = mmoPrincipalChange
    OnClick = mmoPrincipalClick
    OnKeyUp = mmoPrincipalKeyUp
  end
  object pmArquivo: TPopupMenu
    Left = 16
    Top = 32
    object pmiNovo: TMenuItem
      Caption = 'Novo'
      ShortCut = 16462
      OnClick = pmiNovoClick
    end
    object pmiNovaJanela: TMenuItem
      Caption = 'Nova Janela'
      ShortCut = 24654
      OnClick = pmiNovaJanelaClick
    end
    object pmiAbrir: TMenuItem
      Caption = 'Abrir...'
      ShortCut = 16463
      OnClick = pmiAbrirClick
    end
    object pmiSalvar: TMenuItem
      Caption = 'Salvar'
      ShortCut = 16467
      OnClick = pmiSalvarClick
    end
    object pmiSalvarComo: TMenuItem
      Caption = 'Salvar Como...'
      ShortCut = 24659
      OnClick = pmiSalvarComoClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pmiConfigurarPagina: TMenuItem
      Caption = 'Configurar P'#225'gina...'
      Enabled = False
    end
    object pmiImprimir: TMenuItem
      Caption = 'Imprimir...'
      ShortCut = 16464
      OnClick = pmiImprimirClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object pmiSair: TMenuItem
      Caption = 'Sair'
      ShortCut = 27
      OnClick = pmiSairClick
    end
  end
  object stfdPrincipal: TSaveTextFileDialog
    DefaultExt = 'txt'
    Filter = 'Text files (*.txt)|*.TXT|Any file (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableIncludeNotify, ofEnableSizing]
    Title = 'Salvar como'
    EncodingIndex = 4
    Left = 256
    Top = 176
  end
  object pmQA: TPopupMenu
    Left = 16
    Top = 248
    object pmiGerarCPF: TMenuItem
      Caption = 'Gerar CPF'
      OnClick = pmiGerarCPFClick
    end
    object pmiGerarCPFPontuacao: TMenuItem
      Caption = 'Gerar CPF com Pontua'#231#227'o'
      OnClick = pmiGerarCPFPontuacaoClick
    end
    object pmiValidarCPF: TMenuItem
      Caption = 'Validar CPF'
      OnClick = pmiValidarCPFClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object pmiGerarCNPJ: TMenuItem
      Caption = 'Gerar CNPJ'
      OnClick = pmiGerarCNPJClick
    end
    object pmiGerarCNPJPontuacao: TMenuItem
      Caption = 'Gerar CNPJ com Pontua'#231#227'o'
      OnClick = pmiGerarCNPJPontuacaoClick
    end
    object pmiValidarCNPJ: TMenuItem
      Caption = 'Validar CNPJ'
    end
  end
  object otfdPrincipal: TOpenTextFileDialog
    DefaultExt = 'txt'
    Filter = 'Text files (*.txt)|*.TXT|Any file (*.*)|*.*'
    Left = 328
    Top = 176
  end
  object pdImprimir: TPrintDialog
    Options = [poPrintToFile, poPageNums]
    PrintRange = prSelection
    Left = 432
    Top = 184
  end
  object pmEditar: TPopupMenu
    Left = 18
    Top = 82
    object pmiDesfazer: TMenuItem
      Caption = 'Desfazer'
      Enabled = False
      ShortCut = 16474
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object pmiRecortar: TMenuItem
      Caption = 'Recortar'
      Enabled = False
      ShortCut = 16472
    end
    object pmiCopiar: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      ShortCut = 16451
    end
    object pmiColar: TMenuItem
      Caption = 'Colar'
      Enabled = False
      ShortCut = 16470
    end
    object pmiExcluir: TMenuItem
      Caption = 'Excluir'
      Enabled = False
      ShortCut = 46
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object pmiBuscarComGoogle: TMenuItem
      Caption = 'Buscar com Google...'
      Enabled = False
      ShortCut = 16453
    end
    object pmiLocalizar: TMenuItem
      Caption = 'Localizar'
      Enabled = False
      ShortCut = 16454
    end
    object pmiLocalizarProxima: TMenuItem
      Caption = 'Localizar Pr'#243'xima'
      Enabled = False
      ShortCut = 114
    end
    object pmiLocalizarAnterior: TMenuItem
      Caption = 'Localizar Anterior'
      Enabled = False
      ShortCut = 8306
    end
    object pmiSubstituir: TMenuItem
      Caption = 'Substituir...'
      ShortCut = 16456
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object pmiSelecionarTudo: TMenuItem
      Caption = 'Seleconar tudo'
    end
    object pmiHoraData: TMenuItem
      Caption = 'Inserir Hora/Data'
      ShortCut = 115
    end
  end
  object pmFormatar: TPopupMenu
    Left = 18
    Top = 138
    object pmiQuebrarLinha: TMenuItem
      AutoCheck = True
      Caption = 'Quebra autom'#225'tica de linha'
      Checked = True
    end
    object pmiFonte: TMenuItem
      Caption = 'Fonte...'
    end
  end
  object pmExibir: TPopupMenu
    Left = 18
    Top = 194
    object pmiZoom: TMenuItem
      Caption = 'Zoom'
      object pmiAmpliar: TMenuItem
        Caption = 'Ampliar'
        ShortCut = 16491
      end
      object pmiReduzir: TMenuItem
        Caption = 'Reduzir'
        ShortCut = 16493
      end
      object pmiRestaurarZoom: TMenuItem
        Caption = 'Restaurar Zoom Padr'#227'o'
        ShortCut = 16432
      end
    end
    object pmiBarraStatus: TMenuItem
      AutoCheck = True
      Caption = 'Barra de Status'
      Checked = True
    end
  end
end
