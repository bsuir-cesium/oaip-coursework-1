unit uHash;

interface

uses
  SysUtils, uTypes;

const
  SQUARE_CUT_DIGITS = 3;
  SQUARE_DIVISOR = 100;

  SHIFT_SPLIT_POS = 3;

function SquareHash(const Key: TKey; TableSize: Integer): Integer;

function ShiftHash(const Key: TKey; TableSize: Integer): Integer;

implementation

function TKeyToNumber(const Key: TKey): UInt64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Key) do
  begin
    Result := Result + Ord(Key[i]);
  end;
end;

function SquareHash(const Key: TKey; TableSize: Integer): Integer;
var
  Value: UInt64;
  Len: Integer;
  Mid: Integer;
begin
  Value := TKeyToNumber(Key);
  Value := Value * Value; // возведение в квадрат
  Len := Length(IntToStr(Value));
  Mid := Len div 2;
  Value := StrToInt64(Copy(IntToStr(Value), Mid - 3, 6)); // выбор центральных цифр
  Value := Value * 13; // умножение на константу
  Result := Value mod MAX_TABLE_SIZE;
end;

function ShiftHash(const Key: TKey; TableSize: Integer): Integer;
var
  Value: UInt64;
  Len: Integer;
begin
  Value := TKeyToNumber(Key);
  Len := Length(IntToStr(TableSize - 1));
  while Length(IntToStr(Value)) > Len do
  begin
    Value := (Value div 10) + (Value mod 10);
  end;
  Result := Value mod TableSize;
end;
//function ShiftHash(const Key: TKey; TableSize: Integer): Integer;
//var
//  NumericKey: UInt64;
//  KeyLength: Integer;
//  SplitPos: Integer;
//  HighPart, LowPart: UInt64;
//begin
//  NumericKey := QuickKeyToNumber(Key);
//  KeyLength := SizeOf(NumericKey) * 8;
//  SplitPos := KeyLength div 2;
//  HighPart := NumericKey shr SplitPos;
//  LowPart := NumericKey and ((UInt64(1) shl SplitPos) - 1);
//
//  Result := (HighPart xor LowPart) mod TableSize;
//end;

end.
