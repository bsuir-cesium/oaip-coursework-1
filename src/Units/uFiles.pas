unit uFiles;


interface

uses
  uTypes, uLCG, DateUtils, SysUtils;

procedure ReadKeysFromFile(const FileName: String; var keys: TOccupiedKeys);

implementation

procedure ReadKeysFromFile(const FileName: String; var keys: TOccupiedKeys);
var
  F: File of TDataRecord;
  Rec: TDataRecord;
  i, index: Integer;
  LCG: TLCG;
  Now: TDateTime;
begin
  i := 0;
  try
    AssignFile(F, FileName);
    Reset(F);

    while not EOF(F) do
    begin
      Read(F, Rec);
      keys[i] := Rec.Key;
      Inc(i);
    end;

  finally
    CloseFile(F);
  end;
  LCG := TLCG.Create(1103515245, 2147483648, DateTimeToUnix(Now));
  index := uTypes.RECORDS_COUNT;
  try
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

