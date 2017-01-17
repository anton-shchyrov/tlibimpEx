unit rsActiveDataX_TLB;

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
// File generated on 19.10.2015 17:00:12 from Type Library described below.

// ************************************************************************  //
// Type Lib: rsActiveDataX.tlb (1)
// LIBID: {86B7C309-2174-42F4-BDC0-343828D6FE24}
// LCID: 0
// Helpfile: 
// HelpString: Radiosoft ActiveDataX Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v1.0 rsShare, (D:\Anton\Sources\rsShared\TLB\rsshare.tlb)
//   (3) v1.0 COMSVCSLib, (C:\Windows\SysWOW64\comsvcs.dll)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: TypeInfo 'rsActiveDataX' changed to 'rsActiveDataX_'
//   Hint: Symbol 'Assign' renamed to 'Assign_'
//   Hint: Member 'Values' of 'IrsUserPropertySeries' changed to 'Values_'
// Cmdline:
//   "C:\Program Files (x86)\Embarcadero\RAD Studio\10.0\bin\tlibimp.exe" -P+ rsActiveDataX.tlb
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, rsShare_TLB, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleCtrls, Vcl.OleServer, 
Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  rsActiveDataXMajorVersion = 1;
  rsActiveDataXMinorVersion = 0;

  LIBID_rsActiveDataX: TGUID = '{86B7C309-2174-42F4-BDC0-343828D6FE24}';

  IID_IrsADXLicence: TGUID = '{BA14E64A-3E3F-44D0-83D2-9B21B26CC7C8}';
  IID_IrsADXLicenceFreq: TGUID = '{2F51D0D3-D5AD-473F-B156-B4331387A9BB}';
  IID_IrsADXID: TGUID = '{5B9A3DB0-31AD-453D-80FA-F0C0AF24DEA9}';
  IID_IrsADXLicence2: TGUID = '{1DD18E0D-731B-44E5-A8B2-838F34A4444F}';
  DIID_IrsActiveDataXEvents: TGUID = '{3B39A993-0004-4B48-8A3B-2C5E22B17C9B}';
  IID_IrsActiveDataX: TGUID = '{2BB11364-34E7-4A90-A06A-0A68D700A9F1}';
  IID_IrsActiveDataX2: TGUID = '{F758BA93-93FA-4ACE-9236-845C044CB60D}';
  CLASS_rsActiveDataX_: TGUID = '{C8E237C6-8273-4917-8FD5-AF927463498B}';
  IID_IrsSeriesList: TGUID = '{E9811BBC-D1C6-4DA3-BDAF-D6A3FC983F58}';
  IID_IrsPropertySeries: TGUID = '{6190410D-DD6A-4103-8D66-A3B06D0252CE}';
  IID_IrsUserPropertySeries: TGUID = '{FC8BAA48-9128-42E7-8D3F-EE3E670E9E31}';
  IID_IrsLevelPalette: TGUID = '{CE64766F-E275-4B8E-9A9E-872B446593E0}';
  IID_IrsADXCustomList: TGUID = '{92F75DB3-038F-4741-B8DD-5F5C3C5D0922}';
  IID_IrsADXInterfacedList: TGUID = '{E7547563-65CD-4D33-83BE-0496A1F46494}';
  IID_IrsADXCompare: TGUID = '{D44B5464-27CA-48BD-9098-493317AE0E13}';
  IID_IrsADXLicenceList: TGUID = '{C03B1D8C-B096-4F46-8198-DD6F282EBB4B}';
  IID_IrsADXCustomMarker: TGUID = '{D8F262FE-2416-483C-8A65-39E7B2E769CD}';
  IID_IrsADXMarker: TGUID = '{CB7BFB1B-F25C-4C28-99F7-6204169DA4D3}';
  IID_IrsADXPrpMarker: TGUID = '{02651DE5-2F42-48DB-B454-269F0DE3BCE0}';
  IID_IrsPropertySeries2: TGUID = '{9E98D2ED-A388-443B-B24A-CAAB158AE8AF}';
  IID_IrsADXLoadSaveSupport: TGUID = '{3E1A1FAC-72E7-454D-BD03-42B96B524E9A}';
  IID_IrsADXParamSupport: TGUID = '{2F2D00EA-DD3F-42D7-B978-0572C1DA6A45}';
  IID_IrsADXUserDefMarker: TGUID = '{F5212A8C-868C-4B8B-B927-BD8EA147C448}';
  IID_IrsADXUserDefMarker2: TGUID = '{840223C7-88EB-43C7-9F84-86C11B6B32C1}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum TFileFormat
type
  TFileFormat = TOleEnum;
const
  ffDefault = $FFFFFFFF;
  ffBMP = $00000000;
  ffWMF = $00000001;
  ffEMF = $00000002;
  ffJPEG = $00000003;
  ffPNG = $00000004;

// Constants for enum TMarkerFlag
type
  TMarkerFlag = TOleEnum;
const
  mfNone = $00000000;
  mfProperty = $00000001;
  mfPermanent = $00000002;
  mfNotPermanent = $00000004;
  mfLic = $00000008;

// Constants for enum TxActiveFormBorderStyle
type
  TxActiveFormBorderStyle = TOleEnum;
const
  afbNone = $00000000;
  afbSingle = $00000001;
  afbSunken = $00000002;
  afbRaised = $00000003;

// Constants for enum TxPrintScale
type
  TxPrintScale = TOleEnum;
const
  poNone = $00000000;
  poProportional = $00000001;
  poPrintToFit = $00000002;

// Constants for enum TxPopupMode
type
  TxPopupMode = TOleEnum;
const
  pmNone = $00000000;
  pmAuto = $00000001;
  pmExplicit = $00000002;

// Constants for enum TxMouseButton
type
  TxMouseButton = TOleEnum;
const
  mbLeft = $00000000;
  mbRight = $00000001;
  mbMiddle = $00000002;

// Constants for enum TVertAlign
type
  TVertAlign = TOleEnum;
const
  vaTop = $00000000;
  vaCenter = $00000001;
  vaBottom = $00000002;

// Constants for enum THorizAlign
type
  THorizAlign = TOleEnum;
const
  haLeft = $00000000;
  haRight = $00000001;
  haCenter = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IrsADXLicence = interface;
  IrsADXLicenceDisp = dispinterface;
  IrsADXLicenceFreq = interface;
  IrsADXLicenceFreqDisp = dispinterface;
  IrsADXID = interface;
  IrsADXIDDisp = dispinterface;
  IrsADXLicence2 = interface;
  IrsADXLicence2Disp = dispinterface;
  IrsActiveDataXEvents = dispinterface;
  IrsActiveDataX = interface;
  IrsActiveDataXDisp = dispinterface;
  IrsActiveDataX2 = interface;
  IrsActiveDataX2Disp = dispinterface;
  IrsSeriesList = interface;
  IrsSeriesListDisp = dispinterface;
  IrsPropertySeries = interface;
  IrsPropertySeriesDisp = dispinterface;
  IrsUserPropertySeries = interface;
  IrsUserPropertySeriesDisp = dispinterface;
  IrsLevelPalette = interface;
  IrsLevelPaletteDisp = dispinterface;
  IrsADXCustomList = interface;
  IrsADXCustomListDisp = dispinterface;
  IrsADXInterfacedList = interface;
  IrsADXInterfacedListDisp = dispinterface;
  IrsADXCompare = interface;
  IrsADXCompareDisp = dispinterface;
  IrsADXLicenceList = interface;
  IrsADXLicenceListDisp = dispinterface;
  IrsADXCustomMarker = interface;
  IrsADXCustomMarkerDisp = dispinterface;
  IrsADXMarker = interface;
  IrsADXMarkerDisp = dispinterface;
  IrsADXPrpMarker = interface;
  IrsADXPrpMarkerDisp = dispinterface;
  IrsPropertySeries2 = interface;
  IrsPropertySeries2Disp = dispinterface;
  IrsADXLoadSaveSupport = interface;
  IrsADXLoadSaveSupportDisp = dispinterface;
  IrsADXParamSupport = interface;
  IrsADXParamSupportDisp = dispinterface;
  IrsADXUserDefMarker = interface;
  IrsADXUserDefMarkerDisp = dispinterface;
  IrsADXUserDefMarker2 = interface;
  IrsADXUserDefMarker2Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  rsActiveDataX_ = IrsActiveDataX2;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PPUserType1 = IFontDisp; {*}

  TMarkerAlign = record
    Horiz: THorizAlign;
    Vert: TVertAlign;
  end;


// *********************************************************************//
// Interface: IrsADXLicence
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BA14E64A-3E3F-44D0-83D2-9B21B26CC7C8}
// *********************************************************************//
  IrsADXLicence = interface(IDispatch)
    ['{BA14E64A-3E3F-44D0-83D2-9B21B26CC7C8}']
    function Get_Freq: IrsADXLicenceFreq; safecall;
    function Get_DuplexFreq: IrsADXLicenceFreq; safecall;
    function Get_Hint: WideString; safecall;
    procedure Set_Hint(const AOut: WideString); safecall;
    function Get_ID: IrsADXID; safecall;
    procedure Set_ID(const AOut: IrsADXID); safecall;
    procedure Assign_(const AValue: IUnknown); safecall;
    property Freq: IrsADXLicenceFreq read Get_Freq;
    property DuplexFreq: IrsADXLicenceFreq read Get_DuplexFreq;
    property Hint: WideString read Get_Hint write Set_Hint;
    property ID: IrsADXID read Get_ID write Set_ID;
  end;

// *********************************************************************//
// DispIntf:  IrsADXLicenceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BA14E64A-3E3F-44D0-83D2-9B21B26CC7C8}
// *********************************************************************//
  IrsADXLicenceDisp = dispinterface
    ['{BA14E64A-3E3F-44D0-83D2-9B21B26CC7C8}']
    property Freq: IrsADXLicenceFreq readonly dispid 256;
    property DuplexFreq: IrsADXLicenceFreq readonly dispid 257;
    property Hint: WideString dispid 258;
    property ID: IrsADXID dispid 259;
    procedure Assign_(const AValue: IUnknown); dispid 260;
  end;

// *********************************************************************//
// Interface: IrsADXLicenceFreq
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2F51D0D3-D5AD-473F-B156-B4331387A9BB}
// *********************************************************************//
  IrsADXLicenceFreq = interface(IDispatch)
    ['{2F51D0D3-D5AD-473F-B156-B4331387A9BB}']
    function Get_Freq(ADim: TFreqDim): OleVariant; safecall;
    procedure Set_Freq(ADim: TFreqDim; AValue: OleVariant); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(AValue: OLE_COLOR); safecall;
    function Get_BorderColor: OLE_COLOR; safecall;
    procedure Set_BorderColor(AValue: OLE_COLOR); safecall;
    procedure Assign_(const AValue: IUnknown); safecall;
    property Freq[ADim: TFreqDim]: OleVariant read Get_Freq write Set_Freq;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property BorderColor: OLE_COLOR read Get_BorderColor write Set_BorderColor;
  end;

// *********************************************************************//
// DispIntf:  IrsADXLicenceFreqDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2F51D0D3-D5AD-473F-B156-B4331387A9BB}
// *********************************************************************//
  IrsADXLicenceFreqDisp = dispinterface
    ['{2F51D0D3-D5AD-473F-B156-B4331387A9BB}']
    property Freq[ADim: TFreqDim]: OleVariant dispid 256;
    property Color: OLE_COLOR dispid 257;
    property BorderColor: OLE_COLOR dispid 258;
    procedure Assign_(const AValue: IUnknown); dispid 259;
  end;

// *********************************************************************//
// Interface: IrsADXID
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5B9A3DB0-31AD-453D-80FA-F0C0AF24DEA9}
// *********************************************************************//
  IrsADXID = interface(IDispatch)
    ['{5B9A3DB0-31AD-453D-80FA-F0C0AF24DEA9}']
    function Get_ID: SYSINT; safecall;
    procedure Set_ID(AValue: SYSINT); safecall;
    function Get_GUID: TGUID; safecall;
    procedure Set_GUID(AValue: TGUID); safecall;
    function Get_GUIDStr: WideString; safecall;
    procedure Set_GUIDStr(const AValue: WideString); safecall;
    procedure Assign_(const AValue: IUnknown); safecall;
    property ID: SYSINT read Get_ID write Set_ID;
    property GUID: TGUID read Get_GUID write Set_GUID;
    property GUIDStr: WideString read Get_GUIDStr write Set_GUIDStr;
  end;

// *********************************************************************//
// DispIntf:  IrsADXIDDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5B9A3DB0-31AD-453D-80FA-F0C0AF24DEA9}
// *********************************************************************//
  IrsADXIDDisp = dispinterface
    ['{5B9A3DB0-31AD-453D-80FA-F0C0AF24DEA9}']
    property ID: SYSINT dispid 256;
    property GUID: {NOT_OLEAUTO(TGUID)}OleVariant dispid 257;
    property GUIDStr: WideString dispid 258;
    procedure Assign_(const AValue: IUnknown); dispid 259;
  end;

// *********************************************************************//
// Interface: IrsADXLicence2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1DD18E0D-731B-44E5-A8B2-838F34A4444F}
// *********************************************************************//
  IrsADXLicence2 = interface(IrsADXLicence)
    ['{1DD18E0D-731B-44E5-A8B2-838F34A4444F}']
    function Get_StnID: IrsADXID; safecall;
    procedure Set_StnID(const AOut: IrsADXID); safecall;
    property StnID: IrsADXID read Get_StnID write Set_StnID;
  end;

// *********************************************************************//
// DispIntf:  IrsADXLicence2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1DD18E0D-731B-44E5-A8B2-838F34A4444F}
// *********************************************************************//
  IrsADXLicence2Disp = dispinterface
    ['{1DD18E0D-731B-44E5-A8B2-838F34A4444F}']
    property StnID: IrsADXID dispid 512;
    property Freq: IrsADXLicenceFreq readonly dispid 256;
    property DuplexFreq: IrsADXLicenceFreq readonly dispid 257;
    property Hint: WideString dispid 258;
    property ID: IrsADXID dispid 259;
    procedure Assign_(const AValue: IUnknown); dispid 260;
  end;

// *********************************************************************//
// DispIntf:  IrsActiveDataXEvents
// Flags:     (4096) Dispatchable
// GUID:      {3B39A993-0004-4B48-8A3B-2C5E22B17C9B}
// *********************************************************************//
  IrsActiveDataXEvents = dispinterface
    ['{3B39A993-0004-4B48-8A3B-2C5E22B17C9B}']
    procedure OnActivate; dispid 201;
    procedure OnClick; dispid 202;
    procedure OnCreate; dispid 203;
    procedure OnDblClick; dispid 204;
    procedure OnDestroy; dispid 205;
    procedure OnDeactivate; dispid 206;
    procedure OnKeyPress(var Key: Smallint); dispid 207;
    procedure OnMouseEnter; dispid 208;
    procedure OnMouseLeave; dispid 209;
    procedure OnPaint; dispid 210;
    procedure OnLicClick(const ALicense: IrsADXLicence2); dispid 211;
  end;

// *********************************************************************//
// Interface: IrsActiveDataX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2BB11364-34E7-4A90-A06A-0A68D700A9F1}
// *********************************************************************//
  IrsActiveDataX = interface(IDispatch)
    ['{2BB11364-34E7-4A90-A06A-0A68D700A9F1}']
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    function Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    function Get_PixelsPerInch: Integer; safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    function Get_Scaled: WordBool; safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    function Get_Active: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    function Get_PopupMode: TxPopupMode; safecall;
    procedure Set_PopupMode(Value: TxPopupMode); safecall;
    function Get_ScreenSnap: WordBool; safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    function Get_SnapBuffer: Integer; safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    function Get_DockSite: WordBool; safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_MouseInClient: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    function Get_UseDockManager: WordBool; safecall;
    procedure Set_UseDockManager(Value: WordBool); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_ExplicitLeft: Integer; safecall;
    function Get_ExplicitTop: Integer; safecall;
    function Get_ExplicitWidth: Integer; safecall;
    function Get_ExplicitHeight: Integer; safecall;
    function Get_AlignWithMargins: WordBool; safecall;
    procedure Set_AlignWithMargins(Value: WordBool); safecall;
    function Get_BgColor: OLE_COLOR; safecall;
    procedure Set_BgColor(AOut: OLE_COLOR); safecall;
    function Get_LabelColor: OLE_COLOR; safecall;
    procedure Set_LabelColor(AOut: OLE_COLOR); safecall;
    function Get_LabelVisible: WordBool; safecall;
    procedure Set_LabelVisible(AOut: WordBool); safecall;
    procedure CreateChart; safecall;
    procedure SavePictureToFile(const AFile: WideString; var AFormat: TFileFormat); safecall;
    procedure SavePictureToStream(const AStream: IUnknown; var AFormat: TFileFormat); safecall;
    function AddSeriesList: IrsSeriesList; safecall;
    procedure ClearSeriesList; safecall;
    procedure DeleteSeriesList(AIdx: Integer); safecall;
    function Get_SeriesListCount: Integer; safecall;
    function Get_SeriesList(AIdx: Integer): IrsSeriesList; safecall;
    function IndexOf(const ASeries: IrsSeriesList): Integer; safecall;
    procedure EnableValidSeries; safecall;
    function Get_Palette: IrsLevelPalette; safecall;
    procedure Set_Palette(const APalette: IrsLevelPalette); safecall;
    function Get_Limits: IrsLimits2; safecall;
    procedure Set_Limits(const ALimits: IrsLimits2); safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle write Set_AxBorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Font: IFontDisp read Get_Font write Set_Font;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property PopupMode: TxPopupMode read Get_PopupMode write Set_PopupMode;
    property ScreenSnap: WordBool read Get_ScreenSnap write Set_ScreenSnap;
    property SnapBuffer: Integer read Get_SnapBuffer write Set_SnapBuffer;
    property DockSite: WordBool read Get_DockSite write Set_DockSite;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property AlignDisabled: WordBool read Get_AlignDisabled;
    property MouseInClient: WordBool read Get_MouseInClient;
    property VisibleDockClientCount: Integer read Get_VisibleDockClientCount;
    property UseDockManager: WordBool read Get_UseDockManager write Set_UseDockManager;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property ExplicitLeft: Integer read Get_ExplicitLeft;
    property ExplicitTop: Integer read Get_ExplicitTop;
    property ExplicitWidth: Integer read Get_ExplicitWidth;
    property ExplicitHeight: Integer read Get_ExplicitHeight;
    property AlignWithMargins: WordBool read Get_AlignWithMargins write Set_AlignWithMargins;
    property BgColor: OLE_COLOR read Get_BgColor write Set_BgColor;
    property LabelColor: OLE_COLOR read Get_LabelColor write Set_LabelColor;
    property LabelVisible: WordBool read Get_LabelVisible write Set_LabelVisible;
    property SeriesListCount: Integer read Get_SeriesListCount;
    property SeriesList[AIdx: Integer]: IrsSeriesList read Get_SeriesList;
  end;

// *********************************************************************//
// DispIntf:  IrsActiveDataXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2BB11364-34E7-4A90-A06A-0A68D700A9F1}
// *********************************************************************//
  IrsActiveDataXDisp = dispinterface
    ['{2BB11364-34E7-4A90-A06A-0A68D700A9F1}']
    property Visible: WordBool dispid 201;
    property AutoScroll: WordBool dispid 202;
    property AutoSize: WordBool dispid 203;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 204;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property Font: IFontDisp dispid -512;
    property KeyPreview: WordBool dispid 205;
    property PixelsPerInch: Integer dispid 206;
    property PrintScale: TxPrintScale dispid 207;
    property Scaled: WordBool dispid 208;
    property Active: WordBool readonly dispid 209;
    property DropTarget: WordBool dispid 210;
    property HelpFile: WideString dispid 211;
    property PopupMode: TxPopupMode dispid 212;
    property ScreenSnap: WordBool dispid 213;
    property SnapBuffer: Integer dispid 214;
    property DockSite: WordBool dispid 215;
    property DoubleBuffered: WordBool dispid 216;
    property AlignDisabled: WordBool readonly dispid 217;
    property MouseInClient: WordBool readonly dispid 218;
    property VisibleDockClientCount: Integer readonly dispid 219;
    property UseDockManager: WordBool dispid 220;
    property Enabled: WordBool dispid -514;
    property ExplicitLeft: Integer readonly dispid 221;
    property ExplicitTop: Integer readonly dispid 222;
    property ExplicitWidth: Integer readonly dispid 223;
    property ExplicitHeight: Integer readonly dispid 224;
    property AlignWithMargins: WordBool dispid 225;
    property BgColor: OLE_COLOR dispid 512;
    property LabelColor: OLE_COLOR dispid 513;
    property LabelVisible: WordBool dispid 514;
    procedure CreateChart; dispid 544;
    procedure SavePictureToFile(const AFile: WideString; var AFormat: TFileFormat); dispid 545;
    procedure SavePictureToStream(const AStream: IUnknown; var AFormat: TFileFormat); dispid 546;
    function AddSeriesList: IrsSeriesList; dispid 549;
    procedure ClearSeriesList; dispid 550;
    procedure DeleteSeriesList(AIdx: Integer); dispid 551;
    property SeriesListCount: Integer readonly dispid 552;
    property SeriesList[AIdx: Integer]: IrsSeriesList readonly dispid 553;
    function IndexOf(const ASeries: IrsSeriesList): Integer; dispid 554;
    procedure EnableValidSeries; dispid 555;
    function Get_Palette: IrsLevelPalette; dispid 556;
    procedure Set_Palette(const APalette: IrsLevelPalette); dispid 557;
    function Get_Limits: IrsLimits2; dispid 558;
    procedure Set_Limits(const ALimits: IrsLimits2); dispid 559;
  end;

// *********************************************************************//
// Interface: IrsActiveDataX2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F758BA93-93FA-4ACE-9236-845C044CB60D}
// *********************************************************************//
  IrsActiveDataX2 = interface(IrsActiveDataX)
    ['{F758BA93-93FA-4ACE-9236-845C044CB60D}']
    function Get_Height: Integer; safecall;
    procedure Set_Height(AValue: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(AValue: Integer); safecall;
    function Get_TextColor: OLE_COLOR; safecall;
    procedure Set_TextColor(AValue: OLE_COLOR); safecall;
    function Get_Param(const AName: WideString): OleVariant; safecall;
    procedure Set_Param(const AName: WideString; AValue: OleVariant); safecall;
    function Get_MarkerList: IrsADXInterfacedList; safecall;
    function Get_LicenceList: IrsADXLicenceList; safecall;
    function Get_PropertyMarker: IrsADXPrpMarker; safecall;
    procedure DeleteMarkers(AFlags: TMarkerFlag); safecall;
    procedure Set_Scale(AXCoef: Double; AYCoef: Double); safecall;
    procedure Set_DeltaScale(AXCoef: Double; AYCoef: Double); safecall;
    function BeginPaint: OleVariant; safecall;
    procedure EndPaint(AVal: OleVariant); safecall;
    property Height: Integer read Get_Height write Set_Height;
    property Width: Integer read Get_Width write Set_Width;
    property TextColor: OLE_COLOR read Get_TextColor write Set_TextColor;
    property Param[const AName: WideString]: OleVariant read Get_Param write Set_Param;
    property MarkerList: IrsADXInterfacedList read Get_MarkerList;
    property LicenceList: IrsADXLicenceList read Get_LicenceList;
    property PropertyMarker: IrsADXPrpMarker read Get_PropertyMarker;
  end;

// *********************************************************************//
// DispIntf:  IrsActiveDataX2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F758BA93-93FA-4ACE-9236-845C044CB60D}
// *********************************************************************//
  IrsActiveDataX2Disp = dispinterface
    ['{F758BA93-93FA-4ACE-9236-845C044CB60D}']
    property Height: Integer dispid 768;
    property Width: Integer dispid 769;
    property TextColor: OLE_COLOR dispid 770;
    property Param[const AName: WideString]: OleVariant dispid 771;
    property MarkerList: IrsADXInterfacedList readonly dispid 772;
    property LicenceList: IrsADXLicenceList readonly dispid 773;
    property PropertyMarker: IrsADXPrpMarker readonly dispid 774;
    procedure DeleteMarkers(AFlags: TMarkerFlag); dispid 775;
    procedure Set_Scale(AXCoef: Double; AYCoef: Double); dispid 776;
    procedure Set_DeltaScale(AXCoef: Double; AYCoef: Double); dispid 777;
    function BeginPaint: OleVariant; dispid 778;
    procedure EndPaint(AVal: OleVariant); dispid 779;
    property Visible: WordBool dispid 201;
    property AutoScroll: WordBool dispid 202;
    property AutoSize: WordBool dispid 203;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 204;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property Font: IFontDisp dispid -512;
    property KeyPreview: WordBool dispid 205;
    property PixelsPerInch: Integer dispid 206;
    property PrintScale: TxPrintScale dispid 207;
    property Scaled: WordBool dispid 208;
    property Active: WordBool readonly dispid 209;
    property DropTarget: WordBool dispid 210;
    property HelpFile: WideString dispid 211;
    property PopupMode: TxPopupMode dispid 212;
    property ScreenSnap: WordBool dispid 213;
    property SnapBuffer: Integer dispid 214;
    property DockSite: WordBool dispid 215;
    property DoubleBuffered: WordBool dispid 216;
    property AlignDisabled: WordBool readonly dispid 217;
    property MouseInClient: WordBool readonly dispid 218;
    property VisibleDockClientCount: Integer readonly dispid 219;
    property UseDockManager: WordBool dispid 220;
    property Enabled: WordBool dispid -514;
    property ExplicitLeft: Integer readonly dispid 221;
    property ExplicitTop: Integer readonly dispid 222;
    property ExplicitWidth: Integer readonly dispid 223;
    property ExplicitHeight: Integer readonly dispid 224;
    property AlignWithMargins: WordBool dispid 225;
    property BgColor: OLE_COLOR dispid 512;
    property LabelColor: OLE_COLOR dispid 513;
    property LabelVisible: WordBool dispid 514;
    procedure CreateChart; dispid 544;
    procedure SavePictureToFile(const AFile: WideString; var AFormat: TFileFormat); dispid 545;
    procedure SavePictureToStream(const AStream: IUnknown; var AFormat: TFileFormat); dispid 546;
    function AddSeriesList: IrsSeriesList; dispid 549;
    procedure ClearSeriesList; dispid 550;
    procedure DeleteSeriesList(AIdx: Integer); dispid 551;
    property SeriesListCount: Integer readonly dispid 552;
    property SeriesList[AIdx: Integer]: IrsSeriesList readonly dispid 553;
    function IndexOf(const ASeries: IrsSeriesList): Integer; dispid 554;
    procedure EnableValidSeries; dispid 555;
    function Get_Palette: IrsLevelPalette; dispid 556;
    procedure Set_Palette(const APalette: IrsLevelPalette); dispid 557;
    function Get_Limits: IrsLimits2; dispid 558;
    procedure Set_Limits(const ALimits: IrsLimits2); dispid 559;
  end;

// *********************************************************************//
// Interface: IrsSeriesList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E9811BBC-D1C6-4DA3-BDAF-D6A3FC983F58}
// *********************************************************************//
  IrsSeriesList = interface(IDispatch)
    ['{E9811BBC-D1C6-4DA3-BDAF-D6A3FC983F58}']
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(AOut: WordBool); safecall;
    function Get_PrpSeriesCount: Integer; safecall;
    function Get_PrpSeries(AIdx: Integer): IrsPropertySeries; safecall;
    function AddSeries(AGUID: TGUID): IrsUserPropertySeries; safecall;
    procedure LoadBase64WithHdr(const AGUID: WideString; const AHeader: WideString; 
                                const AData: WideString); safecall;
    procedure LoadData(AGUID: TGUID; const AHeader: IUnknown; const AData: IUnknown); safecall;
    procedure EnableValidProperties; safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property PrpSeriesCount: Integer read Get_PrpSeriesCount;
    property PrpSeries[AIdx: Integer]: IrsPropertySeries read Get_PrpSeries;
  end;

// *********************************************************************//
// DispIntf:  IrsSeriesListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E9811BBC-D1C6-4DA3-BDAF-D6A3FC983F58}
// *********************************************************************//
  IrsSeriesListDisp = dispinterface
    ['{E9811BBC-D1C6-4DA3-BDAF-D6A3FC983F58}']
    property Visible: WordBool dispid 101;
    property PrpSeriesCount: Integer readonly dispid 102;
    property PrpSeries[AIdx: Integer]: IrsPropertySeries readonly dispid 103;
    function AddSeries(AGUID: {NOT_OLEAUTO(TGUID)}OleVariant): IrsUserPropertySeries; dispid 104;
    procedure LoadBase64WithHdr(const AGUID: WideString; const AHeader: WideString; 
                                const AData: WideString); dispid 105;
    procedure LoadData(AGUID: {NOT_OLEAUTO(TGUID)}OleVariant; const AHeader: IUnknown; 
                       const AData: IUnknown); dispid 106;
    procedure EnableValidProperties; dispid 107;
  end;

// *********************************************************************//
// Interface: IrsPropertySeries
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6190410D-DD6A-4103-8D66-A3B06D0252CE}
// *********************************************************************//
  IrsPropertySeries = interface(IDispatch)
    ['{6190410D-DD6A-4103-8D66-A3B06D0252CE}']
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(AOut: OLE_COLOR); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(AOut: WordBool); safecall;
    function Get_PrpGUID: TGUID; safecall;
    function Get_PrpGUIDStr: WideString; safecall;
    function Get_PrpName: WideString; safecall;
    function Get_PrpDesc: WideString; safecall;
    procedure Set_PrpDesc(const AOut: WideString); safecall;
    function Get_Values: IUnknown; safecall;
    function Get_UseGradientFill: WordBool; safecall;
    procedure Set_UseGradientFill(AOut: WordBool); safecall;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property PrpGUID: TGUID read Get_PrpGUID;
    property PrpGUIDStr: WideString read Get_PrpGUIDStr;
    property PrpName: WideString read Get_PrpName;
    property PrpDesc: WideString read Get_PrpDesc write Set_PrpDesc;
    property Values: IUnknown read Get_Values;
    property UseGradientFill: WordBool read Get_UseGradientFill write Set_UseGradientFill;
  end;

// *********************************************************************//
// DispIntf:  IrsPropertySeriesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6190410D-DD6A-4103-8D66-A3B06D0252CE}
// *********************************************************************//
  IrsPropertySeriesDisp = dispinterface
    ['{6190410D-DD6A-4103-8D66-A3B06D0252CE}']
    property Color: OLE_COLOR dispid 100;
    property Visible: WordBool dispid 101;
    property PrpGUID: {NOT_OLEAUTO(TGUID)}OleVariant readonly dispid 102;
    property PrpGUIDStr: WideString readonly dispid 103;
    property PrpName: WideString readonly dispid 104;
    property PrpDesc: WideString dispid 105;
    property Values: IUnknown readonly dispid 106;
    property UseGradientFill: WordBool dispid 107;
  end;

// *********************************************************************//
// Interface: IrsUserPropertySeries
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FC8BAA48-9128-42E7-8D3F-EE3E670E9E31}
// *********************************************************************//
  IrsUserPropertySeries = interface(IrsPropertySeries)
    ['{FC8BAA48-9128-42E7-8D3F-EE3E670E9E31}']
    function Get_Values_: IUnknown; safecall;
    procedure Set_Values(const AOut: IUnknown); safecall;
    property Values_: IUnknown read Get_Values_ write Set_Values;
  end;

// *********************************************************************//
// DispIntf:  IrsUserPropertySeriesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FC8BAA48-9128-42E7-8D3F-EE3E670E9E31}
// *********************************************************************//
  IrsUserPropertySeriesDisp = dispinterface
    ['{FC8BAA48-9128-42E7-8D3F-EE3E670E9E31}']
    property Values_: IUnknown dispid 200;
    property Color: OLE_COLOR dispid 100;
    property Visible: WordBool dispid 101;
    property PrpGUID: {NOT_OLEAUTO(TGUID)}OleVariant readonly dispid 102;
    property PrpGUIDStr: WideString readonly dispid 103;
    property PrpName: WideString readonly dispid 104;
    property PrpDesc: WideString dispid 105;
    property Values: IUnknown readonly dispid 106;
    property UseGradientFill: WordBool dispid 107;
  end;

// *********************************************************************//
// Interface: IrsLevelPalette
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CE64766F-E275-4B8E-9A9E-872B446593E0}
// *********************************************************************//
  IrsLevelPalette = interface(IDispatch)
    ['{CE64766F-E275-4B8E-9A9E-872B446593E0}']
    function Get_Count: Integer; safecall;
    procedure Get_Item(AIdx: Integer; out AValue: Double; out AColor: OLE_COLOR); safecall;
    procedure Set_Item(AIdx: Integer; AValue: Double; AColor: OLE_COLOR); safecall;
    function AddItem(AValue: Double; AColor: OLE_COLOR): Integer; safecall;
    procedure InsertItem(AIdx: Integer; AValue: Double; AColor: OLE_COLOR); safecall;
    procedure DeleteItem(AIdx: Integer); safecall;
    procedure Clear; safecall;
    procedure Sort; safecall;
    function Get_ColorByValue(AValue: Double): OLE_COLOR; safecall;
    function Get_NullColor: OLE_COLOR; safecall;
    procedure Set_NullColor(AColor: OLE_COLOR); safecall;
  end;

// *********************************************************************//
// DispIntf:  IrsLevelPaletteDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CE64766F-E275-4B8E-9A9E-872B446593E0}
// *********************************************************************//
  IrsLevelPaletteDisp = dispinterface
    ['{CE64766F-E275-4B8E-9A9E-872B446593E0}']
    function Get_Count: Integer; dispid 256;
    procedure Get_Item(AIdx: Integer; out AValue: Double; out AColor: OLE_COLOR); dispid 257;
    procedure Set_Item(AIdx: Integer; AValue: Double; AColor: OLE_COLOR); dispid 258;
    function AddItem(AValue: Double; AColor: OLE_COLOR): Integer; dispid 259;
    procedure InsertItem(AIdx: Integer; AValue: Double; AColor: OLE_COLOR); dispid 260;
    procedure DeleteItem(AIdx: Integer); dispid 261;
    procedure Clear; dispid 262;
    procedure Sort; dispid 263;
    function Get_ColorByValue(AValue: Double): OLE_COLOR; dispid 264;
    function Get_NullColor: OLE_COLOR; dispid 265;
    procedure Set_NullColor(AColor: OLE_COLOR); dispid 272;
  end;

// *********************************************************************//
// Interface: IrsADXCustomList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {92F75DB3-038F-4741-B8DD-5F5C3C5D0922}
// *********************************************************************//
  IrsADXCustomList = interface(IDispatch)
    ['{92F75DB3-038F-4741-B8DD-5F5C3C5D0922}']
    function Get_Item(AIdx: Integer): OleVariant; safecall;
    procedure Set_Item(AIdx: Integer; AValue: OleVariant); safecall;
    function AddItem(AValue: OleVariant): Integer; safecall;
    procedure InsertItem(AIdx: Integer; AValue: OleVariant); safecall;
    procedure DeleteItem(AIdx: Integer); safecall;
    procedure Clear; safecall;
    procedure Sort; safecall;
    function IndexOf(AValue: OleVariant): Integer; safecall;
    function Get_Sorted: WordBool; safecall;
    procedure Set_Sorted(AValue: WordBool); safecall;
    function Get_Count: Integer; safecall;
    function Get_Compare: IrsADXCompare; safecall;
    procedure Set_Compare(const AOut: IrsADXCompare); safecall;
    property Item[AIdx: Integer]: OleVariant read Get_Item write Set_Item;
    property Sorted: WordBool read Get_Sorted write Set_Sorted;
    property Count: Integer read Get_Count;
    property Compare: IrsADXCompare read Get_Compare write Set_Compare;
  end;

// *********************************************************************//
// DispIntf:  IrsADXCustomListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {92F75DB3-038F-4741-B8DD-5F5C3C5D0922}
// *********************************************************************//
  IrsADXCustomListDisp = dispinterface
    ['{92F75DB3-038F-4741-B8DD-5F5C3C5D0922}']
    property Item[AIdx: Integer]: OleVariant dispid 4097;
    function AddItem(AValue: OleVariant): Integer; dispid 4098;
    procedure InsertItem(AIdx: Integer; AValue: OleVariant); dispid 4099;
    procedure DeleteItem(AIdx: Integer); dispid 4100;
    procedure Clear; dispid 4101;
    procedure Sort; dispid 4102;
    function IndexOf(AValue: OleVariant): Integer; dispid 4103;
    property Sorted: WordBool dispid 4104;
    property Count: Integer readonly dispid 4105;
    property Compare: IrsADXCompare dispid 4106;
  end;

// *********************************************************************//
// Interface: IrsADXInterfacedList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E7547563-65CD-4D33-83BE-0496A1F46494}
// *********************************************************************//
  IrsADXInterfacedList = interface(IrsADXCustomList)
    ['{E7547563-65CD-4D33-83BE-0496A1F46494}']
    function AddIntf: IUnknown; safecall;
    function InsertIntf(AIdx: Integer): IUnknown; safecall;
  end;

// *********************************************************************//
// DispIntf:  IrsADXInterfacedListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E7547563-65CD-4D33-83BE-0496A1F46494}
// *********************************************************************//
  IrsADXInterfacedListDisp = dispinterface
    ['{E7547563-65CD-4D33-83BE-0496A1F46494}']
    function AddIntf: IUnknown; dispid 4352;
    function InsertIntf(AIdx: Integer): IUnknown; dispid 4353;
    property Item[AIdx: Integer]: OleVariant dispid 4097;
    function AddItem(AValue: OleVariant): Integer; dispid 4098;
    procedure InsertItem(AIdx: Integer; AValue: OleVariant); dispid 4099;
    procedure DeleteItem(AIdx: Integer); dispid 4100;
    procedure Clear; dispid 4101;
    procedure Sort; dispid 4102;
    function IndexOf(AValue: OleVariant): Integer; dispid 4103;
    property Sorted: WordBool dispid 4104;
    property Count: Integer readonly dispid 4105;
    property Compare: IrsADXCompare dispid 4106;
  end;

// *********************************************************************//
// Interface: IrsADXCompare
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D44B5464-27CA-48BD-9098-493317AE0E13}
// *********************************************************************//
  IrsADXCompare = interface(IDispatch)
    ['{D44B5464-27CA-48BD-9098-493317AE0E13}']
    procedure Compare(AItem1: OleVariant; AItem2: OleVariant; out AOut: SYSINT); safecall;
  end;

// *********************************************************************//
// DispIntf:  IrsADXCompareDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D44B5464-27CA-48BD-9098-493317AE0E13}
// *********************************************************************//
  IrsADXCompareDisp = dispinterface
    ['{D44B5464-27CA-48BD-9098-493317AE0E13}']
    procedure Compare(AItem1: OleVariant; AItem2: OleVariant; out AOut: SYSINT); dispid 4096;
  end;

// *********************************************************************//
// Interface: IrsADXLicenceList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C03B1D8C-B096-4F46-8198-DD6F282EBB4B}
// *********************************************************************//
  IrsADXLicenceList = interface(IrsADXInterfacedList)
    ['{C03B1D8C-B096-4F46-8198-DD6F282EBB4B}']
    function GetLicenceListByFreq(ADim: TFreqDim; AValue: OleVariant): IrsADXLicenceList; safecall;
    procedure SelectById(const AValue: IrsADXID); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(AValue: WordBool); safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
  end;

// *********************************************************************//
// DispIntf:  IrsADXLicenceListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C03B1D8C-B096-4F46-8198-DD6F282EBB4B}
// *********************************************************************//
  IrsADXLicenceListDisp = dispinterface
    ['{C03B1D8C-B096-4F46-8198-DD6F282EBB4B}']
    function GetLicenceListByFreq(ADim: TFreqDim; AValue: OleVariant): IrsADXLicenceList; dispid 4608;
    procedure SelectById(const AValue: IrsADXID); dispid 4609;
    property Visible: WordBool dispid 4610;
    function AddIntf: IUnknown; dispid 4352;
    function InsertIntf(AIdx: Integer): IUnknown; dispid 4353;
    property Item[AIdx: Integer]: OleVariant dispid 4097;
    function AddItem(AValue: OleVariant): Integer; dispid 4098;
    procedure InsertItem(AIdx: Integer; AValue: OleVariant); dispid 4099;
    procedure DeleteItem(AIdx: Integer); dispid 4100;
    procedure Clear; dispid 4101;
    procedure Sort; dispid 4102;
    function IndexOf(AValue: OleVariant): Integer; dispid 4103;
    property Sorted: WordBool dispid 4104;
    property Count: Integer readonly dispid 4105;
    property Compare: IrsADXCompare dispid 4106;
  end;

// *********************************************************************//
// Interface: IrsADXCustomMarker
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D8F262FE-2416-483C-8A65-39E7B2E769CD}
// *********************************************************************//
  IrsADXCustomMarker = interface(IDispatch)
    ['{D8F262FE-2416-483C-8A65-39E7B2E769CD}']
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(AValue: OLE_COLOR); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(AValue: WordBool); safecall;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Visible: WordBool read Get_Visible write Set_Visible;
  end;

// *********************************************************************//
// DispIntf:  IrsADXCustomMarkerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D8F262FE-2416-483C-8A65-39E7B2E769CD}
// *********************************************************************//
  IrsADXCustomMarkerDisp = dispinterface
    ['{D8F262FE-2416-483C-8A65-39E7B2E769CD}']
    property Color: OLE_COLOR dispid 256;
    property Visible: WordBool dispid 258;
  end;

// *********************************************************************//
// Interface: IrsADXMarker
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CB7BFB1B-F25C-4C28-99F7-6204169DA4D3}
// *********************************************************************//
  IrsADXMarker = interface(IrsADXCustomMarker)
    ['{CB7BFB1B-F25C-4C28-99F7-6204169DA4D3}']
    procedure Get_XPos(out ADimKind: TDimensionKind; out ADim: LongWord; var AOut: OleVariant); safecall;
    procedure Set_XPos(ADimKind: TDimensionKind; ADim: LongWord; AValue: OleVariant); safecall;
    procedure Get_YPos(out ADimKind: TDimensionKind; out ADim: LongWord; var AOut: OleVariant); safecall;
    procedure Set_YPos(ADimKind: TDimensionKind; ADim: LongWord; AValue: OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  IrsADXMarkerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CB7BFB1B-F25C-4C28-99F7-6204169DA4D3}
// *********************************************************************//
  IrsADXMarkerDisp = dispinterface
    ['{CB7BFB1B-F25C-4C28-99F7-6204169DA4D3}']
    procedure Get_XPos(out ADimKind: TDimensionKind; out ADim: LongWord; var AOut: OleVariant); dispid 512;
    procedure Set_XPos(ADimKind: TDimensionKind; ADim: LongWord; AValue: OleVariant); dispid 513;
    procedure Get_YPos(out ADimKind: TDimensionKind; out ADim: LongWord; var AOut: OleVariant); dispid 514;
    procedure Set_YPos(ADimKind: TDimensionKind; ADim: LongWord; AValue: OleVariant); dispid 515;
    property Color: OLE_COLOR dispid 256;
    property Visible: WordBool dispid 258;
  end;

// *********************************************************************//
// Interface: IrsADXPrpMarker
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {02651DE5-2F42-48DB-B454-269F0DE3BCE0}
// *********************************************************************//
  IrsADXPrpMarker = interface(IrsADXMarker)
    ['{02651DE5-2F42-48DB-B454-269F0DE3BCE0}']
    function Get_Alignment: WordBool; safecall;
    procedure Set_Alignment(AOut: WordBool); safecall;
    procedure DoAlign; safecall;
    property Alignment: WordBool read Get_Alignment write Set_Alignment;
  end;

// *********************************************************************//
// DispIntf:  IrsADXPrpMarkerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {02651DE5-2F42-48DB-B454-269F0DE3BCE0}
// *********************************************************************//
  IrsADXPrpMarkerDisp = dispinterface
    ['{02651DE5-2F42-48DB-B454-269F0DE3BCE0}']
    property Alignment: WordBool dispid 528;
    procedure DoAlign; dispid 529;
    procedure Get_XPos(out ADimKind: TDimensionKind; out ADim: LongWord; var AOut: OleVariant); dispid 512;
    procedure Set_XPos(ADimKind: TDimensionKind; ADim: LongWord; AValue: OleVariant); dispid 513;
    procedure Get_YPos(out ADimKind: TDimensionKind; out ADim: LongWord; var AOut: OleVariant); dispid 514;
    procedure Set_YPos(ADimKind: TDimensionKind; ADim: LongWord; AValue: OleVariant); dispid 515;
    property Color: OLE_COLOR dispid 256;
    property Visible: WordBool dispid 258;
  end;

// *********************************************************************//
// Interface: IrsPropertySeries2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9E98D2ED-A388-443B-B24A-CAAB158AE8AF}
// *********************************************************************//
  IrsPropertySeries2 = interface(IrsPropertySeries)
    ['{9E98D2ED-A388-443B-B24A-CAAB158AE8AF}']
    function Get_GroupID: Integer; safecall;
    property GroupID: Integer read Get_GroupID;
  end;

// *********************************************************************//
// DispIntf:  IrsPropertySeries2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9E98D2ED-A388-443B-B24A-CAAB158AE8AF}
// *********************************************************************//
  IrsPropertySeries2Disp = dispinterface
    ['{9E98D2ED-A388-443B-B24A-CAAB158AE8AF}']
    property GroupID: Integer readonly dispid 110;
    property Color: OLE_COLOR dispid 100;
    property Visible: WordBool dispid 101;
    property PrpGUID: {NOT_OLEAUTO(TGUID)}OleVariant readonly dispid 102;
    property PrpGUIDStr: WideString readonly dispid 103;
    property PrpName: WideString readonly dispid 104;
    property PrpDesc: WideString dispid 105;
    property Values: IUnknown readonly dispid 106;
    property UseGradientFill: WordBool dispid 107;
  end;

// *********************************************************************//
// Interface: IrsADXLoadSaveSupport
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3E1A1FAC-72E7-454D-BD03-42B96B524E9A}
// *********************************************************************//
  IrsADXLoadSaveSupport = interface(IDispatch)
    ['{3E1A1FAC-72E7-454D-BD03-42B96B524E9A}']
    procedure LoadData(const AStream: IStream); safecall;
    procedure SaveData(var AStream: IStream); safecall;
  end;

// *********************************************************************//
// DispIntf:  IrsADXLoadSaveSupportDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3E1A1FAC-72E7-454D-BD03-42B96B524E9A}
// *********************************************************************//
  IrsADXLoadSaveSupportDisp = dispinterface
    ['{3E1A1FAC-72E7-454D-BD03-42B96B524E9A}']
    procedure LoadData(const AStream: IStream); dispid 268435457;
    procedure SaveData(var AStream: IStream); dispid 268500994;
  end;

// *********************************************************************//
// Interface: IrsADXParamSupport
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2F2D00EA-DD3F-42D7-B978-0572C1DA6A45}
// *********************************************************************//
  IrsADXParamSupport = interface(IDispatch)
    ['{2F2D00EA-DD3F-42D7-B978-0572C1DA6A45}']
    function Get_Param(const AName: WideString): OleVariant; safecall;
    procedure Set_Param(const AName: WideString; AValue: OleVariant); safecall;
    property Param[const AName: WideString]: OleVariant read Get_Param write Set_Param;
  end;

// *********************************************************************//
// DispIntf:  IrsADXParamSupportDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2F2D00EA-DD3F-42D7-B978-0572C1DA6A45}
// *********************************************************************//
  IrsADXParamSupportDisp = dispinterface
    ['{2F2D00EA-DD3F-42D7-B978-0572C1DA6A45}']
    property Param[const AName: WideString]: OleVariant dispid 268435473;
  end;

// *********************************************************************//
// Interface: IrsADXUserDefMarker
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F5212A8C-868C-4B8B-B927-BD8EA147C448}
// *********************************************************************//
  IrsADXUserDefMarker = interface(IrsADXMarker)
    ['{F5212A8C-868C-4B8B-B927-BD8EA147C448}']
    function Get_IsPermanent: WordBool; safecall;
    procedure Set_IsPermanent(AOut: WordBool); safecall;
    property IsPermanent: WordBool read Get_IsPermanent write Set_IsPermanent;
  end;

// *********************************************************************//
// DispIntf:  IrsADXUserDefMarkerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F5212A8C-868C-4B8B-B927-BD8EA147C448}
// *********************************************************************//
  IrsADXUserDefMarkerDisp = dispinterface
    ['{F5212A8C-868C-4B8B-B927-BD8EA147C448}']
    property IsPermanent: WordBool dispid 528;
    procedure Get_XPos(out ADimKind: TDimensionKind; out ADim: LongWord; var AOut: OleVariant); dispid 512;
    procedure Set_XPos(ADimKind: TDimensionKind; ADim: LongWord; AValue: OleVariant); dispid 513;
    procedure Get_YPos(out ADimKind: TDimensionKind; out ADim: LongWord; var AOut: OleVariant); dispid 514;
    procedure Set_YPos(ADimKind: TDimensionKind; ADim: LongWord; AValue: OleVariant); dispid 515;
    property Color: OLE_COLOR dispid 256;
    property Visible: WordBool dispid 258;
  end;

// *********************************************************************//
// Interface: IrsADXUserDefMarker2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {840223C7-88EB-43C7-9F84-86C11B6B32C1}
// *********************************************************************//
  IrsADXUserDefMarker2 = interface(IrsADXUserDefMarker)
    ['{840223C7-88EB-43C7-9F84-86C11B6B32C1}']
    function Get_XAlign: TMarkerAlign; safecall;
    procedure Set_XAlign(AOut: TMarkerAlign); safecall;
    function Get_YAlign: TMarkerAlign; safecall;
    procedure Set_YAlign(AOut: TMarkerAlign); safecall;
    function Get_XTitle: WideString; safecall;
    procedure Set_XTitle(const AOut: WideString); safecall;
    function Get_YTitle: WideString; safecall;
    procedure Set_YTitle(const AOut: WideString); safecall;
    property XAlign: TMarkerAlign read Get_XAlign write Set_XAlign;
    property YAlign: TMarkerAlign read Get_YAlign write Set_YAlign;
    property XTitle: WideString read Get_XTitle write Set_XTitle;
    property YTitle: WideString read Get_YTitle write Set_YTitle;
  end;

// *********************************************************************//
// DispIntf:  IrsADXUserDefMarker2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {840223C7-88EB-43C7-9F84-86C11B6B32C1}
// *********************************************************************//
  IrsADXUserDefMarker2Disp = dispinterface
    ['{840223C7-88EB-43C7-9F84-86C11B6B32C1}']
    property XAlign: {NOT_OLEAUTO(TMarkerAlign)}OleVariant dispid 544;
    property YAlign: {NOT_OLEAUTO(TMarkerAlign)}OleVariant dispid 545;
    property XTitle: WideString dispid 546;
    property YTitle: WideString dispid 547;
    property IsPermanent: WordBool dispid 528;
    procedure Get_XPos(out ADimKind: TDimensionKind; out ADim: LongWord; var AOut: OleVariant); dispid 512;
    procedure Set_XPos(ADimKind: TDimensionKind; ADim: LongWord; AValue: OleVariant); dispid 513;
    procedure Get_YPos(out ADimKind: TDimensionKind; out ADim: LongWord; var AOut: OleVariant); dispid 514;
    procedure Set_YPos(ADimKind: TDimensionKind; ADim: LongWord; AValue: OleVariant); dispid 515;
    property Color: OLE_COLOR dispid 256;
    property Visible: WordBool dispid 258;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TrsActiveDataX_
// Help String      : rsActiveDataX Control
// Default Interface: IrsActiveDataX2
// Def. Intf. DISP? : No
// Event   Interface: IrsActiveDataXEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TrsActiveDataX_OnKeyPress = procedure(ASender: TObject; var Key: Smallint) of object;
  TrsActiveDataX_OnLicClick = procedure(ASender: TObject; const ALicense: IrsADXLicence2) of object;

  TrsActiveDataX_ = class(TOleControl)
  private
    FOnActivate: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnKeyPress: TrsActiveDataX_OnKeyPress;
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    FOnPaint: TNotifyEvent;
    FOnLicClick: TrsActiveDataX_OnLicClick;
    FIntf: IrsActiveDataX2;
    function  GetControlInterface: IrsActiveDataX2;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_SeriesList(AIdx: Integer): IrsSeriesList;
    function Get_Param(const AName: WideString): OleVariant;
    procedure Set_Param(const AName: WideString; AValue: OleVariant);
    function Get_MarkerList: IrsADXInterfacedList;
    function Get_LicenceList: IrsADXLicenceList;
    function Get_PropertyMarker: IrsADXPrpMarker;
  public
    procedure CreateChart;
    procedure SavePictureToFile(const AFile: WideString; var AFormat: TFileFormat);
    procedure SavePictureToStream(const AStream: IUnknown; var AFormat: TFileFormat);
    function AddSeriesList: IrsSeriesList;
    procedure ClearSeriesList;
    procedure DeleteSeriesList(AIdx: Integer);
    function IndexOf(const ASeries: IrsSeriesList): Integer;
    procedure EnableValidSeries;
    function Get_Palette: IrsLevelPalette;
    procedure Set_Palette(const APalette: IrsLevelPalette);
    function Get_Limits: IrsLimits2;
    procedure Set_Limits(const ALimits: IrsLimits2);
    procedure DeleteMarkers(AFlags: TMarkerFlag);
    procedure Set_Scale(AXCoef: Double; AYCoef: Double);
    procedure Set_DeltaScale(AXCoef: Double; AYCoef: Double);
    function BeginPaint: OleVariant;
    procedure EndPaint(AVal: OleVariant);
    property  ControlInterface: IrsActiveDataX2 read GetControlInterface;
    property  DefaultInterface: IrsActiveDataX2 read GetControlInterface;
    property Visible: WordBool index 201 read GetWordBoolProp write SetWordBoolProp;
    property Active: WordBool index 209 read GetWordBoolProp;
    property DropTarget: WordBool index 210 read GetWordBoolProp write SetWordBoolProp;
    property HelpFile: WideString index 211 read GetWideStringProp write SetWideStringProp;
    property PopupMode: TOleEnum index 212 read GetTOleEnumProp write SetTOleEnumProp;
    property ScreenSnap: WordBool index 213 read GetWordBoolProp write SetWordBoolProp;
    property SnapBuffer: Integer index 214 read GetIntegerProp write SetIntegerProp;
    property DockSite: WordBool index 215 read GetWordBoolProp write SetWordBoolProp;
    property DoubleBuffered: WordBool index 216 read GetWordBoolProp write SetWordBoolProp;
    property AlignDisabled: WordBool index 217 read GetWordBoolProp;
    property MouseInClient: WordBool index 218 read GetWordBoolProp;
    property VisibleDockClientCount: Integer index 219 read GetIntegerProp;
    property UseDockManager: WordBool index 220 read GetWordBoolProp write SetWordBoolProp;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp;
    property ExplicitLeft: Integer index 221 read GetIntegerProp;
    property ExplicitTop: Integer index 222 read GetIntegerProp;
    property ExplicitWidth: Integer index 223 read GetIntegerProp;
    property ExplicitHeight: Integer index 224 read GetIntegerProp;
    property BgColor: TColor index 512 read GetTColorProp write SetTColorProp;
    property SeriesListCount: Integer index 552 read GetIntegerProp;
    property SeriesList[AIdx: Integer]: IrsSeriesList read Get_SeriesList;
    property TextColor: TColor index 770 read GetTColorProp write SetTColorProp;
    property Param[const AName: WideString]: OleVariant read Get_Param write Set_Param;
    property MarkerList: IrsADXInterfacedList read Get_MarkerList;
    property LicenceList: IrsADXLicenceList read Get_LicenceList;
    property PropertyMarker: IrsADXPrpMarker read Get_PropertyMarker;
  published
    property Anchors;
    property  ParentColor;
    property  ParentFont;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property AutoScroll: WordBool index 202 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 203 read GetWordBoolProp write SetWordBoolProp stored False;
    property AxBorderStyle: TOleEnum index 204 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property KeyPreview: WordBool index 205 read GetWordBoolProp write SetWordBoolProp stored False;
    property PixelsPerInch: Integer index 206 read GetIntegerProp write SetIntegerProp stored False;
    property PrintScale: TOleEnum index 207 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Scaled: WordBool index 208 read GetWordBoolProp write SetWordBoolProp stored False;
    property AlignWithMargins: WordBool index 225 read GetWordBoolProp write SetWordBoolProp stored False;
    property LabelColor: TColor index 513 read GetTColorProp write SetTColorProp stored False;
    property LabelVisible: WordBool index 514 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyPress: TrsActiveDataX_OnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
    property OnLicClick: TrsActiveDataX_OnLicClick read FOnLicClick write FOnLicClick;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'Servers';

  dtlOcxPage = 'ActiveX';

implementation

uses System.Win.ComObj;

procedure TrsActiveDataX_.InitControlData;
const
  CEventDispIDs: array [0..10] of DWORD = (
    $000000C9, $000000CA, $000000CB, $000000CC, $000000CD, $000000CE,
    $000000CF, $000000D0, $000000D1, $000000D2, $000000D3);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData2 = (
    ClassID:      '{C8E237C6-8273-4917-8FD5-AF927463498B}';
    EventIID:     '{3B39A993-0004-4B48-8A3B-2C5E22B17C9B}';
    EventCount:   11;
    EventDispIDs: @CEventDispIDs;
    LicenseKey:   nil (*HR:$00000000*);
    Flags:        $0000001D;
    Version:      500;
    FontCount:    1;
    FontIDs:      @CTFontIDs);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := UIntPtr(@@FOnActivate) - UIntPtr(Self);
end;

procedure TrsActiveDataX_.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IrsActiveDataX2;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TrsActiveDataX_.GetControlInterface: IrsActiveDataX2;
begin
  CreateControl;
  Result := FIntf;
end;

function TrsActiveDataX_.Get_SeriesList(AIdx: Integer): IrsSeriesList;
begin
  Result := DefaultInterface.SeriesList[AIdx];
end;

function TrsActiveDataX_.Get_Param(const AName: WideString): OleVariant;
begin
  Result := DefaultInterface.Param[AName];
end;

procedure TrsActiveDataX_.Set_Param(const AName: WideString; AValue: OleVariant);
begin
  DefaultInterface.Param[AName] := AValue;
end;

function TrsActiveDataX_.Get_MarkerList: IrsADXInterfacedList;
begin
  Result := DefaultInterface.MarkerList;
end;

function TrsActiveDataX_.Get_LicenceList: IrsADXLicenceList;
begin
  Result := DefaultInterface.LicenceList;
end;

function TrsActiveDataX_.Get_PropertyMarker: IrsADXPrpMarker;
begin
  Result := DefaultInterface.PropertyMarker;
end;

procedure TrsActiveDataX_.CreateChart;
begin
  DefaultInterface.CreateChart;
end;

procedure TrsActiveDataX_.SavePictureToFile(const AFile: WideString; var AFormat: TFileFormat);
begin
  DefaultInterface.SavePictureToFile(AFile, AFormat);
end;

procedure TrsActiveDataX_.SavePictureToStream(const AStream: IUnknown; var AFormat: TFileFormat);
begin
  DefaultInterface.SavePictureToStream(AStream, AFormat);
end;

function TrsActiveDataX_.AddSeriesList: IrsSeriesList;
begin
  Result := DefaultInterface.AddSeriesList;
end;

procedure TrsActiveDataX_.ClearSeriesList;
begin
  DefaultInterface.ClearSeriesList;
end;

procedure TrsActiveDataX_.DeleteSeriesList(AIdx: Integer);
begin
  DefaultInterface.DeleteSeriesList(AIdx);
end;

function TrsActiveDataX_.IndexOf(const ASeries: IrsSeriesList): Integer;
begin
  Result := DefaultInterface.IndexOf(ASeries);
end;

procedure TrsActiveDataX_.EnableValidSeries;
begin
  DefaultInterface.EnableValidSeries;
end;

function TrsActiveDataX_.Get_Palette: IrsLevelPalette;
begin
  Result := DefaultInterface.Get_Palette;
end;

procedure TrsActiveDataX_.Set_Palette(const APalette: IrsLevelPalette);
begin
  DefaultInterface.Set_Palette(APalette);
end;

function TrsActiveDataX_.Get_Limits: IrsLimits2;
begin
  Result := DefaultInterface.Get_Limits;
end;

procedure TrsActiveDataX_.Set_Limits(const ALimits: IrsLimits2);
begin
  DefaultInterface.Set_Limits(ALimits);
end;

procedure TrsActiveDataX_.DeleteMarkers(AFlags: TMarkerFlag);
begin
  DefaultInterface.DeleteMarkers(AFlags);
end;

procedure TrsActiveDataX_.Set_Scale(AXCoef: Double; AYCoef: Double);
begin
  DefaultInterface.Set_Scale(AXCoef, AYCoef);
end;

procedure TrsActiveDataX_.Set_DeltaScale(AXCoef: Double; AYCoef: Double);
begin
  DefaultInterface.Set_DeltaScale(AXCoef, AYCoef);
end;

function TrsActiveDataX_.BeginPaint: OleVariant;
begin
  Result := DefaultInterface.BeginPaint;
end;

procedure TrsActiveDataX_.EndPaint(AVal: OleVariant);
begin
  DefaultInterface.EndPaint(AVal);
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TrsActiveDataX_]);
end;

end.
