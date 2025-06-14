﻿unit uHashTable;

interface

uses
  SysUtils, Classes, uTypes, uHash, Vcl.Forms;

type

  THashTable = class
  private

    FBuckets: array of TBucket;
    FHashFunc: THashFunc;
    FTableSize: UInt32;
    FBucketSize: UInt32;
    FCount: UInt32;
    FMain: UInt32;
    FCollisions: UInt32;
    FInsertStart: TDateTime;
    FInsertTime: Double;
    FSearchStart: TDateTime;
    FSearchTime: Double;

  public
    constructor Create(HashFunc: THashFunc; TableSize: Integer);
    destructor Destroy; override;

    procedure Insert(const Rec: TDataRecord);
    function Find(const Key: TKey; out Data: TSearchDataRecord): Boolean;
    function GetBucket(const Index: Integer; out Data: TBucket): Boolean;
    procedure Delete(const Key: TKey);
    procedure Clear;
    procedure LoadFromFile(const FileName: string);
    function SearchFromKeys(const Keys: TOccupiedKeys): Integer;

    property Count: UInt32 read FCount;
    property Main: UInt32 read FMain;
    property Collisions: UInt32 read FCollisions;
    property InsertTime: Double read FInsertTime;
    property SearchTime: Double read FSearchTime;
    property BucketSize: UInt32 read FBucketSize;
    property TableSize: UInt32 read FTableSize;
    function LoadFactor: Double;
  end;

implementation

{ THashTable }

constructor THashTable.Create(HashFunc: THashFunc; TableSize: Integer);
var
  i: Integer;
begin
  inherited Create;
  FHashFunc := HashFunc;
  FTableSize := TableSize;
  SetLength(FBuckets, FTableSize);
  FBucketSize := uTypes.RECORDS_MAX_MEMORY div FTableSize;

  for i := 0 to TableSize - 1 do
  begin
    SetLength(FBuckets[i].Data, FBucketSize);
    FBuckets[i].Len := 0;
    FBuckets[i].Overflow := nil;
  end;

  FCount := 0;
  FCollisions := 0;
end;

destructor THashTable.Destroy;
begin
  Clear;
  inherited;
end;

procedure THashTable.Insert(const Rec: TDataRecord);
var
  Index: Integer;
  Bucket: ^TBucket;
  Node, Temp: PChainNode;
begin
  Index := FHashFunc(Rec.Key, FTableSize);
  Bucket := @FBuckets[index];
  if Bucket^.Len < FBucketSize then
  begin
    Bucket^.Data[Bucket^.Len] := Rec;
    Inc(Bucket^.Len);
    Inc(FMain);
  end
  else
  begin
    Inc(FCollisions);
    New(Node);
    Node^.Data := Rec;
    Node^.Next := nil;

    if Bucket^.Overflow = nil then
      Bucket^.Overflow := Node
    else
    begin
      Temp := Bucket^.Overflow;
      while Temp.Next <> nil do
        Temp := Temp^.Next;
      Temp^.Next := Node;
    end;

  end;

  Inc(FCount);
end;

function THashTable.Find(const Key: TKey; out Data: TSearchDataRecord): Boolean;
var
  Index: Integer;
  Bucket: ^TBucket;
  i: Integer;
  TempNode: PChainNode;
begin
  Index := FHashFunc(Key, FTableSize);
  Bucket := @FBuckets[Index];
  for i := 0 to Bucket^.Len - 1 do
  begin
    if Bucket^.Data[i].Key = Key then
    begin
      Data.Bucket := Index + 1;
      Data.Name := Bucket^.Data[i].Name;
      Data.Value := Bucket^.Data[i].Value;
      Exit(True);
    end;
  end;

  TempNode := Bucket^.Overflow;
  while TempNode <> nil do
  begin
    if TempNode^.Data.Key = Key then
    begin
      Data.Bucket := Index + 1;
      Data.Name := TempNode^.Data.Name;
      Data.Value := TempNode^.Data.Value;
      Exit(True);
    end;
    TempNode := TempNode^.Next;
  end;

  Result := False;
end;

function THashTable.GetBucket(const Index: Integer; out Data: TBucket): Boolean;
begin
  Result := False;

  if (Index < 0) or (Index >= FTableSize) then
    Exit;

  Data := FBuckets[Index];
  Result := True;

end;

procedure THashTable.Delete(const Key: TKey);
var
  Index: Integer;
  Bucket: ^TBucket;
  i: Integer;
  PrevNode, CurrNode: PChainNode;
begin
  Index := FHashFunc(Key, FTableSize);
  Bucket := @FBuckets[Index];

  for i := 0 to Bucket^.Len - 1 do
  begin
    if Bucket^.Data[i].Key = Key then
    begin
      System.Delete(Bucket^.Data, i, 1);
      Dec(Bucket^.Len);
      Dec(FCount);
      Exit;
    end;
  end;

  PrevNode := nil;
  CurrNode := Bucket^.Overflow;
  while CurrNode <> nil do
  begin
    if CurrNode^.Data.Key = Key then
    begin
      if PrevNode = nil then
        Bucket^.Overflow := CurrNode^.Next
      else
        PrevNode^.Next := CurrNode^.Next;
      Dispose(CurrNode);
      Dec(FCount);
      Exit;
    end;
    PrevNode := CurrNode;
    CurrNode := CurrNode^.Next;
  end;
end;

procedure THashTable.Clear;
var
  i: Integer;
  CurrentNode, TempNode: PChainNode;
begin
  for i := Low(FBuckets) to High(FBuckets) - 1 do
  begin
    CurrentNode := FBuckets[i].Overflow;
    while CurrentNode <> nil do
    begin
      TempNode := CurrentNode;
      CurrentNode := CurrentNode^.Next;
      Dispose(TempNode);
    end;
    FBuckets[i].Overflow := nil;
    SetLength(FBuckets[i].Data, 0);
    FBuckets[i].Len := 0;
  end;
  SetLength(FBuckets, 0);
  FCount := 0;
  FCollisions := 0;
end;

procedure THashTable.LoadFromFile(const FileName: string);
var
  F: File of TDataRecord;
  Rec: TDataRecord;
begin
  FInsertStart := Now;
  try
    AssignFile(F, FileName);
    Reset(F);

    while not EOF(F) do
    begin
      Read(F, Rec);
      Insert(Rec);
    end;

  finally
    CloseFile(F);
    FInsertTime := (Now - FInsertStart) * 86400;
  end;
end;

function THashTable.SearchFromKeys(const Keys: TOccupiedKeys): Integer;
var
  Data: TSearchDataRecord;
  i, Finded: Integer;
begin
  Finded := 0;
  FSearchStart := Now;
  for i := low(Keys) to high(Keys) do
  begin
    if Find(Keys[i], Data) then
      Inc(Finded);
  end;
  FSearchTime := (Now - FSearchStart) * 86400;
  Result := Finded;
end;

// procedure THashTable.SaveToFile(const FileName: string);
// var
// F: File of TDataRecord;
// i: Integer;
// Node: TBucket;
// begin
// AssignFile(F, FileName);
// Rewrite(F);
//
// try
// for i := 0 to FTableSize - 1 do
// begin
// Rec := FBuckets[i];
// while Node <> nil do
// begin
// Write(F, Node^.Data);
// Node := Node^.Next;
// end;
// end;
//
// finally
// CloseFile(F);
// end;
// end;

function THashTable.LoadFactor: Double;
begin
  Result := FCount / FTableSize;
end;

end.
