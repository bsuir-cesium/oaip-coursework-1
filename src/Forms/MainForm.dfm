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
    Style = tsButtons
    TabOrder = 0
    Visible = False
    object tbstAnalysis: TTabSheet
      Caption = 'Analysis'
      object lvStats: TListView
        Left = 0
        Top = 50
        Width = 470
        Height = 271
        Align = alClient
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
        TabOrder = 0
        ViewStyle = vsReport
        ExplicitTop = 53
        ExplicitWidth = 463
        ExplicitHeight = 265
      end
      object pnlAnalysisTop: TPanel
        Left = 0
        Top = 0
        Width = 470
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnlAnalysisTop'
        ShowCaption = False
        TabOrder = 1
        DesignSize = (
          470
          50)
        object lblStatus: TLabel
          Left = 311
          Top = 0
          Width = 159
          Height = 47
          Alignment = taCenter
          Anchors = [akLeft, akRight]
          AutoSize = False
          Caption = 'Here you can see'#13#10'inforamtional messages'
          Layout = tlCenter
        end
        object btnGetCharts: TButton
          Left = 166
          Top = 3
          Width = 139
          Height = 44
          Anchors = [akLeft, akTop, akBottom]
          Caption = 'Get charts'
          Enabled = False
          TabOrder = 0
          OnClick = btnGetChartsClick
        end
        object btnStartAnalysis: TButton
          Left = 0
          Top = 3
          Width = 161
          Height = 44
          Anchors = [akLeft, akTop, akBottom]
          Caption = 'Start analysis'
          TabOrder = 1
          OnClick = btnStartAnalysisClick
        end
      end
    end
    object tbstLaboratory: TTabSheet
      Caption = 'Laboratory'
      ImageIndex = 2
      object spltLab: TSplitter
        Left = 220
        Top = 0
        Width = 5
        Height = 321
        Color = clBtnShadow
        Constraints.MaxWidth = 5
        Constraints.MinWidth = 5
        ParentColor = False
        ResizeStyle = rsUpdate
      end
      object pnlLabLeft: TPanel
        Left = 0
        Top = 0
        Width = 220
        Height = 321
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'pnlLabLeft'
        ShowCaption = False
        TabOrder = 0
        ExplicitTop = 3
        ExplicitHeight = 318
        DesignSize = (
          220
          321)
        object lblRecordsName: TLabel
          Left = 0
          Top = 125
          Width = 220
          Height = 16
          Anchors = [akLeft, akTop, akRight]
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
        object lvSearchStat: TListView
          AlignWithMargins = True
          Left = 0
          Top = 271
          Width = 220
          Height = 66
          Anchors = [akLeft, akTop, akRight, akBottom]
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
          TabOrder = 0
          ViewStyle = vsReport
        end
        object btnCreateTable: TButton
          Left = 0
          Top = 77
          Width = 220
          Height = 35
          Margins.Bottom = 10
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Create table'
          Constraints.MinWidth = 220
          Enabled = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'JetBrains Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnCreateTableClick
        end
        object btnGetRandomKey: TButton
          Left = 0
          Top = 175
          Width = 220
          Height = 35
          Margins.Bottom = 10
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Get random key'
          Constraints.MinWidth = 220
          Enabled = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'JetBrains Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnGetRandomKeyClick
        end
        object cbHashMethodLab: TComboBox
          Left = 0
          Top = 3
          Width = 220
          Height = 24
          Margins.Bottom = 10
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 220
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'JetBrains Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = 'Select hash method'
          OnChange = cbHashMethodLabChange
          Items.Strings = (
            'Shift method'
            'Square method')
        end
        object cbBucketsCount: TComboBox
          Left = 0
          Top = 40
          Width = 220
          Height = 24
          Margins.Bottom = 10
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 220
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'JetBrains Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Text = 'Select buckets count'
          OnChange = cbBucketsCountChange
        end
        object btnSearch: TButton
          Left = 0
          Top = 223
          Width = 220
          Height = 35
          Margins.Bottom = 10
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Find record'
          Constraints.MinWidth = 220
          Enabled = False
          TabOrder = 5
          OnClick = btnSearchClick
        end
        object edKey: TEdit
          Left = 0
          Top = 147
          Width = 220
          Height = 24
          Margins.Bottom = 10
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 220
          Enabled = False
          TabOrder = 6
          Text = 'Ex A1B2C3'
        end
      end
      object pnlLabRight: TPanel
        Left = 225
        Top = 0
        Width = 245
        Height = 321
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlLabRight'
        ShowCaption = False
        TabOrder = 1
        ExplicitLeft = 247
        ExplicitTop = -2
        ExplicitWidth = 226
        ExplicitHeight = 323
        DesignSize = (
          245
          321)
        object lblBucketsNum: TLabel
          Left = 6
          Top = 6
          Width = 236
          Height = 15
          Anchors = [akLeft, akTop, akRight]
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
          AlignWithMargins = True
          Left = 6
          Top = 104
          Width = 235
          Height = 217
          Anchors = [akLeft, akTop, akRight, akBottom]
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
        object edBucket: TEdit
          Left = 6
          Top = 27
          Width = 239
          Height = 24
          Margins.Bottom = 10
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 220
          Enabled = False
          TabOrder = 1
          Text = 'Ex 8'
        end
        object btnGetBucket: TButton
          Left = 6
          Top = 63
          Width = 239
          Height = 35
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Get bucket'
          Constraints.MinWidth = 220
          Enabled = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'JetBrains Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnGetBucketClick
        end
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
