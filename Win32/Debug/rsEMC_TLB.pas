unit rsEMC_TLB;

interface

uses
  Winapi.ActiveX;

const
  rsEMCMajorVersion = 1;
  rsEMCMinorVersion = 0;

  LIBID_rsEMC: TGUID = '{073DCFC8-9A65-49E0-858D-45D4A4BC7904}';

  // IID constants
  IID_IrsEMCAntenna: TGUID = '{554CFF64-EC3E-488E-8F63-0C3E3CB3C712}';
  IID_IrsFreqMaskList: TGUID = '{9C601EF2-0768-4C1B-BAB4-2D98E5DF39F0}';
  IID_IrsEMCRadioStation: TGUID = '{D43FAB7A-DC18-485E-A705-B13078C2EF48}';
  IID_IrsEMCTx: TGUID = '{803EA695-5831-4235-9859-7E6CCF39565B}';
  IID_IrsEMCRx: TGUID = '{D93509FF-E2D2-43DA-AE43-88D46A52B220}';
  IID_IrsEMCDBStation: TGUID = '{C7685B75-8CD4-41F1-B3A3-96662772B48C}';
  IID_IrsEMCCalcModeData: TGUID = '{DEF540FB-54D9-4404-B46E-7D61DCB691D8}';
  IID_IrsEMCEChart: TGUID = '{1D976C64-EAFF-495E-AC42-D6D0CF429048}';
  IID_IrsEMCEField: TGUID = '{EA46802E-359B-4B61-AF90-23E7D5329B69}';

// Enumerators
type
  TSeaTemperature = type TOleEnum;
const
  stNone = TSeaTemperature($00000000);
  stCold = TSeaTemperature($00000001);
  stWarm = TSeaTemperature($00000002);
  stBlackSea = TSeaTemperature($00000003);

type
  TPolarization = type TOleEnum;
const
  pNone = TPolarization($00000000);
  pVert = TPolarization($00000001);
  pHorz = TPolarization($00000002);

type
  TIsotropType = type TOleEnum;
const
  itNone = TIsotropType($00000000);
  itIsotropic = TIsotropType($00000001);
  itAnisotropic = TIsotropType($00000002);

type
  TMultiInterferense = type TOleEnum;
const
  miAdd = TMultiInterferense($00000000);
  miMultiply = TMultiInterferense($00000001);

type
  TGroundCover = type TOleEnum;
const
  gcNone = TGroundCover($00000000);
  gcRural = TGroundCover($00000001);
  gcOpenSuburban = TGroundCover($00000002);
  gcSuburban = TGroundCover($00000003);
  gcUrbanWooded = TGroundCover($00000004);
  gcDenseUrban = TGroundCover($00000005);

type
  TAntennaKind = type TOleEnum;
const
  akNone = TAntennaKind($00000000);
  akCollinear = TAntennaKind($00000001);
  akCollinearArray = TAntennaKind($00000002);
  akParabolic = TAntennaKind($00000003);

type
  TSignalKind = type TOleEnum;
const
  skService = TSignalKind($00000000);
  skInterference = TSignalKind($00000001);

type
  TRadioKind = type TOleEnum;
const
  rkBroadcast = TRadioKind($00000000);
  rkMobile = TRadioKind($00000001);

type
  TDigitalOrAnalogue = type TOleEnum;
const
  daNone = TDigitalOrAnalogue($00000000);
  daDigital = TDigitalOrAnalogue($00000001);
  daAnalogue = TDigitalOrAnalogue($00000002);

type
  TClearanceFlag = type TOleEnum;
const
  cfTx = TClearanceFlag($00000000);
  cfRx = TClearanceFlag($00000001);

type
  TStationFlag = type TOleEnum;
const
  sfTx = TStationFlag($00000001);
  sfRx = TStationFlag($00000002);
  sfMobile = TStationFlag($00000004);
  sfChecked = TStationFlag($00000008);
  sfTxIntermod = TStationFlag($00000010);

type
  TStrengthFormat = type TOleEnum;
const
  sfDBm = TStrengthFormat($00000000);
  sfDBW = TStrengthFormat($00000001);
  sfDBmcVm = TStrengthFormat($00000002);

type
  TEMCJobType = type TOleEnum;
const
  jtNo = TEMCJobType($00000001);
  jtSingleTrace = TEMCJobType($00000002);
  jtBlockage = TEMCJobType($00000004);
  jtMirror = TEMCJobType($00000008);
  jtHarmonic = TEMCJobType($00000010);
  jtIntermod = TEMCJobType($00000020);
  jtNear = TEMCJobType($00000040);
  jtEChart = TEMCJobType($00000080);
  jtPChart = TEMCJobType($00000100);
  jtBorderLine = TEMCJobType($00000200);
  jtBLIntraAzimuths = TEMCJobType($00000400);
  jtBLAzimuths = TEMCJobType($00000800);
  jtBLIntra = TEMCJobType($00001000);
  jtRoofTrace = TEMCJobType($00002000);

type
  TGeterodin = type TOleEnum;
const
  gdLowest = TGeterodin($FFFFFFFF);
  gdUndefined = TGeterodin($00000000);
  gdHighest = TGeterodin($00000001);

type
  TFarZoneCalcMode = type TOleEnum;
const
  cmFreeSpaceFlatEarth = TFarZoneCalcMode($00000000);
  cmHCM = TFarZoneCalcMode($00000001);
  cm1146 = TFarZoneCalcMode($00000002);
  cm1546 = TFarZoneCalcMode($00000003);
  cmHata = TFarZoneCalcMode($00000004);
  cmCost231Hata = TFarZoneCalcMode($00000005);
  cmCost231Wolfis = TFarZoneCalcMode($00000006);
  cmDeygout = TFarZoneCalcMode($00000007);

type
  TNearZoneCalcMode = type TOleEnum;
const
  cmOurSite = TNearZoneCalcMode($00000000);

type
  TEMCErrorCode = type TOleEnum;
const
  ecNone = TEMCErrorCode($00000000);
  ecUserTerminate = TEMCErrorCode($00000001);
  ecInvalidCalcMode = TEMCErrorCode($00000002);
  ecNotCalculated = TEMCErrorCode($00000003);
  ecNoRxInData = TEMCErrorCode($00000004);
  ecNoTxInData = TEMCErrorCode($00000005);
  ecTxCountFailed = TEMCErrorCode($00000006);
  ecAntennaHeight = TEMCErrorCode($00000007);
  ecTxAndRxInTheSamePoint = TEMCErrorCode($00000008);
  ecNoProfile = TEMCErrorCode($00000009);
  ecNoDistance = TEMCErrorCode($0000000A);
  ecNoMethodForFreq = TEMCErrorCode($0000000B);
  ecFreqNotInValidRange = TEMCErrorCode($0000000C);
  ecVeryLongDistance = TEMCErrorCode($0000000D);
  ecInvalidPolarization = TEMCErrorCode($0000000E);
  ecInvalidTimePercent = TEMCErrorCode($0000000F);
  ecInvalidAntennaKind = TEMCErrorCode($00000010);
  ecInvalidElevation = TEMCErrorCode($00000011);
  ecInvalidAzimuth = TEMCErrorCode($00000012);
  ecInvalidVienDNA = TEMCErrorCode($00000013);
  ecBandWidthInvalid = TEMCErrorCode($00000014);
  ecInvalidRSDataFormat = TEMCErrorCode($00000015);
  ecNoDistanceForChart = TEMCErrorCode($00000016);
  ecInvalidStrengthFormat = TEMCErrorCode($00000017);
  ecInvalidDeygoutGeometry = TEMCErrorCode($00000018);
  ecNoDll = TEMCErrorCode($00000019);
  ecBadDll = TEMCErrorCode($0000001A);

type
  // Interfaces forward declarations
  IrsEMCAntenna = interface;
  IrsFreqMaskList = interface;
  IrsEMCRadioStation = interface;
  IrsEMCTx = interface;
  IrsEMCRx = interface;
  IrsEMCDBStation = interface;
  IrsEMCCalcModeData = interface;
  IrsEMCEChart = interface;
  IrsEMCEField = interface;

type
  // Aliaces
  TAngle = type Double;
  TAntennaHorVertType = type WideString;
  TRealHeight = type Double;
  TStrength = type Double;
  TDistance = type Double;
  TFreq = type Double;
  TAzimuth = type TAngle;
  TPercent = type Byte;
  TPower = type Double;

type
  // Records
  T3DPoint = record
    X: Double;
    Y: Double;
    Z: Double;
  end;

  TSector = record
    Center: TGeoPoint;
    Radius: TDistance;
    Bisectrix: TAzimuth;
    Opening: TAzimuth;
  end;

  TFreqMaskPoint = record
    DF: TFreq;
    Level: TStrength;
  end;

type
  // Interfaces
  IrsEMCAntenna = interface(IUnknown)
    ['{554CFF64-EC3E-488E-8F63-0C3E3CB3C712}']
    function Get_Azimuth: TAngle; safecall;
    procedure Set_Azimuth(AVal: TAngle); safecall;
    function Get_HorType: TAntennaHorVertType; safecall;
    procedure Set_HorType(const AVal: TAntennaHorVertType); safecall;
    function Get_VertType: TAntennaHorVertType; safecall;
    procedure Set_VertType(const AVal: TAntennaHorVertType); safecall;
    function Get_Ele: TAngle; safecall;
    procedure Set_Ele(AVal: TAngle); safecall;
    function Get_Isotrop: TIsotropType; safecall;
    procedure Set_Isotrop(AVal: TIsotropType); safecall;
    function Get_Height: TRealHeight; safecall;
    procedure Set_Height(AVal: TRealHeight); safecall;
    function Get_Polarization: TPolarization; safecall;
    procedure Set_Polarization(AVal: TPolarization); safecall;
    function Get_Kind: TAntennaKind; safecall;
    procedure Set_Kind(AVal: TAntennaKind); safecall;
    function Get_L: TRealHeight; safecall;
    procedure Set_L(AVal: TRealHeight); safecall;
    function Get_Tetta: TAngle; safecall;
    procedure Set_Tetta(AVal: TAngle); safecall;
    function Get_Gain: TStrength; safecall;
    procedure Set_Gain(AVal: TStrength); safecall;
    function Get_DP: TStrength; safecall;
    procedure Set_DP(AVal: TStrength); safecall;
    function DirectionGain(APointAzimuth: TAngle; APointElevation: TAngle): TStrength; safecall;
    property Azimuth: TAngle read Get_Azimuth write Set_Azimuth;
    property HorType: TAntennaHorVertType read Get_HorType write Set_HorType;
    property VertType: TAntennaHorVertType read Get_VertType write Set_VertType;
    property Ele: TAngle read Get_Ele write Set_Ele;
    property Isotrop: TIsotropType read Get_Isotrop write Set_Isotrop;
    property Height: TRealHeight read Get_Height write Set_Height;
    property Polarization: TPolarization read Get_Polarization write Set_Polarization;
    property Kind: TAntennaKind read Get_Kind write Set_Kind;
    property L: TRealHeight read Get_L write Set_L;
    property Tetta: TAngle read Get_Tetta write Set_Tetta;
    property Gain: TStrength read Get_Gain write Set_Gain;
    property DP: TStrength read Get_DP write Set_DP;
  end;

  IrsFreqMaskList = interface(IUnknown)
    ['{9C601EF2-0768-4C1B-BAB4-2D98E5DF39F0}']
    function Get_Count: Integer; safecall;
    function Get_Items(AIdx: Integer): TFreqMaskPoint; safecall;
    procedure Add(AVal: TFreqMaskPoint); safecall;
    function OutOfMask(ADF: TFreq): WordBool; safecall;
    function Level(ADF: TFreq): TStrength; safecall;
    property Count: Integer read Get_Count;
    property Items[AIdx: Integer]: TFreqMaskPoint read Get_Items; default;
  end;

  IrsEMCRadioStation = interface(IUnknown)
    ['{D43FAB7A-DC18-485E-A705-B13078C2EF48}']
    function Get_Tag: OLE_HANDLE; safecall;
    procedure Set_Tag(AVal: OLE_HANDLE); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(AVal: OLE_COLOR); safecall;
    function Get_Flag: Cardinal; safecall;
    procedure Set_Flag(AVal: Cardinal); safecall;
    function Get_Id: Integer; safecall;
    procedure Set_Id(AVal: Integer); safecall;
    function Get_SectorId: Integer; safecall;
    procedure Set_SectorId(AVal: Integer); safecall;
    function Get_RoofId: Integer; safecall;
    procedure Set_RoofId(AVal: Integer); safecall;
    function Get_NetId: Integer; safecall;
    procedure Set_NetId(AVal: Integer); safecall;
    function Get_ClassSt: WideString; safecall;
    procedure Set_ClassSt(const AVal: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const AVal: WideString); safecall;
    function Get_System: WideString; safecall;
    procedure Set_System(const AVal: WideString); safecall;
    function Get_StandardID: Integer; safecall;
    procedure Set_StandardID(AVal: Integer); safecall;
    function Get_DuplexStandart: WordBool; safecall;
    procedure Set_DuplexStandart(AVal: WordBool); safecall;
    function Get_Place: TGeoPoint; safecall;
    procedure Set_Place(AVal: TGeoPoint); safecall;
    function Get_RoofPlace: T3DPoint; safecall;
    procedure Set_RoofPlace(AVal: T3DPoint); safecall;
    function Get_ServiceArea: TDistance; safecall;
    procedure Set_ServiceArea(AVal: TDistance); safecall;
    function Get_Freq: TFreq; safecall;
    procedure Set_Freq(AVal: TFreq); safecall;
    function Get_DFreq: TFreq; safecall;
    procedure Set_DFreq(AVal: TFreq); safecall;
    function Get_Radiation: WideString; safecall;
    procedure Set_Radiation(const AVal: WideString); safecall;
    function Get_PathAttenuation: TStrength; safecall;
    procedure Set_PathAttenuation(AVal: TStrength); safecall;
    function Get_Antenna: IrsEMCAntenna; safecall;
    procedure Precalculate(ACurFreq: TFreq); safecall;
    function EToU(AE: TStrength): TStrength; safecall;
    function UToE(AU: TStrength): TStrength; safecall;
    function IsMobile: WordBool; safecall;
    function ServiceZone: TSector; safecall;
    procedure LoadFromStream(const AStrm: IStream); safecall;
    procedure SaveToStream(const AStrm: IStream); safecall;
    function Get_FreqMask: IrsFreqMaskList; safecall;
    function Get_Filter: IrsFreqMaskList; safecall;
    property Tag: OLE_HANDLE read Get_Tag write Set_Tag;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Flag: Cardinal read Get_Flag write Set_Flag;
    property Id: Integer read Get_Id write Set_Id;
    property SectorId: Integer read Get_SectorId write Set_SectorId;
    property RoofId: Integer read Get_RoofId write Set_RoofId;
    property NetId: Integer read Get_NetId write Set_NetId;
    property ClassSt: WideString read Get_ClassSt write Set_ClassSt;
    property Name: WideString read Get_Name write Set_Name;
    property System: WideString read Get_System write Set_System;
    property StandardID: Integer read Get_StandardID write Set_StandardID;
    property DuplexStandart: WordBool read Get_DuplexStandart write Set_DuplexStandart;
    property Place: TGeoPoint read Get_Place write Set_Place;
    property RoofPlace: T3DPoint read Get_RoofPlace write Set_RoofPlace;
    property ServiceArea: TDistance read Get_ServiceArea write Set_ServiceArea;
    property Freq: TFreq read Get_Freq write Set_Freq;
    property DFreq: TFreq read Get_DFreq write Set_DFreq;
    property Radiation: WideString read Get_Radiation write Set_Radiation;
    property PathAttenuation: TStrength read Get_PathAttenuation write Set_PathAttenuation;
    property Antenna: IrsEMCAntenna read Get_Antenna;
    property FreqMask: IrsFreqMaskList read Get_FreqMask;
    property Filter: IrsFreqMaskList read Get_Filter;
  end;

  IrsEMCTx = interface(IrsEMCRadioStation)
    ['{803EA695-5831-4235-9859-7E6CCF39565B}']
    function Get_MaPo: TPower; safecall;
    procedure Set_MaPo(AVal: TPower); safecall;
    function Get_TimePercent: TPercent; safecall;
    procedure Set_TimePercent(AVal: TPercent); safecall;
    function Get_Lambda: Double; safecall;
    procedure Set_Lambda(AVal: Double); safecall;
    property MaPo: TPower read Get_MaPo write Set_MaPo;
    property TimePercent: TPercent read Get_TimePercent write Set_TimePercent;
    property Lambda: Double read Get_Lambda write Set_Lambda;
  end;

  IrsEMCRx = interface(IrsEMCRadioStation)
    ['{D93509FF-E2D2-43DA-AE43-88D46A52B220}']
    function Get_Selectivity: TStrength; safecall;
    procedure Set_Selectivity(AVal: TStrength); safecall;
    function Get_Protection: TStrength; safecall;
    procedure Set_Protection(AVal: TStrength); safecall;
    function Get_UHFBand: TFreq; safecall;
    procedure Set_UHFBand(AVal: TFreq); safecall;
    function Get_SelfIsolation: TStrength; safecall;
    procedure Set_SelfIsolation(AVal: TStrength); safecall;
    function Get_FreqInter: TFreq; safecall;
    procedure Set_FreqInter(AVal: TFreq); safecall;
    function Get_Geterodin: TGeterodin; safecall;
    procedure Set_Geterodin(AVal: TGeterodin); safecall;
    function Get_Blockage: TStrength; safecall;
    procedure Set_Blockage(AVal: TStrength); safecall;
    function Get_EMirror: TStrength; safecall;
    procedure Set_EMirror(AVal: TStrength); safecall;
    function Get_EIntermod: TStrength; safecall;
    procedure Set_EIntermod(AVal: TStrength); safecall;
    property Selectivity: TStrength read Get_Selectivity write Set_Selectivity;
    property Protection: TStrength read Get_Protection write Set_Protection;
    property UHFBand: TFreq read Get_UHFBand write Set_UHFBand;
    property SelfIsolation: TStrength read Get_SelfIsolation write Set_SelfIsolation;
    property FreqInter: TFreq read Get_FreqInter write Set_FreqInter;
    property Geterodin: TGeterodin read Get_Geterodin write Set_Geterodin;
    property Blockage: TStrength read Get_Blockage write Set_Blockage;
    property EMirror: TStrength read Get_EMirror write Set_EMirror;
    property EIntermod: TStrength read Get_EIntermod write Set_EIntermod;
  end;

  IrsEMCDBStation = interface(IUnknown)
    ['{C7685B75-8CD4-41F1-B3A3-96662772B48C}']
    procedure Precalculate; safecall;
    procedure LoadFromStream(const AVal: IStream); safecall;
    procedure SaveToStream(const AVal: IStream); safecall;
    function IsMobile: WordBool; safecall;
    function Get_Id: Integer; safecall;
    procedure Set_Id(AVal: Integer); safecall;
    function Get_SectorId: Integer; safecall;
    procedure Set_SectorId(AVal: Integer); safecall;
    function Get_RoofId: Integer; safecall;
    procedure Set_RoofId(AVal: Integer); safecall;
    function Get_NetId: Integer; safecall;
    procedure Set_NetId(AVal: Integer); safecall;
    function Get_VariantNumber: Integer; safecall;
    procedure Set_VariantNumber(AVal: Integer); safecall;
    function Get_TableName: WideString; safecall;
    procedure Set_TableName(const AVal: WideString); safecall;
    function Get_Country: WideString; safecall;
    procedure Set_Country(const AVal: WideString); safecall;
    function Get_System: WideString; safecall;
    procedure Set_System(const AVal: WideString); safecall;
    function Get_StandardID: Integer; safecall;
    procedure Set_StandardID(AVal: Integer); safecall;
    function Get_Owner: WideString; safecall;
    procedure Set_Owner(const AVal: WideString); safecall;
    function Get_Hint: WideString; safecall;
    procedure Set_Hint(const AVal: WideString); safecall;
    function Get_Tx: IrsEMCTx; safecall;
    function Get_Rx: IrsEMCRx; safecall;
    property Id: Integer read Get_Id write Set_Id;
    property SectorId: Integer read Get_SectorId write Set_SectorId;
    property RoofId: Integer read Get_RoofId write Set_RoofId;
    property NetId: Integer read Get_NetId write Set_NetId;
    property VariantNumber: Integer read Get_VariantNumber write Set_VariantNumber;
    property TableName: WideString read Get_TableName write Set_TableName;
    property Country: WideString read Get_Country write Set_Country;
    property System: WideString read Get_System write Set_System;
    property StandardID: Integer read Get_StandardID write Set_StandardID;
    property Owner: WideString read Get_Owner write Set_Owner;
    property Hint: WideString read Get_Hint write Set_Hint;
    property Tx: IrsEMCTx read Get_Tx;
    property Rx: IrsEMCRx read Get_Rx;
  end;

  IrsEMCCalcModeData = interface(IUnknown)
    ['{DEF540FB-54D9-4404-B46E-7D61DCB691D8}']
    function Get_FarMethodCount: Integer; safecall;
    function Get_FarMethod(AIdx: Integer): TFarZoneCalcMode; safecall;
    procedure AddFarMethod(AMethod: TFarZoneCalcMode); safecall;
    procedure ClearFarMethods; safecall;
    procedure EditFarMethods; safecall;
    function Get_MethodR: TDistance; safecall;
    procedure Set_MethodR(AVal: TDistance); safecall;
    function Get_OnlyFarZone: WordBool; safecall;
    procedure Set_OnlyFarZone(AVal: WordBool); safecall;
    function Get_NearMethod: TNearZoneCalcMode; safecall;
    procedure Set_NearMethod(AVal: TNearZoneCalcMode); safecall;
    function Get_CalculateSignal: WordBool; safecall;
    procedure Set_CalculateSignal(AVal: WordBool); safecall;
    function Get_UseProfile: WordBool; safecall;
    procedure Set_UseProfile(AVal: WordBool); safecall;
    function Get_UseMorpho: WordBool; safecall;
    procedure Set_UseMorpho(AVal: WordBool); safecall;
    function Get_LocationVariability: Double; safecall;
    procedure Set_LocationVariability(AVal: Double); safecall;
    function Get_SeaTem: TSeaTemperature; safecall;
    procedure Set_SeaTem(AVal: TSeaTemperature); safecall;
    function Get_HarmonicNumber: Integer; safecall;
    procedure Set_HarmonicNumber(AVal: Integer); safecall;
    function Get_BaseAzimuth: TAzimuth; safecall;
    procedure Set_BaseAzimuth(AVal: TAzimuth); safecall;
    function Get_JobType: TEMCJobType; safecall;
    procedure Set_JobType(AVal: TEMCJobType); safecall;
    function Get_KnownLoss: TStrength; safecall;
    procedure Set_KnownLoss(AVal: TStrength); safecall;
    function Get_GroundCover: TGroundCover; safecall;
    procedure Set_GroundCover(AVal: TGroundCover); safecall;
    function Get_StandardProfileIncrement: TDistance; safecall;
    procedure Set_StandardProfileIncrement(AVal: TDistance); safecall;
    property FarMethodCount: Integer read Get_FarMethodCount;
    property FarMethod[AIdx: Integer]: TFarZoneCalcMode read Get_FarMethod; default;
    property MethodR: TDistance read Get_MethodR write Set_MethodR;
    property OnlyFarZone: WordBool read Get_OnlyFarZone write Set_OnlyFarZone;
    property NearMethod: TNearZoneCalcMode read Get_NearMethod write Set_NearMethod;
    property CalculateSignal: WordBool read Get_CalculateSignal write Set_CalculateSignal;
    property UseProfile: WordBool read Get_UseProfile write Set_UseProfile;
    property UseMorpho: WordBool read Get_UseMorpho write Set_UseMorpho;
    property LocationVariability: Double read Get_LocationVariability write Set_LocationVariability;
    property SeaTem: TSeaTemperature read Get_SeaTem write Set_SeaTem;
    property HarmonicNumber: Integer read Get_HarmonicNumber write Set_HarmonicNumber;
    property BaseAzimuth: TAzimuth read Get_BaseAzimuth write Set_BaseAzimuth;
    property JobType: TEMCJobType read Get_JobType write Set_JobType;
    property KnownLoss: TStrength read Get_KnownLoss write Set_KnownLoss;
    property GroundCover: TGroundCover read Get_GroundCover write Set_GroundCover;
    property StandardProfileIncrement: TDistance read Get_StandardProfileIncrement write Set_StandardProfileIncrement;
  end;

  IrsEMCEChart = interface(IUnknown)
    ['{1D976C64-EAFF-495E-AC42-D6D0CF429048}']
    function Get_AzimuthStep: TAzimuth; safecall;
    procedure Set_AzimuthStep(AVal: TAzimuth); safecall;
    function Get_Distance: TDistance; safecall;
    procedure Set_Distance(AVal: TDistance); safecall;
    function Get_RayCount: Integer; safecall;
    function Get_PointCount: Integer; safecall;
    function Get_CenterPoint: TGeoPoint; safecall;
    function Get_ErrorCode: TEMCErrorCode; safecall;
    function Get_ErrorMessage: WideString; safecall;
    function IsCalculated: WordBool; safecall;
    function Get_EC(AGeoP: TGeoPoint): TStrength; safecall;
    function Get_MaxEC: TStrength; safecall;
    function Get_MinEC: TStrength; safecall;
    function Get_ResultFmt: TStrengthFormat; safecall;
    procedure Set_ResultFmt(AVal: TStrengthFormat); safecall;
    function Get_NodeCount: Integer; safecall;
    function Get_NodePoint(AIdx: Integer): TGeoPoint; safecall;
    function Get_NodeStrength(AIdx: Integer): TStrength; safecall;
    procedure Run; safecall;
    function Get_Tx: IrsEMCTx; safecall;
    function Get_Rx: IrsEMCRx; safecall;
    function Get_CalcModeData: IrsEMCCalcModeData; safecall;
    function Get_EArray: VOID; safecall;
    property AzimuthStep: TAzimuth read Get_AzimuthStep write Set_AzimuthStep;
    property Distance: TDistance read Get_Distance write Set_Distance;
    property RayCount: Integer read Get_RayCount;
    property PointCount: Integer read Get_PointCount;
    property CenterPoint: TGeoPoint read Get_CenterPoint;
    property EC[AGeoP: TGeoPoint]: TStrength read Get_EC;
    property MaxEC: TStrength read Get_MaxEC;
    property MinEC: TStrength read Get_MinEC;
    property ResultFmt: TStrengthFormat read Get_ResultFmt write Set_ResultFmt;
    property NodeCount: Integer read Get_NodeCount;
    property NodePoint[AIdx: Integer]: TGeoPoint read Get_NodePoint;
    property NodeStrength[AIdx: Integer]: TStrength read Get_NodeStrength;
    property Tx: IrsEMCTx read Get_Tx;
    property Rx: IrsEMCRx read Get_Rx;
    property CalcModeData: IrsEMCCalcModeData read Get_CalcModeData;
  end;

  IrsEMCEField = interface(IrsEMCEChart)
    ['{EA46802E-359B-4B61-AF90-23E7D5329B69}']
    function Get_MinGeoCorner: TGeoPoint; safecall;
    function Get_MaxGeoCorner: TGeoPoint; safecall;
    function Get_LatStep: TGeoCoord; safecall;
    function Get_LonStep: TGeoCoord; safecall;
    function Get_Poligons(ALevel: TStrength): IUnknown; safecall;
    property MinGeoCorner: TGeoPoint read Get_MinGeoCorner;
    property MaxGeoCorner: TGeoPoint read Get_MaxGeoCorner;
    property LatStep: TGeoCoord read Get_LatStep;
    property LonStep: TGeoCoord read Get_LonStep;
    property Poligons[ALevel: TStrength]: IUnknown read Get_Poligons;
  end;


