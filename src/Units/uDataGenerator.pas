unit uDataGenerator;

interface

uses
  uTypes, uLCG, SysUtils, DateUtils, Windows;

procedure GenerateTestData(const FileName: string; RecordCount: Integer;
  var keys: TOccupiedKeys);

implementation

function HighPrecisionSeed: UInt64;
var
  Counter: Int64;
begin
  QueryPerformanceCounter(Counter);
  Result := UInt64(Counter) xor (UInt64(GetTickCount) shl 32);
end;

procedure GenerateTestData(const FileName: string; RecordCount: Integer;
  var keys: TOccupiedKeys);
var
  LCG: TLCG;
  F: File of TDataRecord;
  i, index: Integer;
  Rec: TDataRecord;
begin
  LCG := TLCG.Create(1103515245, 2147483648, DateTimeToUnix(Now));
  index := 0;
  try
    AssignFile(F, FileName);
    Rewrite(F);

    for i := 1 to RecordCount do
    begin
      Rec.Key := LCG.NextKey;
      keys[index] := Rec.Key;
      Rec.Name := TName('Info_' + IntToStr(i));
      Rec.Value := Random(1000);
      Write(F, Rec);
      Inc(Index);
    end;
    CloseFile(F);
    for i := 1 to 200 do
    begin
      keys[index] := LCG.NextKey;
      Inc(Index);
    end;
  finally
    LCG.Free;
  end;
end;

end.
