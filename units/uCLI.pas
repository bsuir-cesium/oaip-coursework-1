unit uCLI;

interface

procedure Start;

implementation

uses
  Windows, SysUtils, uTypes, uHash, uHashTable, uDataGenerator;

// procedure ClearScreen;
// var
// hConsole: THandle;
// cursorPos: TCoord;
// begin
// hConsole := GetStdHandle(STD_OUTPUT_HANDLE);
// Write(#27'[2J'#27'[3J');
// cursorPos.X := 0;
// cursorPos.Y := 0;
// SetConsoleCursorPosition(hConsole, cursorPos);
// end;
procedure ClearScreen;
var
  hStdOut: THandle;
  csbi: TConsoleScreenBufferInfo;
  dwConSize: DWORD;
  dwCharsWritten: DWORD;
  Origin: TCoord;
begin
  hStdOut := GetStdHandle(STD_OUTPUT_HANDLE);

  if not GetConsoleScreenBufferInfo(hStdOut, csbi) then
    Exit;

  dwConSize := csbi.dwSize.X * csbi.dwSize.Y;

  Origin.X := 0;
  Origin.Y := 0;
  FillConsoleOutputCharacter(hStdOut, ' ', dwConSize, Origin, dwCharsWritten);

  FillConsoleOutputAttribute(hStdOut, csbi.wAttributes, dwConSize, Origin,
    dwCharsWritten);

  SetConsoleCursorPosition(hStdOut, Origin);
end;

procedure Awaiting;
begin
  Writeln('������� Enter, ����� ����������...');
  Readln;
end;

procedure TableRow(const Name: string; Statistic: TStatistic);
begin
  Writeln('| ', Name:20, ' | ', Statistic.TableSize:6, ' | ',
    Statistic.BucketSize:5, ' | ', Statistic.Collisions:9, ' | ',
    Statistic.Main:10, ' | ', Statistic.InsertTime:12:2, ' | ',
    Statistic.SearchTime:12:2, ' |');
end;

procedure Delimiter;
begin
  Writeln('|----------------------|--------|-------|-----------|------------|--------------|--------------|');
end;

procedure TableHead;
begin
  Writeln('==== ��������� ������� ====');
  Writeln(Format('| %-20s | %-6s | %-5s | %-9s | %-10s | %-12s | %-12s |',
    ['�����', '����.', '�����', '��������', '���. ���.', '����������',
    '�����']));
end;

function AnalysForTables(var HashTable: THashTable; FileName: String;
  const keys: TOccupiedKeys): TStatistic;
var
  Choice, I, counted: Integer;
  data: TStatistic;
begin
  HashTable.LoadFromFile(FileName);
  HashTable.SearchFromKeys(keys);
  data.TableSize := HashTable.TableSize;
  data.BucketSize := HashTable.BucketSize;
  data.Main := HashTable.Main;
  data.Collisions := HashTable.Collisions;
  data.InsertTime := HashTable.InsertTime;
  data.SearchTime := HashTable.SearchTime;

  result := data;
end;

procedure Start;
var
  Choice, TableSize: Integer;
  HashTableSquare, HashTableShift: THashTable;
  keys: TOccupiedKeys;
  Statistic: TStatistic;
  SquareStatistics, ShiftStatistics: TStatistics;
  I: Integer;
begin
  setLength(keys, RECORDS_COUNT);
  HashTableSquare := nil;
  HashTableShift := nil;
  setLength(keys, RECORDS_COUNT);
  try
    repeat
      ClearScreen;
      Writeln('�������� ����� ����:');
      Writeln('1. ��������� ������ � ����');
      Writeln('2. ������ �������');
      Writeln('3. ����� ����������');
      Writeln('0. �����');
      Readln(Choice);
      case Choice of
        1:
          begin
            Writeln('������ ���������. ��� ����� ������ ��������� �����...');
            GenerateTestData(FilePath, RECORDS_COUNT, keys);
            Writeln('��������� ���������!');
            Awaiting;
          end;
        2:
          begin
            if not FileExists(FilePath) then
              Writeln('���� �� ����������! ��������� ��������� ������')
            else
            begin
              Writeln('����� �������. ��� ����� �����-�� �����...');
              for I := Low(uTypes.TABLE_STEPS) to High(uTypes.TABLE_STEPS) do
              begin

                HashTableSquare := THashTable.Create(uHash.SquareHash,
                  uTypes.TABLE_STEPS[I]);
                SquareStatistics[I] := AnalysForTables(HashTableSquare,
                  FilePath, keys);
                HashTableSquare.Free;

                HashTableShift := THashTable.Create(uHash.ShiftHash,
                  uTypes.TABLE_STEPS[I]);
                ShiftStatistics[I] := AnalysForTables(HashTableShift,
                  FilePath, keys);
                HashTableShift.Free;
              end;
            end;
            Awaiting;
          end;
        3:
          begin
            TableHead;
            for I := Low(SquareStatistics) to High(SquareStatistics) do
            begin
              TableRow('��. ���������', SquareStatistics[I]);
              Delimiter;
            end;
            Writeln;
            TableHead;
            for I := Low(ShiftStatistics) to High(ShiftStatistics) do
            begin
              TableRow('���� ��������', ShiftStatistics[I]);
              Delimiter;
            end;
            Awaiting;
          end;
        0:
          break;
      end;
    until False;
  finally
    if Assigned(HashTableSquare) then
      HashTableSquare.Free;
    if Assigned(HashTableShift) then
      HashTableShift.Free;
    keys := nil;
    Awaiting;
  end;
end;

end.
