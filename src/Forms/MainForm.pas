unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, uFiles, uTypes,
  uDataGenerator,
  Vcl.StdCtrls, uAnalysisFrame, uAnalysis, uHash, uHashTable;

type
  TfrmMain = class(TForm)
    pgclMain: TPageControl;
    tbstAnalysis: TTabSheet;
    tbstCharts: TTabSheet;
    MainMenu: TMainMenu;
    itemFile: TMenuItem;
    OpenDialog: TOpenDialog;
    subItemOpenFile: TMenuItem;
    subItemGenerateFile: TMenuItem;
    lblStart: TLabel;
    cbHashMethod: TComboBox;
    btnStartAnalysis: TButton;
    lvStats: TListView;
    lblStatus: TLabel;
    tbstLaboratory: TTabSheet;
    lvBucket: TListView;
    cbBucketsCount: TComboBox;
    cbHashMethodLab: TComboBox;
    btnCreateTable: TButton;
    edKey: TEdit;
    lblRecordsName: TLabel;
    lvSearchStat: TListView;
    btnSearch: TButton;
    lblBucketsNum: TLabel;
    edBucket: TEdit;
    btnGetBucket: TButton;
    btnGetRandomKey: TButton;
    procedure subItemOpenFileClick(Sender: TObject);
    procedure subItemGenerateFileClick(Sender: TObject);
    procedure btnStartAnalysisClick(Sender: TObject);
    procedure cbHashMethodChange(Sender: TObject);
    procedure btnCreateTableClick(Sender: TObject);
    procedure cbHashMethodLabChange(Sender: TObject);
    procedure cbBucketsCountChange(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdateStatistic(const Statistic: TStatistic);
  end;

var
  frmMain: TfrmMain;
  isAnalys, isBucketsCount, isHashMethodLab: Boolean;
  HashTableLab: THashTable;

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

procedure TfrmMain.btnCreateTableClick(Sender: TObject);
var
  TableSize: UInt32;
  HashFunc: THashFunc;
  I: Integer;
begin
  if cbHashMethodLab.Text = 'Shift metod' then
    HashFunc := uHash.ShiftHash
  else
    HashFunc := uHash.SquareHash;

  TableSize := StrToInt(cbBucketsCount.Text);
  HashTableLab := THashTable.Create(HashFunc, TableSize);
  HashTableLab.LoadFromFile(uTypes.FilePath);
  btnSearch.Enabled := True;
  btnGetBucket.Enabled := True;
  btnGetRandomKey.Enabled := True;
  ShowMessage('Table was succesfully created.');
end;

procedure TfrmMain.cbBucketsCountChange(Sender: TObject);
begin
  isBucketsCount := True;
  if isBucketsCount and isHashMethodLab then
    btnCreateTable.Enabled := True;
end;

procedure TfrmMain.cbHashMethodChange(Sender: TObject);
begin
  btnStartAnalysis.Enabled := True;
end;

procedure TfrmMain.cbHashMethodLabChange(Sender: TObject);
begin
  isHashMethodLab := True;
  if isBucketsCount and isHashMethodLab then
    btnCreateTable.Enabled := True;
end;

procedure TfrmMain.btnSearchClick(Sender: TObject);
var
  key: uTypes.TKey;
  data: uTypes.TSearchDataRecord;
  item: TListItem;
  isFinded: Boolean;
begin
  key := uTypes.TKey(edKey.Text);
  isFinded := HashTableLab.Find(key, data);
  if not isFinded then
  begin
    ShowMessage('Record is not find');
    Exit;
  end;
  item := lvSearchStat.Items.Add;
  with data do
  begin
    item.Caption := IntToStr(Bucket);
    item.SubItems.Add(FloatToStr(Time));
  end;
  ShowMessage('Record is not find');
end;

procedure TfrmMain.btnStartAnalysisClick(Sender: TObject);
var
  HashTable: THashTable;
  HashFunc: THashFunc;
  I: Integer;
begin
  lvStats.Items.Clear;
  isAnalys := True;
  lblStatus.Caption := 'Awaiting...';
  lblStatus.Update;
  HashTable := nil;
  if cbHashMethod.Text = 'Shift method' then
    HashFunc := uHash.ShiftHash
  else
    HashFunc := uHash.SquareHash;

  for I := Low(uTypes.TABLE_STEPS) to High(uTypes.TABLE_STEPS) do
  begin
    Application.ProcessMessages;
    try
      HashTable := THashTable.Create(HashFunc, uTypes.TABLE_STEPS[I]);
      Statistics[I] := AnalysForTables(HashTable, FilePath, keys);
    finally
      HashTable.Free;
    end;
  end;
  for I := Low(Statistics) to High(Statistics) do
    UpdateStatistic(Statistics[I]);
  tbstCharts.Enabled := True;
  isAnalys := False;
  lblStatus.Caption := 'Done!';
  lblStatus.Update;
end;

procedure TfrmMain.UpdateStatistic(const Statistic: TStatistic);
var
  item: TListItem;
begin
  item := lvStats.Items.Add;
  with Statistic do
  begin
    item.Caption := IntToStr(TableSize);
    item.SubItems.Add(IntToStr(Main));
    item.SubItems.Add(IntToStr(Collisions));
  end;
  lvStats.Invalidate;
end;

end.
