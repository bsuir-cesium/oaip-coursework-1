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
  Writeln('Нажмите Enter, чтобы продолжить...');
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
  Writeln('==== Сравнение методов ====');
  Writeln(Format('| %-20s | %-6s | %-5s | %-9s | %-10s | %-12s | %-12s |',
    ['Метод', 'Табл.', 'Пакет', 'Коллизии', 'Осн. обл.', 'Заполнение',
    'Поиск']));
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
      Writeln('Выберите пункт меню:');
      Writeln('1. Генерация данных в файл');
      Writeln('2. Запуск анализа');
      Writeln('3. Вывод статистики');
      Writeln('0. Выход');
      Readln(Choice);
      case Choice of
        1:
          begin
            Writeln('Начало генерации. Это может занять некоторое время...');
            GenerateTestData(FilePath, RECORDS_COUNT, keys);
            Writeln('Генерация завершена!');
            Awaiting;
          end;
        2:
          begin
            if not FileExists(FilePath) then
              Writeln('Файл не существует! Выполните генерацию данных')
            else
            begin
              Writeln('Старт анализа. Это займёт какое-то время...');
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
              TableRow('Ср. квадратов', SquareStatistics[I]);
              Delimiter;
            end;
            Writeln;
            TableHead;
            for I := Low(ShiftStatistics) to High(ShiftStatistics) do
            begin
              TableRow('Сдиг разрядов', ShiftStatistics[I]);
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
