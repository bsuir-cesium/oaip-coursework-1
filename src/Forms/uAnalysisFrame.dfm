object fAnalysis: TfAnalysis
  Left = 0
  Top = 0
  Width = 503
  Height = 336
  Margins.Left = 6
  Margins.Top = 6
  Margins.Right = 6
  Margins.Bottom = 6
  Align = alClient
  Anchors = [akLeft, akTop, akRight]
  Padding.Left = 10
  Padding.Top = 10
  Padding.Right = 10
  Padding.Bottom = 10
  TabOrder = 0
  PixelsPerInch = 192
  DesignSize = (
    503
    336)
  object lblStatus: TLabel
    Left = 272
    Top = 0
    Width = 182
    Height = 15
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Alignment = taCenter
    Anchors = []
    Caption = 'Here you can check analysis status'
    Layout = tlCenter
  end
  object cbHashMethod: TComboBox
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 249
    Height = 23
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
    Left = 0
    Top = 35
    Width = 249
    Height = 81
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Anchors = []
    Caption = 'Start analysis'
    Enabled = False
    TabOrder = 0
    OnClick = btnStartAnalysisClick
  end
  object ListView1: TListView
    Left = 0
    Top = 136
    Width = 497
    Height = 199
    Columns = <>
    TabOrder = 2
  end
end
