unit test_TLB;

interface

const
  testMajorVersion = 1;
  testMinorVersion = 0;

  LIBID_test: TGUID = '{6766CD0E-744E-4EEF-AFD4-A6F8C1761EA0}';

  // IID constants
  IID_IrsTest: TGUID = '{D3F8F5B4-E9AC-487B-8397-98E2EC44450D}';

type
  // Interfaces forward declarations
  IrsTest = interface;

type
  // Interfaces
  IrsTest = interface(IDispatch)
    ['{D3F8F5B4-E9AC-487B-8397-98E2EC44450D}']
    function Owner(out AOut: !!!UNKNOWN HRefType!!!): HRESULT; stdcall;
  end;


