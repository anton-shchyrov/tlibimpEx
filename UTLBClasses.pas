unit UTLBClasses;

interface

uses
  System.Classes,
  System.Generics.Collections;

type
  TCustomOut = class
  strict private
    const
      CEmptyStr = '';
      CIdent = '  ';
  strict private
    FIdentStr: string;
    FLevels: TStrings;
  strict private
    function GetIdent: Integer;
    procedure SetIdent(AVal: Integer);
    function GetLevel(AIdx: Integer): string;
  strict protected
    procedure WriteStr(const AStr: string); virtual; abstract;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Write(const AStr: string);
    procedure WriteFmt(const AFmt: string; const AArgs: array of const);
    procedure EmptyLine;
    procedure IncIdent;
    procedure DecIdent;
  public
    property Ident: Integer read GetIdent write SetIdent;
    property Level[AIdx: Integer]: string read GetLevel;
  end;

  TOutFile = class(TCustomOut)
  strict private
    FFile: TextFile;
  strict protected
    procedure WriteStr(const AStr: string); override;
  public
    constructor Create(const AFileName: string);
    destructor Destroy; override;
  end;

  TOutBuffer = class(TCustomOut)
  strict private
    FBuffer: TStrings;
  strict private
    function GetCount: Integer;
    function GetBuffer(AIdx: Integer): string;
  strict protected
    procedure WriteStr(const AStr: string); override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure Flush(AOut: TCustomOut);
  public
    property Count: Integer read GetCount;
    property Buffer[AIdx: Integer]: string read GetBuffer;
  end;

  TStdUnits = (suSystem, suCustom, suActiveX, suWindows, suComObj);

  TPasTypeInfo = record
    Name: string;
    Ref: Integer;
    RefBase: Integer;
    VarType: TVarType;
    StdUnit: TStdUnits;
    CustomUnit: string;
    function IsEqual(const AInfo: TPasTypeInfo): Boolean;
  end;

  TUnitManager = class
  strict private
    type
      TUnitName = record
        Name: string;
        NS: string;
      end;
    const
      CStdUnits: array[TStdUnits] of TUnitName = (
        (Name: 'System'; NS: ''),
        (Name: ''; NS: ''),
        (Name: 'ActiveX'; NS: 'Winapi'),
        (Name: 'Windows'; NS: 'Winapi'),
        (Name: 'ComObj'; NS: 'System.Win')
      );
  strict private
    FUnits: TDictionary<string, Integer>;
    FUseNS: Boolean;
  public
    constructor Create(AUseNS: Boolean);
    destructor Destroy; override;
    procedure AddStdUnit(AUnit: TStdUnits);
    procedure AddCustomUnit(const AUnit: string);
    procedure AddPasType(const AType: TPasTypeInfo);
    procedure Print(AOut: TCustomOut);
    procedure Clear;
  end;

  TReservedWords = class
  strict private
    class var
      FWords: TDictionary<string, Byte>;
  strict private
    class constructor Create;
    class destructor Destroy;
  public
    class function IsReserved(const AStr: string): Boolean;
    class function Escape(const AStr: string): string;
  end;

function CompareInt(const ALeft, ARight: Integer): Integer;

implementation

uses
  System.SysUtils,
  System.Generics.Defaults;

function CompareInt(const ALeft, ARight: Integer): Integer;
begin
  if ALeft < ARight then
    Result := -1
  else if ALeft = ARight then
    Result := 0
  else
    Result := 1;
end;

{ TCustomOut }

constructor TCustomOut.Create;
begin
  inherited Create;
  FLevels := TStringList.Create;
  FLevels.Add(CEmptyStr);
end;

destructor TCustomOut.Destroy;
begin
  FLevels.Free;
  inherited Destroy;
end;

function TCustomOut.GetIdent: Integer;
begin
  Result := FLevels.Count - 1;
end;

procedure TCustomOut.SetIdent(AVal: Integer);
begin
  if AVal < 0 then
    raise Exception.CreateFmt('Invalid ident %d', [AVal]);
  while AVal > Ident do
    IncIdent;
  while AVal < Ident do
    DecIdent;
end;

function TCustomOut.GetLevel(AIdx: Integer): string;
begin
  Result := FLevels[Ident + AIdx];
end;

procedure TCustomOut.Write(const AStr: string);
begin
  WriteStr(FIdentStr + AStr);
  FLevels[Ident] := AStr;
end;

procedure TCustomOut.WriteFmt(const AFmt: string; const AArgs: array of const);
begin
  Write(Format(AFmt, AArgs));
end;

procedure TCustomOut.EmptyLine;
begin
  WriteStr(CEmptyStr);
end;

procedure TCustomOut.IncIdent;
begin
  FIdentStr := FIdentStr + CIdent;
  FLevels.Add(CEmptyStr);
end;

procedure TCustomOut.DecIdent;
begin
  SetLength(FIdentStr, Length(FIdentStr) - Length(CIdent));
  FLevels.Delete(Ident);
end;

{ TOutFile }

constructor TOutFile.Create(const AFileName: string);
begin
  inherited Create;
  AssignFile(FFile, AFileName);
  Rewrite(FFile);
end;

destructor TOutFile.Destroy;
begin
  CloseFile(FFile);
  inherited Destroy;
end;

procedure TOutFile.WriteStr(const AStr: string);
begin
  System.Writeln(FFile, AStr);
end;

{ TOutBuffer }

constructor TOutBuffer.Create;
begin
  inherited Create;
  FBuffer := TStringList.Create;
end;

destructor TOutBuffer.Destroy;
begin
  FBuffer.Free;
  inherited Destroy;
end;

function TOutBuffer.GetCount: Integer;
begin
  Result := FBuffer.Count;
end;

function TOutBuffer.GetBuffer(AIdx: Integer): string;
begin
  Result := FBuffer[AIdx];
end;

procedure TOutBuffer.WriteStr(const AStr: string);
begin
  FBuffer.Add(AStr);
end;

procedure TOutBuffer.Clear;
begin
  FBuffer.Clear;
end;

procedure TOutBuffer.Flush(AOut: TCustomOut);
var
  Li: Integer;
begin
  AOut.Ident := 0;
  for Li := 0 to FBuffer.Count - 1 do
    AOut.Write(FBuffer[Li]);
  Clear;
  AOut.Ident := Ident;
end;

{ TPasTypeInfo }

function TPasTypeInfo.IsEqual(const AInfo: TPasTypeInfo): Boolean;
begin
  Result := (Name = AInfo.Name) and (Ref = AInfo.Ref);
end;

{ TUnitManager }

constructor TUnitManager.Create(AUseNS: Boolean);
begin
  inherited Create;
  FUnits := TDictionary<string, Integer>.Create(Length(CStdUnits));
  FUseNS := AUseNS;
end;

destructor TUnitManager.Destroy;
begin
  FUnits.Free;
  inherited Destroy;
end;

procedure TUnitManager.AddStdUnit(AUnit: TStdUnits);
var
  LStr: string;
  LUnit: TUnitName;
begin
  if AUnit > suCustom then begin
    LUnit := CStdUnits[AUnit];
    if FUseNS and (LUnit.NS <> '') then
      LStr := Format('%s.%s', [LUnit.NS, LUnit.Name])
    else
      LStr := LUnit.Name;
    AddCustomUnit(LStr);
  end;
end;

procedure TUnitManager.AddCustomUnit(const AUnit: string);
begin
  if (AUnit <> '') and not FUnits.ContainsKey(AUnit) then
    FUnits.Add(AUnit, FUnits.Count);
end;

procedure TUnitManager.AddPasType(const AType: TPasTypeInfo);
begin
  if AType.StdUnit <> suCustom then
    AddStdUnit(AType.StdUnit)
  else
    AddCustomUnit(AType.CustomUnit);
end;

procedure TUnitManager.Print(AOut: TCustomOut);
const
  CDelim = ', ';
type
  TUnitPair = TPair<string, Integer>;
var
  LData: TArray<TUnitPair>;
  Li: Integer;
  LStr: string;
  LUnitLen: Integer;
begin
  if FUnits.Count = 0 then
    Exit;

  LData := FUnits.ToArray;

  TArray.Sort<TUnitPair>(LData, TComparer<TUnitPair>.Construct(
    function(const ALeft, ARight: TUnitPair): Integer
    begin
      Result := CompareInt(ALeft.Value, ARight.Value);
    end
  ));

  AOut.Write('uses');
  AOut.IncIdent;
  try
    LStr := '';
    for Li := 0 to Length(LData) - 1 do begin
      LUnitLen := Length(LData[Li].Key) + Length(CDelim);
      if (Length(LStr) + LUnitLen >= 78) and (LStr <> '') then begin
        AOut.Write(TrimRight(LStr));
        LStr := '';
      end;
      LStr := LStr + LData[Li].Key + CDelim;
    end;
    SetLength(LStr, Length(LStr) - Length(CDelim));
    LStr := LStr + ';';
    AOut.Write(LStr);
  finally
    AOut.DecIdent;
  end;
  AOut.EmptyLine;
end;

procedure TUnitManager.Clear;
begin
  FUnits.Clear;
end;

{ TReservedWords }

class constructor TReservedWords.Create;
const
  CWords: array[0..63] of string = (
    'and',
    'array',
    'as',
    'asm',
    'begin',
    'case',
    'class',
    'const',
    'constructor',
    'destructor',
    'dispinterface',
    'div',
    'do',
    'downto',
    'else',
    'end',
    'except',
    'exports',
    'file',
    'finalization',
    'finally',
    'for',
    'function',
    'goto',
    'if',
    'implementation',
    'in',
    'inherited',
    'initialization',
    'inline',
    'interface',
    'is',
    'label',
    'library',
    'mod',
    'nil',
    'not',
    'object',
    'of',
    'or',
    'packed',
    'procedure',
    'program',
    'property',
    'raise',
    'record',
    'repeat',
    'resourcestring',
    'set',
    'shl',
    'shr',
    'string',
    'then',
    'threadvar',
    'to',
    'try',
    'type',
    'unit',
    'until',
    'uses',
    'var',
    'while',
    'with',
    'xor'
  );
var
  Li: Integer;
begin
  FWords := TDictionary<string, Byte>.Create(Length(CWords));
  for Li := 0 to Length(CWords) - 1 do
    FWords.Add(CWords[Li], 0);
end;

class destructor TReservedWords.Destroy;
begin
  FWords.Free;
end;

class function TReservedWords.IsReserved(const AStr: string): Boolean;
begin
  Result := FWords.ContainsKey(AnsiLowerCase(AStr));
end;

class function TReservedWords.Escape(const AStr: string): string;
begin
  Result := AStr;
  if IsReserved(AStr) then
    Result := Result + '_';
end;

end.
