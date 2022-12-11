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
  PixelsPerInch = 96
  TextHeight = 13
  object HintLabel: TLabel
    Left = 219
    Top = 105
    Width = 3
    Height = 13
    Visible = False
  end
  object RandomWordLabel: TLabel
    Left = 72
    Top = 100
    Width = 132
    Height = 19
    Caption = #1057#1083#1091#1095#1072#1081#1085#1086#1077' '#1089#1083#1086#1074#1086':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object BackPanel: TPanel
    Left = 24
    Top = 152
    Width = 457
    Height = 189
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
      Width = 3
      Height = 13
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
      Left = 304
      Top = 104
      Width = 105
      Height = 57
      Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
      Enabled = False
      TabOrder = 0
      Visible = False
      OnClick = ConfirmWordClick
    end
    object EnterWord: TEdit
      Left = 112
      Top = 120
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
      OnKeyPress = EnterWordKeyPress
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
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 64
    Top = 24
  end
end
