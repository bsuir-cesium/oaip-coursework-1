object frmMain: TfrmMain
  AlignWithMargins = True
  Left = 0
  Top = 0
  Caption = 'HashShiftSquare'
  ClientHeight = 361
  ClientWidth = 484
  Color = clBtnFace
  Constraints.MinHeight = 420
  Constraints.MinWidth = 500
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'JetBrains Mono'
  Font.Style = []
  Menu = MainMenu
  Position = poDefault
  PrintScale = poNone
  Scaled = False
  TextHeight = 16
  object lblStart: TLabel
    Left = 0
    Top = 0
    Width = 484
    Height = 361
    Align = alClient
    Alignment = taCenter
    Caption = 'You need to select the file'#13#10'or generate a new one.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clSilver
    Font.Height = -14
    Font.Name = 'JetBrains Mono Medium'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    Layout = tlCenter
    ExplicitWidth = 243
    ExplicitHeight = 36
  end
  object pgclMain: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 478
    Height = 355
    ActivePage = tbstLaboratory
    Align = alClient
    Anchors = [akLeft, akTop, akRight]
    Style = tsButtons
    TabOrder = 0
    Visible = False
    object tbstAnalysis: TTabSheet
      Caption = 'Analysis'
      DesignSize = (
        470
        321)
      object lblStatus: TLabel
        Left = 312
        Top = 0
        Width = 151
        Height = 47
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Here you can see'#13#10'inforamtional messages'
        Layout = tlCenter
        ExplicitWidth = 159
      end
      object btnStartAnalysis: TButton
        Left = 0
        Top = 3
        Width = 161
        Height = 44
        Caption = 'Start analysis'
        TabOrder = 0
        OnClick = btnStartAnalysisClick
      end
      object lvStats: TListView
        Left = 0
        Top = 53
        Width = 463
        Height = 265
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clBtnFace
        Columns = <
          item
            AutoSize = True
            Caption = 'Method'
          end
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
        TabOrder = 1
        ViewStyle = vsReport
        ExplicitWidth = 471
        ExplicitHeight = 295
      end
      object btnGetCharts: TButton
        Left = 167
        Top = 3
        Width = 139
        Height = 44
        Caption = 'Get charts'
        Enabled = False
        TabOrder = 2
        OnClick = btnGetChartsClick
      end
    end
    object tbstLaboratory: TTabSheet
      Caption = 'Laboratory'
      ImageIndex = 2
      DesignSize = (
        470
        321)
      object lblRecordsName: TLabel
        Left = 0
        Top = 125
        Width = 220
        Height = 16
        AutoSize = False
        Caption = 'Record'#39's name'
        Constraints.MinWidth = 220
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'JetBrains Mono'
        Font.Style = []
        ParentFont = False
      end
      object lblBucketsNum: TLabel
        Left = 247
        Top = 6
        Width = 220
        Height = 15
        AutoSize = False
        Caption = 'Bucket'#39's number'
        Constraints.MinWidth = 220
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'JetBrains Mono'
        Font.Style = []
        ParentFont = False
      end
      object lvBucket: TListView
        Left = 247
        Top = 104
        Width = 220
        Height = 219
        Anchors = [akLeft, akTop, akBottom]
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
        Constraints.MinWidth = 220
        GridLines = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object cbBucketsCount: TComboBox
        Left = 0
        Top = 40
        Width = 220
        Height = 24
        Margins.Bottom = 10
        Constraints.MinWidth = 220
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'JetBrains Mono'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'Select buckets count'
        OnChange = cbBucketsCountChange
      end
      object cbHashMethodLab: TComboBox
        Left = 0
        Top = 3
        Width = 220
        Height = 24
        Margins.Bottom = 10
        Constraints.MinWidth = 220
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Top = 77
        Width = 220
        Height = 35
        Margins.Bottom = 10
        Caption = 'Create table'
        Constraints.MinWidth = 220
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'JetBrains Mono'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btnCreateTableClick
      end
      object edKey: TEdit
        Left = 0
        Top = 147
        Width = 220
        Height = 24
        Margins.Bottom = 10
        Constraints.MinWidth = 220
        Enabled = False
        TabOrder = 4
        Text = 'Ex A1B2C3'
      end
      object lvSearchStat: TListView
        Left = 0
        Top = 279
        Width = 220
        Height = 48
        Columns = <
          item
            AutoSize = True
            Caption = 'Bucket'
          end
          item
            AutoSize = True
            Caption = 'Name'
          end
          item
            AutoSize = True
            Caption = 'Value'
          end>
        Constraints.MinHeight = 48
        Constraints.MinWidth = 220
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'JetBrains Mono'
        Font.Style = []
        GridLines = True
        ParentFont = False
        TabOrder = 5
        ViewStyle = vsReport
      end
      object btnSearch: TButton
        Left = 0
        Top = 231
        Width = 220
        Height = 35
        Margins.Bottom = 10
        Caption = 'Find record'
        Constraints.MinWidth = 220
        Enabled = False
        TabOrder = 6
        OnClick = btnSearchClick
      end
      object edBucket: TEdit
        Left = 247
        Top = 27
        Width = 220
        Height = 24
        Margins.Bottom = 10
        Constraints.MinWidth = 220
        Enabled = False
        TabOrder = 7
        Text = 'Ex 8'
      end
      object btnGetBucket: TButton
        Left = 247
        Top = 63
        Width = 220
        Height = 35
        Caption = 'Get bucket'
        Constraints.MinWidth = 220
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'JetBrains Mono'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = btnGetBucketClick
      end
      object btnGetRandomKey: TButton
        Left = 0
        Top = 183
        Width = 220
        Height = 35
        Margins.Bottom = 10
        Caption = 'Get random key'
        Constraints.MinWidth = 220
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
