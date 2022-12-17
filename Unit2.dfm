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
    ActivePage = SecondPhase
    TabOrder = 0
    object MenuPhase: TTabSheet
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
    end
    object FirstPhase: TTabSheet
      Caption = #1055#1077#1088#1074#1099#1081' '#1101#1090#1072#1087
      Enabled = False
      ImageIndex = 1
      TabVisible = False
      object BackPanel: TPanel
        Left = 30
        Top = 40
        Width = 457
        Height = 249
        TabOrder = 0
        Visible = False
        object Task1Label: TLabel
          Left = 188
          Top = 23
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
        object ResultLabel: TLabel
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
        object Task2Label: TLabel
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
        object GameWordLabel: TLabel
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
        object ConfirmWord: TButton
          Left = 328
          Top = 137
          Width = 113
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
          OnClick = ConfirmWordClick
        end
        object EnterWord: TEdit
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
          OnChange = EnterWordChange
        end
        object NextButton: TButton
          Left = 328
          Top = 200
          Width = 113
          Height = 41
          Caption = #1050#1086' '#1074#1090#1086#1088#1086#1084#1091' '#1101#1090#1072#1087#1091
          Default = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = False
          OnClick = NextButtonClick
        end
      end
    end
    object ThirdPhase: TTabSheet
      Caption = #1058#1088#1077#1090#1080#1081' '#1101#1090#1072#1087
      ImageIndex = 3
      TabVisible = False
    end
    object FourthPhase: TTabSheet
      Caption = #1063#1077#1090#1074#1077#1088#1090#1099#1081' '#1101#1090#1072#1087
      ImageIndex = 4
      TabVisible = False
    end
    object FifthPhase: TTabSheet
      Caption = #1055#1103#1090#1099#1081' '#1101#1090#1072#1087
      ImageIndex = 5
      TabVisible = False
    end
    object SecondPhase: TTabSheet
      Caption = #1042#1090#1086#1088#1086#1081' '#1101#1090#1072#1087
      ImageIndex = 6
      TabVisible = False
      object BeginningLabel: TLabel
        Left = 192
        Top = 31
        Width = 206
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ReadyLabel: TLabel
        Left = 192
        Top = 9
        Width = 110
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = #1055#1088#1080#1075#1086#1090#1086#1074#1100#1090#1077#1089#1100'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ThirdWordEdit: TEdit
        Left = 64
        Top = 177
        Width = 153
        Height = 27
        TabOrder = 0
        TextHint = #1058#1088#1077#1090#1100#1077' '#1089#1083#1086#1074#1086
        Visible = False
        OnChange = ThirdWordEditChange
        OnKeyPress = ThirdWordEditKeyPress
      end
      object FirstWordEdit: TEdit
        Left = 64
        Top = 115
        Width = 153
        Height = 27
        TabOrder = 1
        TextHint = #1055#1077#1088#1074#1086#1077' '#1089#1083#1086#1074#1086
        Visible = False
        OnChange = FirstWordEditChange
        OnKeyPress = FirstWordEditKeyPress
      end
      object SecondWordEdit: TEdit
        Left = 64
        Top = 146
        Width = 153
        Height = 27
        TabOrder = 2
        TextHint = #1042#1090#1086#1088#1086#1077' '#1089#1083#1086#1074#1086
        Visible = False
        OnChange = SecondWordEditChange
        OnKeyPress = SecondWordEditKeyPress
      end
      object Edit4: TEdit
        Left = 264
        Top = 208
        Width = 153
        Height = 27
        TabOrder = 3
        TextHint = #1042#1086#1089#1100#1084#1086#1077' '#1089#1083#1086#1074#1086
        Visible = False
        OnKeyPress = Edit4KeyPress
      end
      object FourthWordEdit: TEdit
        Left = 64
        Top = 208
        Width = 153
        Height = 27
        TabOrder = 4
        TextHint = #1063#1077#1090#1074#1077#1088#1090#1086#1077' '#1089#1083#1086#1074#1086
        Visible = False
        OnChange = FourthWordEditChange
        OnKeyPress = FourthWordEditKeyPress
      end
      object FifthWordEdit: TEdit
        Left = 264
        Top = 115
        Width = 153
        Height = 27
        TabOrder = 5
        TextHint = #1055#1103#1090#1086#1077' '#1089#1083#1086#1074#1086
        Visible = False
        OnChange = FifthWordEditChange
        OnKeyPress = FifthWordEditKeyPress
      end
      object SixthWord: TEdit
        Left = 264
        Top = 146
        Width = 153
        Height = 27
        TabOrder = 6
        TextHint = #1064#1077#1089#1090#1086#1077' '#1089#1083#1086#1074#1086
        Visible = False
        OnKeyPress = SixthWordKeyPress
      end
      object SeventhWord: TEdit
        Left = 264
        Top = 177
        Width = 153
        Height = 27
        TabOrder = 7
        TextHint = #1057#1077#1076#1100#1084#1086#1077' '#1089#1083#1086#1074#1086
        Visible = False
        OnKeyPress = SeventhWordKeyPress
      end
      object InputButton: TButton
        Left = 64
        Top = 246
        Width = 99
        Height = 42
        Caption = #1042#1074#1077#1089#1090#1080
        Enabled = False
        TabOrder = 8
        Visible = False
        OnClick = InputButtonClick
      end
      object MemoOfWords: TMemo
        Left = 64
        Top = 56
        Width = 369
        Height = 53
        Lines.Strings = (
          ''
          '')
        ReadOnly = True
        TabOrder = 9
        Visible = False
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 424
    Top = 8
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
  end
  object SecondPhaseTimer: TTimer
    Left = 44
    Top = 62
  end
end
