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
    procedure ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr); virtual;
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
  strict private
    FType: TPasTypeInfo;
    FFlag: Byte;
  public
    constructor Create(const ATypeInfo: ITypeInfo; const AName: string;
      const ADesc: TElemDesc);
    procedure Print(AOut: TOutFile); override;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
    function ToString: string; override;
    function IsRetVal: Boolean;
  public
    property Type_: TPasTypeInfo read FType;
  end;

  TIntfMethod = class(TTypeMember)
  strict private
    type
      TCallingConv = (ccRegister, ccPascal, ccCdecl, ccStdcall, ccSafecall);
      TUseSafeCall = (uscNone, uscDef, uscForced);
    const
      CCallinvConvNames: array[TCallingConv] of string = (
        'register', 'pascal', 'cdecl', 'stdcall', 'safecall'
      );
  strict private
    FRetType: TPasTypeInfo;
    FArgs: TObjectList<TMethodArg>;
    FCallingConv: TCallingConv;
    FUseSafeCall: TUseSafeCall;
    FInvoke: TInvokeKind;
    FDispID: TMemberID;
  strict private
    function DecodeCallingConv(ACallingConv: TCallConv): TCallingConv;
    function IsRetHRes: Boolean;
    function IsVoid(const AType: TPasTypeInfo): Boolean;
  strict protected
    property DispID: TMemberID read FDispID;
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
    procedure ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr); override;
    function GetIIDPrefix: string; virtual; abstract;
  public
    procedure PrintIID(AOut: TOutFile);
    procedure PrintForward(AOut: TOutFile); virtual; abstract;
  end;

  TCustomInterface = class(TGUIDMember)
  public
    property Name;
  end;

  TInterface = class(TCustomInterface)
  strict private
    FMethods: TObjectList<TIntfMethod>;
    FParent: TCustomInterface;
    FFlags: Word;
  strict private
    function GetForwardDecl: string;
  strict protected
    property Flags: Word read FFlags;
  strict protected
    function GetIIDPrefix: string; override;
    procedure ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr); override;
    procedure ParseTypeInfo(const ATypeInfo: ITypeInfo); override;
    procedure InternalPrint(AOut: TOutFile; const AHeader: string;
      APrintDisp: Boolean);
  public
    constructor Create(const ATypeInfo: ITypeInfo); override;
    destructor Destroy; override;
    procedure Print(AOut: TOutFile); override;
    procedure PrintForward(AOut: TOutFile); override;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
  end;

  TDispInterface = class(TInterface)
  strict private
    class function GetIsDisp(AFlags: Word): Boolean; overload;
    function GetIsDisp: Boolean; overload;
    function GetDispName: string;
    function GetForwardDecl: string;
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
  strict protected
    function GetIIDPrefix: string; override;
    procedure ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr); override;
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
    FShowEnum: Boolean;
    FShowHex: Boolean;
  strict private
    procedure PrintItem(AOut: TOutFile; AItem: TEnumItem; const AFmt: string);
  strict protected
    procedure ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr); override;
  public
    constructor Create(const ATypeInfo: ITypeInfo); override;
    destructor Destroy; override;
    procedure Print(AOut: TOutFile); override;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
  end;

  TRecord = class(TTLBMember)
  strict private
    FFields: TObjectList<TVariable>;
  strict protected
    procedure ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr); override;
  public
    constructor Create(const ATypeInfo: ITypeInfo); override;
    destructor Destroy; override;
    procedure Print(AOut: TOutFile); override;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
  end;

  TAlias = class(TTLBMember)
  strict private
    FAlias: TPasTypeInfo;
  strict protected
    procedure ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr); override;
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

function __TypeDescToPasType(const ATypeDesc: TTypeDesc; out AHRef: HRefType;
  var APasType: TPasTypeInfo): Boolean;
begin
  Result := True;
  APasType.VarType := ATypeDesc.vt;
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
      Result := __TypeDescToPasType(ATypeDesc.ptdesc^, AHRef, APasType);
    end;
    VT_SAFEARRAY: APasType.Name := '!!!UNKNOWN Type VT_SAFEARRAY!!!';
    VT_CARRAY: APasType.Name := '!!!UNKNOWN Type VT_CARRAY!!!';
    VT_USERDEFINED: begin
      AHRef := ATypeDesc.hreftype;
      APasType.Name := '';
      Result := False;
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

function TypeDescToPasType(const ATypeDesc: TTypeDesc; out AHRef: HRefType;
  out APasType: TPasTypeInfo): Boolean;
begin
  APasType.Ref := 0;
  APasType.StdUnit := suSystem;
  APasType.CustomUnit := '';
  Result := __TypeDescToPasType(ATypeDesc, AHRef, APasType);
end;

procedure GetHRefName(const ATypeInfo: ITypeInfo; AHRef: HRefType;
  var AType: TPasTypeInfo); forward;

function ElemDescToTypeStr(const ATypeInfo: ITypeInfo;
  const ADesc: TTypeDesc): TPasTypeInfo; overload;
var
  LHref: HRefType;
begin
  if not TypeDescToPasType(ADesc, LHref, Result) then
    GetHRefName(ATypeInfo, LHref, Result);
end;

function ElemDescToTypeStr(const ATypeInfo: ITypeInfo;
  const ADesc: TElemDesc): TPasTypeInfo; overload;
begin
  Result := ElemDescToTypeStr(ATypeInfo, ADesc.tdesc);
end;

procedure GetHRefName(const ATypeInfo: ITypeInfo; AHRef: HRefType;
  var AType: TPasTypeInfo);
var
  LType: ITypeInfo;
  LAttr: PTypeAttr;
  LStr: WideString;
  LPasType: TPasTypeInfo;
begin
  OleCheck(ATypeInfo.GetRefTypeInfo(AHRef, LType));
  OleCheck(LType.GetDocumentation(MEMBERID_NIL, @LStr, nil, nil, nil));
  AType.Name := TReservedWords.Escape(LStr);
  OleCheck(LType.GetTypeAttr(LAttr));
  try
    case LAttr^.typekind of
      TKIND_ENUM: AType.VarType := VT_I4;
      TKIND_RECORD: AType.VarType := VT_RECORD;
      TKIND_INTERFACE: AType.VarType := VT_UNKNOWN;
      TKIND_DISPATCH: AType.VarType := VT_DISPATCH;
      TKIND_ALIAS: begin
        LPasType := ElemDescToTypeStr(ATypeInfo, LAttr^.tdescAlias);
        AType.VarType := LPasType.VarType;
      end;
    end;
  finally
    LType.ReleaseTypeAttr(LAttr);
  end;
  if AType.VarType in [VT_UNKNOWN, VT_DISPATCH] then
    Dec(AType.Ref);
end;

{ TIntfItem }

constructor TIntfItem.Create(const AName: string);
begin
  inherited Create;
  FName := TReservedWords.Escape(AName);
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
  ParseTypeInfo(ATypeInfo);
end;

procedure TTLBMember.ParseTypeInfo(const ATypeInfo: ITypeInfo);
var
  LAttr: PTypeAttr;
begin
  OleCheck(ATypeInfo.GetTypeAttr(LAttr));
  try
    ParseTypeAttr(ATypeInfo, LAttr^);
  finally
    ATypeInfo.ReleaseTypeAttr(LAttr);
  end;
end;

procedure TTLBMember.ParseTypeAttr(const ATypeInfo: ITypeInfo;
  const ATypeAttr: TTypeAttr);
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
  LRefCnt: Integer;
begin
  LRefCnt := FType.Ref;
  if FFlag and CFlagOut = CFlagOut then begin
    Dec(LRefCnt);
    if FFlag and CFlagIn = CFlagIn then
      LPrfx := 'var '
    else
      LPrfx := 'out ';
  end else begin
    if FType.VarType in [VT_BSTR, VT_UNKNOWN, VT_DISPATCH] then
      Inc(LRefCnt);
    if LRefCnt > 0 then begin
      LPrfx := 'const ';
      Dec(LRefCnt);
    end else
      LPrfx := '';
  end;
  if LRefCnt <> 0 then
    LPrfx := Format('{%d} %s', [LRefCnt, LPrfx]);

  Result := Format('%s%s: %s', [LPrfx, Name, FType.Name]);
end;

function TMethodArg.IsRetVal: Boolean;
begin
  Result := FFlag and CFlagRetVal = CFlagRetVal;
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
    FDispID := LDesc^.memid;
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
  FUseSafeCall := uscDef;
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

function TIntfMethod.IsRetHRes: Boolean;
begin
  Result := (FRetType.Ref = 0) and (FRetType.VarType = VT_HRESULT);
end;

function TIntfMethod.IsVoid(const AType: TPasTypeInfo): Boolean;
begin
  Result := (AType.Ref = 0) and (AType.VarType = VT_VOID);
end;

procedure TIntfMethod.Print(AOut: TOutFile);
const
  CDelim = '; ';
var
  Li: Integer;
  LArgStr: string;
  LIsIdent: Boolean;
  LUseSafeCall: Boolean;
  LCallConv: TCallingConv;
  LRetType: TPasTypeInfo;
  LLastArg: TMethodArg;
  LBuilder: TStringBuilder;
  LArgCnt: Integer;
begin
  case FUseSafeCall of
    uscDef: LUseSafeCall := (FCallingConv = ccStdcall) and IsRetHRes;
    uscForced: LUseSafeCall := IsRetHRes;
  else
    LUseSafeCall := False;
  end;

  LLastArg := nil;
  LRetType := FRetType;
  LArgCnt := FArgs.Count;
  if LUseSafeCall then begin
    if LArgCnt > 0 then begin
      LLastArg := FArgs.Last;
      if LLastArg.IsRetVal then begin
        LRetType := LLastArg.Type_;
        Dec(LArgCnt);
      end else
        LLastArg := nil;
    end;
    LCallConv := ccSafecall;
  end else
    LCallConv := FCallingConv;

  LBuilder := TStringBuilder.Create;
  try
    if (LLastArg <> nil) or (not LUseSafeCall and not IsVoid(FRetType)) then
      LBuilder.Append('function ')
    else begin
      LBuilder.Append('procedure ');
      LRetType.Ref := 0;
      LRetType.VarType := VT_VOID;
    end;

    case FInvoke of
      INVOKE_PROPERTYGET: LBuilder.Append('Get_');
      INVOKE_PROPERTYPUT, INVOKE_PROPERTYPUTREF: LBuilder.Append('Set_');
    end;

    LBuilder.Append(Name);
    LIsIdent := False;
    if LArgCnt > 0 then begin
      LBuilder.Append('(');
      for Li := 0 to LArgCnt - 1 do begin
        LArgStr := FArgs[Li].ToString;
        if (LBuilder.Length + Length(LArgStr) + Length(CDelim) >= 76) and (LBuilder.Length <> 0) then begin
          AOut.Write(TrimRight(LBuilder.ToString));
          LBuilder.Clear;
          if not LIsIdent then begin
            AOut.IncIdent;
            LIsIdent := True;
          end;
        end;
        LBuilder.Append(LArgStr);
        LBuilder.Append(CDelim);
      end;
      LBuilder.Remove(LBuilder.Length - Length(CDelim), Length(CDelim));
      LBuilder.Append(')');
    end;
    if not IsVoid(LRetType) then begin
      LBuilder.Append(': ');
      LBuilder.Append(LRetType.Name);
    end;
    LBuilder.Append(';');
    if FCallingConv <> ccRegister then begin
      LBuilder.Append(' ');
      if FUseSafeCall <> uscForced then
        LBuilder.Append(CCallinvConvNames[LCallConv])
      else
        LBuilder.AppendFormat('dispid %d', [FDispID]);
      LBuilder.Append(';');
    end;
    AOut.Write(LBuilder.ToString);
  finally
    LBuilder.Free;
  end;
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

procedure TGUIDMember.ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr);
begin
  inherited ParseTypeAttr(ATypeInfo, ATypeAttr);
  FUUID := ATypeAttr.guid;
end;

procedure TGUIDMember.PrintIID(AOut: TOutFile);
begin
  AOut.WriteFmt('%s_%s: TGUID = ''%s'';', [GetIIDPrefix, Name, GUIDToString(FUUID)]);
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

function TInterface.GetForwardDecl: string;
begin
  Result := Name + ' = interface';
end;

function TInterface.GetIIDPrefix: string;
begin
  Result := 'IID';
end;

procedure TInterface.ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr);
var
  Li: Integer;
begin
  inherited ParseTypeAttr(ATypeInfo, ATypeAttr);
  FFlags := ATypeAttr.wTypeFlags;
  for Li := 0 to ATypeAttr.cFuncs - 1 do
    FMethods.Add(TIntfMethod.Create(ATypeInfo, Li));
end;

procedure TInterface.ParseTypeInfo(const ATypeInfo: ITypeInfo);
var
  LRef: HRefType;
  LInfo: ITypeInfo;
begin
  inherited ParseTypeInfo(ATypeInfo);
  OleCheck(ATypeInfo.GetRefTypeOfImplType(0, LRef));
  OleCheck(ATypeInfo.GetRefTypeInfo(LRef, LInfo));
  FParent := TCustomInterface.Create(LInfo);
end;

procedure TInterface.InternalPrint(AOut: TOutFile; const AHeader: string;
  APrintDisp: Boolean);
var
  Li: Integer;
begin
  AOut.Write(AHeader);
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

procedure TInterface.Print(AOut: TOutFile);
var
  LHeader: string;
begin
  LHeader := Format('%s(%s)', [GetForwardDecl, FParent.Name]);
  InternalPrint(AOut, LHeader, False);
end;

procedure TInterface.PrintForward(AOut: TOutFile);
begin
  AOut.Write(GetForwardDecl + ';');
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

function TDispInterface.GetForwardDecl: string;
begin
  Result :=Format('%s = dispinterface', [GetDispName]);
end;

function TDispInterface.GetIIDPrefix: string;
begin
  Result := inherited GetIIDPrefix;
  if not GetIsDisp then
    Result := 'D' + Result;
end;

procedure TDispInterface.Print(AOut: TOutFile);
begin
  if GetIsDisp then
    inherited Print(AOut);
  InternalPrint(AOut, GetForwardDecl, True);
end;

procedure TDispInterface.PrintForward(AOut: TOutFile);
begin
  if GetIsDisp then
    inherited PrintForward(AOut);
  AOut.Write(GetForwardDecl + ';');
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

procedure TCoClass.ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr);
var
  Li: Integer;
  LFlag: Integer;
  LRefType: HRefType;
  LInfo: ITypeInfo;
begin
  inherited ParseTypeAttr(ATypeInfo, ATypeAttr);
  for Li := 0 to ATypeAttr.cImplTypes - 1 do begin
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

procedure TEnum.ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr);
var
  Li: Integer;
begin
  inherited ParseTypeAttr(ATypeInfo, ATypeAttr);
  for Li := 0 to ATypeAttr.cVars - 1 do
    FItems.Add(TEnumItem.Create(ATypeInfo, Li));
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

procedure TRecord.ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr);
var
  Li: Integer;
begin
  inherited ParseTypeAttr(ATypeInfo, ATypeAttr);
  for Li := 0 to ATypeAttr.cVars - 1 do
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

procedure TAlias.ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr);
begin
  inherited ParseTypeAttr(ATypeInfo, ATypeAttr);
  FAlias := ElemDescToTypeStr(ATypeInfo, ATypeAttr.tdescAlias);
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
