unit UTLBMembers;

interface

uses
  Winapi.ActiveX,
  System.SysUtils,
  System.Generics.Collections,
  UTLBClasses;

type
  TAliasList = class
  strict private
    type
      TItem = record
        Idx: Integer;
        OldName: string;
      end;
  strict private
    FList: TDictionary<string, TItem>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddAlias(const ANewName, AOldName: string); overload;
    function AddAlias(const AName: string; ARefCnt: Integer; AStdUnit: TStdUnits): string; overload;
    function AddAlias(const AType: TPasTypeInfo): string; overload;
    procedure Print(AOut: TOutFile);
  end;

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
    procedure RegisterAliases(AList: TAliasList); virtual;
  end;

  TTLBMember = class(TIntfItem)
  strict protected
    procedure ParseTypeInfo(const ATypeInfo: ITypeInfo); virtual;
    procedure ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr); virtual;
  public
    constructor CreateTLB(const ATypeLib: ITypeLib; AIdx: Integer);
    constructor Create(const ATypeInfo: ITypeInfo); virtual;
  end;

  TAlias = class(TTLBMember)
  strict private
    FAlias: TPasTypeInfo;
    FWriteType: string;
  strict protected
    procedure ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr); override;
  public
    procedure Print(AOut: TOutFile); override;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
    procedure RegisterAliases(AList: TAliasList); override;
  end;

  TTypeMember = class(TIntfItem)
  public
    constructor Create(const ATypeInfo: ITypeInfo; AMemberID: TMemberID);
  end;

  TVariable = class(TTypeMember)
  strict private
    FType: TPasTypeInfo;
    FWriteType: string;
  public
    constructor Create(const ATypeInfo: ITypeInfo; AIdx: Integer);
    procedure Print(AOut: TOutFile); override;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
    procedure RegisterAliases(AList: TAliasList); override;
  end;

  TMethodArg = class(TIntfItem)
  strict private
    const
      CFlagIn = $01;
      CFlagOut = $02;
      CFlagRetVal = $04;
  strict private
    FType: TPasTypeInfo;
    FWriteType: string;
    FFlag: Byte;
  public
    constructor Create(const ATypeInfo: ITypeInfo; const AName: string;
      const ADesc: TElemDesc);
    procedure Print(AOut: TOutFile); override;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
    function ToString: string; override;
    function IsRetVal: Boolean;
    procedure RegisterAliases(AList: TAliasList); override;
  public
    property Type_: TPasTypeInfo read FType;
    property WriteType: string read FWriteType;
  end;

  TIntfMethod = class(TTypeMember)
  strict private
    type
      TCallingConv = (ccRegister, ccPascal, ccCdecl, ccStdcall, ccSafecall);
      TPropInfo = (piNone, piGet, piSet);
      TBrackets = (bRound, bSquare);
    const
      CCallinvConvNames: array[TCallingConv] of string = (
        'register', 'pascal', 'cdecl', 'stdcall', 'safecall'
      );
  strict private
    FRetType: TPasTypeInfo;
    FWriteRetType: string;
    FArgs: TObjectList<TMethodArg>;
    FCallingConv: TCallingConv;
    FUseSafeCall: Boolean;
    FPropInfo: TPropInfo;
    FDispID: TMemberID;
  strict private
    function GetArgCount: Integer;
    function GetArg(AIdx: Integer): TMethodArg;
  strict private
    function DecodeCallingConv(ACallingConv: TCallConv): TCallingConv;
    function IsRetHRes: Boolean;
    function IsVoid(const AType: TPasTypeInfo): Boolean;
  public
    constructor Create(const ATypeInfo: ITypeInfo; AIdx: Integer; AUseSafecall: Boolean);
    destructor Destroy; override;
    procedure Print(AOut: TOutFile); override;
    procedure PrintForDisp(AOut: TOutFile; AUseDisp: Boolean);
    function PrintArgs(AOut: TOutFile; ABuilder: TStringBuilder; ACnt: Integer;
      ABrackets: TBrackets): Boolean;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
    procedure RegisterAliases(AList: TAliasList); override;
  public
    property Name;
    property RetType: TPasTypeInfo read FRetType;
    property WriteRetType: string read FWriteRetType;
    property DispID: TMemberID read FDispID;
    property PropInfo: TPropInfo read FPropInfo;
    property ArgCount: Integer read GetArgCount;
    property Args[AIdx: Integer]: TMethodArg read GetArg;
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

  TPropMember = record
    Read: TIntfMethod;
    Write: TIntfMethod;
    Index: Integer;
  end;
  TPropList = TDictionary<TMemberID, TPropMember>;

  TCustomInterface = class(TGUIDMember)
  strict protected
    function GetIIDPrefix: string; override;
  public
    procedure Print(AOut: TOutFile); override;
    procedure PrintForward(AOut: TOutFile); override;
    procedure PrintMethods(AOut: TOutFile; APropList: TPropList; APrintDisp: Boolean); virtual;
  public
    property Name;
  end;

  TInterface = class(TCustomInterface)
  strict private
    type
      TPropPair = TPair<TMemberID, TPropMember>;
      TPropArray = TArray<TPropPair>;
  strict private
    FMethods: TObjectList<TIntfMethod>;
    FParent: TCustomInterface;
    FFlags: Word;
  strict private
    function GetForwardDecl: string;
    function PropListToSortedArray(AProps: TPropList): TPropArray;
    function PrintHeaderProp(AOut: TOutFile; ABuilder: TStringBuilder;
      const AProp: TPropMember; out AIdxCnt: Integer): Boolean;
    procedure PrintProps(AOut: TOutFile; const AProps: TPropArray);
    procedure PrintDispProps(AOut: TOutFile; const AProps: TPropArray);
  strict protected
    property Flags: Word read FFlags;
 strict protected
    class function GetIsDisp(AFlags: Word): Boolean; overload;
    function GetIsDisp: Boolean; overload;
 strict protected
    procedure ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr); override;
    procedure ParseTypeInfo(const ATypeInfo: ITypeInfo); override;
    procedure InternalPrint(AOut: TOutFile; const AHeader: string;
      APrintDisp: Boolean);
    function CreateParent(const ATypeInfo: ITypeInfo): TCustomInterface; virtual;
  public
    constructor Create(const ATypeInfo: ITypeInfo); override;
    destructor Destroy; override;
    procedure Print(AOut: TOutFile); override;
    procedure PrintForward(AOut: TOutFile); override;
    procedure PrintMethods(AOut: TOutFile; APropList: TPropList; APrintDisp: Boolean); override;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
    procedure RegisterAliases(AList: TAliasList); override;
  end;

  TDispInterface = class(TInterface)
  strict private
    function GetDispName: string;
    function GetForwardDecl: string;
  strict protected
    function GetIIDPrefix: string; override;
    function CreateParent(const ATypeInfo: ITypeInfo): TCustomInterface; override;
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
    FAlign: Word;
  strict protected
    procedure ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr); override;
  public
    constructor Create(const ATypeInfo: ITypeInfo); override;
    destructor Destroy; override;
    procedure Print(AOut: TOutFile); override;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
    procedure RegisterAliases(AList: TAliasList); override;
  end;

  TTLBMemberList<T: TTLBMember> = class(TObjectList<T>)
  strict private
    type
      TPrintProc = reference to procedure(AOut: TOutFile; AItem: T);
  public
    constructor Create;
    procedure Print(AOut: TOutFile; const AComment: string; AAddEmptyLine: Boolean);
    procedure CustomPrint(AOut: TOutFile; const AComment: string;
      AAddEmptyLine: Boolean; const APrintProc: TPrintProc);
    procedure RequireUnits(AUnitManager: TUnitManager);
    procedure RegisterAliases(AList: TAliasList);
  end;

  TTLBInfo = class(TIntfItem)
  strict private
    FMajorVersion: Integer;
    FMinorVersion: Integer;
    FUUID: TGUID;
    FMemberList: TObjectList<TTLBMemberList<TTLBMember>>;
    FEnums: TTLBMemberList<TEnum>;
    FRecords: TTLBMemberList<TRecord>;
    FInterfaces: TTLBMemberList<TInterface>;
    FCoClasses: TTLBMemberList<TCoClass>;
    FAliases: TTLBMemberList<TAlias>;
  strict private
    function GetPasUnitName: string;
  strict private
    function CreateMemberList<T: TTLBMember>: TTLBMemberList<T>;
    procedure Parse(const ATypeLib: ITypeLib);
    procedure PrintHeaderConst(AOut: TOutFile);
    procedure PrintClassIDs(AOut: TOutFile);
    procedure PrintIIDs(AOut: TOutFile);
    procedure PrintForward<T: TGUIDMember>(AOut: TOutFile; AItem: T);
  public
    constructor Create(const AFileName: string);
    destructor Destroy; override;
    procedure Print(AOut: TOutFile); override;
    procedure RequireUnits(AUnitManager: TUnitManager); override;
    procedure RegisterAliases(AList: TAliasList); override;
  public
    property PasUnitName: string read GetPasUnitName;
  end;

implementation

uses
  System.Win.ComObj,
  System.Generics.Defaults;

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
      APasType.StdUnit := suCustom;
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
  APasType.RefBase := APasType.Ref;
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
  if (Result.VarType = VT_VOID) and (Result.Ref > 0) then begin
    Result.Name := 'Pointer';
    Result.VarType := VT_PTR;
    Dec(Result.Ref);
    Dec(Result.RefBase);
  end;
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
      TKIND_RECORD: begin
        AType.VarType := VT_RECORD;
        if (LAttr^.cVars = 4) and (AType.Name = 'GUID') then begin
          AType.Name := 'TGUID';
          AType.StdUnit := suSystem;
        end;
      end;
      TKIND_INTERFACE: AType.VarType := VT_UNKNOWN;
      TKIND_DISPATCH: AType.VarType := VT_DISPATCH;
      TKIND_ALIAS: begin
        LPasType := ElemDescToTypeStr(ATypeInfo, LAttr^.tdescAlias);
        AType.VarType := LPasType.VarType;
        Inc(AType.RefBase, LPasType.Ref);
      end;
    end;
  finally
    LType.ReleaseTypeAttr(LAttr);
  end;
  if AType.VarType in [VT_UNKNOWN, VT_DISPATCH] then begin
    Dec(AType.Ref);
    Dec(AType.RefBase);
  end;
end;

{ TAliasList }

constructor TAliasList.Create;
begin
  inherited Create;
  FList := TDictionary<string, TItem>.Create;
end;

destructor TAliasList.Destroy;
begin
  FList.Free;
  inherited Destroy;
end;

procedure TAliasList.AddAlias(const ANewName, AOldName: string);
var
  LItem: TItem;
begin
  if not FList.TryGetValue(ANewName, LItem) then begin
    LItem.Idx := FList.Count;
    LItem.OldName := AOldName;
    FList.Add(ANewName, LItem);
  end;
end;

function TAliasList.AddAlias(const AName: string; ARefCnt: Integer;
  AStdUnit: TStdUnits): string;
const
  CTypePrfx = 'T';
  CPtrPrfx = 'P';
  CPtrSign = '^';
var
  LPrevName: string;
begin
  if AName = '' then
    raise Exception.Create('Type bust be not empty');
  if ARefCnt <= 0 then
    Result := AName
  else if ARefCnt = 1 then begin
    Result := AName;
    if Result[1] = CTypePrfx then
      Result[1] := CPtrPrfx
    else
      Result := CPtrPrfx + Result;
    if AStdUnit = suCustom then
      AddAlias(Result, CPtrSign + AName);
  end else begin
    LPrevName := AddAlias(AName, ARefCnt - 1, AStdUnit);
    Result := CPtrPrfx + LPrevName;
    AddAlias(Result, CPtrSign + LPrevName);
  end;
end;

function TAliasList.AddAlias(const AType: TPasTypeInfo): string;
begin
  Result := AddAlias(AType.Name, AType.Ref, AType.StdUnit);
end;

procedure TAliasList.Print(AOut: TOutFile);
type
  TItemPair = TPair<string, TItem>;
var
  LData: TArray<TItemPair>;
  Li: Integer;
begin
  if FList.Count = 0 then
    Exit;
  LData := FList.ToArray;
  TArray.Sort<TItemPair>(LData, TComparer<TItemPair>.Construct(
    function (const ALeft, ARight: TItemPair): Integer
    begin
      Result := CompareInt(ALeft.Value.Idx, ARight.Value.Idx);
    end
  ));
  AOut.Write(TUnitSections.CType);
  AOut.IncIdent;
  try
    AOut.Write('// Custom aliaces');
    for Li := 0 to Length(LData) - 1 do
      AOut.WriteFmt('%s = %s;', [LData[Li].Key, LData[Li].Value.OldName]);
    AOut.EmptyLine;
  finally
    AOut.DecIdent;
  end;
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

procedure TIntfItem.RegisterAliases(AList: TAliasList);
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

{ TAlias }

procedure TAlias.ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr);
begin
  inherited ParseTypeAttr(ATypeInfo, ATypeAttr);
  FAlias := ElemDescToTypeStr(ATypeInfo, ATypeAttr.tdescAlias);
end;

procedure TAlias.Print(AOut: TOutFile);
begin
  AOut.WriteFmt('%s = type %s;', [Name, FWriteType]);
end;

procedure TAlias.RequireUnits(AUnitManager: TUnitManager);
begin
  inherited RequireUnits(AUnitManager);
  AUnitManager.AddPasType(FAlias);
end;

procedure TAlias.RegisterAliases(AList: TAliasList);
begin
  inherited RegisterAliases(AList);
  FWriteType := AList.AddAlias(FAlias);
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
  AOut.WriteFmt('%s: %s;', [Name, FWriteType]);
end;

procedure TVariable.RequireUnits(AUnitManager: TUnitManager);
begin
  inherited RequireUnits(AUnitManager);
  AUnitManager.AddPasType(FType);
end;

procedure TVariable.RegisterAliases(AList: TAliasList);
begin
  inherited RegisterAliases(AList);
  FWriteType := AList.AddAlias(FType);
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
begin
  if (FType.Ref > 0) and (FFlag and CFlagOut = CFlagOut) then begin
    if FFlag and CFlagIn = CFlagIn then
      LPrfx := 'var '
    else
      LPrfx := 'out ';
  end else begin
    if FType.Ref = 0 then begin
      if FType.VarType in [VT_BSTR, VT_UNKNOWN, VT_DISPATCH, VT_RECORD] then
        LPrfx := 'const '
      else
        LPrfx := '';
    end else
      LPrfx := 'var ';
  end;
  Result := Format('%s%s: %s', [LPrfx, Name, FWriteType]);
end;

function TMethodArg.IsRetVal: Boolean;
begin
  Result := FFlag and CFlagRetVal = CFlagRetVal;
end;

procedure TMethodArg.RegisterAliases(AList: TAliasList);
begin
  inherited RegisterAliases(AList);
  FWriteType := AList.AddAlias(FType.Name, FType.Ref - 1, FType.StdUnit);
end;

{ TIntfMethod }

constructor TIntfMethod.Create(const ATypeInfo: ITypeInfo; AIdx: Integer;
  AUseSafecall: Boolean);
var
  LDesc: PFuncDesc;
  Li: Integer;
  LParamNames: array of WideString;
  LCnt: Integer;
  LPrmName: string;
begin
  FUseSafeCall := AUseSafecall;
  FArgs := TObjectList<TMethodArg>.Create(True);
  OleCheck(ATypeInfo.GetFuncDesc(AIdx, LDesc));
  try
    inherited Create(ATypeInfo, LDesc^.memid);
    FDispID := LDesc^.memid;
    FRetType := ElemDescToTypeStr(ATypeInfo, LDesc^.elemdescFunc);
    FCallingConv := DecodeCallingConv(LDesc^.callconv);
    case LDesc^.invkind of
      INVOKE_PROPERTYGET: FPropInfo := piGet;
      INVOKE_PROPERTYPUT, INVOKE_PROPERTYPUTREF: FPropInfo := piSet;
    else
      FPropInfo := piNone;
    end;

    if LDesc^.cParams > 0 then begin
      SetLength(LParamNames, LDesc^.cParams + 1);
      OleCheck(ATypeInfo.GetNames(LDesc^.memid, @LParamNames[0], LDesc^.cParams + 1, LCnt));
      for Li := 0 to LDesc^.cParams - 1 do begin
        LPrmName := LParamNames[Li + 1];
        if LPrmName = '' then
          LPrmName := 'Param' + IntToStr(Li + 1);
        FArgs.Add(TMethodArg.Create(ATypeInfo, LPrmName, LDesc^.lprgelemdescParam^[Li]));
      end;
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

function TIntfMethod.GetArgCount: Integer;
begin
  Result := FArgs.Count;
end;

function TIntfMethod.GetArg(AIdx: Integer): TMethodArg;
begin
  Result := FArgs[AIdx];
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
  Result := (FRetType.RefBase = 0) and (FRetType.VarType = VT_HRESULT);
end;

function TIntfMethod.IsVoid(const AType: TPasTypeInfo): Boolean;
begin
  Result := (AType.RefBase = 0) and (AType.VarType = VT_VOID);
end;

procedure TIntfMethod.Print(AOut: TOutFile);
begin
  PrintForDisp(AOut, False);
end;

procedure TIntfMethod.PrintForDisp(AOut: TOutFile; AUseDisp: Boolean);
var
  LIsIdent: Boolean;
  LUseSafeCall: Boolean;
  LCallConv: TCallingConv;
  LRetType: TPasTypeInfo;
  LRetTypeName: string;
  LLastArg: TMethodArg;
  LBuilder: TStringBuilder;
  LArgCnt: Integer;
begin
  if AUseDisp then
    LUseSafeCall := IsRetHRes
  else if FUseSafeCall then
    LUseSafeCall := (FCallingConv = ccStdcall) and IsRetHRes
  else
    LUseSafeCall := False;

  LLastArg := nil;
  LRetType := FRetType;
  LRetTypeName := FWriteRetType;
  LArgCnt := FArgs.Count;
  if LUseSafeCall then begin
    if LArgCnt > 0 then begin
      LLastArg := FArgs.Last;
      if LLastArg.IsRetVal then begin
        LRetType := LLastArg.Type_;
        LRetTypeName := LLastArg.WriteType;
        Dec(LArgCnt);
      end else
        LLastArg := nil;
    end;
    LCallConv := ccSafecall;
  end else
    LCallConv := FCallingConv;

//  if AUseDisp and (LLastArg = nil) then
//    LUseSafeCall := False;

  LBuilder := TStringBuilder.Create;
  try
    if (LLastArg <> nil) or (not LUseSafeCall and not IsVoid(FRetType)) then
      LBuilder.Append('function ')
    else begin
      LBuilder.Append('procedure ');
      LRetType.Ref := 0;
      LRetType.VarType := VT_VOID;
    end;

    case FPropInfo of
      piGet: LBuilder.Append('Get_');
      piSet: LBuilder.Append('Set_');
    end;

    LBuilder.Append(Name);
    LIsIdent := PrintArgs(AOut, LBuilder, LArgCnt, bRound);
    if not IsVoid(LRetType) then begin
      LBuilder.Append(': ');
      LBuilder.Append(LRetTypeName);
    end;
    LBuilder.Append(';');
    if FCallingConv <> ccRegister then begin
      LBuilder.Append(' ');
      if AUseDisp then
        LBuilder.AppendFormat('dispid %d', [FDispID])
      else
        LBuilder.Append(CCallinvConvNames[LCallConv]);
      LBuilder.Append(';');
    end;
    AOut.Write(LBuilder.ToString);
  finally
    LBuilder.Free;
  end;
  if LIsIdent then
    AOut.DecIdent;
end;

function TIntfMethod.PrintArgs(AOut: TOutFile; ABuilder: TStringBuilder;
  ACnt: Integer; ABrackets: TBrackets): Boolean;
const
  CDelim = '; ';
  COpenBrackets: array[TBrackets] of Char = ('(', '[');
  CCloseBrackets: array[TBrackets] of Char = (')', ']');
var
  Li: Integer;
  LArgStr: string;
begin
  Result := False;
  if ACnt > 0 then begin
    ABuilder.Append(COpenBrackets[ABrackets]);
    for Li := 0 to ACnt - 1 do begin
      LArgStr := FArgs[Li].ToString;
      if (ABuilder.Length + Length(LArgStr) + Length(CDelim) >= 176) and (ABuilder.Length <> 0) then begin
        AOut.Write(TrimRight(ABuilder.ToString));
        ABuilder.Clear;
        if not Result then begin
          AOut.IncIdent;
          Result := True;
        end;
      end;
      ABuilder.Append(LArgStr);
      ABuilder.Append(CDelim);
    end;
    ABuilder.Remove(ABuilder.Length - Length(CDelim), Length(CDelim));
    ABuilder.Append(CCloseBrackets[ABrackets]);
  end;
end;

procedure TIntfMethod.RegisterAliases(AList: TAliasList);
var
  Li: Integer;
begin
  inherited RegisterAliases(AList);
  FWriteRetType := AList.AddAlias(FRetType);
  for Li := 0 to FArgs.Count - 1 do
    FArgs[Li].RegisterAliases(AList);
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

{ TCustomInterface }

function TCustomInterface.GetIIDPrefix: string;
begin
  Result := 'IID';
end;

procedure TCustomInterface.Print(AOut: TOutFile);
begin
  // Abstract
end;

procedure TCustomInterface.PrintForward(AOut: TOutFile);
begin
  // Abstract
end;

procedure TCustomInterface.PrintMethods(AOut: TOutFile; APropList: TPropList;
  APrintDisp: Boolean);
begin
  // Abstract
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

function TInterface.PropListToSortedArray(AProps: TPropList): TPropArray;
begin
  Result := AProps.ToArray;
  TArray.Sort<TPropPair>(Result, TComparer<TPropPair>.Construct(
    function (const ALeft, ARight: TPropPair): Integer
    begin
      Result := CompareInt(ALeft.Value.Index, ARight.Value.Index);
    end
  ));
end;

function TInterface.PrintHeaderProp(AOut: TOutFile; ABuilder: TStringBuilder;
  const AProp: TPropMember; out AIdxCnt: Integer): Boolean;
var
  LMethod: TIntfMethod;
  LArgCnt: Integer;
begin
  ABuilder.Clear;
  if AProp.Read <> nil then
    LMethod := AProp.Read
  else
    LMethod := AProp.Write;
  ABuilder.Append('property ');
  ABuilder.Append(LMethod.Name);
  LArgCnt := LMethod.ArgCount;
  Result := LMethod.PrintArgs(AOut, ABuilder, LArgCnt - 1, bSquare);
  ABuilder.Append(': ');
  AIdxCnt := LArgCnt;
  if LArgCnt > 0 then begin
    ABuilder.Append(LMethod.Args[LArgCnt - 1].WriteType);
    Dec(AIdxCnt);
  end else
    ABuilder.Append(LMethod.WriteRetType);
  ABuilder.Append(' ');
end;

procedure TInterface.PrintProps(AOut: TOutFile; const AProps: TPropArray);
var
  LBuilder: TStringBuilder;
  Li: Integer;
  LProp: TPropMember;
  LIdxCnt: Integer;
  LIsIdent: Boolean;
begin
  LBuilder := TStringBuilder.Create;
  try
    for Li := 0 to Length(AProps) - 1 do begin
      LProp := AProps[Li].Value;
      LIsIdent := PrintHeaderProp(AOut, LBuilder, LProp, LIdxCnt);
      if LProp.Read <> nil then begin
        LBuilder.Append('read Get_');
        LBuilder.Append(LProp.Read.Name);
        LBuilder.Append(' ');
      end;
      if LProp.Write <> nil then begin
        LBuilder.Append('write Set_');
        LBuilder.Append(LProp.Write.Name);
        LBuilder.Append(' ');
      end;
      LBuilder.Chars[LBuilder.Length - 1] := ';';
      if (AProps[Li].Key = 0) and (LIdxCnt > 0) then
        LBuilder.Append(' default;');
      AOut.Write(LBuilder.ToString);
      if LIsIdent then
        AOut.DecIdent;
    end;
  finally
    LBuilder.Free;
  end;
end;

procedure TInterface.PrintDispProps(AOut: TOutFile; const AProps: TPropArray);
var
  LBuilder: TStringBuilder;
  Li: Integer;
  LProp: TPropMember;
  LIdxCnt: Integer;
  LIsIdent: Boolean;
begin
  LBuilder := TStringBuilder.Create;
  try
    for Li := 0 to Length(AProps) - 1 do begin
      LProp := AProps[Li].Value;
      LIsIdent := PrintHeaderProp(AOut, LBuilder, LProp, LIdxCnt);
      if LProp.Read <> nil then begin
        if LProp.Write = nil then
          LBuilder.Append('readonly ');
      end else
        LBuilder.Append('writeonly ');

      LBuilder.AppendFormat('dispid %d;', [AProps[Li].Key]);
      AOut.Write(LBuilder.ToString);
      if LIsIdent then
        AOut.DecIdent;
    end;
  finally
    LBuilder.Free;
  end;
end;

class function TInterface.GetIsDisp(AFlags: Word): Boolean;
begin
  Result := AFlags and TYPEFLAG_FDUAL = TYPEFLAG_FDUAL
end;

function TInterface.GetIsDisp: Boolean;
begin
  Result := GetIsDisp(FFlags);
end;

procedure TInterface.ParseTypeAttr(const ATypeInfo: ITypeInfo; const ATypeAttr: TTypeAttr);
var
  Li: Integer;
begin
  inherited ParseTypeAttr(ATypeInfo, ATypeAttr);
  FFlags := ATypeAttr.wTypeFlags;
  for Li := 0 to ATypeAttr.cFuncs - 1 do
    FMethods.Add(TIntfMethod.Create(ATypeInfo, Li, GetIsDisp));
end;

procedure TInterface.ParseTypeInfo(const ATypeInfo: ITypeInfo);
var
  LRef: HRefType;
  LInfo: ITypeInfo;
begin
  inherited ParseTypeInfo(ATypeInfo);
  OleCheck(ATypeInfo.GetRefTypeOfImplType(0, LRef));
  OleCheck(ATypeInfo.GetRefTypeInfo(LRef, LInfo));
  FParent := CreateParent(LInfo);
end;

procedure TInterface.InternalPrint(AOut: TOutFile; const AHeader: string;
  APrintDisp: Boolean);
var
  LProps: TPropList;
  LPropArray: TPropArray;
begin
  AOut.Write(AHeader);
  AOut.IncIdent;
  try
    AOut.WriteFmt('[''%s'']', [GUIDToString(UUID)]);
    LProps := TPropList.Create;
    try
      {$IFOPT D+}
      if APrintDisp then begin
        FMethods.Sort(TComparer<TIntfMethod>.Construct(
          function (const ALeft, ARight: TIntfMethod): Integer
          begin
            Result := CompareInt(ALeft.DispID, ARight.DispID);
          end
        ));
      end;
      {$ENDIF}
      PrintMethods(AOut, LProps, APrintDisp);
      LPropArray := PropListToSortedArray(LProps);
      if APrintDisp then
        PrintDispProps(AOut, LPropArray)
      else
        PrintProps(AOut, LPropArray);
    finally
      LProps.Free;
    end;
  finally
    AOut.DecIdent;
  end;
  AOut.Write('end;');
  AOut.EmptyLine;
end;

function TInterface.CreateParent(const ATypeInfo: ITypeInfo): TCustomInterface;
begin
  Result := TCustomInterface.Create(ATypeInfo);
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

procedure TInterface.PrintMethods(AOut: TOutFile; APropList: TPropList;
  APrintDisp: Boolean);
var
  Li: Integer;
  LMethod: TIntfMethod;
  LPropMember: TPropMember;
begin
  inherited PrintMethods(AOut, APropList, APrintDisp);
  for Li := 0 to FMethods.Count - 1 do begin
    LMethod := FMethods[Li];
    if LMethod.PropInfo <> piNone then begin
      if not APropList.TryGetValue(LMethod.DispID, LPropMember) then begin
        LPropMember.Read := nil;
        LPropMember.Write := nil;
        LPropMember.Index := APropList.Count;
      end;
      if LMethod.PropInfo = piGet then
        LPropMember.Read := LMethod
      else
        LPropMember.Write := LMethod;
      APropList.AddOrSetValue(LMethod.DispID, LPropMember);
    end;
    if not APrintDisp or (LMethod.PropInfo = piNone) then
      LMethod.PrintForDisp(AOut, APrintDisp);
  end;
  if APrintDisp then begin
//    AOut.Write('// Parent ' + FParent.Name);
    FParent.PrintMethods(AOut, APropList, APrintDisp);
  end;
end;

procedure TInterface.RequireUnits(AUnitManager: TUnitManager);
var
  Li: Integer;
begin
  inherited RequireUnits(AUnitManager);
  FParent.RequireUnits(AUnitManager);
  for Li := 0 to FMethods.Count - 1 do
    FMethods[Li].RequireUnits(AUnitManager);
end;

procedure TInterface.RegisterAliases(AList: TAliasList);
var
  Li: Integer;
begin
  inherited RegisterAliases(AList);
  FParent.RegisterAliases(AList);
  for Li := 0 to FMethods.Count - 1 do
    FMethods[Li].RegisterAliases(AList);
end;

{ TDispInterface }

constructor TDispInterface.Create(const ATypeInfo: ITypeInfo);
var
  LAttr: PTypeAttr;
  LHref: HRefType;
  LType: ITypeInfo;
  LKind: TTypeKind;
begin
  OleCheck(ATypeInfo.GetTypeAttr(LAttr));
  try
    LKind := LAttr^.typekind;
    if (LKind = TKIND_DISPATCH) and GetIsDisp(LAttr^.wTypeFlags) then begin
      OleCheck(ATypeInfo.GetRefTypeOfImplType(-1, LHref));
      OleCheck(ATypeInfo.GetRefTypeInfo(LHref, LType));
    end else
      LType := ATypeInfo;
  finally
    ATypeInfo.ReleaseTypeAttr(LAttr);
  end;
  inherited Create(LType);
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

function TDispInterface.CreateParent(
  const ATypeInfo: ITypeInfo): TCustomInterface;
var
  LAttr: PTypeAttr;
begin
  if GetIsDisp then begin
    OleCheck(ATypeInfo.GetTypeAttr(LAttr));
    try
      if
        not IsEqualGUID(LAttr^.guid, IDispatch) and
        not IsEqualGUID(LAttr^.guid, IUnknown)
      then
        Result := TDispInterface.Create(ATypeInfo)
      else
        Result := inherited CreateParent(ATypeInfo);
    finally
      ATypeInfo.ReleaseTypeAttr(LAttr);
    end;
  end else
    Result := inherited CreateParent(ATypeInfo);
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
  FAlign := ATypeAttr.cbAlignment;
  for Li := 0 to ATypeAttr.cVars - 1 do
    FFields.Add(TVariable.Create(ATypeInfo, Li));
end;

procedure TRecord.Print(AOut: TOutFile);
var
  Li: Integer;
begin
//  AOut.WriteFmt('{$A %d}', [FAlign]);
  AOut.WriteFmt('{$ALIGN %d}', [FAlign]);
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

procedure TRecord.RegisterAliases(AList: TAliasList);
var
  Li: Integer;
begin
  inherited RegisterAliases(AList);
  for Li := 0 to FFields.Count - 1 do
    FFields[Li].RegisterAliases(AList);
end;

{ TTLBMemberList<T> }

constructor TTLBMemberList<T>.Create;
begin
  inherited Create(True);
end;

procedure TTLBMemberList<T>.Print(AOut: TOutFile; const AComment: string;
  AAddEmptyLine: Boolean);
begin
  CustomPrint(
    AOut,
    AComment,
    AAddEmptyLine,
    procedure(AOut: TOutFile; AItem: T)
    begin
      AItem.Print(AOut);
    end
  );
end;

procedure TTLBMemberList<T>.CustomPrint(AOut: TOutFile; const AComment: string;
  AAddEmptyLine: Boolean; const APrintProc: TPrintProc);
var
  Li: Integer;
begin
  if Count > 0 then begin
    AOut.Write(TUnitSections.CType);
    AOut.IncIdent;
    try
      if AComment <> '' then
        AOut.Write('// ' + AComment);
      for Li := 0 to Count - 1 do
        APrintProc(AOut, Items[Li]);
      if AAddEmptyLine then
        AOut.EmptyLine;
    finally
      AOut.DecIdent;
    end;
  end;
end;

procedure TTLBMemberList<T>.RequireUnits(AUnitManager: TUnitManager);
var
  Li: Integer;
begin
  for Li := 0 to Count - 1 do
    Items[Li].RequireUnits(AUnitManager);
end;

procedure TTLBMemberList<T>.RegisterAliases(AList: TAliasList);
var
  Li: Integer;
begin
  for Li := 0 to Count - 1 do
    Items[Li].RegisterAliases(AList);
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
  FMemberList := TObjectList<TTLBMemberList<TTLBMember>>.Create(True);
  FEnums := CreateMemberList<TEnum>;
  FRecords := CreateMemberList<TRecord>;
  FInterfaces := CreateMemberList<TInterface>;
  FCoClasses := CreateMemberList<TCoClass>;
  FAliases := CreateMemberList<TAlias>;
  Parse(LTlb);
end;

destructor TTLBInfo.Destroy;
begin
  FMemberList.Free;
  inherited Destroy;
end;

function TTLBInfo.GetPasUnitName: string;
begin
  Result := Name + '_TLB';
end;

function TTLBInfo.CreateMemberList<T>: TTLBMemberList<T>;
begin
  Result := TTLBMemberList<T>.Create;
  FMemberList.Add(TTLBMemberList<TTLBMember>(Result));
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

procedure TTLBInfo.PrintForward<T>(AOut: TOutFile; AItem: T);
begin
  AItem.PrintForward(AOut);
end;

procedure TTLBInfo.Print(AOut: TOutFile);
var
  LUnits: TUnitManager;
  LAliaces: TAliasList;
begin
  AOut.WriteFmt(TUnitSections.CUnit + ' %s;', [PasUnitName]);
  AOut.EmptyLine;
  AOut.Write(TUnitSections.CInterface);
  AOut.EmptyLine;

  LUnits := TUnitManager.Create(True);
  try
    RequireUnits(LUnits);
    LUnits.Print(AOut);
  finally
    LUnits.Free;
  end;

  AOut.Write(TUnitSections.CConst);
  AOut.IncIdent;
  try
    PrintHeaderConst(AOut);
    PrintClassIDs(AOut);
    PrintIIDs(AOut);
  finally
    AOut.DecIdent;
  end;

  if FEnums.Count > 0 then begin
    AOut.Write('// Enumerators');
//    AOut.Write('{$Z 4}');
    AOut.Write('{$MINENUMSIZE 4}');
    FEnums.Print(AOut, '', False);
  end;
  FInterfaces.CustomPrint(AOut, 'Interfaces forward declarations', True, PrintForward<TInterface>);
  FCoClasses.CustomPrint(AOut, 'CoClasses as default interface', True, PrintForward<TCoClass>);

  LAliaces := TAliasList.Create;
  try
    RegisterAliases(LAliaces);
    LAliaces.Print(AOut);
  finally
    LAliaces.Free;
  end;
  FAliases.Print(AOut, 'Aliaces', True);
  FRecords.Print(AOut, 'Records', False);
  FInterfaces.Print(AOut, 'Interfaces', False);
end;

procedure TTLBInfo.RequireUnits(AUnitManager: TUnitManager);
var
  Li: Integer;
begin
  for Li := 0 to FMemberList.Count - 1 do
    FMemberList[Li].RequireUnits(AUnitManager);
end;

procedure TTLBInfo.RegisterAliases(AList: TAliasList);
var
  Li: Integer;
begin
  for Li := 0 to FMemberList.Count - 1 do
    FMemberList[Li].RegisterAliases(AList);
end;

end.
