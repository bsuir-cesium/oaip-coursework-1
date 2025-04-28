unit uTypes;

interface

uses
  SysUtils;

const
  MAX_TABLE_SIZE = 200000;
  RECORDS_COUNT = 1_000_000;
  KEY_LENGTH = 6;
  NAME_LENGTH = 20;
  FILE_NAME = 'data.TDataRecord';

type
  EHashException = class(Exception);

  TKey = string[KEY_LENGTH];

  TDataRecord = record
    Key: TKey;
    Name: string[NAME_LENGTH];
    Value: Integer;
  end;

  PChainNode = ^TChainNode;

  TChainNode = record
    Data: TDataRecord;
    Next: PChainNode;
  end;

  THashTable = array [0 .. MAX_TABLE_SIZE - 1] of PChainNode;
  THashFunc = function(const Key: TKey; TableSize: Integer): Integer;

implementation

end.
