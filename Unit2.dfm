object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1058#1088#1077#1085#1072#1078#1077#1088' '#1087#1072#1084#1103#1090#1080
  ClientHeight = 349
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 19
  object PageControl: TPageControl
    Left = 8
    Top = 16
    Width = 514
    Height = 325
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    ActivePage = MenuPhase
    TabOrder = 0
    object MenuPhase: TTabSheet
=======
    ActivePage = MenuStage
    TabOrder = 0
    object MenuStage: TTabSheet
>>>>>>> Stashed changes
=======
    ActivePage = MenuStage
    TabOrder = 0
    object MenuStage: TTabSheet
>>>>>>> Stashed changes
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
        Width = 443
        Height = 16
        Caption = 
          #1080#1075#1088#1099'. '#1044#1083#1103' '#1101#1090#1086#1075#1086' '#1085#1072#1078#1084#1080#1090#1077'  '#39#1060#1072#1081#1083#39' - '#39#1054#1090#1082#1088#1099#1090#1100#39' '#1080' '#1074#1099#1073#1077#1088#1080#1090#1077' '#1085#1091#1078#1085#1099#1077' 4 ' +
          #1092#1072#1081#1083#1072'.'
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
<<<<<<< Updated upstream
    end
<<<<<<< Updated upstream
    object FirstPhase: TTabSheet
=======
    object FirstStage: TTabSheet
>>>>>>> Stashed changes
      Caption = #1055#1077#1088#1074#1099#1081' '#1101#1090#1072#1087
      Enabled = False
      ImageIndex = 1
      TabVisible = False
<<<<<<< Updated upstream
      object BackPanel: TPanel
=======
      object Stage1BackPanel: TPanel
>>>>>>> Stashed changes
        Left = 30
        Top = 40
        Width = 457
        Height = 249
        TabOrder = 0
        Visible = False
<<<<<<< Updated upstream
        object Task1Label: TLabel
          Left = 188
          Top = 23
=======
        object Stage1Task1Label: TLabel
          Left = 180
          Top = 0
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        object ResultLabel: TLabel
=======
        object Stage1ResultLabel: TLabel
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        object Task2Label: TLabel
=======
        object Stage1Task2Label: TLabel
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        object GameWordLabel: TLabel
=======
        object Stage1GameWordLabel: TLabel
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        object ConfirmWord: TButton
=======
        object Stage1ConfirmWord: TButton
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
          OnClick = ConfirmWordClick
        end
        object EnterWord: TEdit
=======
          OnClick = Stage1ConfirmWordClick
        end
        object Stage1EnterWord: TEdit
>>>>>>> Stashed changes
          Left = 136
          Top = 144
          Width = 145
          Height = 27
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1083#1086#1074#1086
          Visible = False
<<<<<<< Updated upstream
          OnChange = EnterWordChange
        end
      end
    end
    object SecondPhase: TTabSheet
=======
          OnChange = Stage1EnterWordChange
        end
      end
    end
    object SecondStage: TTabSheet
>>>>>>> Stashed changes
      Caption = #1042#1090#1086#1088#1086#1081' '#1101#1090#1072#1087
      Enabled = False
      ImageIndex = 2
      TabVisible = False
<<<<<<< Updated upstream
    end
    object ThirdPhase: TTabSheet
=======
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
        Left = 62
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = Stage2MemoForWordsChange
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
    object ThirdStage: TTabSheet
>>>>>>> Stashed changes
      Caption = #1058#1088#1077#1090#1080#1081' '#1101#1090#1072#1087
      ImageIndex = 3
      TabVisible = False
    end
<<<<<<< Updated upstream
    object FourthPhase: TTabSheet
=======
    object FourthStage: TTabSheet
>>>>>>> Stashed changes
      Caption = #1063#1077#1090#1074#1077#1088#1090#1099#1081' '#1101#1090#1072#1087
      ImageIndex = 4
      TabVisible = False
    end
<<<<<<< Updated upstream
    object FifthPhase: TTabSheet
=======
    object FifthStage: TTabSheet
>>>>>>> Stashed changes
=======
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
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1083#1086#1074#1086
          Visible = False
          OnChange = Stage1EnterWordChange
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
        Left = 62
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = Stage2MemoForWordsChange
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
    object ThirdStage: TTabSheet
      Caption = #1058#1088#1077#1090#1080#1081' '#1101#1090#1072#1087
      ImageIndex = 3
      TabVisible = False
    end
    object FourthStage: TTabSheet
      Caption = #1063#1077#1090#1074#1077#1088#1090#1099#1081' '#1101#1090#1072#1087
      ImageIndex = 4
      TabVisible = False
    end
    object FifthStage: TTabSheet
>>>>>>> Stashed changes
      Caption = #1055#1103#1090#1099#1081' '#1101#1090#1072#1087
      ImageIndex = 5
      TabVisible = False
    end
  end
  object MainMenu: TMainMenu
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    Left = 424
    Top = 8
=======
    Left = 160
    Top = 16
>>>>>>> Stashed changes
=======
    Left = 160
    Top = 16
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  object Phase1TimerGame: TTimer
    Enabled = False
    OnTimer = Phase1TimerGameTimer
    Left = 480
    Top = 8
  end
  object OpenFromFileDialog: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 372
    Top = 6
=======
=======
>>>>>>> Stashed changes
  object Stage1GameTimer: TTimer
    Enabled = False
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
    OnTimer = Stage2GameTimerTimer
    Left = 272
    Top = 16
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
  end
end
