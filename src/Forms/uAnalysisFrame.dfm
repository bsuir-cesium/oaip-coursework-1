object fAnalysis: TfAnalysis
  Left = 0
  Top = 0
  Width = 1233
  Height = 705
  Margins.Left = 6
  Margins.Top = 6
  Margins.Right = 6
  Margins.Bottom = 6
  TabOrder = 0
  PixelsPerInch = 192
  DesignSize = (
    1233
    705)
  object lblStatus: TLabel
    Left = 368
    Top = 32
    Width = 500
    Height = 49
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Here you can check analysis status'
    Layout = tlCenter
  end
  object cbHashMethod: TComboBox
    AlignWithMargins = True
    Left = 457
    Top = 128
    Width = 320
    Height = 40
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    TabOrder = 1
    OnChange = cbHashMethodChange
    Items.Strings = (
      'Shift method'
      'Square method')
  end
  object btnStartAnalysis: TButton
    Left = 457
    Top = 208
    Width = 320
    Height = 81
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Start analysis'
    Enabled = False
    TabOrder = 0
    OnClick = btnStartAnalysisClick
  end
  object lvStats: TListView
    Left = 368
    Top = 336
    Width = 500
    Height = 300
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Columns = <
      item
        Caption = 'Buckets'
      end
      item
        Caption = 'Main'
      end
      item
        Caption = 'Overflow'
      end>
    TabOrder = 2
  end
end
