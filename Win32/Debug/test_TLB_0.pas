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
// File generated on 19.10.2016 19:29:57 from Type Library described below.

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

  DIID_IPureDisp: TGUID = '{1D5BF34D-2B3A-4B9A-AAB7-E693BBBDDBCE}';
  IID_IBase: TGUID = '{6FB81CFB-39D0-466A-8FB3-34F4869C31EE}';
  IID_IChild: TGUID = '{4ED7009C-0ABF-48A2-AED3-BDF3EF234281}';
  IID_IChild2: TGUID = '{CD7ADC1B-BF0D-4B90-865E-A37D9839E613}';
  IID_ITest: TGUID = '{D3F8F5B4-E9AC-487B-8397-98E2EC44450D}';
  IID_ITestProp: TGUID = '{8B19090D-3476-42CB-9510-DC497354E1DA}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
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

// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PLong1 = ^Integer; 
  PLong2 = ^PInteger1; 
  PInteger1 = ^Integer; {*}
  PUserType1 = ^TRec; {*}


{$ALIGN 2}
  TRec = record
    F3: Smallint;
  end;

{$ALIGN 1}
  TRecAlign = record
    F1: Shortint;
  end;

  myStr = WideString; 

// *********************************************************************//
// DispIntf:  IPureDisp
// Flags:     (4096) Dispatchable
// GUID:      {1D5BF34D-2B3A-4B9A-AAB7-E693BBBDDBCE}
// *********************************************************************//
  IPureDisp = dispinterface
    ['{1D5BF34D-2B3A-4B9A-AAB7-E693BBBDDBCE}']
    function Disp1: HResult; dispid 1;
    function Disp2(AIdx: Integer): HResult; dispid 2;
    function Disp3: Integer; dispid 3;
  end;

// *********************************************************************//
// Interface: IBase
// Flags:     (4096) Dispatchable
// GUID:      {6FB81CFB-39D0-466A-8FB3-34F4869C31EE}
// *********************************************************************//
  IBase = interface(IDispatch)
    ['{6FB81CFB-39D0-466A-8FB3-34F4869C31EE}']
    procedure Base1(ARec: TRec); safecall;
    procedure Base2(AVal: TGUID); safecall;
    procedure Base3(var ARec: TRec); safecall;
  end;

// *********************************************************************//
// Interface: IChild
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4ED7009C-0ABF-48A2-AED3-BDF3EF234281}
// *********************************************************************//
  IChild = interface(IBase)
    ['{4ED7009C-0ABF-48A2-AED3-BDF3EF234281}']
    procedure Child; safecall;
  end;

// *********************************************************************//
// DispIntf:  IChildDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4ED7009C-0ABF-48A2-AED3-BDF3EF234281}
// *********************************************************************//
  IChildDisp = dispinterface
    ['{4ED7009C-0ABF-48A2-AED3-BDF3EF234281}']
    procedure Child; dispid 1610809344;
    procedure Base1(ARec: {NOT_OLEAUTO(TRec)}OleVariant); dispid 1610743808;
    procedure Base2(AVal: {NOT_OLEAUTO(TGUID)}OleVariant); dispid 1610743809;
    procedure Base3(var ARec: {NOT_OLEAUTO(TRec)}OleVariant); dispid 1610743810;
  end;

// *********************************************************************//
// Interface: IChild2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CD7ADC1B-BF0D-4B90-865E-A37D9839E613}
// *********************************************************************//
  IChild2 = interface(IChild)
    ['{CD7ADC1B-BF0D-4B90-865E-A37D9839E613}']
    procedure Child2; safecall;
  end;

// *********************************************************************//
// DispIntf:  IChild2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CD7ADC1B-BF0D-4B90-865E-A37D9839E613}
// *********************************************************************//
  IChild2Disp = dispinterface
    ['{CD7ADC1B-BF0D-4B90-865E-A37D9839E613}']
    procedure Child2; dispid 1610874880;
    procedure Child; dispid 1610809344;
    procedure Base1(ARec: {NOT_OLEAUTO(TRec)}OleVariant); dispid 1610743808;
    procedure Base2(AVal: {NOT_OLEAUTO(TGUID)}OleVariant); dispid 1610743809;
    procedure Base3(var ARec: {NOT_OLEAUTO(TRec)}OleVariant); dispid 1610743810;
  end;

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
