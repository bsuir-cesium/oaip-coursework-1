unit ufMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  uDataGenerator, uTypes, uFiles, uHash, uHashTable, uAnalysis, Vcl.ComCtrls;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    FileItem: TMenuItem;
    OpenFileSubItem: TMenuItem;
    GenerateFileSubItem: TMenuItem;
    OpenFileDialog: TOpenDialog;
    StartLabel: TLabel;
    btnStartAnalysis: TButton;
    cbHashMethod: TComboBox;
    lvResults: TListView;
    Button1: TButton;
    procedure OpenFileSubItemClick(Sender: TObject);
    procedure GenerateFileSubItemClick(Sender: TObject);
    procedure btnStartAnalysisClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdateResults(statistic: TStatistic);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.btnStartAnalysisClick(Sender: TObject);
var
  I: Integer;
  HashTable: THashTable;
  HashFunc: THashFunc;
begin
  lvResults.Items.Clear;

  HashTable := nil;
  if cbHashMethod.Text = 'Shift method' then
    HashFunc := uHash.ShiftHash
  else if cbHashMethod.Text = 'Square method' then
    HashFunc := uHash.SquareHash
  else
  begin
    ShowMessage('You must select a hash method!');
    Exit;
  end;

  for I := Low(uTypes.TABLE_STEPS) to High(uTypes.TABLE_STEPS) do
  begin
    try
      HashTable := THashTable.Create(HashFunc, uTypes.TABLE_STEPS[I]);
      Statistics[I] := AnalysForTables(HashTable, FilePath, keys);
      UpdateResults(Statistics[I]);

    finally
      HashTable.Free;
    end;
  end;
end;

procedure TMainForm.GenerateFileSubItemClick(Sender: TObject);
begin
  if OpenFileDialog.Execute then
  begin
    FilePath := OpenFileDialog.FileName;

    StartLabel.Caption := 'It is can take some time...';
    StartLabel.Update;

    GenerateTestData(FilePath, uTypes.RECORDS_COUNT, keys);
    ShowMessage('File saved to: ' + FilePath);

    StartLabel.Visible := False;
    btnStartAnalysis.Visible := True;
    cbHashMethod.Visible := True;
    lvResults.Visible := True;
  end;
end;

procedure TMainForm.OpenFileSubItemClick(Sender: TObject);
begin
  if OpenFileDialog.Execute then
  begin
    FilePath := OpenFileDialog.FileName;
    StartLabel.Caption := 'It is can take some time...';
    StartLabel.Update;

    ReadKeysFromFile(FilePath, keys);
    ShowMessage('File was loaded');

    StartLabel.Visible := False;
    btnStartAnalysis.Visible := True;
    cbHashMethod.Visible := True;
    lvResults.Visible := True;
  end;

end;

procedure TMainForm.UpdateResults(statistic: TStatistic);
var
  item: TListItem;
begin
  item := lvResults.Items.Add;
  item.Caption := IntToStr(statistic.TableSize);
  item.SubItems.Add(IntToStr(statistic.Main));
  item.SubItems.Add(IntToStr(statistic.Collisions));
end;

end.
