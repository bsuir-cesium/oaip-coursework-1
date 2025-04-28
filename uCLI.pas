unit uCLI;

interface

procedure Start;

implementation

uses
  Windows, SysUtils, uTypes, uHash, uHashTable, uDataGenerator;

procedure ClearScreen;
var
  hConsole: THandle;
  cursorPos: TCoord;
begin
  hConsole := GetStdHandle(STD_OUTPUT_HANDLE);
  Write(#27'[2J'#27'[3J');
  cursorPos.X := 0;
  cursorPos.Y := 0;
  SetConsoleCursorPosition(hConsole, cursorPos);
end;

procedure Awaiting;
begin
  Writeln('������� Enter, ����� ����������...');
  Readln;
end;

procedure CreateTables(var HashTableSquare, HashTableShift: THashTable;
  FileName: String);
var
  Choice, I, TableSize: Integer;
begin
  Writeln('�������� ���������� ������� ��� ���-�������:');
  Writeln('1.      20 �������');
  Writeln('2.     200 �������');
  Writeln('3.   2.000 �������');
  Writeln('4.  20.000 �������');
  Writeln('5. 200.000 �������');
  Readln(Choice);
  if (Choice > 5) or (Choice < 1) then
  begin
    Writeln('������� ���������� �����.');
    Exit;
  end;
  TableSize := 2;
  for I := 1 to Choice do
    TableSize := TableSize * 10;

  Writeln('�������� � ���������� ���-������� � ���-�������� ������� ���������. ��� ����� ������ �����...');
  HashTableSquare := THashTable.Create(uHash.SquareHash, TableSize);
  HashTableSquare.LoadFromFile(FileName);
  Writeln('������� ������!');

  Writeln('�������� � ���������� ���-������� � ���-�������� ������ ��������. ��� ����� ������ �����...');
  HashTableShift := THashTable.Create(uHash.ShiftHash, TableSize);
  HashTableShift.LoadFromFile(FileName);
  Writeln('������� ������!');
  Awaiting;
end;

procedure PrintMethodResult(const Name: string; Table: THashTable);
begin
  Writeln(Format('| %-20s | %-8d | %-12.1f%% | %-12.2f |',
    [Name, Table.Collisions, Table.LoadFactor * 100, Table.InsertTime]));
end;

procedure CompareResults(Table1, Table2: THashTable);
begin
  Writeln('==== ��������� ������� ====');
  Writeln(Format('| %-20s | %-8s | %-10s | %-12s |', ['�����', '��������',
    '�������������', '����� (���)']));
  Writeln('|----------------------|----------|---------------|--------------|');
  PrintMethodResult('������� ��������', Table1);
  PrintMethodResult('����� ��������', Table2);
end;

procedure Start;
var
  Choice: Integer;
  HashTableSquare, HashTableShift: THashTable;
begin
  HashTableSquare := nil;
  HashTableShift := nil;
  try
    repeat
      ClearScreen;
      Writeln('�������� ����� ����:');
      Writeln('1. ��������� ������ � ����');
      Writeln('2. ������ �������');
      Writeln('0. �����');
      Readln(Choice);
      case Choice of
        1:
          begin
            Writeln('������ ���������. ��� ����� ������ ��������� �����...');
            GenerateTestData(FILE_NAME, RECORDS_COUNT);
            Writeln('��������� ���������!');
            Awaiting;
          end;
        2:
          begin
            if not FileExists(FILE_NAME) then
              Writeln('���� �� ����������! ��������� ��������� ������')
            else
            begin
              CreateTables(HashTableSquare, HashTableShift, FILE_NAME);
              CompareResults(HashTableSquare, HashTableShift);
            end;
            if Assigned(HashTableSquare) then HashTableSquare.Free;
            if Assigned(HashTableShift) then HashTableShift.Free;
            Awaiting;
          end;
        0:
          break;
      end;
    until False;
  finally
    if Assigned(HashTableSquare) then HashTableSquare.Free;
    if Assigned(HashTableShift) then HashTableShift.Free;
    Writeln('������ ������� �� ����������� ������.');
    Awaiting;
  end;
end;

end.
