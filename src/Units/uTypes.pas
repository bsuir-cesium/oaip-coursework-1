unit uTypes;

interface

uses
  SysUtils;

const
  MAX_TABLE_SIZE = 200000;
  RECORDS_MAX_MEMORY = 1_200_000;
  RECORDS_COUNT = 1_000_000;
  KEY_LENGTH = 6;
  NAME_LENGTH = 20;
  TABLE_STEPS: array[1..37] of Integer = (
    20, 40, 60, 80, 100, 120, 140, 160, 180, 200,
    400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000,
    4000, 6000, 8000, 10000, 12000, 14000, 16000, 18000, 20000,
    40000, 60000, 80000, 100000, 120000, 140000, 160000, 180000, 200000
  );

type
  EHashException = class(Exception);

  TKey = string[KEY_LENGTH];
  TName = string[NAME_LENGTH];
  TOccupiedKeys = array of TKey;

  TDataRecord = record
    Key: TKey;
    Name: TName;
    Value: Integer;
  end;

  TSearchDataRecord = record
    Bucket: UInt32;
    Name: TName;
    Value: Integer;
  end;

  PChainNode = ^TChainNode;

  TChainNode = record
    Data: TDataRecord;
    Next: PChainNode;
  end;

  TBucket = record
    Data: array of TDataRecord;
    Len: UInt32;
    Overflow: PChainNode;
  end;

  THashFunc = function(const Key: TKey; TableSize: UInt32): UInt64;

  TStatistic = record
    TableSize: UInt32;
    BucketSize: UInt32;
    Main: UInt32;
    Collisions: UInt32;
    InsertTime: Double;
    SearchTime: Double;
  end;

  TStatistics = array [1..37] of TStatistic;

var
  keys: TOccupiedKeys;
  FilePath: String;
  StatisticsSquare, StatisticsShift: TStatistics;

implementation

end.

