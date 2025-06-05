unit uAnalysis;

interface

uses
  uTypes, uHashTable;

function AnalysForTables(var HashTable: THashTable; FileName: String;
  const keys: TOccupiedKeys): TStatistic;

implementation

function AnalysForTables(var HashTable: THashTable; FileName: String;
  const keys: TOccupiedKeys): TStatistic;
var
  data: TStatistic;
begin
  HashTable.LoadFromFile(FileName);
  HashTable.SearchFromKeys(keys);
  with data do
  begin
    TableSize := HashTable.TableSize;
    BucketSize := HashTable.BucketSize;
    Main := HashTable.Main;
    Collisions := HashTable.Collisions;
    InsertTime := HashTable.InsertTime;
    SearchTime := HashTable.SearchTime;
  end;

  result := data;
end;

end.
