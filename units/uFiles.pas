unit uFiles;


interface

uses
  uTypes;

procedure ReadKeysFromFile(const FileName: String; var keys: TOccupiedKeys);

implementation

procedure ReadKeysFromFile(const FileName: String; var keys: TOccupiedKeys);
var
  F: File of TDataRecord;
  Rec: TDataRecord;
  i: Integer;
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
end;

end.
