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
    procedure RequireUnits(AUnitManager: TUnitManager); virtual;
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
    FType: TPasTypeInfo;
  public
    constructor Create(const ATypeInfo: ITypeInfo; AIdx: Integer);
    procedure Print(AOut: TOutFile); override;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
  end;

  TMethodArg = class(TIntfItem)
  strict private
    const
      CFlagIn = $01;
      CFlagOut = $02;
      CFlagRetVal = $04;
      CFlagRef = $08;
  strict private
    FType: TPasTypeInfo;
    FFlag: Byte;
  public
    constructor Create(const ATypeInfo: ITypeInfo; const AName: string;
      const ADesc: TElemDesc);
    procedure Print(AOut: TOutFile); override;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
    function ToString: string; override;
  end;

  TIntfMethod = class(TTypeMember)
  strict private
    type
      TCallingConv = (ccRegister, ccPascal, ccCdecl, ccStdcall, ccSafecall);
    const
      CCallinvConvNames: array[TCallingConv] of string = (
        'register', 'pascal', 'cdecl', 'stdcall', 'safecall'
      );
  strict private
    FRetType: TPasTypeInfo;
    FArgs: TObjectList<TMethodArg>;
    FCallingConv: TCallingConv;
    FInvoke: TInvokeKind;
  strict private
    function DecodeCallingConv(ACallingConv: TCallConv): TCallingConv;
  public
    constructor Create(const ATypeInfo: ITypeInfo; AIdx: Integer);
    destructor Destroy; override;
    procedure Print(AOut: TOutFile); override;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
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
    procedure RequireUnits(AUnitManager: TUnitManager); override;
  end;

  TDispInterface = class(TInterface)
  strict private
    class function GetIsDisp(AFlags: Word): Boolean; overload;
    function GetIsDisp: Boolean; overload;
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
    procedure RequireUnits(AUnitManager: TUnitManager); override;
  end;

  TAlias = class(TTLBMember)
  strict private
    FAlias: TPasTypeInfo;
    FHRef: HRefType;
  strict protected
    procedure ParseTypeInfo(const ATypeInfo: ITypeInfo); override;
    procedure ParseTypeAttr(const ATypeAttr: TTypeAttr); override;
  public
    procedure Print(AOut: TOutFile); override;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
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
    procedure RequireUnits(AUnitManager: TUnitManager); override;
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

procedure __TypeDescToPasType(const ATypeInfo: ITypeInfo;
const ATypeDesc: TTypeDesc; out AHRef: HRefType;
  var APasType: TPasTypeInfo);
var
  LRes: HRESULT;
  LType: ITypeInfo;
  LStr: WideString;
begin
  if (ATypeDesc.hreftype <> 0) and (ATypeInfo <> nil) then begin
    LRes := ATypeInfo.GetRefTypeInfo(ATypeDesc.hreftype, LType);
    if LRes = S_OK then
      LType.GetDocumentation(MEMBERID_NIL, @LStr, nil, nil, nil);
  end;
  AHRef := 0;
  case ATypeDesc.vt of
    VT_EMPTY: APasType.Name := '!!!UNKNOWN Type VT_EMPTY!!!';
    VT_NULL: APasType.Name := '!!!UNKNOWN Type VT_NULL!!!';
    VT_I2: APasType.Name := 'SmallInt';
    VT_I4: APasType.Name := 'Integer';
    VT_R4: APasType.Name := 'Single';
    VT_R8: APasType.Name := 'Double';
    VT_CY: APasType.Name := 'Currency';
    VT_DATE: APasType.Name := 'TDateTime';
    VT_BSTR: APasType.Name := 'WideString';
    VT_DISPATCH: APasType.Name := 'IDispatch';
    VT_ERROR: begin
      APasType.Name := 'SCODE';
      APasType.StdUnit := suActiveX;
    end;
    VT_BOOL: APasType.Name := 'WordBool';
    VT_VARIANT: APasType.Name := 'OleVariant';
    VT_UNKNOWN: APasType.Name := 'IUnknown';
    VT_DECIMAL: APasType.Name := '!!!UNKNOWN Type VT_DECIMAL!!!';
    VT_I1: APasType.Name := 'ShortInt';
    VT_UI1: APasType.Name := 'Byte';
    VT_UI2: APasType.Name := 'Word';
    VT_UI4: APasType.Name := 'Cardinal';
    VT_I8: APasType.Name := 'Int64';
    VT_UI8: APasType.Name := 'UInt64';
    VT_INT: begin
      APasType.Name := 'SYSINT';
      APasType.StdUnit := suActiveX;
    end;
    VT_UINT: begin
      APasType.Name := 'SYSUINT';
      APasType.StdUnit := suActiveX;
    end;
    VT_VOID: APasType.Name := 'VOID';
    VT_HRESULT: APasType.Name := 'HRESULT';
    VT_PTR: begin
      Inc(APasType.Ref);
      __TypeDescToPasType(ATypeInfo, ATypeDesc.ptdesc^, AHRef, APasType);
    end;
    VT_SAFEARRAY: APasType.Name := '!!!UNKNOWN Type VT_SAFEARRAY!!!';
    VT_CARRAY: APasType.Name := '!!!UNKNOWN Type VT_CARRAY!!!';
    VT_USERDEFINED: begin
      AHRef := ATypeDesc.hreftype;
      if AHRef = 0 then
        APasType.Name := '!!!UNKNOWN HRefType!!!'
      else
        APasType.Name := '';
    end;
    VT_LPSTR: APasType.Name := 'PAnsiChar';
    VT_LPWSTR: APasType.Name := 'PWideChar';
    VT_RECORD: APasType.Name := '!!!UNKNOWN Type VT_RECORD!!!';
    VT_INT_PTR: begin
      APasType.Name := 'LPARAM';
      APasType.StdUnit := suWindows;
    end;
    VT_UINT_PTR: begin
      APasType.Name := 'WPARAM';
      APasType.StdUnit := suWindows;
    end;
    VT_FILETIME: begin
      APasType.Name := 'FILETIME';
      APasType.StdUnit := suWindows;
    end;
    VT_BLOB: APasType.Name := '!!!UNKNOWN Type VT_BLOB!!!';
    VT_STREAM: APasType.Name := '!!!UNKNOWN Type VT_STREAM!!!';
    VT_STORAGE: APasType.Name := '!!!UNKNOWN Type VT_STORAGE!!!';
    VT_STREAMED_OBJECT: APasType.Name := '!!!UNKNOWN Type VT_STREAMED_OBJECT!!!';
    VT_STORED_OBJECT: APasType.Name := '!!!UNKNOWN Type VT_STORED_OBJECT!!!';
    VT_BLOB_OBJECT: APasType.Name := '!!!UNKNOWN Type VT_BLOB_OBJECT!!!';
    VT_CF: APasType.Name := '!!!UNKNOWN Type VT_CF!!!';
    VT_CLSID: APasType.Name := '!!!UNKNOWN Type VT_CLSID!!!';
//    VT_VERSIONED_STREAM: APasType.Name := '!!!UNKNOWN Type VT_VERSIONED_STREAM!!!';
  else
    APasType.Name := Format('!!!UNKNOWN Type desc. VT: %.4x!!!', [ATypeDesc.vt]);
  end;
end;

procedure TypeDescToPasType(const ATypeInfo: ITypeInfo;
  const ATypeDesc: TTypeDesc; out AHRef: HRefType;
  out APasType: TPasTypeInfo);
begin
  APasType.Ref := 0;
  APasType.StdUnit := suSystem;
  APasType.CustomUnit := '';
  __TypeDescToPasType(ATypeInfo, ATypeDesc, AHRef, APasType);
end;

function GetHRefName(const ATypeInfo: ITypeInfo; AHRef: HRefType): TPasTypeInfo;
var
  LType: ITypeInfo;
  LStr: WideString;
begin
  OleCheck(ATypeInfo.GetRefTypeInfo(AHRef, LType));
  OleCheck(LType.GetDocumentation(MEMBERID_NIL, @LStr, nil, nil, nil));
  Result.Name := LStr;
  SysFreeString(PChar(LStr));
  Result.Ref := 0;
  Result.StdUnit := suSystem;
  Result.CustomUnit := '';
end;

function ElemDescToTypeStr(const ATypeInfo: ITypeInfo; const ADesc: TElemDesc): TPasTypeInfo;
var
  LHref: HRefType;
begin
  TypeDescToPasType(ATypeInfo, ADesc.tdesc, LHref, Result);
  if LHref <> 0 then
    Result := GetHRefName(ATypeInfo, LHref);
end;

{ TIntfItem }

constructor TIntfItem.Create(const AName: string);
begin
  inherited Create;
  FName := AName;
end;

procedure TIntfItem.RequireUnits(AUnitManager: TUnitManager);
begin
  // Abstract
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
    FType := ElemDescToTypeStr(ATypeInfo, LVarDesc^.elemdescVar);
    inherited Create(ATypeInfo, LVarDesc^.memid);
  finally
    ATypeInfo.ReleaseVarDesc(LVarDesc);
  end;
end;

procedure TVariable.Print(AOut: TOutFile);
begin
  AOut.WriteFmt('%s: %s;', [Name, FType.Name]);
end;

procedure TVariable.RequireUnits(AUnitManager: TUnitManager);
begin
  inherited RequireUnits(AUnitManager);
  AUnitManager.AddPasType(FType);
end;

{ TMethodArg }

constructor TMethodArg.Create(const ATypeInfo: ITypeInfo; const AName: string;
  const ADesc: TElemDesc);
begin
  inherited Create(AName);
  FType := ElemDescToTypeStr(ATypeInfo, ADesc);
  if ADesc.tdesc.vt = VT_PTR then
    FFlag := CFlagRef;
  if ADesc.paramdesc.wParamFlags and PARAMFLAG_FIN = PARAMFLAG_FIN then
    FFlag := FFlag or CFlagIn;
  if ADesc.paramdesc.wParamFlags and PARAMFLAG_FOUT = PARAMFLAG_FOUT then
    FFlag := FFlag or CFlagOut;
  if ADesc.paramdesc.wParamFlags and PARAMFLAG_FRETVAL = PARAMFLAG_FRETVAL then
    FFlag := FFlag or CFlagRetVal;
end;

procedure TMethodArg.Print(AOut: TOutFile);
begin
  AOut.Write(ToString);
end;

procedure TMethodArg.RequireUnits(AUnitManager: TUnitManager);
begin
  inherited RequireUnits(AUnitManager);
  AUnitManager.AddPasType(FType);
end;

function TMethodArg.ToString: string;
var
  LPrfx: string;
begin
  if FFlag and CFlagOut = CFlagOut then begin
    if FFlag and CFlagIn = CFlagIn then
      LPrfx := 'var '
    else
      LPrfx := 'out ';
  end else
    LPrfx := '';
  Result := Format('%s%s: %s', [LPrfx, Name, FType.Name]);
end;

{ TIntfMethod }

constructor TIntfMethod.Create(const ATypeInfo: ITypeInfo; AIdx: Integer);
var
  LDesc: PFuncDesc;
  LHref: HRefType;
  Li: Integer;
  LAttr: PTypeAttr;
  LParamNames: array of WideString;
  LCnt: Integer;
begin
  FArgs := TObjectList<TMethodArg>.Create(True);
  OleCheck(ATypeInfo.GetFuncDesc(AIdx, LDesc));
  try
    inherited Create(ATypeInfo, LDesc^.memid);
    FRetType := ElemDescToTypeStr(ATypeInfo, LDesc^.elemdescFunc);
    FCallingConv := DecodeCallingConv(LDesc^.callconv);
    FInvoke := LDesc^.invkind;
    if LDesc^.cParams > 0 then begin
      SetLength(LParamNames, LDesc^.cParams + 1);
      OleCheck(ATypeInfo.GetNames(LDesc^.memid, @LParamNames[0], LDesc^.cParams + 1, LCnt));
      for Li := 0 to LDesc^.cParams - 1 do
        FArgs.Add(TMethodArg.Create(ATypeInfo, LParamNames[Li + 1], LDesc^.lprgelemdescParam^[Li]));
    end;
  finally
    ATypeInfo.ReleaseFuncDesc(LDesc);
  end;
end;

destructor TIntfMethod.Destroy;
begin
  FArgs.Free;
  inherited Destroy;
end;

function TIntfMethod.DecodeCallingConv(ACallingConv: TCallConv): TCallingConv;
begin
  case ACallingConv of
    CC_SAFECALL: Result := ccSafecall;
    CC_CDECL, CC_MPWCDECL: Result := ccCdecl;
    CC_PASCAL, CC_MACPASCAL, CC_MPWPASCAL: Result := ccPascal;
    CC_STDCALL: Result := ccStdcall;
    CC_FPFASTCALL: Result := ccRegister;
    CC_SYSCALL: Result := ccCdecl;
  else
    Result := ccCdecl;
  end;
end;

procedure TIntfMethod.Print(AOut: TOutFile);
const
  CDelim = ', ';
var
  LPrfx: string;
  LCallConv: string;
  Li: Integer;
  LStr: string;
  LArgStr: string;
  LIsIdent: Boolean;
  LB: TStringBuilder;
begin
  case FInvoke of
    INVOKE_PROPERTYGET: LPrfx := 'Get_';
    INVOKE_PROPERTYPUT, INVOKE_PROPERTYPUTREF: LPrfx := 'Set_';
  else
    LPrfx := '';
  end;

  if FCallingConv <> ccRegister then
    LCallConv := Format(' %s;', [CCallinvConvNames[FCallingConv]])
  else
    LCallConv := '';

  LIsIdent := False;
  LStr := Format('function %s%s(', [LPrfx, Name]);
  for Li := 0 to FArgs.Count - 1 do begin
    LArgStr := FArgs[Li].ToString;
    if (Length(LStr) + Length(LArgStr) + Length(CDelim) >= 76) and (LStr <> '') then begin
      AOut.Write(TrimRight(LStr));
      LStr := '';
      if not LIsIdent then begin
        AOut.IncIdent;
        LIsIdent := True;
      end;
    end;
    LStr := LStr + LArgStr + CDelim;
  end;
  SetLength(LStr, Length(LStr) - Length(CDelim));
  AOut.WriteFmt('%s): %s;%s', [LStr, FRetType.Name, LCallConv]);
  if LIsIdent then
    AOut.DecIdent;
end;

procedure TIntfMethod.RequireUnits(AUnitManager: TUnitManager);
var
  Li: Integer;
begin
  inherited RequireUnits(AUnitManager);
  AUnitManager.AddPasType(FRetType);
  for Li := 0 to FArgs.Count - 1 do
    FArgs[Li].RequireUnits(AUnitManager);
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

procedure TInterface.RequireUnits(AUnitManager: TUnitManager);
var
  Li: Integer;
begin
  inherited RequireUnits(AUnitManager);
  for Li := 0 to FMethods.Count - 1 do
    FMethods[Li].RequireUnits(AUnitManager);
end;

{ TDispInterface }

constructor TDispInterface.Create(const ATypeInfo: ITypeInfo);
var
  LAttr: PTypeAttr;
  LHref: HRefType;
  LType: ITypeInfo;
begin
  OleCheck(ATypeInfo.GetTypeAttr(LAttr));
  try
    if GetIsDisp(LAttr^.wTypeFlags) then begin
      OleCheck(ATypeInfo.GetRefTypeOfImplType(-1, LHref));
      OleCheck(ATypeInfo.GetRefTypeInfo(LHref, LType));
    end else
      LType := ATypeInfo;
  finally
    ATypeInfo.ReleaseTypeAttr(LAttr);
  end;
  inherited Create(LType);
end;

class function TDispInterface.GetIsDisp(AFlags: Word): Boolean;
begin
  Result := AFlags and TYPEFLAG_FDUAL = TYPEFLAG_FDUAL
end;

function TDispInterface.GetIsDisp: Boolean;
begin
  Result := GetIsDisp(Flags);
end;

function TDispInterface.GetDispName: string;
begin
  Result := Name;
  if GetIsDisp then
    Result := Result + 'Disp';
end;

function TDispInterface.GetIIDPrefix: string;
begin
  Result := inherited GetIIDPrefix;
  if not GetIsDisp then
    Result := 'D' + Result;
end;

procedure TDispInterface.Print(AOut: TOutFile);
begin
  AOut.Write('Disp!!!');
  inherited Print(AOut);
end;

procedure TDispInterface.PrintForward(AOut: TOutFile);
begin
  if GetIsDisp then
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

procedure TRecord.RequireUnits(AUnitManager: TUnitManager);
var
  Li: Integer;
begin
  inherited RequireUnits(AUnitManager);
  for Li := 0 to FFields.Count - 1 do
    FFields[Li].RequireUnits(AUnitManager);
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
  TypeDescToPasType(nil, ATypeAttr.tdescAlias, FHRef, FAlias);
end;

procedure TAlias.Print(AOut: TOutFile);
begin
  AOut.WriteFmt('%s = type %s;', [Name, FAlias.Name]);
end;

procedure TAlias.RequireUnits(AUnitManager: TUnitManager);
begin
  inherited RequireUnits(AUnitManager);
  AUnitManager.AddPasType(FAlias);
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
  for Li := 0 to FAliases.Count - 1 do
    FAliases[Li].RequireUnits(AUnitManager);
end;

end.
