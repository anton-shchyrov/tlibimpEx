program tlibimpEx;

{.$APPTYPE CONSOLE}

uses
  FastMM4,
  System.SysUtils,
  Winapi.ActiveX,
  System.Win.ComObj,
  UTLBMembers in 'UTLBMembers.pas',
  UTLBClasses in 'UTLBClasses.pas';

{$R *.res}

type
  TSettings = class

  end;

  TImporter = class
  strict private
    function LoadTLB(const AFileName: string): ITypeLib2; inline;
  public
    procedure ImportTLB(const AFileName: string);
  end;

{ TImporter }

function TImporter.LoadTLB(const AFileName: string): ITypeLib2;
var
  LTlb: ITypeLib;
begin
  OleCheck(LoadTypeLibEx(PChar(AFileName), REGKIND_NONE, LTlb));
  OleCheck(LTlb.QueryInterface(ITypeLib2, Result));
end;

procedure TImporter.ImportTLB(const AFileName: string);
var
  LTlb: ITypeLib2;
  LTlbName: WideString;
  LLibAttr: PTLibAttr;
  LFile: TOutFile;
  LCnt: Integer;
  Li: Integer;
  LTypeKind: TTypeKind;
  LName: WideString;
begin
  LTlb := LoadTLB(AFileName);
  OleCheck(LTlb.GetDocumentation(-1, @LTlbName, nil, nil, nil));
  try
    LFile := TOutFile.Create(LTlbName + '_TLB.pas');
    try
      OleCheck(LTlb.GetLibAttr(LLibAttr));
      try
        LFile.Write('const');
        LFile.IncIdent;
        LFile.WriteFmt('%sMajorVersion = %d;', [LTlbName, LLibAttr^.wMajorVerNum]);
        LFile.WriteFmt('%sMinorVersion = %d;', [LTlbName, LLibAttr^.wMinorVerNum]);
        LFile.EmptyLine;
        LFile.WriteFmt('LIBID_%s: TGUID = %s;', [LTlbName, GUIDToString(LLibAttr^.guid)]);
        LFile.EmptyLine;
      finally
        LTlb.ReleaseTLibAttr(LLibAttr);
      end;
      LCnt := LTlb.GetTypeInfoCount;
      for Li := 0 to LCnt - 1 do begin
        OleCheck(LTlb.GetTypeInfoType(Li, LTypeKind));
        case LTypeKind of
          0: LFile.Write('TKIND_ENUM');
          1: LFile.Write('TKIND_RECORD');
          2: LFile.Write('TKIND_MODULE');
          3: LFile.Write('TKIND_INTERFACE');
          4: LFile.Write('TKIND_DISPATCH');
          5: LFile.Write('TKIND_COCLASS');
          6: LFile.Write('TKIND_ALIAS');
          7: LFile.Write('TKIND_UNION');
        end;
        OleCheck(LTlb.GetDocumentation(Li, @LName, nil, nil, nil));
        LFile.Write('  ' + LName);
        SysFreeString(PChar(LName));
      end;

    finally
      LFile.Free;
    end;

  finally
    SysFreeString(PChar(LTlbName));
  end;
end;

procedure ParseElemDesc(const ADesc: TTypeDesc);
begin
  Write('ParseElemDesc: ');
  case ADesc.vt of
    VT_USERDEFINED: Writeln('hreftype: ', ADesc.hreftype);
    VT_PTR: begin
      Writeln('Pointer');
      ParseElemDesc(ADesc.ptdesc^);
    end;
  else
    Writeln(ADesc.vt);
  end;
end;

procedure GetName(const AInfo: ITypeInfo);
var
  LStr: WideString;
begin
  OleCheck(AInfo.GetDocumentation(MEMBERID_NIL, @LStr, nil, nil, nil));
end;

procedure Test;
var
  LLib: ITypeLib;
  LInfo: ITypeInfo;
  LStr: WideString;
  LFuncDesc: PFuncDesc;
  LNames: array[0..1] of WideString;
  Li, LCnt: Integer;
begin
  OleCheck(LoadTypeLibEx('test.tlb', REGKIND_NONE, LLib));
  OleCheck(LLib.GetTypeInfo(0, LInfo));
  for Li := 0 to Round(1E+6) do
    GetName(LInfo);

  exit;

  OleCheck(LInfo.GetDocumentation(MEMBERID_NIL, @LStr, nil, nil, nil));
  Writeln('Interface: ', LStr);
  SysFreeString(PChar(LStr));
  OleCheck(LInfo.GetFuncDesc(0, LFuncDesc));
  try
    OleCheck(LInfo.GetDocumentation(LFuncDesc^.memid, @LStr, nil, nil, nil));
    Writeln('Method: ', LStr);
    SysFreeString(PChar(LStr));
    Writeln('ParamCount: ', LFuncDesc^.cParams);
    LInfo.GetNames(LFuncDesc^.memid, @LNames[0], 2, LCnt);
    for Li := 0 to LCnt - 1 do
      Writeln('Name', Li, ': ', LNames[Li]);
    for Li := 0 to LFuncDesc^.cParams - 1 do
      ParseElemDesc(LFuncDesc^.lprgelemdescParam^[Li].tdesc);
  finally
    LInfo.ReleaseFuncDesc(LFuncDesc);
  end;
end;

type
  TTestType = TGUID;
const
//  CTestVal = TTestType($FF);
  CTestVal: TGUID = (
    D1: 0;
    D2: $FF;
  );


procedure Test_(AVal: TTestType);
var
  LVal: TTestType;
begin
  LVal := AVal;
end;

procedure TestC(const AVal: TTestType);
var
  LVal: TTestType;
begin
  LVal := AVal;
end;

procedure TestV(var AVal: TTestType);
var
  LVal: TTestType;
begin
  LVal := AVal;
end;

procedure TestAll;
var
  LVal: TTestType;
begin
  LVal := CTestVal;
  Test_(LVal);
  TestC(LVal);
  TestV(LVal);
end;

const
//  CName = 'tlibimpEx.tlb';
//  CName = 'msxml6.dll';
//  CName = 'msxml2my.tlb';
//  CName = 'rsEmc.tlb';
  CName = 'test.tlb';

var
  LParser: TTLBInfo;
  LOut: TOutFile;
begin
//  TestAll;
//  readln;
//  exit;
  LParser := TTLBInfo.Create(CName);
  try
    LOut := TOutFile.Create(LParser.PasUnitName + '.pas');
    try
      LParser.Print(LOut);
    finally
      LOut.Free;
    end;
  finally
    LParser.Free;
  end;
end.