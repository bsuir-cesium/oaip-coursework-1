unit uDataGenerator;

interface

uses
  uTypes, uLCG, SysUtils, DateUtils;

procedure GenerateTestData(const FileName: string; RecordCount: Integer; var keys: TOccupiedKeys);

implementation

procedure GenerateTestData(const FileName: string; RecordCount: Integer; var keys: TOccupiedKeys);
var
  LCG: TLCG;
  F: File of TDataRecord;
  i: Integer;
  Rec: TDataRecord;
  key: TKey;
begin
  LCG := TLCG.Create(1103515245, 2147483648, DateTimeToUnix(Now));

  try
    AssignFile(F, FileName);
    Rewrite(F);

    for i := 1 to RecordCount do
    begin
      Rec.Key := LCG.NextKey;
      keys[i-1] := Rec.Key;
      Rec.Name := 'Info_' + IntToStr(i);
      Rec.Value := Random(1000);
      Write(F, Rec);
    end;

    CloseFile(F);
  finally
    LCG.Free;
  end;
end;

end.
