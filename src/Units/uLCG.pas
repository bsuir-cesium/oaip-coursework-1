unit uLCG;

interface

uses
  uTypes;

type
  TLCG = class
  private
    FSeed: Int64; // ������� �������� ����������
    FA: Int64; // ��������� (a)
    FM: Int64; // ������ (m)
  public
    constructor Create(A, M, Seed: Int64);
    function Next: Int64;
    function NextKey: TKey;
  end;

implementation

constructor TLCG.Create(A, M, Seed: Int64);
begin
  FA := A;
  FM := M;
  FSeed := Seed;
end;

function TLCG.Next: Int64;
begin
  FSeed := (FA * FSeed) mod FM;
  Result := FSeed;
end;

function TLCG.NextKey: TKey;
var
  Num: Int64;
  Chars: array [0 .. 5] of Char;
  i: Integer;
begin
  Num := Next;
  for i := 0 to 5 do
  begin
    case i mod 2 of
      0:
        Chars[i] := Chr(Ord('A') + (Num mod 26));
      1:
        Chars[i] := Chr(Ord('0') + (Num mod 10));
    end;
    Num := Num div 10;
  end;
  Result := TKey(Chars);
end;

end.

