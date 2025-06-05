unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, uFiles, uTypes,
  uDataGenerator,
  Vcl.StdCtrls, uAnalysisFrame;

type
  TfrmMain = class(TForm)
    pgclMain: TPageControl;
    tbstAnalysis: TTabSheet;
    pgstCharts: TTabSheet;
    MainMenu: TMainMenu;
    itemFile: TMenuItem;
    OpenDialog: TOpenDialog;
    subItemOpenFile: TMenuItem;
    subItemGenerateFile: TMenuItem;
    lblStart: TLabel;
    fAnalysis1: TfAnalysis;
    procedure subItemOpenFileClick(Sender: TObject);
    procedure subItemGenerateFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.subItemOpenFileClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    uTypes.FilePath := OpenDialog.FileName;
    lblStart.Caption := 'It is can take some time';
    lblStart.Update;

    ReadKeysFromFile(uTypes.FilePath, uTypes.keys);
    lblStart.Visible := False;
    pgclMain.Visible := True;
    ShowMessage('File was loaded.');
  end;
end;

procedure TfrmMain.subItemGenerateFileClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    uTypes.FilePath := OpenDialog.FileName;
    lblStart.Caption := 'It is can take some time';
    lblStart.Update;

    GenerateTestData(uTypes.FilePath, uTypes.RECORDS_COUNT, keys);
    lblStart.Visible := False;
    pgclMain.Visible := True;
    ShowMessage('File "' + uTypes.FilePath + '" was generated.');
  end;

end;

end.
