program HashShiftSquare;

uses
  Vcl.Forms,
  SysUtils,
  Classes,
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

var
  I: Integer;

begin
  SetLength(keys, uTypes.RECORDS_COUNT);
  MainForm.isAnalys := False;
  MainForm.isBucketsCount := False;
  MainForm.isHashMethodLab := False;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Tablet Dark');
  Application.CreateForm(TfrmMain, frmMain);
  for I := Low(uTypes.TABLE_STEPS) to High(uTypes.TABLE_STEPS) do
     MainForm.frmMain.cbBucketsCount.Items.Add(IntToStr(uTypes.TABLE_STEPS[I]));
  Application.Run;


end.
