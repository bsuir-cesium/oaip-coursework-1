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
    procedure btnGetRandomKeyClick(Sender: TObject);
    procedure btnGetBucketClick(Sender: TObject);
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
  edKey.Enabled := True;
  edBucket.Enabled := True;
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

procedure TfrmMain.btnGetBucketClick(Sender: TObject);
var
  Index, I: Integer;
  Bucket: uTypes.TBucket;
  item: TListItem;
  TempNode: uTypes.PChainNode;
begin
  if not TryStrToInt(edBucket.Text, Index) then
  begin
    ShowMessage('Not a valid number.');
    Exit;
  end;
  if not HashTableLab.GetBucket(Index - 1, Bucket) then
  begin
    ShowMessage('Bucket is not found.');
    Exit;
  end;
  lvBucket.Items.Clear;
  for I := Low(Bucket.Data) to High(Bucket.Data) do
  begin
    item := lvBucket.Items.Add;
    item.Caption := Bucket.Data[I].Key;
    item.SubItems.Add(Bucket.Data[I].Name);
    item.SubItems.Add(IntToStr(Bucket.Data[I].Value));
  end;

  TempNode := Bucket.Overflow;
  while TempNode <> nil do
  begin
    item := lvBucket.Items.Add;
    item.Caption := TempNode^.Data.Key;
    item.SubItems.Add(TempNode^.Data.Name);
    item.SubItems.Add(IntToStr(TempNode^.Data.Value));
    TempNode := TempNode^.Next;
  end;
end;

procedure TfrmMain.btnGetRandomKeyClick(Sender: TObject);
var
  I: UInt32;
begin
  I := Random(1_000_000);
  edKey.Text := keys[I];
end;

procedure TfrmMain.btnSearchClick(Sender: TObject);
var
  key: uTypes.TKey;
  Data: uTypes.TSearchDataRecord;
  item: TListItem;
  isFinded: Boolean;
begin
  key := uTypes.TKey(edKey.Text);
  isFinded := HashTableLab.Find(key, Data);
  if not isFinded then
  begin
    ShowMessage('Record is not find');
    Exit;
  end;
  lvSearchStat.Items.Clear;
  item := lvSearchStat.Items.Add;
  with Data do
  begin
    item.Caption := IntToStr(Bucket);
    item.SubItems.Add(FloatToStr(Time));
  end;
end;

procedure TfrmMain.btnStartAnalysisClick(Sender: TObject);
var
  HashTable: THashTable;
  HashFunc: THashFunc;
  I: Integer;
  item: TListItem;
begin
  lvStats.Items.Clear;
  isAnalys := True;
  lblStatus.Caption := 'Awaiting...';
  btnStartAnalysis.Enabled := False;
  lblStatus.Update;
  HashTable := nil;
  if cbHashMethod.Text = 'Shift method' then
    HashFunc := uHash.ShiftHash
  else
    HashFunc := uHash.SquareHash;

  for I := Low(uTypes.TABLE_STEPS) to High(uTypes.TABLE_STEPS) do
  begin
    try
      HashTable := THashTable.Create(HashFunc, uTypes.TABLE_STEPS[I]);
      Statistics[I] := AnalysForTables(HashTable, FilePath, keys);
      item := lvStats.Items.Add;
      with Statistics[I] do
      begin
        item.Caption := IntToStr(TableSize);
        item.SubItems.Add(IntToStr(Main));
        item.SubItems.Add(IntToStr(Collisions));
      end;
    finally
      Application.ProcessMessages;
      HashTable.Free;
    end;
  end;
  tbstCharts.Enabled := True;
  isAnalys := False;
  lblStatus.Caption := 'Done!';
  lblStatus.Update;

  btnStartAnalysis.Enabled := True;
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
end;

end.
