object frmMain: TfrmMain
  AlignWithMargins = True
  Left = 0
  Top = 0
  Margins.Left = 6
  Margins.Top = 6
  Margins.Right = 6
  Margins.Bottom = 6
  Align = alClient
  Anchors = [akLeft, akTop, akRight]
  Caption = 'HashShiftSquare'
  ClientHeight = 730
  ClientWidth = 974
  Color = clBtnFace
  Constraints.MinHeight = 840
  Constraints.MinWidth = 1000
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -24
  Font.Name = 'JetBrains Mono'
  Font.Style = []
  Menu = MainMenu
  Position = poDesktopCenter
  PixelsPerInch = 192
  TextHeight = 31
  object lblStart: TLabel
    Left = 0
    Top = 0
    Width = 974
    Height = 730
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alClient
    Alignment = taCenter
    Caption = 'You need to select the file'#13#10'or generate a new one.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clSilver
    Font.Height = -28
    Font.Name = 'JetBrains Mono Medium'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    Layout = tlCenter
    ExplicitWidth = 486
    ExplicitHeight = 74
  end
  object pgclMain: TPageControl
    AlignWithMargins = True
    Left = 6
    Top = 6
    Width = 962
    Height = 718
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ActivePage = tbstCharts
    Align = alClient
    Anchors = [akLeft, akTop, akRight]
    Style = tsButtons
    TabOrder = 0
    Visible = False
    object tbstAnalysis: TTabSheet
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Analysis'
      DesignSize = (
        954
        669)
      object lblStatus: TLabel
        Left = 343
        Top = 2
        Width = 604
        Height = 178
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Alignment = taCenter
        Anchors = []
        AutoSize = False
        Caption = 'Here you can see'#13#10'inforamtional messages'
        Layout = tlCenter
        ExplicitLeft = 334
        ExplicitTop = -2
      end
      object cbHashMethod: TComboBox
        Left = 0
        Top = 0
        Width = 322
        Height = 39
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        TabOrder = 0
        Text = 'Select a hash metod'
        OnChange = cbHashMethodChange
        Items.Strings = (
          'Shift method'
          'Square method')
      end
      object btnStartAnalysis: TButton
        Left = 0
        Top = 74
        Width = 322
        Height = 88
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = 'btnStartAnalysis'
        Enabled = False
        TabOrder = 1
        OnClick = btnStartAnalysisClick
      end
      object lvStats: TListView
        Left = 0
        Top = 190
        Width = 948
        Height = 475
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clBtnFace
        Columns = <
          item
            AutoSize = True
            Caption = 'Buckets'
          end
          item
            AutoSize = True
            Caption = 'Main'
          end
          item
            AutoSize = True
            Caption = 'Overflow'
          end>
        GridLines = True
        RowSelect = True
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        ViewStyle = vsReport
      end
    end
    object tbstCharts: TTabSheet
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Charts'
      Enabled = False
      ImageIndex = 1
    end
    object tbstLaboratory: TTabSheet
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Laboratory'
      ImageIndex = 2
      object lblRecordsName: TLabel
        Left = 0
        Top = 250
        Width = 440
        Height = 32
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Record'#39's name'
        Constraints.MinWidth = 440
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'JetBrains Mono'
        Font.Style = []
        ParentFont = False
      end
      object lblBucketsNum: TLabel
        Left = 494
        Top = 12
        Width = 440
        Height = 30
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Bucket'#39's number'
        Constraints.MinWidth = 440
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'JetBrains Mono'
        Font.Style = []
        ParentFont = False
      end
      object lvBucket: TListView
        Left = 494
        Top = 208
        Width = 440
        Height = 434
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Columns = <
          item
            AutoSize = True
            Caption = 'ID'
          end
          item
            AutoSize = True
            Caption = 'Name'
          end
          item
            AutoSize = True
            Caption = 'Value'
          end>
        Constraints.MinWidth = 440
        GridLines = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object cbBucketsCount: TComboBox
        Left = 0
        Top = 80
        Width = 440
        Height = 39
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 20
        Constraints.MinWidth = 440
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'JetBrains Mono'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'Select buckets count'
        OnChange = cbBucketsCountChange
      end
      object cbHashMethodLab: TComboBox
        Left = 0
        Top = 6
        Width = 440
        Height = 39
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 20
        Constraints.MinWidth = 440
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'JetBrains Mono'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = 'Select hash method'
        OnChange = cbHashMethodLabChange
        Items.Strings = (
          'Shift method'
          'Square method')
      end
      object btnCreateTable: TButton
        Left = 0
        Top = 154
        Width = 440
        Height = 70
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 20
        Caption = 'Create table'
        Constraints.MinWidth = 440
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'JetBrains Mono'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btnCreateTableClick
      end
      object edKey: TEdit
        Left = 0
        Top = 294
        Width = 440
        Height = 39
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 20
        Constraints.MinWidth = 440
        Enabled = False
        TabOrder = 4
        Text = 'Ex A1B2C3'
      end
      object lvSearchStat: TListView
        Left = 0
        Top = 558
        Width = 440
        Height = 96
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Columns = <
          item
            AutoSize = True
            Caption = 'Bucket'
          end
          item
            AutoSize = True
            Caption = 'S. Time'
          end>
        Constraints.MinHeight = 96
        Constraints.MinWidth = 440
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'JetBrains Mono'
        Font.Style = []
        GridLines = True
        ParentFont = False
        TabOrder = 5
        ViewStyle = vsReport
      end
      object btnSearch: TButton
        Left = 0
        Top = 462
        Width = 440
        Height = 70
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 20
        Caption = 'Find record'
        Constraints.MinWidth = 440
        Enabled = False
        TabOrder = 6
        OnClick = btnSearchClick
      end
      object edBucket: TEdit
        Left = 494
        Top = 54
        Width = 440
        Height = 39
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 20
        Constraints.MinWidth = 440
        Enabled = False
        TabOrder = 7
        Text = 'Ex 8'
      end
      object btnGetBucket: TButton
        Left = 494
        Top = 126
        Width = 440
        Height = 70
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = 'Get bucket'
        Constraints.MinWidth = 440
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'JetBrains Mono'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = btnGetBucketClick
      end
      object btnGetRandomKey: TButton
        Left = 0
        Top = 366
        Width = 440
        Height = 70
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 20
        Caption = 'Get random key'
        Constraints.MinWidth = 440
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'JetBrains Mono'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = btnGetRandomKeyClick
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 304
    Top = 65504
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
    Left = 232
    Top = 65504
  end
end
