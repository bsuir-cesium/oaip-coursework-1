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
  Choice, I, counted: Integer;
  data: TStatistic;
begin
  HashTable.LoadFromFile(FileName);
//  HashTable.SearchFromKeys(keys);
  data.TableSize := HashTable.TableSize;
  data.BucketSize := HashTable.BucketSize;
  data.Main := HashTable.Main;
  data.Collisions := HashTable.Collisions;
//  data.InsertTime := HashTable.InsertTime;
//  data.SearchTime := HashTable.SearchTime;

  result := data;
end;

end.
