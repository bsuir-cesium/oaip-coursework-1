object frmMain: TfrmMain
  Left = 0
  Top = 0
  Margins.Left = 6
  Margins.Top = 6
  Margins.Right = 6
  Margins.Bottom = 6
  Anchors = [akLeft, akTop, akRight]
  Caption = 'HashShiftSquare'
  ClientHeight = 679
  ClientWidth = 1179
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -24
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  PixelsPerInch = 192
  TextHeight = 32
  object lblStart: TLabel
    Left = 0
    Top = 0
    Width = 1179
    Height = 679
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alClient
    Alignment = taCenter
    Caption = 'You need to select the file'#13#10'or generate a new one.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clSilver
    Font.Height = -27
    Font.Name = 'JetBrains Mono Medium'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    Layout = tlCenter
    ExplicitWidth = 459
    ExplicitHeight = 72
  end
  object pgclMain: TPageControl
    Left = 0
    Top = 0
    Width = 1179
    Height = 679
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ActivePage = tbstAnalysis
    Align = alClient
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Visible = False
    ExplicitWidth = 1233
    ExplicitHeight = 882
    object tbstAnalysis: TTabSheet
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Analysis'
      inline fAnalysis1: TfAnalysis
        Left = -8
        Top = 6
        Width = 1233
        Height = 705
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        TabOrder = 0
        ExplicitLeft = -8
        ExplicitTop = 6
        inherited lblStatus: TLabel
          Width = 368
          Height = 32
          ExplicitWidth = 368
          ExplicitHeight = 32
        end
      end
    end
    object pgstCharts: TTabSheet
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Charts'
      Enabled = False
      ImageIndex = 1
    end
  end
  object MainMenu: TMainMenu
    Left = 688
    object itemFile: TMenuItem
      Caption = 'File'
      object subItemOpenFile: TMenuItem
        Caption = 'Open file'
        OnClick = subItemOpenFileClick
      end
      object subItemGenerateFile: TMenuItem
        Caption = 'Generate file'
        OnClick = subItemGenerateFileClick
      end
    end
  end
  object OpenDialog: TOpenDialog
    Filter = #1060#1072#1081#1083' '#1079#1072#1087#1080#1089#1077#1081' '#1076#1083#1103' '#1072#1085#1072#1083#1080#1079#1072' (*.TDataRecord)|*.TDataRecord'
    Left = 832
  end
end
