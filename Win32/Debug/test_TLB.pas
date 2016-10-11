unit test_TLB;

interface

uses
  Winapi.ActiveX;

const
  testMajorVersion = 1;
  testMinorVersion = 0;

  LIBID_test: TGUID = '{EAB4E943-AF9F-4D2F-A2D2-955C10D2A67B}';

  // IID constants
  IID_IrsTest: TGUID = '{D3F8F5B4-E9AC-487B-8397-98E2EC44450D}';
  IID_IrsTestDual: TGUID = '{5FB032D3-FBAF-4C53-AFF2-2445476BCE07}';
  DIID_IrsTestDisp: TGUID = '{C479589F-2226-45C8-8499-2DE1AA25C851}';
  DIID_IrsTest2: TGUID = '{6A8BECCC-88A3-49FA-8BBD-B84CF49C5797}';

// Enumerators
type
  TTestEnum = type TOleEnum;
const
  teOne = TTestEnum($00000001);
  teTen = TTestEnum($0000000A);

type
  // Interfaces forward declarations
  IrsTest = interface;
  IrsTestDual = interface;
  IrsTestDualDisp = dispinterface;
  IrsTestDisp = dispinterface;
  IrsTest2 = dispinterface;

type
  // Records
  testStruct = record
    Fld1: SYSINT;
    Fld2: GUID;
    Fld3: WideString;
  end;


