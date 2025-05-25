object FileForm: TFileForm
  Left = 0
  Top = 0
  Caption = 'FileForm'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object grpFileActions: TGroupBox
    Left = 232
    Top = 192
    Width = 185
    Height = 105
    Caption = 'Choose an action with file'
    TabOrder = 0
    object btnChooseFile: TButton
      Left = 56
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Choose file'
      TabOrder = 0
      OnClick = btnChooseFileClick
    end
    object btnGenerateFile: TButton
      Left = 56
      Top = 71
      Width = 75
      Height = 25
      Caption = 'Generate file'
      TabOrder = 1
    end
  end
  object OpenFileDialog: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' '#1079#1072#1087#1080#1089#1077#1081' '#1072#1085#1072#1083#1080#1079#1072' (*.TDataRecord)|*.TDataRecord'
    Left = 136
    Top = 312
  end
end
