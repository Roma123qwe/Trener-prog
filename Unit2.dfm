object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1058#1088#1077#1085#1072#1078#1077#1088' '#1087#1072#1084#1103#1090#1080
  ClientHeight = 373
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object BackPanel: TPanel
    Left = 24
    Top = 100
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
      Width = 10
      Height = 22
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object ConfirmWord: TButton
      Left = 312
      Top = 128
      Width = 105
      Height = 57
      Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
      Enabled = False
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
  end
  object StartNewGame: TButton
    Left = 170
    Top = 24
    Width = 177
    Height = 49
    Caption = #1053#1072#1095#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1080#1075#1088#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = StartNewGameClick
  end
  object MainMenu: TMainMenu
    Left = 416
    Top = 40
    object GameRulesInfo: TMenuItem
      Caption = #1055#1088#1072#1074#1080#1083#1072' '#1080#1075#1088#1099
      ShortCut = 16466
      OnClick = GameRulesInfoClick
    end
  end
  object TimerGame: TTimer
    Enabled = False
    OnTimer = TimerGameTimer
    Left = 64
    Top = 32
  end
end
