unit uHash;

interface

uses
  SysUtils, uTypes, math;

const
  SQUARE_CUT_DIGITS = 3;
  SQUARE_DIVISOR = 100;

  SHIFT_SPLIT_POS = 3;

function SquareHash(const Key: TKey; TableSize: UInt32): UInt64;

function ShiftHash(const Key: TKey; TableSize: UInt32): UInt64;

implementation

function TKeyToNumber(const Key: TKey): UInt64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Key) do
  begin
    Result := (Result shl 4) or (Ord(Key[i]) and $0F);
  end;
end;

function SquareHash(const Key: TKey; TableSize: UInt32): UInt64;
var
  num: UInt64;
  squareStr: string;
  midDigitsStr: string;
  midValue: Int64;
begin
  num := TKeyToNumber(Key);

  squareStr := IntToStr(num * num);
  midDigitsStr := Copy(squareStr, ((Length(squareStr) - 6) div 2) + 1, 6);
  midValue := StrToInt64(midDigitsStr);

  Result := (midValue * 13) mod TableSize;
end;

function ShiftHash(const Key: TKey; TableSize: UInt32): UInt64;
var
  Num, Temp: UInt64;
  NumDigits, SplitDigits: Integer;
  SplitPow: UInt64;
begin
  Num := TKeyToNumber(Key);

  SplitDigits := 1;
  Temp := 10;
  while Temp <= TableSize do
  begin
    Inc(SplitDigits);
    Temp := Temp * 10;
  end;

  repeat
    NumDigits := 0;
    Temp := Num;
    while Temp > 0 do
    begin
      Inc(NumDigits);
      Temp := Temp div 10;
    end;

    if NumDigits <= SplitDigits then Break;

    SplitPow := 1;
    for var i := 1 to (NumDigits div 2) do
      SplitPow := SplitPow * 10;

    Temp := Num div SplitPow;
    Num := Temp + (Num mod SplitPow);

  until False;

  Result := Num mod TableSize;
end;

end.

