unit UTLBClasses;

interface

uses
  System.Classes,
  System.Generics.Collections;

type
  TOutFile = class
  strict private
    const
      CIdent = '  ';
  strict private
    FFile: TextFile;
    FIdentStr: string;
    FLevels: TStrings;
  strict private
    function GetLevel(AIdx: Integer): string;
  public
    constructor Create(const AFileName: string);
    destructor Destroy; override;
    procedure Write(const AStr: string);
    procedure WriteFmt(const AFmt: string; const AArgs: array of const);
    procedure EmptyLine;
    procedure IncIdent;
    procedure DecIdent;
  public
    property Level[AIdx: Integer]: string read GetLevel;
  end;

  TUnitManager = class
  public
    type
      TStdUnits = (suActiveX);
  strict private
    type
      TUnitName = record
        Name: string;
        NS: string;
      end;
    const
      CStdUnits: array[TStdUnits] of TUnitName = (
        (Name: 'ActiveX'; NS: 'Winapi')
      );
  strict private
    FUnits: TDictionary<string, Integer>;
    FUseNS: Boolean;
  public
    constructor Create(AUseNS: Boolean);
    destructor Destroy; override;
    procedure AddStdUnit(AUnit: TStdUnits);
    procedure AddCustomUnit(const AUnit: string);
    procedure Print(AOut: TOutFile);
  end;

implementation

uses
  System.SysUtils,
  System.Generics.Defaults;

{ TOutFile }

constructor TOutFile.Create(const AFileName: string);
begin
  inherited Create;
  AssignFile(FFile, AFileName);
  Rewrite(FFile);
  FLevels := TStringList.Create;
  FLevels.Add('');
end;

destructor TOutFile.Destroy;
begin
  FLevels.Free;
  CloseFile(FFile);
  inherited Destroy;
end;

function TOutFile.GetLevel(AIdx: Integer): string;
begin
  Result := FLevels[FLevels.Count - 1 + AIdx];
end;

procedure TOutFile.Write(const AStr: string);
begin
  System.Writeln(FFile, FIdentStr, AStr);
  FLevels[FLevels.Count - 1] := AStr;
end;

procedure TOutFile.WriteFmt(const AFmt: string; const AArgs: array of const);
begin
  Write(Format(AFmt, AArgs));
end;

procedure TOutFile.EmptyLine;
begin
  System.Writeln(FFile);
end;

procedure TOutFile.IncIdent;
begin
  FIdentStr := FIdentStr + CIdent;
  FLevels.Add('');
end;

procedure TOutFile.DecIdent;
begin
  SetLength(FIdentStr, Length(FIdentStr) - Length(CIdent));
  FLevels.Delete(FLevels.Count - 1);
end;

{ TUnitManager }

constructor TUnitManager.Create(AUseNS: Boolean);
begin
  inherited Create;
  FUnits := TDictionary<string, Integer>.Create;
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
  LUnit := CStdUnits[AUnit];
  if FUseNS and (LUnit.NS <> '') then
    LStr := Format('%s.%s', [LUnit.NS, LUnit.Name])
  else
    LStr := LUnit.Name;
  AddCustomUnit(LStr);
end;

procedure TUnitManager.AddCustomUnit(const AUnit: string);
begin
TComparer<Byte>.Construct(nil);
  if not FUnits.ContainsKey(AUnit) then
    FUnits.Add(AUnit, FUnits.Count);
end;

procedure TUnitManager.Print(AOut: TOutFile);
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
      if ALeft.Value < ARight.Value then
        Result := -1
      else if ALeft.Value = ARight.Value then
        Result := 0
      else
        Result := 1;
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

end.
