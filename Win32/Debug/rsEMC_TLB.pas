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
  TAngle = Double;
  TAntennaHorVertType = WideString;
  TRealHeight = Double;
  TStrength = Double;
  TDistance = Double;
  TFreq = Double;
  TAzimuth = ;
  TPercent = Byte;
  TPower = Double;

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


