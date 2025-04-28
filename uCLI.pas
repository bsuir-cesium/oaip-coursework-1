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
  Writeln('Нажмите Enter, чтобы продолжить...');
  Readln;
end;

procedure CreateTables(var HashTableSquare, HashTableShift: THashTable;
  FileName: String);
var
  Choice, I, TableSize: Integer;
begin
  Writeln('Выберите количество пакетов для хэш-таблицы:');
  Writeln('1.      20 пакетов');
  Writeln('2.     200 пакетов');
  Writeln('3.   2.000 пакетов');
  Writeln('4.  20.000 пакетов');
  Writeln('5. 200.000 пакетов');
  Readln(Choice);
  if (Choice > 5) or (Choice < 1) then
  begin
    Writeln('Введено невалидное число.');
    Exit;
  end;
  TableSize := 2;
  for I := 1 to Choice do
    TableSize := TableSize * 10;

  Writeln('Создание и заполнение хеш-таблицы с хеш-функцией средних квадратов. Это может занять время...');
  HashTableSquare := THashTable.Create(uHash.SquareHash, TableSize);
  HashTableSquare.LoadFromFile(FileName);
  Writeln('Таблица готова!');

  Writeln('Создание и заполнение хеш-таблицы с хеш-функцией Сдвига разрядов. Это может занять время...');
  HashTableShift := THashTable.Create(uHash.ShiftHash, TableSize);
  HashTableShift.LoadFromFile(FileName);
  Writeln('Таблица готова!');
  Awaiting;
end;

procedure PrintMethodResult(const Name: string; Table: THashTable);
begin
  Writeln(Format('| %-20s | %-8d | %-12.1f%% | %-12.2f |',
    [Name, Table.Collisions, Table.LoadFactor * 100, Table.InsertTime]));
end;

procedure CompareResults(Table1, Table2: THashTable);
begin
  Writeln('==== Сравнение методов ====');
  Writeln(Format('| %-20s | %-8s | %-10s | %-12s |', ['Метод', 'Коллизии',
    'Наполненность', 'Время (сек)']));
  Writeln('|----------------------|----------|---------------|--------------|');
  PrintMethodResult('Средние квадраты', Table1);
  PrintMethodResult('Сдвиг разрядов', Table2);
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
      Writeln('Выберите пункт меню:');
      Writeln('1. Генерация данных в файл');
      Writeln('2. Запуск анализа');
      Writeln('0. Выход');
      Readln(Choice);
      case Choice of
        1:
          begin
            Writeln('Начало генерации. Это может занять некоторое время...');
            GenerateTestData(FILE_NAME, RECORDS_COUNT);
            Writeln('Генерация завершена!');
            Awaiting;
          end;
        2:
          begin
            if not FileExists(FILE_NAME) then
              Writeln('Файл не существует! Выполните генерацию данных')
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
    Writeln('Данные очищены из оперативной памяти.');
    Awaiting;
  end;
end;

end.
