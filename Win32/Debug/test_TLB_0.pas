unit test_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 17.10.2016 19:15:25 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Anton\Sources\rsShared\TLB\test.tlb (1)
// LIBID: {6766CD0E-744E-4EEF-AFD4-A6F8C1761EA0}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Member 'Set' of 'ITest' changed to 'Set_'
//   Hint: Member 'Set' of 'ITestProp' changed to 'Set_'
// Cmdline:
//   "C:\Program Files (x86)\Embarcadero\RAD Studio\10.0\bin\tlibimp.exe"  -P+ -R- "D:\Anton\Sources\rsShared\TLB\test.tlb" -Ha- -Hs- -Hr- -O- -Yc- -Pt+
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  testMajorVersion = 0;
  testMinorVersion = 0;

  LIBID_test: TGUID = '{6766CD0E-744E-4EEF-AFD4-A6F8C1761EA0}';

  IID_ITest: TGUID = '{D3F8F5B4-E9AC-487B-8397-98E2EC44450D}';
  IID_ITestProp: TGUID = '{8B19090D-3476-42CB-9510-DC497354E1DA}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ITest = interface;
  ITestDisp = dispinterface;
  ITestProp = interface;
  ITestPropDisp = dispinterface;

// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//

  myStr = WideString; 

// *********************************************************************//
// Interface: ITest
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D3F8F5B4-E9AC-487B-8397-98E2EC44450D}
// *********************************************************************//
  ITest = interface(IDispatch)
    ['{D3F8F5B4-E9AC-487B-8397-98E2EC44450D}']
    function Set_(const AVal: IUnknown): Integer; stdcall;
    procedure Get(out AOut: IUnknown); safecall;
    function Owner(const AOut: ITest): HResult; cdecl;
    procedure SetStr(out B: Integer; const AVal: WideString); safecall;
    procedure SetStr1(const AVal: myStr); safecall;
    procedure Set0(const AVal: WideString); safecall;
    function Get0(out AVal: Integer): HResult; cdecl;
    procedure GetStr0(const AVal: myStr); safecall;
  end;

// *********************************************************************//
// DispIntf:  ITestDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D3F8F5B4-E9AC-487B-8397-98E2EC44450D}
// *********************************************************************//
  ITestDisp = dispinterface
    ['{D3F8F5B4-E9AC-487B-8397-98E2EC44450D}']
    function Set_(const AVal: IUnknown): Integer; dispid 1610743808;
    procedure Get(out AOut: IUnknown); dispid 1610743809;
    function Owner(const AOut: ITest): HResult; dispid 1610743810;
    procedure SetStr(out B: Integer; const AVal: WideString); dispid 1610743811;
    procedure SetStr1(const AVal: myStr); dispid 1610743812;
    procedure Set0(const AVal: WideString); dispid 1610743813;
    function Get0(out AVal: Integer): Integer; dispid 1610743814;
    procedure GetStr0(const AVal: myStr); dispid 1610743815;
  end;

// *********************************************************************//
// Interface: ITestProp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8B19090D-3476-42CB-9510-DC497354E1DA}
// *********************************************************************//
  ITestProp = interface(IDispatch)
    ['{8B19090D-3476-42CB-9510-DC497354E1DA}']
    function Set_(const AVal: IUnknown): Integer; stdcall;
    function Get_Get: HResult; safecall;
    function Set_Owner(const Param1: ITest): HResult; cdecl;
    function Get_Get0(out AVal: Integer): HResult; cdecl;
    procedure Set_Get0(AVal: Integer); safecall;
    function Get_Get1: Integer; cdecl;
    procedure Set_Get1(Param1: Integer); cdecl;
    function Get_Get2: Integer; safecall;
    procedure Set_Get2(AVal: Integer); safecall;
    function Get_Get3(AIdx: Integer): Integer; safecall;
    procedure Set_Get3(AIdx: Integer; AVal: Integer); safecall;
    property Get: HResult read Get_Get;
    property Get0[out AVal: Integer]: Integer read Get_Get0 write Set_Get0;
    property Get2: Integer read Get_Get2 write Set_Get2;
    property Get3[AIdx: Integer]: Integer read Get_Get3 write Set_Get3;
  end;

// *********************************************************************//
// DispIntf:  ITestPropDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8B19090D-3476-42CB-9510-DC497354E1DA}
// *********************************************************************//
  ITestPropDisp = dispinterface
    ['{8B19090D-3476-42CB-9510-DC497354E1DA}']
    function Set_(const AVal: IUnknown): Integer; dispid 1610743808;
    property Get: HResult readonly dispid 1610743809;
    property Owner: HResult writeonly dispid 1610743810;
    property Get0[out AVal: Integer]: Integer dispid 1610743811;
    function Get1: Integer; dispid 1610743813;
    property Get2: Integer dispid 1610743815;
    property Get3[AIdx: Integer]: Integer dispid 1610743817;
  end;

implementation

uses System.Win.ComObj;

end.
