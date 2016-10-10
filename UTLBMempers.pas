unit UTLBMempers;

interface

uses
  Winapi.ActiveX,
  System.Generics.Collections,
  UTLBClasses;

type
  TIntfItem = class
  strict private
    FName: string;
    FComment: string;
  strict protected
    property Name: string read FName;
  public
    constructor Create(const ATypeLib: ITypeLib; AIdx: Integer);
    procedure Print(AOut: TOutFile); virtual; abstract;
  end;

  TVariable = class(TIntfItem)
  strict private
    FType_: string;
  end;

  TMethodArg = class(TVariable)
  strict private
    const
      CFlagIn = $01;
      CFlagOut = $02;
      CFlagRetVal = $04;
      CFlagRef = $08;
  strict private
    FFlag: Byte;
  end;

  TIntfMethod = class(TIntfItem)
  strict private
    FRetType: string;
    FCallingConv: TCallConv;
    FArgs: TObjectList<TMethodArg>;
  public
    constructor Create(const ATypeLib: ITypeLib; AIdx: Integer);
    destructor Destroy; override;
  end;

  TTLBMember = class(TIntfItem)
  strict protected
    procedure ParseTypeInfo(const ATypeInfo: ITypeInfo); virtual;
  public
    constructor Create(const ATypeLib: ITypeLib; AIdx: Integer);
  end;

  TGUIDMember = class(TTLBMember)
  strict private
    FUUID: TGUID;
  strict protected
    property UUID: TGUID read FUUID;
  strict protected
    procedure ParseTypeInfo(const ATypeInfo: ITypeInfo); override;
    procedure ParseTypeAttr(const ATypeAttr: TTypeAttr); virtual;
    function GetIIDPrefix: string; virtual; abstract;
  public
    procedure PrintIID(AOut: TOutFile);
  end;

  TInterface = class(TGUIDMember)
  strict private
    FMethods: TObjectList<TIntfMethod>;
    FFlags: Word;
  strict protected
    property Flags: Word read FFlags;
  public
    constructor Create(const ATypeLib: ITypeLib; AIdx: Integer);
    destructor Destroy; override;
  strict protected
    function GetIIDPrefix: string; override;
    procedure ParseTypeAttr(const ATypeAttr: TTypeAttr); override;
  public
    procedure Print(AOut: TOutFile); override;
  public
    property Name;
  end;

  TDispInterface = class(TInterface)
  strict protected
    function GetIIDPrefix: string; override;
  public
    procedure Print(AOut: TOutFile); override;
  end;

  TCoClass = class(TGUIDMember)
  strict protected
    function GetIIDPrefix: string; override;
  end;

  TEnumItem = class(TIntfItem)
  strict private
    FValue: Integer;
  end;

  TEnum = class(TTLBMember)
  strict private
    FItems: TObjectList<TEnumItem>;
    FShowEnum: Boolean;
    FShowHex: Boolean;
  public
    constructor Create(const ATypeLib: ITypeLib; AIdx: Integer);
    destructor Destroy; override;
  end;

  TRecord = class(TTLBMember)
  strict private
    FFields: TObjectList<TVariable>;
  public
    constructor Create(const ATypeLib: ITypeLib; AIdx: Integer);
    destructor Destroy; override;
  end;

  TTLBInfo = class(TIntfItem)
  strict private
    FMajorVersion: Integer;
    FMinorVersion: Integer;
    FUUID: TGUID;
    FUnits: TUnitManager;
    FEnums: TObjectList<TEnum>;
    FRecords: TObjectList<TRecord>;
    FInterfaces: TObjectList<TInterface>;
    FCoClasses: TObjectList<TCoClass>;
  strict private
    function GetUnitName: string;
    procedure Parse(const ATypeLib: ITypeLib);
  public
    constructor Create(const AFileName: string);
    destructor Destroy; override;
    procedure Print(AOut: TOutFile); override;
  public
    property UnitName: string read GetUnitName;
  end;

implementation

uses
  System.SysUtils,
  System.Win.ComObj;

{ TIntfItem }

constructor TIntfItem.Create(const ATypeLib: ITypeLib; AIdx: Integer);
var
  LStr: WideString;
begin
  inherited Create;
  OleCheck(ATypeLib.GetDocumentation(AIdx, @LStr, nil, nil, nil));
  FName := LStr;
  SysFreeString(PChar(LStr));
end;

{ TIntfMethod }

constructor TIntfMethod.Create(const ATypeLib: ITypeLib; AIdx: Integer);
begin
  inherited Create(ATypeLib, AIdx);
  FArgs := TObjectList<TMethodArg>.Create(True);
end;

destructor TIntfMethod.Destroy;
begin
  FArgs.Free;
  inherited Destroy;
end;

{ TTLBMember }

constructor TTLBMember.Create(const ATypeLib: ITypeLib; AIdx: Integer);
var
  LInfo: ITypeInfo;
begin
  inherited Create(ATypeLib, AIdx);
  if AIdx >= 0 then begin
    OleCheck(ATypeLib.GetTypeInfo(AIdx, LInfo));
    ParseTypeInfo(LInfo);
  end;
end;

procedure TTLBMember.ParseTypeInfo(const ATypeInfo: ITypeInfo);
begin

end;

{ TGUIDMember }

procedure TGUIDMember.ParseTypeInfo(const ATypeInfo: ITypeInfo);
var
  LAttr: PTypeAttr;
begin
  inherited ParseTypeInfo(ATypeInfo);
  OleCheck(ATypeInfo.GetTypeAttr(LAttr));
  try
    ParseTypeAttr(LAttr^);
  finally
    ATypeInfo.ReleaseTypeAttr(LAttr);
  end;
end;

procedure TGUIDMember.ParseTypeAttr(const ATypeAttr: TTypeAttr);
begin
  FUUID := ATypeAttr.guid;
end;

procedure TGUIDMember.PrintIID(AOut: TOutFile);
begin
  AOut.WriteFmt('%s_%s: TGUID = ''%s'';', [GetIIDPrefix, Name, GUIDToString(FUUID)]);
end;

{ TInterface }

constructor TInterface.Create(const ATypeLib: ITypeLib; AIdx: Integer);
begin
  inherited Create(ATypeLib, AIdx);
  FMethods := TObjectList<TIntfMethod>.Create(True);
end;

destructor TInterface.Destroy;
begin
  FMethods.Free;
  inherited Destroy;
end;

function TInterface.GetIIDPrefix: string;
begin
  Result := 'IID';
end;

procedure TInterface.ParseTypeAttr(const ATypeAttr: TTypeAttr);
begin
  inherited ParseTypeAttr(ATypeAttr);
  FFlags := ATypeAttr.wTypeFlags;
end;

procedure TInterface.Print(AOut: TOutFile);
begin
  AOut.Write(Name);
end;

{ TDispInterface }

function TDispInterface.GetIIDPrefix: string;
begin
  Result := inherited GetIIDPrefix;
  if Flags and TYPEFLAG_FDUAL = 0 then
    Result := 'D' + Result;
end;

procedure TDispInterface.Print(AOut: TOutFile);
begin
  AOut.Write('Disp!!!');
  inherited Print(AOut);
end;

{ TCoClass }

function TCoClass.GetIIDPrefix: string;
begin
  Result := 'CLASS';
end;

{ TEnum }

constructor TEnum.Create(const ATypeLib: ITypeLib; AIdx: Integer);
begin
  inherited Create(ATypeLib, AIdx);
  FItems := TObjectList<TEnumItem>.Create(True);
  FShowEnum := True;
  FShowHex := False;
end;

destructor TEnum.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;

{ TRecord }

constructor TRecord.Create;
begin
  inherited Create(ATypeLib, AIdx);
  FFields := TObjectList<TVariable>.Create(True);
end;

destructor TRecord.Destroy;
begin
  FFields.Free;
  inherited Destroy;
end;

{ TTLBInfo }

constructor TTLBInfo.Create(const AFileName: string);
var
  LTlb: ITypeLib;
begin
  OleCheck(LoadTypeLibEx(PChar(AFileName), REGKIND_NONE, LTlb));
  inherited Create(LTlb, -1);
  FUnits := TUnitManager.Create(True);
  FEnums := TObjectList<TEnum>.Create(True);
  FRecords := TObjectList<TRecord>.Create(True);
  FInterfaces := TObjectList<TInterface>.Create(True);
  FCoClasses := TObjectList<TCoClass>.Create(True);
  Parse(LTlb);
end;

destructor TTLBInfo.Destroy;
begin
  FCoClasses.Free;
  FInterfaces.Free;
  FRecords.Free;
  FEnums.Free;
  FUnits.Free;
  inherited Destroy;
end;

function TTLBInfo.GetUnitName: string;
begin
  Result := Name + '_TLB';
end;

procedure TTLBInfo.Parse(const ATypeLib: ITypeLib);
var
  LAttr: PTLibAttr;
  Li: Integer;
  LTypeKind: TTypeKind;
begin
  OleCheck(ATypeLib.GetLibAttr(LAttr));
  try
    FMajorVersion := LAttr^.wMajorVerNum;
    FMinorVersion := LAttr^.wMinorVerNum;
    FUUID := LAttr^.guid;
  finally
    ATypeLib.ReleaseTLibAttr(LAttr);
  end;
  for Li := 0 to ATypeLib.GetTypeInfoCount - 1 do begin
    OleCheck(ATypeLib.GetTypeInfoType(Li, LTypeKind));
    case LTypeKind of
      TKIND_ENUM: FEnums.Add(TEnum.Create(ATypeLib, Li));
      TKIND_RECORD: FRecords.Add(TRecord.Create(ATypeLib, Li));
      TKIND_MODULE:;
//      TKIND_INTERFACE, TKIND_DISPATCH: FInterfaces.Add(TInterface.Create(ATypeLib, Li));
      TKIND_INTERFACE: FInterfaces.Add(TInterface.Create(ATypeLib, Li));
      TKIND_DISPATCH: FInterfaces.Add(TDispInterface.Create(ATypeLib, Li));
      TKIND_COCLASS: FCoClasses.Add(TCoClass.Create(ATypeLib, Li));
      TKIND_ALIAS:;
      TKIND_UNION:;
    end;
  end;
end;

procedure TTLBInfo.Print(AOut: TOutFile);
var
  Li: Integer;
  LIntf: TInterface;
begin
  AOut.WriteFmt('unit %s;', [UnitName]);
  AOut.EmptyLine;
  AOut.Write('const');
  AOut.IncIdent;
  try
    AOut.WriteFmt('%sMajorVersion = %d;', [Name, FMajorVersion]);
    AOut.WriteFmt('%sMinorVersion = %d;', [Name, FMinorVersion]);
    AOut.EmptyLine;
    AOut.WriteFmt('LIBID_%s: TGUID = ''%s'';', [Name, GUIDToString(FUUID)]);
    AOut.EmptyLine;

    if FCoClasses.Count > 0 then begin
      AOut.Write('// CLASSID constants');
      for Li := 0 to FCoClasses.Count - 1 do
        FCoClasses[Li].PrintIID(AOut);
      AOut.EmptyLine;
    end;

    if FInterfaces.Count > 0 then begin
      AOut.Write('// IID constants');
      for Li := 0 to FInterfaces.Count - 1 do
        FInterfaces[Li].PrintIID(AOut);
      AOut.EmptyLine;
    end;
  finally
    AOut.DecIdent;
  end;
end;

end.
