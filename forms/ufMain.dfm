object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'HashDivSquare'
  ClientHeight = 425
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poDesktopCenter
  TextHeight = 15
  object StartLabel: TLabel
    Left = 0
    Top = 0
    Width = 631
    Height = 425
    Align = alClient
    Alignment = taCenter
    Caption = 'Choose file for analys or generate a new one...'
    Layout = tlCenter
    ExplicitLeft = -8
    ExplicitTop = 288
    ExplicitWidth = 624
    ExplicitHeight = 461
  end
  object btnStartAnalysis: TButton
    Left = 0
    Top = 53
    Width = 100
    Height = 40
    Caption = 'Start analysis'
    TabOrder = 0
    Visible = False
    OnClick = btnStartAnalysisClick
  end
  object cbHashMethod: TComboBox
    Left = 0
    Top = 16
    Width = 245
    Height = 23
    TabOrder = 1
    Text = 'Select hash method'
    Visible = False
    Items.Strings = (
      'Shift method'
      'Square method')
  end
  object lvResults: TListView
    Left = 0
    Top = 107
    Width = 245
    Height = 246
    Columns = <
      item
        Caption = 'Bucket'
        Width = 80
      end
      item
        Caption = 'Main'
        Width = 80
      end
      item
        Caption = 'Collisions'
        Width = 80
      end>
    TabOrder = 2
    ViewStyle = vsReport
    Visible = False
  end
  object Button1: TButton
    Left = 145
    Top = 53
    Width = 100
    Height = 40
    Caption = 'Button1'
    TabOrder = 3
    Visible = False
  end
  object MainMenu: TMainMenu
    Left = 424
    Top = 232
    object FileItem: TMenuItem
      Caption = 'File'
      object OpenFileSubItem: TMenuItem
        Caption = 'Open file'
        OnClick = OpenFileSubItemClick
      end
      object GenerateFileSubItem: TMenuItem
        Caption = 'Generate new file'
        OnClick = GenerateFileSubItemClick
      end
    end
  end
  object OpenFileDialog: TOpenDialog
    FileName = 
      'D:\'#1059#1053#1048#1042#1045#1056'\'#1050#1091#1088#1089#1086#1074#1099#1077'\oaip\oaip-coursework-1\Win32\Debug\data.TData' +
      'Record'
    Filter = 'Choose data file (*.TDataRecord)|*.TDataRecord'
    Left = 352
    Top = 264
  end
end
