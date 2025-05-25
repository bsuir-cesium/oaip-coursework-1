program HashShiftSquare;

{$R *.res}

uses
  Forms,
  System.SysUtils,
  uTypes in 'units\uTypes.pas',
  uHash in 'units\uHash.pas',
  uDataGenerator in 'units\uDataGenerator.pas',
  uLCG in 'units\uLCG.pas',
  uHashTable in 'units\uHashTable.pas',
  uCLI in 'units\uCLI.pas',
  ufMain in 'forms\ufMain.pas' {MainForm},
  uFiles in 'units\uFiles.pas',
  uAnalysis in 'units\uAnalysis.pas';

begin
//  Start;
  try
    setLength(keys, RECORDS_COUNT);

    Application.Initialize;
    Application.Title := 'DivAddHash';
    Application.CreateForm(TMainForm, MainForm);
  Application.Run;
  finally
    keys := nil;
  end;

end.
