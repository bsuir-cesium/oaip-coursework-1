unit uAnalysisFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, uHashTable, uTypes, uHash, uAnalysis;

type
  TfAnalysis = class(TFrame)
    cbHashMethod: TComboBox;
    btnStartAnalysis: TButton;
    lvStats: TListView;
    lblStatus: TLabel;
    procedure cbHashMethodChange(Sender: TObject);
    procedure btnStartAnalysisClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdateStats(statistic: TStatistic);
  end;

var
  isAnalys: Boolean;

implementation

{$R *.dfm}

procedure TfAnalysis.btnStartAnalysisClick(Sender: TObject);
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
    try
      HashTable := THashTable.Create(HashFunc, uTypes.TABLE_STEPS[I]);
      Statistics[I] := AnalysForTables(HashTable, FilePath, keys);

    finally
      HashTable.Free;
    end;
  end;
  isAnalys := False;
  lblStatus.Caption := 'Done!';
  lblStatus.Update;
end;

procedure TfAnalysis.cbHashMethodChange(Sender: TObject);
begin
  btnStartAnalysis.Enabled := True;
end;

procedure TfAnalysis.UpdateStats(statistic: TStatistic);
var
  NewItem: TListItem;
begin
  NewItem := lvStats.Items.Add;
  with statistic do
  begin
    NewItem.Caption := IntToStr(TableSize);
    NewItem.SubItems.Add(IntToStr(Main));
    NewItem.SubItems.Add(IntToStr(Collisions));
  end;
end;

end.
