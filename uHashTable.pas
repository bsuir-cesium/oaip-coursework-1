unit uHashTable;

interface

uses
  SysUtils, Classes, uTypes, uHash;

type
  THashTable = class
  private
    FTable: array of PChainNode;
    FHashFunc: THashFunc;
    FTableSize: Integer;
    FCount: Integer;
    FCollisions: Integer;

    FInsertStart: TDateTime;
    FInsertTime: Double;

    function CreateNode(const Rec: TDataRecord): PChainNode;

  public
    constructor Create(HashFunc: THashFunc; TableSize: Integer);
    destructor Destroy; override;

    procedure Insert(const Rec: TDataRecord);
    function Find(const Key: TKey; out Data: TDataRecord): Boolean;
    procedure Delete(const Key: TKey);
    procedure Clear;
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(const FileName: string);

    // Статистика
    property Count: Integer read FCount;
    property Collisions: Integer read FCollisions;
    property InsertTime: Double read FInsertTime;
    function LoadFactor: Double;
  end;

implementation

{ THashTable }

constructor THashTable.Create(HashFunc: THashFunc; TableSize: Integer);
begin
  inherited Create;
  FHashFunc := HashFunc;
  FTableSize := TableSize;
  SetLength(FTable, FTableSize);
  FillChar(FTable[0], FTableSize * SizeOf(PChainNode), 0);
  FCount := 0;
  FCollisions := 0;
end;

destructor THashTable.Destroy;
begin
  Clear;
  inherited;
end;

function THashTable.CreateNode(const Rec: TDataRecord): PChainNode;
begin
  New(Result);
  Result^.Data := Rec;
  Result^.Next := nil;
end;

procedure THashTable.Insert(const Rec: TDataRecord);
var
  Index: Integer;
  Node: PChainNode;
begin
  Index := FHashFunc(Rec.Key, FTableSize);
  if FTable[Index] <> nil then
    Inc(FCollisions);

  if FTable[Index] = nil then
  begin
    FTable[Index] := CreateNode(Rec);
  end
  else
  begin
    Node := FTable[Index];
    while Node^.Next <> nil do
      Node := Node^.Next;
    Node^.Next := CreateNode(Rec);
  end;

  Inc(FCount);
end;

function THashTable.Find(const Key: TKey; out Data: TDataRecord): Boolean;
var
  Index: Integer;
  Node: PChainNode;
begin
  Index := FHashFunc(Key, FTableSize);
  Node := FTable[Index];

  while Node <> nil do
  begin
    if Node^.Data.Key = Key then
    begin
      Data := Node^.Data;
      Exit(True);
    end;
    Node := Node^.Next;
  end;

  Result := False;
end;

procedure THashTable.Delete(const Key: TKey);
var
  Index: Integer;
  Current, Prev: PChainNode;
begin
  Index := FHashFunc(Key, FTableSize);
  Current := FTable[Index];
  Prev := nil;

  while Current <> nil do
  begin
    if Current^.Data.Key = Key then
    begin
      if Prev = nil then
        FTable[Index] := Current^.Next
      else
        Prev^.Next := Current^.Next;

      Dispose(Current);
      Dec(FCount);
      Exit;
    end;

    Prev := Current;
    Current := Current^.Next;
  end;
end;

procedure THashTable.Clear;
var
  i: Integer;
begin
  for i := 0 to FTableSize - 1 do
  begin
    while FTable[i] <> nil do
    begin
      var
      Temp := FTable[i];
      FTable[i] := FTable[i]^.Next;
      Dispose(Temp);
    end;
  end;
  SetLength(FTable, 0);
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

procedure THashTable.SaveToFile(const FileName: string);
var
  F: File of TDataRecord;
  i: Integer;
  Node: PChainNode;
begin
  AssignFile(F, FileName);
  Rewrite(F);

  try
    for i := 0 to FTableSize - 1 do
    begin
      Node := FTable[i];
      while Node <> nil do
      begin
        Write(F, Node^.Data);
        Node := Node^.Next;
      end;
    end;

  finally
    CloseFile(F);
  end;
end;

function THashTable.LoadFactor: Double;
begin
  Result := FCount / FTableSize;
end;

end.
