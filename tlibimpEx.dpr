program tlibimpEx;

uses
  Fastmm4,
  System.SysUtils,
  Winapi.ActiveX,
  System.Win.ComObj,
  UTLBMempers in 'UTLBMempers.pas',
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

var
  LParser: TTLBInfo;
  LOut: TOutFile;
begin
  LParser := TTLBInfo.Create('msxml6.dll');
//  LParser := TTLBInfo.Create('test.tlb');
  try
    LOut := TOutFile.Create(LParser.UnitName + '.pas');
    try
      LParser.Print(LOut);
    finally
      LOut.Free;
    end;
  finally
    LParser.Free;
  end;
end.