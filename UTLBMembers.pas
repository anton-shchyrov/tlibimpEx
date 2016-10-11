unit UTLBMembers;

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
    constructor Create(const AName: string);
    procedure Print(AOut: TOutFile); virtual; abstract;
    class function GetHRefName(const ATypeInfo: ITypeInfo; AHRef: HRefType): string;
  end;

  TTLBMember = class(TIntfItem)
  strict protected
    procedure ParseTypeInfo(const ATypeInfo: ITypeInfo); virtual;
    procedure ParseTypeAttr(const ATypeAttr: TTypeAttr); virtual;
  public
    constructor CreateTLB(const ATypeLib: ITypeLib; AIdx: Integer);
    constructor Create(const ATypeInfo: ITypeInfo); virtual;
    procedure RequireUnits(AUnitManager: TUnitManager); virtual;
  end;

  TTypeMember = class(TIntfItem)
  public
    constructor Create(const ATypeInfo: ITypeInfo; AMemberID: TMemberID);
  end;

  TVariable = class(TTypeMember)
  strict private
    FType_: string;
  public
    constructor Create(const ATypeInfo: ITypeInfo; AIdx: Integer);
    procedure Print(AOut: TOutFile); override;
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

  TIntfMethod = class(TTypeMember)
  strict private
    FRetType: string;
    FCallingConv: TCallConv;
    FArgs: TObjectList<TMethodArg>;
  public
    constructor Create(const ATypeInfo: ITypeInfo; AIdx: Integer);
    destructor Destroy; override;
    procedure Print(AOut: TOutFile); override;
  end;

  TGUIDMember = class(TTLBMember)
  strict private
    FUUID: TGUID;
  strict protected
    property UUID: TGUID read FUUID;
  strict protected
    procedure ParseTypeAttr(const ATypeAttr: TTypeAttr); override;
    function GetIIDPrefix: string; virtual; abstract;
  public
    procedure PrintIID(AOut: TOutFile);
    procedure PrintForward(AOut: TOutFile); virtual; abstract;
  end;

  TCustomInterface = class(TGUIDMember)
  strict private
    FFuncCount: Integer;
  strict protected
    procedure ParseTypeAttr(const ATypeAttr: TTypeAttr); override;
  public
    property Name;
    property FuncCount: Integer read FFuncCount;
  end;

  TInterface = class(TCustomInterface)
  strict private
    FMethods: TObjectList<TIntfMethod>;
    FParent: TCustomInterface;
    FFlags: Word;
  strict protected
    property Flags: Word read FFlags;
  public
    constructor Create(const ATypeInfo: ITypeInfo); override;
    destructor Destroy; override;
  strict protected
    function GetIIDPrefix: string; override;
    procedure ParseTypeAttr(const ATypeAttr: TTypeAttr); override;
    procedure ParseTypeInfo(const ATypeInfo: ITypeInfo); override;
  public
    procedure Print(AOut: TOutFile); override;
    procedure PrintForward(AOut: TOutFile); override;
  end;

  TDispInterface = class(TInterface)
  strict private
    function GetDispName: string;
  strict protected
    function GetIIDPrefix: string; override;
  public
    constructor Create(const ATypeInfo: ITypeInfo); override;
    procedure Print(AOut: TOutFile); override;
    procedure PrintForward(AOut: TOutFile); override;
  end;

  TCoClass = class(TGUIDMember)
  strict private
    FDefaultIntf: TCustomInterface;
    FCountImpl: Integer;
  strict protected
    function GetIIDPrefix: string; override;
    procedure ParseTypeAttr(const ATypeAttr: TTypeAttr); override;
    procedure ParseTypeInfo(const ATypeInfo: ITypeInfo); override;
  public
    destructor Destroy; override;
    procedure PrintForward(AOut: TOutFile); override;
  end;

  TEnumItem = class(TTypeMember)
  strict private
    FValue: Integer;
    FValueFmt: string;
  public
    constructor Create(const ATypeInfo: ITypeInfo; AIdx: Integer);
    procedure Print(AOut: TOutFile); override;
  public
    property ValueFmt: string read FValueFmt write FValueFmt;
  end;

  TEnum = class(TTLBMember)
  strict private
    FItems: TObjectList<TEnumItem>;
    FCount: Integer;
    FShowEnum: Boolean;
    FShowHex: Boolean;
  strict private
    procedure PrintItem(AOut: TOutFile; AItem: TEnumItem; const AFmt: string);
  strict protected
    procedure ParseTypeInfo(const ATypeInfo: ITypeInfo); override;
    procedure ParseTypeAttr(const ATypeAttr: TTypeAttr); override;
  public
    constructor Create(const ATypeInfo: ITypeInfo); override;
    destructor Destroy; override;
    procedure Print(AOut: TOutFile); override;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
  end;

  TRecord = class(TTLBMember)
  strict private
    FFields: TObjectList<TVariable>;
    FCount: Integer;
  strict protected
    procedure ParseTypeAttr(const ATypeAttr: TTypeAttr); override;
    procedure ParseTypeInfo(const ATypeInfo: ITypeInfo); override;
  public
    constructor Create(const ATypeInfo: ITypeInfo); override;
    destructor Destroy; override;
    procedure Print(AOut: TOutFile); override;
  end;

  TAlias = class(TTLBMember)
  strict private
    FAlias: string;
    FHRef: HRefType;
  strict protected
    procedure ParseTypeInfo(const ATypeInfo: ITypeInfo); override;
    procedure ParseTypeAttr(const ATypeAttr: TTypeAttr); override;
  public
    procedure Print(AOut: TOutFile); override;
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
    FAliases: TObjectList<TAlias>;
  strict private
    function GetUnitName: string;
  strict private
    procedure Parse(const ATypeLib: ITypeLib);
    procedure RequireUnits(AUnitManager: TUnitManager);
    procedure PrintHeaderConst(AOut: TOutFile);
    procedure PrintClassIDs(AOut: TOutFile);
    procedure PrintIIDs(AOut: TOutFile);
    procedure PrintEnums(AOut: TOutFile);
    procedure PrintForwardIntf(AOut: TOutFile);
    procedure PrintForwardClass(AOut: TOutFile);
    procedure PrintAliaces(AOut: TOutFile);
    procedure PrintRecords(AOut: TOutFile);
    procedure PrintIntf(AOut: TOutFile);
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

type
  TUnitSections = record
    const
      CUnit = 'unit';
      CInterface = 'interface';
      CImplementation = 'implementation';
      CType = 'type';
      CConst = 'const';
  end;

procedure TypeDescToTypeStr(const ATypeDesc: TTypeDesc; out AHRef: HRefType;
  out ATypeStr: string);
begin
  AHRef := 0;
  case ATypeDesc.vt of
    VT_EMPTY: ATypeStr := '!!!UNKNOWN Type VT_EMPTY!!!';
    VT_NULL: ATypeStr := '!!!UNKNOWN Type VT_NULL!!!';
    VT_I2: ATypeStr := 'SmallInt';
    VT_I4: ATypeStr := 'Integer';
    VT_R4: ATypeStr := 'Single';
    VT_R8: ATypeStr := 'Double';
    VT_CY: ATypeStr := 'Currency';
    VT_DATE: ATypeStr := 'TDateTime';
    VT_BSTR: ATypeStr := 'WideString';
    VT_DISPATCH: ATypeStr := 'IDispatch';
    VT_ERROR: ATypeStr := 'SCODE';
    VT_BOOL: ATypeStr := 'WordBool';
    VT_VARIANT: ATypeStr := 'OleVariant';
    VT_UNKNOWN: ATypeStr := 'IUnknown';
    VT_DECIMAL: ATypeStr := '!!!UNKNOWN Type VT_DECIMAL!!!';
    VT_I1: ATypeStr := 'ShortInt';
    VT_UI1: ATypeStr := 'Byte';
    VT_UI2: ATypeStr := 'Word';
    VT_UI4: ATypeStr := 'Cardinal';
    VT_I8: ATypeStr := 'Int64';
    VT_UI8: ATypeStr := 'UInt64';
    VT_INT: ATypeStr := 'SYSINT';
    VT_UINT: ATypeStr := 'SYSUINT';
    VT_VOID: ATypeStr := 'Pointer';
    VT_HRESULT: ATypeStr := 'HRESULT';
    VT_PTR: ATypeStr := 'Pointer';
    VT_SAFEARRAY: ATypeStr := '!!!UNKNOWN Type VT_SAFEARRAY!!!';
    VT_CARRAY: ATypeStr := '!!!UNKNOWN Type VT_CARRAY!!!';
    VT_USERDEFINED: begin
      AHRef := ATypeDesc.hreftype;
      if AHRef = 0 then
        ATypeStr := '!!!UNKNOWN HRefType!!!'
      else
        ATypeStr := '';
    end;
    VT_LPSTR: ATypeStr := 'PAnsiChar';
    VT_LPWSTR: ATypeStr := 'PWideChar';
    VT_RECORD: ATypeStr := '!!!UNKNOWN Type VT_RECORD!!!';
    VT_INT_PTR: ATypeStr := 'SYSINT';
    VT_UINT_PTR: ATypeStr := 'SYSUINT';
    VT_FILETIME: ATypeStr := 'FILETIME';
    VT_BLOB: ATypeStr := '!!!UNKNOWN Type VT_BLOB!!!';
    VT_STREAM: ATypeStr := '!!!UNKNOWN Type VT_STREAM!!!';
    VT_STORAGE: ATypeStr := '!!!UNKNOWN Type VT_STORAGE!!!';
    VT_STREAMED_OBJECT: ATypeStr := '!!!UNKNOWN Type VT_STREAMED_OBJECT!!!';
    VT_STORED_OBJECT: ATypeStr := '!!!UNKNOWN Type VT_STORED_OBJECT!!!';
    VT_BLOB_OBJECT: ATypeStr := '!!!UNKNOWN Type VT_BLOB_OBJECT!!!';
    VT_CF: ATypeStr := '!!!UNKNOWN Type VT_CF!!!';
    VT_CLSID: ATypeStr := '!!!UNKNOWN Type VT_CLSID!!!';
//    VT_VERSIONED_STREAM: ATypeStr := '!!!UNKNOWN Type VT_VERSIONED_STREAM!!!';
  else
    ATypeStr := Format('!!!UNKNOWN Type desc. VT: %.4x!!!', [ATypeDesc.vt]);
  end;
end;

{ TIntfItem }

constructor TIntfItem.Create(const AName: string);
begin
  inherited Create;
  FName := AName;
end;

class function TIntfItem.GetHRefName(const ATypeInfo: ITypeInfo;
  AHRef: HRefType): string;
var
  LType: ITypeInfo;
  LStr: WideString;
begin
  OleCheck(ATypeInfo.GetRefTypeInfo(AHRef, LType));
  OleCheck(LType.GetDocumentation(MEMBERID_NIL, @LStr, nil, nil, nil));
  Result := LStr;
  SysFreeString(PChar(LStr));
end;

{ TTLBMember }

constructor TTLBMember.CreateTLB(const ATypeLib: ITypeLib; AIdx: Integer);
var
  LType: ITypeInfo;
begin
  OleCheck(ATypeLib.GetTypeInfo(AIdx, LType));
  Create(LType);
end;

constructor TTLBMember.Create(const ATypeInfo: ITypeInfo);
var
  LStr: WideString;
begin
  OleCheck(ATypeInfo.GetDocumentation(MEMBERID_NIL, @LStr, nil, nil, nil));
  inherited Create(LStr);
  SysFreeString(PChar(LStr));
  ParseTypeInfo(ATypeInfo);
end;

procedure TTLBMember.ParseTypeInfo(const ATypeInfo: ITypeInfo);
var
  LAttr: PTypeAttr;
begin
  OleCheck(ATypeInfo.GetTypeAttr(LAttr));
  try
    ParseTypeAttr(LAttr^);
  finally
    ATypeInfo.ReleaseTypeAttr(LAttr);
  end;
end;

procedure TTLBMember.ParseTypeAttr(const ATypeAttr: TTypeAttr);
begin
  // Abstract
end;

procedure TTLBMember.RequireUnits(AUnitManager: TUnitManager);
begin
  // Abstract
end;

{ TTypeMember }

constructor TTypeMember.Create(const ATypeInfo: ITypeInfo; AMemberID: TMemberID);
var
  LStr: WideString;
begin
  ATypeInfo.GetDocumentation(AMemberID, @LStr, nil, nil, nil);
  inherited Create(LStr);
  SysFreeString(PChar(LStr));
end;

{ TVariable }

constructor TVariable.Create(const ATypeInfo: ITypeInfo; AIdx: Integer);
var
  LVarDesc: PVarDesc;
  LMemID: TMemberID;
  LHref: HRefType;
begin
  OleCheck(ATypeInfo.GetVarDesc(AIdx, LVarDesc));
  try
    TypeDescToTypeStr(LVarDesc^.elemdescVar.tdesc, LHref, FType_);
    if LHref <> 0 then
      FType_ := GetHRefName(ATypeInfo, LHref);
    inherited Create(ATypeInfo, LVarDesc^.memid);
  finally
    ATypeInfo.ReleaseVarDesc(LVarDesc);
  end;
end;

procedure TVariable.Print(AOut: TOutFile);
begin
  AOut.WriteFmt('%s: %s;', [Name, FType_]);
end;

{ TIntfMethod }

constructor TIntfMethod.Create(const ATypeInfo: ITypeInfo; AIdx: Integer);
var
  LDesc: PFuncDesc;
begin
  OleCheck(ATypeInfo.GetFuncDesc(AIdx, LDesc));
  try
    inherited Create(ATypeInfo, LDesc^.memid);
  finally
    ATypeInfo.ReleaseFuncDesc(LDesc);
  end;
  FArgs := TObjectList<TMethodArg>.Create(True);
end;

destructor TIntfMethod.Destroy;
begin
  FArgs.Free;
  inherited Destroy;
end;

procedure TIntfMethod.Print(AOut: TOutFile);
begin
  AOut.WriteFmt('%s;', [Name]);
end;

{ TGUIDMember }

procedure TGUIDMember.ParseTypeAttr(const ATypeAttr: TTypeAttr);
begin
  inherited ParseTypeAttr(ATypeAttr);
  FUUID := ATypeAttr.guid;
end;

procedure TGUIDMember.PrintIID(AOut: TOutFile);
begin
  AOut.WriteFmt('%s_%s: TGUID = ''%s'';', [GetIIDPrefix, Name, GUIDToString(FUUID)]);
end;

{ TCustomInterface }

procedure TCustomInterface.ParseTypeAttr(const ATypeAttr: TTypeAttr);
begin
  inherited ParseTypeAttr(ATypeAttr);
  FFuncCount := ATypeAttr.cFuncs;
end;

{ TInterface }

constructor TInterface.Create(const ATypeInfo: ITypeInfo);
begin
  FMethods := TObjectList<TIntfMethod>.Create(True);
  inherited Create(ATypeInfo);
end;

destructor TInterface.Destroy;
begin
  FParent.Free;
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

procedure TInterface.ParseTypeInfo(const ATypeInfo: ITypeInfo);
var
  Li: Integer;
  LRef: HRefType;
  LInfo: ITypeInfo;
begin
  inherited ParseTypeInfo(ATypeInfo);
  OleCheck(ATypeInfo.GetRefTypeOfImplType(0, LRef));
  OleCheck(ATypeInfo.GetRefTypeInfo(LRef, LInfo));
  FParent := TCustomInterface.Create(LInfo);
  for Li := 0 to FuncCount - 1 do
    FMethods.Add(TIntfMethod.Create(ATypeInfo, Li));
end;

procedure TInterface.Print(AOut: TOutFile);
var
  Li: Integer;
begin
  AOut.WriteFmt('%s = interface(%s)', [Name, FParent.Name]);
  AOut.IncIdent;
  try
    AOut.WriteFmt('[''%s'']', [GUIDToString(UUID)]);
    for Li := 0 to FMethods.Count - 1 do
      FMethods[Li].Print(AOut);
  finally
    AOut.DecIdent;
  end;
  AOut.Write('end;');
  AOut.EmptyLine;
end;

procedure TInterface.PrintForward(AOut: TOutFile);
begin
  AOut.WriteFmt('%s = interface;', [Name]);
end;

{ TDispInterface }

constructor TDispInterface.Create(const ATypeInfo: ITypeInfo);
var
  LHref: HRefType;
  LType: ITypeInfo;
begin
  if ATypeInfo.GetRefTypeOfImplType(-1, LHref) = S_OK then
    OleCheck(ATypeInfo.GetRefTypeInfo(LHref, LType))
  else
    LType := ATypeInfo;
  inherited Create(LType);
end;

function TDispInterface.GetDispName: string;
begin
  Result := Name;
  if Flags and TYPEFLAG_FDUAL = TYPEFLAG_FDUAL then
    Result := Result + 'Disp';
end;

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

procedure TDispInterface.PrintForward(AOut: TOutFile);
begin
  if Flags and TYPEFLAG_FDUAL = TYPEFLAG_FDUAL then
    inherited PrintForward(AOut);
  AOut.WriteFmt('%s = dispinterface;', [GetDispName]);
end;

{ TCoClass }

destructor TCoClass.Destroy;
begin
  FDefaultIntf.Free;
  inherited Destroy;
end;

function TCoClass.GetIIDPrefix: string;
begin
  Result := 'CLASS';
end;

procedure TCoClass.ParseTypeAttr(const ATypeAttr: TTypeAttr);
begin
  inherited ParseTypeAttr(ATypeAttr);
  FCountImpl := ATypeAttr.cImplTypes;
end;

procedure TCoClass.ParseTypeInfo(const ATypeInfo: ITypeInfo);
var
  Li: Integer;
  LFlag: Integer;
  LRefType: HRefType;
  LInfo: ITypeInfo;
begin
  inherited ParseTypeInfo(ATypeInfo);
  for Li := 0 to FCountImpl - 1 do begin
    OleCheck(ATypeInfo.GetImplTypeFlags(Li, LFlag));
    if LFlag and IMPLTYPEFLAG_FDEFAULT = IMPLTYPEFLAG_FDEFAULT then begin
      OleCheck(ATypeInfo.GetRefTypeOfImplType(Li, LRefType));
      OleCheck(ATypeInfo.GetRefTypeInfo(LRefType, LInfo));
      FDefaultIntf := TInterface.Create(LInfo);
      Break;
    end;
  end;
end;

procedure TCoClass.PrintForward(AOut: TOutFile);
begin
  AOut.WriteFmt('%s = %s;', [Name, FDefaultIntf.Name]);
end;

{ TEnumItem }

constructor TEnumItem.Create(const ATypeInfo: ITypeInfo;
  AIdx: Integer);
var
  LVarDesc: PVarDesc;
  LMemID: TMemberID;
begin
  OleCheck(ATypeInfo.GetVarDesc(AIdx, LVarDesc));
  try
    FValue := LVarDesc^.lpvarValue^;
    inherited Create(ATypeInfo, LVarDesc^.memid);
  finally
    ATypeInfo.ReleaseVarDesc(LVarDesc);
  end;
end;

procedure TEnumItem.Print(AOut: TOutFile);
begin
  AOut.WriteFmt('%s = ' + FValueFmt, [Name, FValue]);
end;

{ TEnum }

constructor TEnum.Create(const ATypeInfo: ITypeInfo);
begin
  FItems := TObjectList<TEnumItem>.Create(True);
  FShowEnum := False;
  FShowHex := True;
  inherited Create(ATypeInfo);
end;

destructor TEnum.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;

procedure TEnum.PrintItem(AOut: TOutFile; AItem: TEnumItem; const AFmt: string);
begin
  AItem.ValueFmt := AFmt;
  AItem.Print(AOut);
end;

procedure TEnum.ParseTypeInfo(const ATypeInfo: ITypeInfo);
var
  Li: Integer;
begin
  inherited ParseTypeInfo(ATypeInfo);
  for Li := 0 to FCount - 1 do
    FItems.Add(TEnumItem.Create(ATypeInfo, Li));
end;

procedure TEnum.ParseTypeAttr(const ATypeAttr: TTypeAttr);
begin
  inherited ParseTypeAttr(ATypeAttr);
  FCount := ATypeAttr.cVars;
end;

procedure TEnum.Print(AOut: TOutFile);
var
  Li: Integer;
  LFmt: string;
begin
  if AOut.Level[-1] <> TUnitSections.CType then begin
    AOut.DecIdent;
    try
      AOut.Write(TUnitSections.CType);
    finally
      AOut.IncIdent;
    end;
  end;
  if FShowHex then
    LFmt := '$%.8x'
  else
    LFmt := '%d';
  if FShowEnum then begin
    AOut.WriteFmt('%s = (', [Name]);
    LFmt := LFmt + ',';
    AOut.IncIdent;
  end else begin
    AOut.WriteFmt('%s = type TOleEnum;', [Name]);
    LFmt := Format('%s(%s);', [Name, LFmt]);
    AOut.DecIdent;
    AOut.Write(TUnitSections.CConst);
    AOut.IncIdent;
  end;
  for Li := 0 to FItems.Count - 2 do
    PrintItem(AOut, FItems[Li], LFmt);
  if FShowEnum then
    SetLength(LFmt, Length(LFmt) - 1);
  PrintItem(AOut, FItems.Last, LFmt);

  if FShowEnum then begin
    AOut.DecIdent;
    AOut.Write(');');
  end;
  AOut.EmptyLine;
end;

procedure TEnum.RequireUnits(AUnitManager: TUnitManager);
begin
  inherited RequireUnits(AUnitManager);
  if not FShowEnum then
    AUnitManager.AddStdUnit(suActiveX);
end;

{ TRecord }

constructor TRecord.Create(const ATypeInfo: ITypeInfo);
begin
  FFields := TObjectList<TVariable>.Create(True);
  inherited Create(ATypeInfo);
end;

destructor TRecord.Destroy;
begin
  FFields.Free;
  inherited Destroy;
end;

procedure TRecord.ParseTypeAttr(const ATypeAttr: TTypeAttr);
begin
  inherited ParseTypeAttr(ATypeAttr);
  FCount := ATypeAttr.cVars;
end;

procedure TRecord.ParseTypeInfo(const ATypeInfo: ITypeInfo);
var
  Li: Integer;
begin
  inherited ParseTypeInfo(ATypeInfo);
  for Li := 0 to FCount - 1 do
    FFields.Add(TVariable.Create(ATypeInfo, Li));
end;

procedure TRecord.Print(AOut: TOutFile);
var
  Li: Integer;
begin
  AOut.WriteFmt('%s = record', [Name]);
  AOut.IncIdent;
  try
    for Li := 0 to FFields.Count - 1 do
      FFields[Li].Print(AOut);
  finally
    AOut.DecIdent;
  end;
  AOut.Write('end;');
  AOut.EmptyLine;
end;

{ TAlias }

procedure TAlias.ParseTypeInfo(const ATypeInfo: ITypeInfo);
begin
  inherited ParseTypeInfo(ATypeInfo);
  if FHRef <> 0 then
    FAlias := GetHRefName(ATypeInfo, FHRef);
end;

procedure TAlias.ParseTypeAttr(const ATypeAttr: TTypeAttr);
begin
  inherited ParseTypeAttr(ATypeAttr);
  TypeDescToTypeStr(ATypeAttr.tdescAlias, FHRef, FAlias);
end;

procedure TAlias.Print(AOut: TOutFile);
begin
  AOut.WriteFmt('%s = type %s;', [Name, FAlias]);
end;

{ TTLBInfo }

constructor TTLBInfo.Create(const AFileName: string);
var
  LTlb: ITypeLib;
  LStr: WideString;
begin
  OleCheck(LoadTypeLibEx(PChar(AFileName), REGKIND_NONE, LTlb));
  OleCheck(LTlb.GetDocumentation(MEMBERID_NIL, @LStr, nil, nil, nil));
  inherited Create(LStr);
  SysFreeString(PChar(LStr));
  FUnits := TUnitManager.Create(True);
  FEnums := TObjectList<TEnum>.Create(True);
  FRecords := TObjectList<TRecord>.Create(True);
  FInterfaces := TObjectList<TInterface>.Create(True);
  FCoClasses := TObjectList<TCoClass>.Create(True);
  FAliases := TObjectList<TAlias>.Create(True);
  Parse(LTlb);
end;

destructor TTLBInfo.Destroy;
begin
  FAliases.Free;
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
      TKIND_ENUM: FEnums.Add(TEnum.CreateTLB(ATypeLib, Li));
      TKIND_RECORD: FRecords.Add(TRecord.CreateTLB(ATypeLib, Li));
      TKIND_MODULE:;
      TKIND_INTERFACE: FInterfaces.Add(TInterface.CreateTLB(ATypeLib, Li));
      TKIND_DISPATCH: FInterfaces.Add(TDispInterface.CreateTLB(ATypeLib, Li));
      TKIND_COCLASS: FCoClasses.Add(TCoClass.CreateTLB(ATypeLib, Li));
      TKIND_ALIAS: FAliases.Add(TAlias.CreateTLB(ATypeLib, Li));
      TKIND_UNION:;
    end;
  end;
end;

procedure TTLBInfo.RequireUnits(AUnitManager: TUnitManager);
var
  Li: Integer;
begin
  for Li := 0 to FEnums.Count - 1 do
    FEnums[Li].RequireUnits(AUnitManager);
  for Li := 0 to FRecords.Count - 1 do
    FRecords[Li].RequireUnits(AUnitManager);
  for Li := 0 to FInterfaces.Count - 1 do
    FInterfaces[Li].RequireUnits(AUnitManager);
  for Li := 0 to FCoClasses.Count - 1 do
    FCoClasses[Li].RequireUnits(AUnitManager);
end;

procedure TTLBInfo.PrintHeaderConst(AOut: TOutFile);
begin
  AOut.WriteFmt('%sMajorVersion = %d;', [Name, FMajorVersion]);
  AOut.WriteFmt('%sMinorVersion = %d;', [Name, FMinorVersion]);
  AOut.EmptyLine;
  AOut.WriteFmt('LIBID_%s: TGUID = ''%s'';', [Name, GUIDToString(FUUID)]);
  AOut.EmptyLine;
end;

procedure TTLBInfo.PrintClassIDs(AOut: TOutFile);
var
  Li: Integer;
begin
  if FCoClasses.Count > 0 then begin
    AOut.Write('// CLASSID constants');
    for Li := 0 to FCoClasses.Count - 1 do
      FCoClasses[Li].PrintIID(AOut);
    AOut.EmptyLine;
  end;
end;

procedure TTLBInfo.PrintIIDs(AOut: TOutFile);
var
  Li: Integer;
begin
  if FInterfaces.Count > 0 then begin
    AOut.Write('// IID constants');
    for Li := 0 to FInterfaces.Count - 1 do
      FInterfaces[Li].PrintIID(AOut);
    AOut.EmptyLine;
  end;
end;

procedure TTLBInfo.PrintEnums(AOut: TOutFile);
var
  Li: Integer;
begin
  if FEnums.Count > 0 then begin
    AOut.Write('// Enumerators');
    AOut.Write(TUnitSections.CType);
    AOut.IncIdent;
    try
      for Li := 0 to FEnums.Count - 1 do
        FEnums[Li].Print(AOut);
    finally
      AOut.DecIdent;
    end;
  end;
end;

procedure TTLBInfo.PrintForwardIntf(AOut: TOutFile);
var
  Li: Integer;
begin
  if FInterfaces.Count > 0 then begin
    AOut.Write(TUnitSections.CType);
    AOut.IncIdent;
    try
      AOut.Write('// Interfaces forward declarations');
      for Li := 0 to FInterfaces.Count - 1 do
        FInterfaces[Li].PrintForward(AOut);
      AOut.EmptyLine;
    finally
      AOut.DecIdent;
    end;
  end;
end;

procedure TTLBInfo.PrintForwardClass(AOut: TOutFile);
var
  Li: Integer;
begin
  if FCoClasses.Count > 0 then begin
    AOut.Write(TUnitSections.CType);
    AOut.IncIdent;
    try
      AOut.Write('// CoClasses as default interface');
      for Li := 0 to FCoClasses.Count - 1 do
        FCoClasses[Li].PrintForward(AOut);
      AOut.EmptyLine;
    finally
      AOut.DecIdent;
    end;
  end;
end;

procedure TTLBInfo.PrintAliaces(AOut: TOutFile);
var
  Li: Integer;
begin
  if FAliases.Count > 0 then begin
    AOut.Write(TUnitSections.CType);
    AOut.IncIdent;
    try
      AOut.Write('// Aliaces');
      for Li := 0 to FAliases.Count - 1 do
        FAliases[Li].Print(AOut);
      AOut.EmptyLine;
    finally
      AOut.DecIdent;
    end;
  end;
end;

procedure TTLBInfo.PrintRecords(AOut: TOutFile);
var
  Li: Integer;
begin
  if FRecords.Count > 0 then begin
    AOut.Write(TUnitSections.CType);
    AOut.IncIdent;
    try
      AOut.Write('// Records');
      for Li := 0 to FRecords.Count - 1 do
        FRecords[Li].Print(AOut);
      AOut.EmptyLine;
    finally
      AOut.DecIdent;
    end;
  end;
end;

procedure TTLBInfo.PrintIntf(AOut: TOutFile);
var
  Li: Integer;
begin
  if FInterfaces.Count > 0 then begin
    AOut.Write(TUnitSections.CType);
    AOut.IncIdent;
    try
      AOut.Write('// Interfaces');
      for Li := 0 to FInterfaces.Count - 1 do
        FInterfaces[Li].Print(AOut);
      AOut.EmptyLine;
    finally
      AOut.DecIdent;
    end;
  end;
end;

procedure TTLBInfo.Print(AOut: TOutFile);
var
  Li: Integer;
  LIntf: TInterface;
begin
  AOut.WriteFmt(TUnitSections.CUnit + ' %s;', [UnitName]);
  AOut.EmptyLine;
  AOut.Write(TUnitSections.CInterface);
  AOut.EmptyLine;
  RequireUnits(FUnits);
  FUnits.Print(AOut);
  AOut.Write(TUnitSections.CConst);
  AOut.IncIdent;
  try
    PrintHeaderConst(AOut);
    PrintClassIDs(AOut);
    PrintIIDs(AOut);
  finally
    AOut.DecIdent;
  end;

  PrintEnums(AOut);
  PrintForwardIntf(AOut);
  PrintForwardClass(AOut);
  PrintAliaces(AOut);
  PrintRecords(AOut);
  PrintIntf(AOut);
end;

end.
