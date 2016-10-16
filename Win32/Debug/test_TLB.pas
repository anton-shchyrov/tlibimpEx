unit test_TLB;

interface

const
  testMajorVersion = 1;
  testMinorVersion = 0;

  LIBID_test: TGUID = '{6766CD0E-744E-4EEF-AFD4-A6F8C1761EA0}';

  // IID constants
  IID_ITest: TGUID = '{D3F8F5B4-E9AC-487B-8397-98E2EC44450D}';

type
  // Interfaces forward declarations
  ITest = interface;
  ITestDisp = dispinterface;

type
  // Interfaces
  ITest = interface(IDispatch)
    ['{D3F8F5B4-E9AC-487B-8397-98E2EC44450D}']
    function Set_(const AVal: IUnknown): Integer; stdcall;
    procedure Get(out AOut: IUnknown); safecall;
    function Owner(out AOut: ITest): HRESULT; cdecl;
    procedure SetStr(out B: Integer; const AVal: WideString); safecall;
    procedure Set0(const AVal: WideString); safecall;
    function Get0: Integer; safecall;
  end;


