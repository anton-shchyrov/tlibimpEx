unit test_TLB;

interface

const
  testMajorVersion = 0;
  testMinorVersion = 0;

  LIBID_test: TGUID = '{6766CD0E-744E-4EEF-AFD4-A6F8C1761EA0}';

  // IID constants
  IID_ITest: TGUID = '{D3F8F5B4-E9AC-487B-8397-98E2EC44450D}';
  IID_ITestProp: TGUID = '{8B19090D-3476-42CB-9510-DC497354E1DA}';

type
  // Interfaces forward declarations
  ITest = interface;
  ITestDisp = dispinterface;
  ITestProp = interface;
  ITestPropDisp = dispinterface;

type
  // Aliaces
  myStr = type WideString;

type
  // Interfaces
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


