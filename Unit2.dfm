object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1058#1088#1077#1085#1072#1078#1077#1088' '#1087#1072#1084#1103#1090#1080
  ClientHeight = 346
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 19
  object PageControl: TPageControl
    Left = 8
    Top = 16
    Width = 514
    Height = 325
    ActivePage = MenuStage
    TabOrder = 0
    object MenuStage: TTabSheet
      Caption = #1052#1077#1085#1102
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object WelcomeLabel: TLabel
        Left = 80
        Top = 24
        Width = 351
        Height = 19
        Caption = #1044#1086#1073#1088#1086' '#1087#1086#1078#1072#1083#1086#1074#1072#1090#1100' '#1074' "'#1058#1088#1077#1085#1072#1078#1077#1088' '#1087#1072#1084#1103#1090#1080'"!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GameInfoLabel: TLabel
        Left = 20
        Top = 57
        Width = 483
        Height = 49
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 
          #1044#1072#1085#1085#1072#1103' '#1080#1075#1088#1072' '#1087#1088#1077#1076#1085#1072#1079#1085#1072#1095#1077#1085#1072' '#1076#1083#1103' '#1090#1086#1075#1086', '#1095#1090#1086#1073#1099' '#1088#1072#1079#1074#1080#1090#1100' '#1082#1088#1072#1090#1082#1086#1074#1088#1077#1084#1077#1085#1085#1091 +
          #1102' '#1087#1072#1084#1103#1090#1100'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        Transparent = True
      end
      object Requirement1Label: TLabel
        Left = 20
        Top = 79
        Width = 479
        Height = 16
        Caption = 
          #1055#1077#1088#1077#1076' '#1085#1072#1095#1072#1083#1086#1084' '#1080#1075#1088#1099' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083#1099', '#1082#1086#1090#1086#1088#1099#1077' '#1089#1086#1076#1077#1088#1078#1072#1090' '#1089#1083 +
          #1086#1074#1072' '#1076#1083#1103' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Requirement2Label: TLabel
        Left = 20
        Top = 101
        Width = 434
        Height = 16
        Caption = 
          #1080#1075#1088#1099'. '#1044#1083#1103' '#1101#1090#1086#1075#1086' '#1085#1072#1078#1084#1080#1090#1077'  '#39#1060#1072#1081#1083#39' - '#39#1054#1090#1082#1088#1099#1090#1100#39' '#1080' '#1074#1099#1073#1077#1088#1080#1090#1077' '#1085#1091#1078#1085#1099#1077' '#1092#1072 +
          #1081#1083#1099'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object StartNewGame: TButton
        Left = 160
        Top = 142
        Width = 177
        Height = 49
        Caption = #1053#1072#1095#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1080#1075#1088#1091
        Default = True
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = StartNewGameClick
      end
    end
    object ThirdStage: TTabSheet
      Caption = #1058#1088#1077#1090#1080#1081' '#1101#1090#1072#1087
      ImageIndex = 3
      TabVisible = False
      object Stage3Task1Label: TLabel
        Left = 216
        Top = 32
        Width = 110
        Height = 16
        Caption = #1055#1088#1080#1075#1086#1090#1086#1074#1100#1090#1077#1089#1100'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Stage3GameWordsLabel: TLabel
        Left = 16
        Top = 60
        Width = 4
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Stage3ResultLabel: TLabel
        Left = 288
        Top = 224
        Width = 5
        Height = 19
      end
      object Stage3ConfirmWordsButton: TButton
        Left = 288
        Top = 160
        Width = 169
        Height = 41
        Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1083#1086#1074
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Stage3ConfirmWordsButtonClick
      end
      object Stage3MemoForWords: TMemo
        Left = 62
        Top = 95
        Width = 185
        Height = 186
        Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1083#1086#1074#1072'...'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = Stage3MemoForWordsChange
        OnKeyPress = Stage3MemoForWordsKeyPress
      end
    end
    object FirstStage: TTabSheet
      Caption = #1055#1077#1088#1074#1099#1081' '#1101#1090#1072#1087
      Enabled = False
      ImageIndex = 1
      TabVisible = False
      object Stage1BackPanel: TPanel
        Left = 30
        Top = 40
        Width = 457
        Height = 249
        TabOrder = 0
        Visible = False
        object Stage1Task1Label: TLabel
          Left = 180
          Top = 0
          Width = 110
          Height = 16
          Caption = #1055#1088#1080#1075#1086#1090#1086#1074#1100#1090#1077#1089#1100'...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Stage1ResultLabel: TLabel
          Left = 214
          Top = 208
          Width = 5
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Stage1Task2Label: TLabel
          Left = 230
          Top = 61
          Width = 8
          Height = 16
          Caption = '3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Stage1GameWordLabel: TLabel
          Left = 214
          Top = 99
          Width = 7
          Height = 15
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Consolas'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Stage1ConfirmWord: TButton
          Left = 332
          Top = 131
          Width = 105
          Height = 57
          Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = False
          OnClick = Stage1ConfirmWordClick
        end
        object Stage1EnterWord: TEdit
          Left = 136
          Top = 144
          Width = 145
          Height = 27
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1083#1086#1074#1086
          Visible = False
          OnChange = Stage1EnterWordChange
          OnKeyPress = Stage1EnterWordKeyPress
        end
      end
    end
    object SecondStage: TTabSheet
      Caption = #1042#1090#1086#1088#1086#1081' '#1101#1090#1072#1087
      Enabled = False
      ImageIndex = 2
      TabVisible = False
      object Stage2Task1Label: TLabel
        Left = 216
        Top = 31
        Width = 110
        Height = 16
        Caption = #1055#1088#1080#1075#1086#1090#1086#1074#1100#1090#1077#1089#1100'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Stage2GameWordsLabel: TLabel
        Left = 40
        Top = 63
        Width = 4
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Stage2ResultLabel: TLabel
        Left = 288
        Top = 224
        Width = 5
        Height = 19
        Visible = False
      end
      object Stage2MemoForWords: TMemo
        Left = 62
        Top = 95
        Width = 185
        Height = 185
        Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1083#1086#1074#1072'...'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = Stage2MemoForWordsChange
        OnKeyPress = Stage2MemoForWordsKeyPress
      end
      object Stage2ConfirmWordsButton: TButton
        Left = 288
        Top = 160
        Width = 169
        Height = 41
        Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1083#1086#1074
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Stage2ConfirmWordsButtonClick
      end
    end
    object FourthStage: TTabSheet
      Caption = #1063#1077#1090#1074#1077#1088#1090#1099#1081' '#1101#1090#1072#1087
      ImageIndex = 4
      TabVisible = False
      object Stage4Task1Label: TLabel
        Left = 216
        Top = 32
        Width = 110
        Height = 16
        Caption = #1055#1088#1080#1075#1086#1090#1086#1074#1100#1090#1077#1089#1100'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Stage4GameWordsLabel: TLabel
        Left = 16
        Top = 60
        Width = 4
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Stage4ResultLabel: TLabel
        Left = 288
        Top = 224
        Width = 5
        Height = 19
      end
      object Stage4MemoForWords: TMemo
        Left = 62
        Top = 94
        Width = 185
        Height = 186
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = Stage4MemoForWordsChange
        OnKeyPress = Stage4MemoForWordsKeyPress
      end
      object Stage4ConfirmWordsButton: TButton
        Left = 288
        Top = 160
        Width = 169
        Height = 41
        Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1083#1086#1074
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Stage4ConfirmWordsButtonClick
      end
    end
    object FifthStage: TTabSheet
      Caption = #1055#1103#1090#1099#1081' '#1101#1090#1072#1087
      ImageIndex = 5
      TabVisible = False
      object Stage5Task1Label: TLabel
        Left = 215
        Top = 32
        Width = 110
        Height = 16
        Caption = #1055#1088#1080#1075#1086#1090#1086#1074#1100#1090#1077#1089#1100'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Stage5GameWordsLabel: TLabel
        Left = 16
        Top = 60
        Width = 5
        Height = 19
      end
      object Stage5ResultLabel: TLabel
        Left = 312
        Top = 216
        Width = 5
        Height = 19
      end
      object Stage5ConfirmWordsButton: TButton
        Left = 288
        Top = 160
        Width = 169
        Height = 41
        Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1083#1086#1074
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Stage5ConfirmWordsButtonClick
      end
      object Stage5MemoForWords: TMemo
        Left = 65
        Top = 95
        Width = 185
        Height = 186
        Enabled = False
        TabOrder = 1
        OnChange = Stage5MemoForWordsChange
        OnKeyPress = Stage5MemoForWordsKeyPress
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 160
    Top = 16
    object FileMenu: TMenuItem
      Caption = #1060#1072#1081#1083
      object OpenFromFileMenu: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        ShortCut = 16463
        OnClick = OpenFromFileMenuClick
      end
    end
    object GameRulesInfo: TMenuItem
      Caption = #1055#1088#1072#1074#1080#1083#1072' '#1080#1075#1088#1099
      ShortCut = 16466
      OnClick = GameRulesInfoClick
    end
  end
  object Stage1GameTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Stage1GameTimerTimer
    Left = 216
    Top = 16
  end
  object OpenFromFileDialog: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 92
    Top = 14
  end
  object Stage2GameTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Stage2GameTimerTimer
    Left = 272
    Top = 16
  end
  object Stage3GameTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Stage3GameTimerTimer
    Left = 320
    Top = 16
  end
  object Stage4GameTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Stage4GameTimerTimer
    Left = 368
    Top = 16
  end
  object Stage5GameTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Stage5GameTimerTimer
    Left = 424
    Top = 16
  end
end
