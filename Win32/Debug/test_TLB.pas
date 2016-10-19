unit test_TLB;

interface

const
  testMajorVersion = 0;
  testMinorVersion = 0;

  LIBID_test: TGUID = '{6766CD0E-744E-4EEF-AFD4-A6F8C1761EA0}';

  // IID constants
  DIID_IPureDisp: TGUID = '{1D5BF34D-2B3A-4B9A-AAB7-E693BBBDDBCE}';
  IID_IBase: TGUID = '{6FB81CFB-39D0-466A-8FB3-34F4869C31EE}';
  IID_IChild: TGUID = '{4ED7009C-0ABF-48A2-AED3-BDF3EF234281}';
  IID_IChild2: TGUID = '{CD7ADC1B-BF0D-4B90-865E-A37D9839E613}';
  IID_ITest: TGUID = '{D3F8F5B4-E9AC-487B-8397-98E2EC44450D}';
  IID_ITestProp: TGUID = '{8B19090D-3476-42CB-9510-DC497354E1DA}';

type
  // Interfaces forward declarations
  IPureDisp = dispinterface;
  IBase = interface;
  IChild = interface;
  IChildDisp = dispinterface;
  IChild2 = interface;
  IChild2Disp = dispinterface;
  ITest = interface;
  ITestDisp = dispinterface;
  ITestProp = interface;
  ITestPropDisp = dispinterface;

type
  // Custom aliaces
  PPInteger = ^PInteger;

type
  // Aliaces
  PLong1 = type PInteger;
  PLong2 = type PPInteger;
  myStr = type WideString;

type
  // Records
  {$ALIGN 2}
  TRec = record
    F3: SmallInt;
  end;

  {$ALIGN 1}
  TRecAlign = record
    F1: ShortInt;
  end;

type
  // Interfaces
  IPureDisp = dispinterface
    ['{1D5BF34D-2B3A-4B9A-AAB7-E693BBBDDBCE}']
    procedure Disp1; dispid 1;
    procedure Disp2(AIdx: Integer); dispid 2;
    function Disp3: Integer; dispid 3;
  end;

  IBase = interface(IDispatch)
    ['{6FB81CFB-39D0-466A-8FB3-34F4869C31EE}']
    function Base1(const ARec: TRec): HRESULT; stdcall;
    function Base2(const AVal: TGUID): HRESULT; stdcall;
    function Base3(var ARec: TRec): HRESULT; stdcall;
  end;

  IChild = interface(IBase)
    ['{4ED7009C-0ABF-48A2-AED3-BDF3EF234281}']
    procedure Child; safecall;
  end;

  IChildDisp = dispinterface
    ['{4ED7009C-0ABF-48A2-AED3-BDF3EF234281}']
    procedure Child; dispid 1610809344;
    procedure Base1(const ARec: TRec); dispid 1610743808;
    procedure Base2(const AVal: TGUID); dispid 1610743809;
    procedure Base3(var ARec: TRec); dispid 1610743810;
  end;

  IChild2 = interface(IChild)
    ['{CD7ADC1B-BF0D-4B90-865E-A37D9839E613}']
    procedure Child2; safecall;
  end;

  IChild2Disp = dispinterface
    ['{CD7ADC1B-BF0D-4B90-865E-A37D9839E613}']
    procedure Child2; dispid 1610874880;
    procedure Child; dispid 1610809344;
    procedure Base1(const ARec: TRec); dispid 1610743808;
    procedure Base2(const AVal: TGUID); dispid 1610743809;
    procedure Base3(var ARec: TRec); dispid 1610743810;
  end;

  ITest = interface(IDispatch)
    ['{D3F8F5B4-E9AC-487B-8397-98E2EC44450D}']
    function Set_(const AVal: IUnknown): Integer; stdcall;
    procedure Get(out AOut: IUnknown); safecall;
    function Owner(const AOut: ITest): HRESULT; cdecl;
    procedure SetStr(out B: Integer; const AVal: WideString); safecall;
    procedure SetStr1(const AVal: myStr); safecall;
    procedure Set0(const AVal: WideString); safecall;
    function Get0(out AVal: Integer): HRESULT; cdecl;
    procedure GetStr0(const AVal: myStr); safecall;
  end;

  ITestDisp = dispinterface
    ['{D3F8F5B4-E9AC-487B-8397-98E2EC44450D}']
    function Set_(const AVal: IUnknown): Integer; dispid 1610743808;
    procedure Get(out AOut: IUnknown); dispid 1610743809;
    procedure Owner(const AOut: ITest); dispid 1610743810;
    procedure SetStr(out B: Integer; const AVal: WideString); dispid 1610743811;
    procedure SetStr1(const AVal: myStr); dispid 1610743812;
    procedure Set0(const AVal: WideString); dispid 1610743813;
    function Get0: Integer; dispid 1610743814;
    procedure GetStr0(const AVal: myStr); dispid 1610743815;
  end;

  ITestProp = interface(IDispatch)
    ['{8B19090D-3476-42CB-9510-DC497354E1DA}']
    function Set_(const AVal: IUnknown): Integer; stdcall;
    procedure Get_Get(out AOut: IUnknown); safecall;
    function Set_Owner(const Param1: ITest): HRESULT; cdecl;
    function Get_Get0(out AVal: Integer): HRESULT; cdecl;
    procedure Set_Get0(AVal: Integer); safecall;
    function Get_Get1: Integer; cdecl;
    procedure Set_Get1(Param1: Integer); cdecl;
    function Get_Get2: Integer; safecall;
    procedure Set_Get2(AVal: Integer); safecall;
    function Get_Get3(AIdx: Integer): Integer; safecall;
    procedure Set_Get3(AIdx: Integer; AVal: Integer); safecall;
    property Get: IUnknown read Get_Get;
    property Owner: ITest write Set_Owner;
    property Get0: Integer read Get_Get0 write Set_Get0;
    property Get1: Integer read Get_Get1 write Set_Get1;
    property Get2: Integer read Get_Get2 write Set_Get2;
    property Get3[AIdx: Integer]: Integer read Get_Get3 write Set_Get3;
  end;

  ITestPropDisp = dispinterface
    ['{8B19090D-3476-42CB-9510-DC497354E1DA}']
    function Set_(const AVal: IUnknown): Integer; dispid 1610743808;
    property Get: IUnknown readonly dispid 1610743809;
    property Owner: ITest writeonly dispid 1610743810;
    property Get0: Integer dispid 1610743811;
    property Get1: Integer dispid 1610743813;
    property Get2: Integer dispid 1610743815;
    property Get3[AIdx: Integer]: Integer dispid 1610743817;
  end;

