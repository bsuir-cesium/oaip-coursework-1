program HashShiftSquare;

uses
  Vcl.Forms,
  MainForm in 'Forms\MainForm.pas' {frmMain},
  uHashTable in 'Units\uHashTable.pas',
  uTypes in 'Units\uTypes.pas',
  uDataGenerator in 'Units\uDataGenerator.pas',
  uLCG in 'Units\uLCG.pas',
  uFiles in 'Units\uFiles.pas',
  uHash in 'Units\uHash.pas',
  uAnalysis in 'Units\uAnalysis.pas',
  Vcl.Themes,
  Vcl.Styles,
  uAnalysisFrame in 'Forms\uAnalysisFrame.pas' {fAnalysis: TfAnalysis};

{$R *.res}

begin
  SetLength(keys, uTypes.RECORDS_COUNT);
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Tablet Dark');
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
