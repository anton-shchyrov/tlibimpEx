program tlibimpEx;

uses
//  Winapi.Windows,
  System.SysUtils,
  Winapi.ActiveX,
  System.Win.ComObj;

{$R *.res}

type
  TSettings = class

  end;

  TOutFile = class
  strict private
    const
      CIdent = '  ';
  strict private
    FFile: TextFile;
    FIdentStr: string;
  public
    constructor Create(const AName: string);
    destructor Destroy; override;
    procedure Write(const AStr: string);
    procedure WriteFmt(const AFmt: string; const AArgs: array of const);
    procedure EmptyStr;
    procedure IncIdent;
    procedure DecIdent;
  end;

  TImporter = class
  strict private
    function LoadTLB(const AFileName: string): ITypeLib2; inline;
  public
    procedure ImportTLB(const AFileName: string);
  end;

{ TOutFile }

constructor TOutFile.Create(const AName: string);
begin
  inherited Create;
  AssignFile(FFile, AName);
  Rewrite(FFile);
  WriteFmt('unit %s;', [ChangeFileExt(ExtractFileName(AName), '')]);
  EmptyStr;
end;

destructor TOutFile.Destroy;
begin
  CloseFile(FFile);
  inherited Destroy;
end;

procedure TOutFile.Write(const AStr: string);
begin
  System.Writeln(FFile, FIdentStr, AStr);
end;

procedure TOutFile.WriteFmt(const AFmt: string; const AArgs: array of const);
begin
  Write(Format(AFmt, AArgs));
end;

procedure TOutFile.EmptyStr;
begin
  System.Writeln(FFile);
end;

procedure TOutFile.IncIdent;
begin
  FIdentStr := FIdentStr + CIdent;
end;

procedure TOutFile.DecIdent;
begin
  SetLength(FIdentStr, Length(FIdentStr) - Length(CIdent));
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
        LFile.EmptyStr;
        LFile.WriteFmt('LIBID_%s: TGUID = %s;', [LTlbName, GUIDToString(LLibAttr^.guid)]);
        LFile.EmptyStr;
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
  LImp: TImporter;
begin
  LImp := TImporter.Create;
  try
    LImp.ImportTLB('msxml6.dll');
  finally
    LImp.Free;
  end;
end.