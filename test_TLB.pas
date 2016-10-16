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

// $Rev: 45604 $
// File generated on 15.10.2016 20:51:51 from Type Library described below.

// ************************************************************************  //
// Type Lib: tlibimpEx.tlb (1)
// LIBID: {6766CD0E-744E-4EEF-AFD4-A6F8C1761EA0}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Member 'Set' of 'ITest' changed to 'Set_'
// Cmdline:
//   "C:\Program Files (x86)\Embarcadero\RAD Studio\9.0\bin\tlibimp.exe" -p+ tlibimpEx.tlb
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
  testMajorVersion = 1;
  testMinorVersion = 0;

  LIBID_test: TGUID = '{6766CD0E-744E-4EEF-AFD4-A6F8C1761EA0}';

  IID_ITest: TGUID = '{D3F8F5B4-E9AC-487B-8397-98E2EC44450D}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ITest = interface;
  ITestDisp = dispinterface;

// *********************************************************************//
// Interface: ITest
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D3F8F5B4-E9AC-487B-8397-98E2EC44450D}
// *********************************************************************//
  ITest = interface(IDispatch)
    ['{D3F8F5B4-E9AC-487B-8397-98E2EC44450D}']
    function Set_(const AVal: IUnknown): Integer; stdcall;
    procedure Get(out AOut: IUnknown); safecall;
    function Get_Owner(out AOut: ITest): HResult; cdecl;
    procedure SetStr(out B: Integer; const AVal: WideString); safecall;
    procedure Set0(const AVal: WideString); safecall;
    function Get_Get0(AVal: Integer): HResult; cdecl;
    procedure Set_Get0(AVal: Integer); safecall;
    property Get0[AVal: Integer]: Integer read Get_Get0 write Set_Get0;
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
    property Owner[out AOut: ITest]: ITest readonly dispid 1610743810;
    procedure SetStr(out B: Integer; const AVal: WideString); dispid 1610743811;
    procedure Set0(const AVal: WideString); dispid 1610743812;
    property Get0[AVal: Integer]: Integer dispid 1610743813;
  end;

implementation

uses System.Win.ComObj;

end.
