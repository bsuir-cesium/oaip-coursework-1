object Charts: TCharts
  Left = 0
  Top = 0
  Caption = 'Charts'
  ClientHeight = 744
  ClientWidth = 1329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    1329
    744)
  TextHeight = 15
  object lblSquareMain: TLabel
    Left = 0
    Top = 8
    Width = 1338
    Height = 33
    Margins.Bottom = 20
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Square method'#39's charts'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'JetBrains Mono Medium'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    ExplicitWidth = 633
  end
  object lblShiftMain: TLabel
    Left = 0
    Top = 368
    Width = 1329
    Height = 49
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Shift method'#39's charts'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'JetBrains Mono Medium'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object chrtSquareBuckets: TChart
    Left = 0
    Top = 48
    Width = 657
    Height = 314
    Title.Font.Color = 16711808
    Title.Font.Height = -13
    Title.Font.Name = 'Bahnschrift Light'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'Fullness')
    Title.VertMargin = 0
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = -2
    ColorPalette = (
      16632904
      5098886
      10132122
      8704759
      9985862
      4284326
      4750236
      13787532
      11308661
      297471
      4078050
      9949621)
  end
  object chrtSquareSearch: TChart
    Left = 672
    Top = 48
    Width = 657
    Height = 314
    Title.Font.Color = 16711808
    Title.Font.Height = -13
    Title.Font.Name = 'Bahnschrift Light'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'Search time')
    Title.VertMargin = 0
    TabOrder = 1
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
  end
  object chrtShiftBuckets: TChart
    Left = 0
    Top = 423
    Width = 657
    Height = 314
    Title.Font.Color = 16711808
    Title.Font.Height = -13
    Title.Font.Name = 'Bahnschrift Light'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'Fullness')
    Title.VertMargin = 0
    TabOrder = 2
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
  end
  object chrtShiftSearch: TChart
    Left = 672
    Top = 422
    Width = 657
    Height = 314
    Title.Font.Color = 16711808
    Title.Font.Height = -13
    Title.Font.Name = 'Bahnschrift Light'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'Search time')
    Title.VertMargin = 0
    TabOrder = 3
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
  end
end
