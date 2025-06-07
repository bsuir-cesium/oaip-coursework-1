unit uLCG;

interface

uses
  System.SysUtils, uTypes;

type
  TLCG = class
  private
    FSeed: UInt64;
    FA: UInt64;
    FM: UInt64;
  public
    constructor Create(A, M: UInt64; Seed: UInt64);
    function Next: UInt64;
    function NextKey: TKey;
  end;

implementation

constructor TLCG.Create(A, M, Seed: UInt64);
begin
  FA := A;
  FM := M;
  FSeed := Seed mod M;
end;

function TLCG.Next: UInt64;
begin
  FSeed := (FA * FSeed) mod FM;
  Result := FSeed;
end;

function TLCG.NextKey: TKey;
const
  CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
var
  i: Integer;
begin
  SetLength(Result, 6);
  for i := 1 to 6 do
  begin
    Result[i] := AnsiChar(CHARS[1 + (Next mod 62)]);
  end;
end;

end.
