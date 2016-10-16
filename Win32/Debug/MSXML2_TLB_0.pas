unit MSXML2_TLB;

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
// File generated on 14.10.2016 21:14:38 from Type Library described below.

// ************************************************************************  //
// Type Lib: msxml6.dll (1)
// LIBID: {F5078F18-C551-11D3-89B9-0000F81FE221}
// LCID: 0
// Helpfile: 
// HelpString: Microsoft XML, v6.0
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Parameter 'type' of IXMLDOMNode.nodeType changed to 'type_'
//   Hint: Member 'implementation' of 'IXMLDOMDocument' changed to 'implementation_'
//   Hint: Parameter 'type' of IXMLDOMDocument.createNode changed to 'type_'
//   Hint: Symbol 'type' renamed to 'type_'
//   Hint: Parameter 'type' of ISchemaElement.type changed to 'type_'
//   Hint: Parameter 'type' of ISchemaAttribute.type changed to 'type_'
//   Hint: Parameter 'var' of IXMLDOMSchemaCollection.add changed to 'var_'
// Cmdline:
//   "C:\Program Files (x86)\Embarcadero\RAD Studio\9.0\bin\tlibimp.exe" -P+ -Ps- msxml6.dll
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  MSXML2MajorVersion = 6;
  MSXML2MinorVersion = 0;

  LIBID_MSXML2: TGUID = '{F5078F18-C551-11D3-89B9-0000F81FE221}';

  IID_IXMLDOMNode: TGUID = '{2933BF80-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMNodeList: TGUID = '{2933BF82-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMNamedNodeMap: TGUID = '{2933BF83-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMDocument: TGUID = '{2933BF81-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMDocumentType: TGUID = '{2933BF8B-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMImplementation: TGUID = '{2933BF8F-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMElement: TGUID = '{2933BF86-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMAttribute: TGUID = '{2933BF85-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMDocumentFragment: TGUID = '{3EFAA413-272F-11D2-836F-0000F87A7782}';
  IID_IXMLDOMCharacterData: TGUID = '{2933BF84-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMText: TGUID = '{2933BF87-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMComment: TGUID = '{2933BF88-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMCDATASection: TGUID = '{2933BF8A-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMProcessingInstruction: TGUID = '{2933BF89-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMEntityReference: TGUID = '{2933BF8E-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMParseError: TGUID = '{3EFAA426-272F-11D2-836F-0000F87A7782}';
  IID_IXMLDOMNotation: TGUID = '{2933BF8C-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMEntity: TGUID = '{2933BF8D-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMParseError2: TGUID = '{3EFAA428-272F-11D2-836F-0000F87A7782}';
  IID_IXMLDOMParseErrorCollection: TGUID = '{3EFAA429-272F-11D2-836F-0000F87A7782}';
  IID_IXTLRuntime: TGUID = '{3EFAA425-272F-11D2-836F-0000F87A7782}';
  IID_ISAXXMLReader: TGUID = '{A4F96ED0-F829-476E-81C0-CDC7BD2A0802}';
  IID_ISAXEntityResolver: TGUID = '{99BCA7BD-E8C4-4D5F-A0CF-6D907901FF07}';
  IID_ISAXContentHandler: TGUID = '{1545CDFA-9E4E-4497-A8A4-2BF7D0112C44}';
  IID_ISAXLocator: TGUID = '{9B7E472A-0DE4-4640-BFF3-84D38A051C31}';
  IID_ISAXAttributes: TGUID = '{F078ABE1-45D2-4832-91EA-4466CE2F25C9}';
  IID_ISAXDTDHandler: TGUID = '{E15C1BAF-AFB3-4D60-8C36-19A8C45DEFED}';
  IID_ISAXErrorHandler: TGUID = '{A60511C4-CCF5-479E-98A3-DC8DC545B7D0}';
  IID_ISAXXMLFilter: TGUID = '{70409222-CA09-4475-ACB8-40312FE8D145}';
  IID_IVBSAXXMLFilter: TGUID = '{1299EB1B-5B88-433E-82DE-82CA75AD4E04}';
  IID_IVBSAXXMLReader: TGUID = '{8C033CAA-6CD6-4F73-B728-4531AF74945F}';
  IID_IVBSAXEntityResolver: TGUID = '{0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}';
  IID_IVBSAXContentHandler: TGUID = '{2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}';
  IID_IVBSAXLocator: TGUID = '{796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}';
  IID_IVBSAXAttributes: TGUID = '{10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}';
  IID_IVBSAXDTDHandler: TGUID = '{24FB3297-302D-4620-BA39-3A732D850558}';
  IID_IVBSAXErrorHandler: TGUID = '{D963D3FE-173C-4862-9095-B92F66995F52}';
  IID_IMXReaderControl: TGUID = '{808F4E35-8D5A-4FBE-8466-33A41279ED30}';
  IID_IMXSchemaDeclHandler: TGUID = '{FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}';
  IID_ISchemaItem: TGUID = '{50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaParticle: TGUID = '{50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaElement: TGUID = '{50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchema: TGUID = '{50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaItemCollection: TGUID = '{50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaStringCollection: TGUID = '{50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaType: TGUID = '{50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaComplexType: TGUID = '{50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaAny: TGUID = '{50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaModelGroup: TGUID = '{50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_IMXXMLFilter: TGUID = '{C90352F7-643C-4FBC-BB23-E996EB2D51FD}';
  IID_ISchemaAttribute: TGUID = '{50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaAttributeGroup: TGUID = '{50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaIdentityConstraint: TGUID = '{50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaNotation: TGUID = '{50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_IXMLDOMSelection: TGUID = '{AA634FC7-5888-44A7-A257-3A47150D3A0E}';
  DIID_XMLDOMDocumentEvents: TGUID = '{3EFAA427-272F-11D2-836F-0000F87A7782}';
  IID_IXMLDOMDocument2: TGUID = '{2933BF95-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMDocument3: TGUID = '{2933BF96-7B36-11D2-B20E-00C04F983E60}';
  CLASS_DOMDocument60: TGUID = '{88D96A05-F192-11D4-A65F-0040963251E5}';
  IID_IXMLDOMSchemaCollection: TGUID = '{373984C8-B845-449B-91E7-45AC83036ADE}';
  CLASS_FreeThreadedDOMDocument60: TGUID = '{88D96A06-F192-11D4-A65F-0040963251E5}';
  IID_IXMLDOMSchemaCollection2: TGUID = '{50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}';
  CLASS_XMLSchemaCache60: TGUID = '{88D96A07-F192-11D4-A65F-0040963251E5}';
  IID_IXSLTemplate: TGUID = '{2933BF93-7B36-11D2-B20E-00C04F983E60}';
  CLASS_XSLTemplate60: TGUID = '{88D96A08-F192-11D4-A65F-0040963251E5}';
  IID_IXSLProcessor: TGUID = '{2933BF92-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLHTTPRequest: TGUID = '{ED8C108D-4349-11D2-91A4-00C04F7969E8}';
  CLASS_XMLHTTP60: TGUID = '{88D96A0A-F192-11D4-A65F-0040963251E5}';
  IID_IXMLHTTPRequest2: TGUID = '{E5D37DC0-552A-4D52-9CC0-A14D546FBD04}';
  CLASS_FreeThreadedXMLHTTP60: TGUID = '{88D96A09-F192-11D4-A65F-0040963251E5}';
  IID_IXMLHTTPRequest2Callback: TGUID = '{A44A9299-E321-40DE-8866-341B41669162}';
  IID_ISequentialStream: TGUID = '{0C733A30-2A1C-11CE-ADE5-00AA0044773D}';
  IID_IServerXMLHTTPRequest: TGUID = '{2E9196BF-13BA-4DD4-91CA-6C571F281495}';
  IID_IServerXMLHTTPRequest2: TGUID = '{2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}';
  CLASS_ServerXMLHTTP60: TGUID = '{88D96A0B-F192-11D4-A65F-0040963251E5}';
  CLASS_SAXXMLReader60: TGUID = '{88D96A0C-F192-11D4-A65F-0040963251E5}';
  IID_IMXWriter: TGUID = '{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}';
  IID_ISAXDeclHandler: TGUID = '{862629AC-771A-47B2-8337-4E6843C1BE90}';
  IID_ISAXLexicalHandler: TGUID = '{7F85D5F5-47A8-4497-BDA5-84BA04819EA6}';
  IID_IVBSAXDeclHandler: TGUID = '{E8917260-7579-4BE1-B5DD-7AFBFA6F077B}';
  IID_IVBSAXLexicalHandler: TGUID = '{032AAC35-8C0E-4D9D-979F-E3B702935576}';
  CLASS_MXXMLWriter60: TGUID = '{88D96A0F-F192-11D4-A65F-0040963251E5}';
  CLASS_MXHTMLWriter60: TGUID = '{88D96A10-F192-11D4-A65F-0040963251E5}';
  IID_IMXAttributes: TGUID = '{F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}';
  CLASS_SAXAttributes60: TGUID = '{88D96A0E-F192-11D4-A65F-0040963251E5}';
  IID_IVBMXNamespaceManager: TGUID = '{C90352F5-643C-4FBC-BB23-E996EB2D51FD}';
  IID_IMXNamespaceManager: TGUID = '{C90352F6-643C-4FBC-BB23-E996EB2D51FD}';
  IID_IMXNamespacePrefixes: TGUID = '{C90352F4-643C-4FBC-BB23-E996EB2D51FD}';
  CLASS_MXNamespaceManager60: TGUID = '{88D96A11-F192-11D4-A65F-0040963251E5}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum tagDOMNodeType
type
  tagDOMNodeType = TOleEnum;
const
  NODE_INVALID = $00000000;
  NODE_ELEMENT = $00000001;
  NODE_ATTRIBUTE = $00000002;
  NODE_TEXT = $00000003;
  NODE_CDATA_SECTION = $00000004;
  NODE_ENTITY_REFERENCE = $00000005;
  NODE_ENTITY = $00000006;
  NODE_PROCESSING_INSTRUCTION = $00000007;
  NODE_COMMENT = $00000008;
  NODE_DOCUMENT = $00000009;
  NODE_DOCUMENT_TYPE = $0000000A;
  NODE_DOCUMENT_FRAGMENT = $0000000B;
  NODE_NOTATION = $0000000C;

// Constants for enum _SOMITEMTYPE
type
  _SOMITEMTYPE = TOleEnum;
const
  SOMITEM_SCHEMA = $00001000;
  SOMITEM_ATTRIBUTE = $00001001;
  SOMITEM_ATTRIBUTEGROUP = $00001002;
  SOMITEM_NOTATION = $00001003;
  SOMITEM_ANNOTATION = $00001004;
  SOMITEM_IDENTITYCONSTRAINT = $00001100;
  SOMITEM_KEY = $00001101;
  SOMITEM_KEYREF = $00001102;
  SOMITEM_UNIQUE = $00001103;
  SOMITEM_ANYTYPE = $00002000;
  SOMITEM_DATATYPE = $00002100;
  SOMITEM_DATATYPE_ANYTYPE = $00002101;
  SOMITEM_DATATYPE_ANYURI = $00002102;
  SOMITEM_DATATYPE_BASE64BINARY = $00002103;
  SOMITEM_DATATYPE_BOOLEAN = $00002104;
  SOMITEM_DATATYPE_BYTE = $00002105;
  SOMITEM_DATATYPE_DATE = $00002106;
  SOMITEM_DATATYPE_DATETIME = $00002107;
  SOMITEM_DATATYPE_DAY = $00002108;
  SOMITEM_DATATYPE_DECIMAL = $00002109;
  SOMITEM_DATATYPE_DOUBLE = $0000210A;
  SOMITEM_DATATYPE_DURATION = $0000210B;
  SOMITEM_DATATYPE_ENTITIES = $0000210C;
  SOMITEM_DATATYPE_ENTITY = $0000210D;
  SOMITEM_DATATYPE_FLOAT = $0000210E;
  SOMITEM_DATATYPE_HEXBINARY = $0000210F;
  SOMITEM_DATATYPE_ID = $00002110;
  SOMITEM_DATATYPE_IDREF = $00002111;
  SOMITEM_DATATYPE_IDREFS = $00002112;
  SOMITEM_DATATYPE_INT = $00002113;
  SOMITEM_DATATYPE_INTEGER = $00002114;
  SOMITEM_DATATYPE_LANGUAGE = $00002115;
  SOMITEM_DATATYPE_LONG = $00002116;
  SOMITEM_DATATYPE_MONTH = $00002117;
  SOMITEM_DATATYPE_MONTHDAY = $00002118;
  SOMITEM_DATATYPE_NAME = $00002119;
  SOMITEM_DATATYPE_NCNAME = $0000211A;
  SOMITEM_DATATYPE_NEGATIVEINTEGER = $0000211B;
  SOMITEM_DATATYPE_NMTOKEN = $0000211C;
  SOMITEM_DATATYPE_NMTOKENS = $0000211D;
  SOMITEM_DATATYPE_NONNEGATIVEINTEGER = $0000211E;
  SOMITEM_DATATYPE_NONPOSITIVEINTEGER = $0000211F;
  SOMITEM_DATATYPE_NORMALIZEDSTRING = $00002120;
  SOMITEM_DATATYPE_NOTATION = $00002121;
  SOMITEM_DATATYPE_POSITIVEINTEGER = $00002122;
  SOMITEM_DATATYPE_QNAME = $00002123;
  SOMITEM_DATATYPE_SHORT = $00002124;
  SOMITEM_DATATYPE_STRING = $00002125;
  SOMITEM_DATATYPE_TIME = $00002126;
  SOMITEM_DATATYPE_TOKEN = $00002127;
  SOMITEM_DATATYPE_UNSIGNEDBYTE = $00002128;
  SOMITEM_DATATYPE_UNSIGNEDINT = $00002129;
  SOMITEM_DATATYPE_UNSIGNEDLONG = $0000212A;
  SOMITEM_DATATYPE_UNSIGNEDSHORT = $0000212B;
  SOMITEM_DATATYPE_YEAR = $0000212C;
  SOMITEM_DATATYPE_YEARMONTH = $0000212D;
  SOMITEM_DATATYPE_ANYSIMPLETYPE = $000021FF;
  SOMITEM_SIMPLETYPE = $00002200;
  SOMITEM_COMPLEXTYPE = $00002400;
  SOMITEM_PARTICLE = $00004000;
  SOMITEM_ANY = $00004001;
  SOMITEM_ANYATTRIBUTE = $00004002;
  SOMITEM_ELEMENT = $00004003;
  SOMITEM_GROUP = $00004100;
  SOMITEM_ALL = $00004101;
  SOMITEM_CHOICE = $00004102;
  SOMITEM_SEQUENCE = $00004103;
  SOMITEM_EMPTYPARTICLE = $00004104;
  SOMITEM_NULL = $00000800;
  SOMITEM_NULL_TYPE = $00002800;
  SOMITEM_NULL_ANY = $00004801;
  SOMITEM_NULL_ANYATTRIBUTE = $00004802;
  SOMITEM_NULL_ELEMENT = $00004803;

// Constants for enum _SCHEMADERIVATIONMETHOD
type
  _SCHEMADERIVATIONMETHOD = TOleEnum;
const
  SCHEMADERIVATIONMETHOD_EMPTY = $00000000;
  SCHEMADERIVATIONMETHOD_SUBSTITUTION = $00000001;
  SCHEMADERIVATIONMETHOD_EXTENSION = $00000002;
  SCHEMADERIVATIONMETHOD_RESTRICTION = $00000004;
  SCHEMADERIVATIONMETHOD_LIST = $00000008;
  SCHEMADERIVATIONMETHOD_UNION = $00000010;
  SCHEMADERIVATIONMETHOD_ALL = $000000FF;
  SCHEMADERIVATIONMETHOD_NONE = $00000100;

// Constants for enum _SCHEMATYPEVARIETY
type
  _SCHEMATYPEVARIETY = TOleEnum;
const
  SCHEMATYPEVARIETY_NONE = $FFFFFFFF;
  SCHEMATYPEVARIETY_ATOMIC = $00000000;
  SCHEMATYPEVARIETY_LIST = $00000001;
  SCHEMATYPEVARIETY_UNION = $00000002;

// Constants for enum _SCHEMAWHITESPACE
type
  _SCHEMAWHITESPACE = TOleEnum;
const
  SCHEMAWHITESPACE_NONE = $FFFFFFFF;
  SCHEMAWHITESPACE_PRESERVE = $00000000;
  SCHEMAWHITESPACE_REPLACE = $00000001;
  SCHEMAWHITESPACE_COLLAPSE = $00000002;

// Constants for enum _SCHEMAPROCESSCONTENTS
type
  _SCHEMAPROCESSCONTENTS = TOleEnum;
const
  SCHEMAPROCESSCONTENTS_NONE = $00000000;
  SCHEMAPROCESSCONTENTS_SKIP = $00000001;
  SCHEMAPROCESSCONTENTS_LAX = $00000002;
  SCHEMAPROCESSCONTENTS_STRICT = $00000003;

// Constants for enum _SCHEMACONTENTTYPE
type
  _SCHEMACONTENTTYPE = TOleEnum;
const
  SCHEMACONTENTTYPE_EMPTY = $00000000;
  SCHEMACONTENTTYPE_TEXTONLY = $00000001;
  SCHEMACONTENTTYPE_ELEMENTONLY = $00000002;
  SCHEMACONTENTTYPE_MIXED = $00000003;

// Constants for enum _SCHEMAUSE
type
  _SCHEMAUSE = TOleEnum;
const
  SCHEMAUSE_OPTIONAL = $00000000;
  SCHEMAUSE_PROHIBITED = $00000001;
  SCHEMAUSE_REQUIRED = $00000002;

// Constants for enum _SERVERXMLHTTP_OPTION
type
  _SERVERXMLHTTP_OPTION = TOleEnum;
const
  SXH_OPTION_URL = $FFFFFFFF;
  SXH_OPTION_URL_CODEPAGE = $00000000;
  SXH_OPTION_ESCAPE_PERCENT_IN_URL = $00000001;
  SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS = $00000002;
  SXH_OPTION_SELECT_CLIENT_SSL_CERT = $00000003;

// Constants for enum _SXH_SERVER_CERT_OPTION
type
  _SXH_SERVER_CERT_OPTION = TOleEnum;
const
  SXH_SERVER_CERT_IGNORE_UNKNOWN_CA = $00000100;
  SXH_SERVER_CERT_IGNORE_WRONG_USAGE = $00000200;
  SXH_SERVER_CERT_IGNORE_CERT_CN_INVALID = $00001000;
  SXH_SERVER_CERT_IGNORE_CERT_DATE_INVALID = $00002000;
  SXH_SERVER_CERT_IGNORE_ALL_SERVER_ERRORS = $00003300;

// Constants for enum _SXH_PROXY_SETTING
type
  _SXH_PROXY_SETTING = TOleEnum;
const
  SXH_PROXY_SET_DEFAULT = $00000000;
  SXH_PROXY_SET_PRECONFIG = $00000000;
  SXH_PROXY_SET_DIRECT = $00000001;
  SXH_PROXY_SET_PROXY = $00000002;

// Constants for enum _XHR_PROPERTY
type
  _XHR_PROPERTY = TOleEnum;
const
  XHR_PROP_NO_CRED_PROMPT = $00000000;
  XHR_PROP_NO_AUTH = $00000001;
  XHR_PROP_TIMEOUT = $00000002;
  XHR_PROP_NO_DEFAULT_HEADERS = $00000003;
  XHR_PROP_REPORT_REDIRECT_STATUS = $00000004;
  XHR_PROP_NO_CACHE = $00000005;
  XHR_PROP_EXTENDED_ERROR = $00000006;
  XHR_PROP_QUERY_STRING_UTF8 = $00000007;
  XHR_PROP_IGNORE_CERT_ERRORS = $00000008;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IXMLDOMNode = interface;
  IXMLDOMNodeDisp = dispinterface;
  IXMLDOMNodeList = interface;
  IXMLDOMNodeListDisp = dispinterface;
  IXMLDOMNamedNodeMap = interface;
  IXMLDOMNamedNodeMapDisp = dispinterface;
  IXMLDOMDocument = interface;
  IXMLDOMDocumentDisp = dispinterface;
  IXMLDOMDocumentType = interface;
  IXMLDOMDocumentTypeDisp = dispinterface;
  IXMLDOMImplementation = interface;
  IXMLDOMImplementationDisp = dispinterface;
  IXMLDOMElement = interface;
  IXMLDOMElementDisp = dispinterface;
  IXMLDOMAttribute = interface;
  IXMLDOMAttributeDisp = dispinterface;
  IXMLDOMDocumentFragment = interface;
  IXMLDOMDocumentFragmentDisp = dispinterface;
  IXMLDOMCharacterData = interface;
  IXMLDOMCharacterDataDisp = dispinterface;
  IXMLDOMText = interface;
  IXMLDOMTextDisp = dispinterface;
  IXMLDOMComment = interface;
  IXMLDOMCommentDisp = dispinterface;
  IXMLDOMCDATASection = interface;
  IXMLDOMCDATASectionDisp = dispinterface;
  IXMLDOMProcessingInstruction = interface;
  IXMLDOMProcessingInstructionDisp = dispinterface;
  IXMLDOMEntityReference = interface;
  IXMLDOMEntityReferenceDisp = dispinterface;
  IXMLDOMParseError = interface;
  IXMLDOMParseErrorDisp = dispinterface;
  IXMLDOMNotation = interface;
  IXMLDOMNotationDisp = dispinterface;
  IXMLDOMEntity = interface;
  IXMLDOMEntityDisp = dispinterface;
  IXMLDOMParseError2 = interface;
  IXMLDOMParseError2Disp = dispinterface;
  IXMLDOMParseErrorCollection = interface;
  IXMLDOMParseErrorCollectionDisp = dispinterface;
  IXTLRuntime = interface;
  IXTLRuntimeDisp = dispinterface;
  ISAXXMLReader = interface;
  ISAXEntityResolver = interface;
  ISAXContentHandler = interface;
  ISAXLocator = interface;
  ISAXAttributes = interface;
  ISAXDTDHandler = interface;
  ISAXErrorHandler = interface;
  ISAXXMLFilter = interface;
  IVBSAXXMLFilter = interface;
  IVBSAXXMLFilterDisp = dispinterface;
  IVBSAXXMLReader = interface;
  IVBSAXXMLReaderDisp = dispinterface;
  IVBSAXEntityResolver = interface;
  IVBSAXEntityResolverDisp = dispinterface;
  IVBSAXContentHandler = interface;
  IVBSAXContentHandlerDisp = dispinterface;
  IVBSAXLocator = interface;
  IVBSAXLocatorDisp = dispinterface;
  IVBSAXAttributes = interface;
  IVBSAXAttributesDisp = dispinterface;
  IVBSAXDTDHandler = interface;
  IVBSAXDTDHandlerDisp = dispinterface;
  IVBSAXErrorHandler = interface;
  IVBSAXErrorHandlerDisp = dispinterface;
  IMXReaderControl = interface;
  IMXReaderControlDisp = dispinterface;
  IMXSchemaDeclHandler = interface;
  IMXSchemaDeclHandlerDisp = dispinterface;
  ISchemaItem = interface;
  ISchemaItemDisp = dispinterface;
  ISchemaParticle = interface;
  ISchemaParticleDisp = dispinterface;
  ISchemaElement = interface;
  ISchemaElementDisp = dispinterface;
  ISchema = interface;
  ISchemaDisp = dispinterface;
  ISchemaItemCollection = interface;
  ISchemaItemCollectionDisp = dispinterface;
  ISchemaStringCollection = interface;
  ISchemaStringCollectionDisp = dispinterface;
  ISchemaType = interface;
  ISchemaTypeDisp = dispinterface;
  ISchemaComplexType = interface;
  ISchemaComplexTypeDisp = dispinterface;
  ISchemaAny = interface;
  ISchemaAnyDisp = dispinterface;
  ISchemaModelGroup = interface;
  ISchemaModelGroupDisp = dispinterface;
  IMXXMLFilter = interface;
  IMXXMLFilterDisp = dispinterface;
  ISchemaAttribute = interface;
  ISchemaAttributeDisp = dispinterface;
  ISchemaAttributeGroup = interface;
  ISchemaAttributeGroupDisp = dispinterface;
  ISchemaIdentityConstraint = interface;
  ISchemaIdentityConstraintDisp = dispinterface;
  ISchemaNotation = interface;
  ISchemaNotationDisp = dispinterface;
  IXMLDOMSelection = interface;
  IXMLDOMSelectionDisp = dispinterface;
  XMLDOMDocumentEvents = dispinterface;
  IXMLDOMDocument2 = interface;
  IXMLDOMDocument2Disp = dispinterface;
  IXMLDOMDocument3 = interface;
  IXMLDOMDocument3Disp = dispinterface;
  IXMLDOMSchemaCollection = interface;
  IXMLDOMSchemaCollectionDisp = dispinterface;
  IXMLDOMSchemaCollection2 = interface;
  IXMLDOMSchemaCollection2Disp = dispinterface;
  IXSLTemplate = interface;
  IXSLTemplateDisp = dispinterface;
  IXSLProcessor = interface;
  IXSLProcessorDisp = dispinterface;
  IXMLHTTPRequest = interface;
  IXMLHTTPRequestDisp = dispinterface;
  IXMLHTTPRequest2 = interface;
  IXMLHTTPRequest2Callback = interface;
  ISequentialStream = interface;
  IServerXMLHTTPRequest = interface;
  IServerXMLHTTPRequestDisp = dispinterface;
  IServerXMLHTTPRequest2 = interface;
  IServerXMLHTTPRequest2Disp = dispinterface;
  IMXWriter = interface;
  IMXWriterDisp = dispinterface;
  ISAXDeclHandler = interface;
  ISAXLexicalHandler = interface;
  IVBSAXDeclHandler = interface;
  IVBSAXDeclHandlerDisp = dispinterface;
  IVBSAXLexicalHandler = interface;
  IVBSAXLexicalHandlerDisp = dispinterface;
  IMXAttributes = interface;
  IMXAttributesDisp = dispinterface;
  IVBMXNamespaceManager = interface;
  IVBMXNamespaceManagerDisp = dispinterface;
  IMXNamespaceManager = interface;
  IMXNamespacePrefixes = interface;
  IMXNamespacePrefixesDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DOMDocument60 = IXMLDOMDocument3;
  FreeThreadedDOMDocument60 = IXMLDOMDocument3;
  XMLSchemaCache60 = IXMLDOMSchemaCollection2;
  XSLTemplate60 = IXSLTemplate;
  XMLHTTP60 = IXMLHTTPRequest;
  FreeThreadedXMLHTTP60 = IXMLHTTPRequest2;
  ServerXMLHTTP60 = IServerXMLHTTPRequest2;
  SAXXMLReader60 = IVBSAXXMLReader;
  MXXMLWriter60 = IMXWriter;
  MXHTMLWriter60 = IMXWriter;
  SAXAttributes60 = IMXAttributes;
  MXNamespaceManager60 = IVBMXNamespaceManager;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PWord1 = ^Word; {*}
  PUserType1 = ^tagXHR_COOKIE; {*}
  PByte1 = ^Byte; {*}

  DOMNodeType = tagDOMNodeType; 
  SOMITEMTYPE = _SOMITEMTYPE; 
  SCHEMADERIVATIONMETHOD = _SCHEMADERIVATIONMETHOD; 
  SCHEMATYPEVARIETY = _SCHEMATYPEVARIETY; 
  SCHEMAWHITESPACE = _SCHEMAWHITESPACE; 
  SCHEMAPROCESSCONTENTS = _SCHEMAPROCESSCONTENTS; 
  SCHEMACONTENTTYPE = _SCHEMACONTENTTYPE; 
  SCHEMAUSE = _SCHEMAUSE; 
  SERVERXMLHTTP_OPTION = _SERVERXMLHTTP_OPTION; 
  SXH_SERVER_CERT_OPTION = _SXH_SERVER_CERT_OPTION; 
  SXH_PROXY_SETTING = _SXH_PROXY_SETTING; 

  __msxml6_ReferenceRemainingTypes__ = record
    __tagDomNodeType__: tagDOMNodeType;
    __domNodeType__: DOMNodeType;
    __serverXmlHttpOptionEnum__: _SERVERXMLHTTP_OPTION;
    __serverXmlHttpOption__: SERVERXMLHTTP_OPTION;
    __serverCertOptionEnum__: _SXH_SERVER_CERT_OPTION;
    __serverCertOption__: SXH_SERVER_CERT_OPTION;
    __proxySettingEnum__: _SXH_PROXY_SETTING;
    __proxySetting__: SXH_PROXY_SETTING;
    __somItemTypeEnum__: _SOMITEMTYPE;
    __somItemType__: SOMITEMTYPE;
    __schemaUseEnum__: _SCHEMAUSE;
    __schemaUse__: SCHEMAUSE;
    __schemaDerivationMethodEnum__: _SCHEMADERIVATIONMETHOD;
    __schemaDerivationMethod__: SCHEMADERIVATIONMETHOD;
    __schemaContentTypeEnum__: _SCHEMACONTENTTYPE;
    __schemaContentType__: SCHEMACONTENTTYPE;
    __schemaProcessContentsEnum__: _SCHEMAPROCESSCONTENTS;
    __schemaProcessContents__: SCHEMAPROCESSCONTENTS;
    __schemaWhitespaceEnum__: _SCHEMAWHITESPACE;
    __schemaWhitespace__: SCHEMAWHITESPACE;
    __schemaTypeVarietyEnum__: _SCHEMATYPEVARIETY;
    __schemaTypeVariety__: SCHEMATYPEVARIETY;
  end;

  _FILETIME = record
    dwLowDateTime: LongWord;
    dwHighDateTime: LongWord;
  end;

  tagXHR_COOKIE = record
    pwszUrl: PWideChar;
    pwszName: PWideChar;
    pwszValue: PWideChar;
    pwszP3PPolicy: PWideChar;
    ftExpires: _FILETIME;
    dwFlags: LongWord;
  end;

  XHR_PROPERTY = _XHR_PROPERTY; 

// *********************************************************************//
// Interface: IXMLDOMNode
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF80-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNode = interface(IDispatch)
    ['{2933BF80-7B36-11D2-B20E-00C04F983E60}']
    function Get_nodeName(out name: WideString): HResult; stdcall;
    function Get_nodeValue(out value: OleVariant): HResult; stdcall;
    function Set_nodeValue(value: OleVariant): HResult; stdcall;
    function Get_nodeType(out type_: DOMNodeType): HResult; stdcall;
    function Get_parentNode(out parent: IXMLDOMNode): HResult; stdcall;
    function Get_childNodes(out childList: IXMLDOMNodeList): HResult; stdcall;
    function Get_firstChild(out firstChild: IXMLDOMNode): HResult; stdcall;
    function Get_lastChild(out lastChild: IXMLDOMNode): HResult; stdcall;
    function Get_previousSibling(out previousSibling: IXMLDOMNode): HResult; stdcall;
    function Get_nextSibling(out nextSibling: IXMLDOMNode): HResult; stdcall;
    function Get_attributes(out attributeMap: IXMLDOMNamedNodeMap): HResult; stdcall;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): HResult; stdcall;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): HResult; stdcall;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): HResult; stdcall;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): HResult; stdcall;
    function hasChildNodes(out hasChild: WordBool): HResult; stdcall;
    function Get_ownerDocument(out XMLDOMDocument: IXMLDOMDocument): HResult; stdcall;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): HResult; stdcall;
    function Get_nodeTypeString(out nodeType: WideString): HResult; stdcall;
    function Get_text(out text: WideString): HResult; stdcall;
    function Set_text(const text: WideString): HResult; stdcall;
    function Get_specified(out isSpecified: WordBool): HResult; stdcall;
    function Get_definition(out definitionNode: IXMLDOMNode): HResult; stdcall;
    function Get_nodeTypedValue(out typedValue: OleVariant): HResult; stdcall;
    function Set_nodeTypedValue(typedValue: OleVariant): HResult; stdcall;
    function Get_dataType(out dataTypeName: OleVariant): HResult; stdcall;
    function Set_dataType(const dataTypeName: WideString): HResult; stdcall;
    function Get_xml(out xmlString: WideString): HResult; stdcall;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): HResult; stdcall;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): HResult; stdcall;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): HResult; stdcall;
    function Get_parsed(out isParsed: WordBool): HResult; stdcall;
    function Get_namespaceURI(out namespaceURI: WideString): HResult; stdcall;
    function Get_prefix(out prefixString: WideString): HResult; stdcall;
    function Get_baseName(out nameString: WideString): HResult; stdcall;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMNodeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF80-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNodeDisp = dispinterface
    ['{2933BF80-7B36-11D2-B20E-00C04F983E60}']
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMNodeList
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF82-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNodeList = interface(IDispatch)
    ['{2933BF82-7B36-11D2-B20E-00C04F983E60}']
    function Get_item(index: Integer; out listItem: IXMLDOMNode): HResult; stdcall;
    function Get_length(out listLength: Integer): HResult; stdcall;
    function nextNode(out nextItem: IXMLDOMNode): HResult; stdcall;
    function reset: HResult; stdcall;
    function Get__newEnum(out ppUnk: IUnknown): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMNodeListDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF82-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNodeListDisp = dispinterface
    ['{2933BF82-7B36-11D2-B20E-00C04F983E60}']
    property item[index: Integer; out listItem: IXMLDOMNode]: IXMLDOMNode readonly dispid 0;
    property length[out listLength: Integer]: Integer readonly dispid 74;
    function nextNode(out nextItem: IXMLDOMNode): IXMLDOMNode; dispid 76;
    function reset: HResult; dispid 77;
    property _newEnum[out ppUnk: IUnknown]: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IXMLDOMNamedNodeMap
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF83-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNamedNodeMap = interface(IDispatch)
    ['{2933BF83-7B36-11D2-B20E-00C04F983E60}']
    function getNamedItem(const name: WideString; out namedItem: IXMLDOMNode): HResult; stdcall;
    function setNamedItem(const newItem: IXMLDOMNode; out nameItem: IXMLDOMNode): HResult; stdcall;
    function removeNamedItem(const name: WideString; out namedItem: IXMLDOMNode): HResult; stdcall;
    function Get_item(index: Integer; out listItem: IXMLDOMNode): HResult; stdcall;
    function Get_length(out listLength: Integer): HResult; stdcall;
    function getQualifiedItem(const baseName: WideString; const namespaceURI: WideString; 
                              out qualifiedItem: IXMLDOMNode): HResult; stdcall;
    function removeQualifiedItem(const baseName: WideString; const namespaceURI: WideString; 
                                 out qualifiedItem: IXMLDOMNode): HResult; stdcall;
    function nextNode(out nextItem: IXMLDOMNode): HResult; stdcall;
    function reset: HResult; stdcall;
    function Get__newEnum(out ppUnk: IUnknown): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMNamedNodeMapDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF83-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNamedNodeMapDisp = dispinterface
    ['{2933BF83-7B36-11D2-B20E-00C04F983E60}']
    function getNamedItem(const name: WideString; out namedItem: IXMLDOMNode): IXMLDOMNode; dispid 83;
    function setNamedItem(const newItem: IXMLDOMNode; out nameItem: IXMLDOMNode): IXMLDOMNode; dispid 84;
    function removeNamedItem(const name: WideString; out namedItem: IXMLDOMNode): IXMLDOMNode; dispid 85;
    property item[index: Integer; out listItem: IXMLDOMNode]: IXMLDOMNode readonly dispid 0;
    property length[out listLength: Integer]: Integer readonly dispid 74;
    function getQualifiedItem(const baseName: WideString; const namespaceURI: WideString; 
                              out qualifiedItem: IXMLDOMNode): IXMLDOMNode; dispid 87;
    function removeQualifiedItem(const baseName: WideString; const namespaceURI: WideString; 
                                 out qualifiedItem: IXMLDOMNode): IXMLDOMNode; dispid 88;
    function nextNode(out nextItem: IXMLDOMNode): IXMLDOMNode; dispid 89;
    function reset: HResult; dispid 90;
    property _newEnum[out ppUnk: IUnknown]: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IXMLDOMDocument
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF81-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocument = interface(IXMLDOMNode)
    ['{2933BF81-7B36-11D2-B20E-00C04F983E60}']
    function Get_doctype(out documentType: IXMLDOMDocumentType): HResult; stdcall;
    function Get_implementation_(out impl: IXMLDOMImplementation): HResult; stdcall;
    function Get_documentElement(out DOMElement: IXMLDOMElement): HResult; stdcall;
    function _Set_documentElement(const DOMElement: IXMLDOMElement): HResult; stdcall;
    function createElement(const tagName: WideString; out element: IXMLDOMElement): HResult; stdcall;
    function createDocumentFragment(out docFrag: IXMLDOMDocumentFragment): HResult; stdcall;
    function createTextNode(const data: WideString; out text: IXMLDOMText): HResult; stdcall;
    function createComment(const data: WideString; out comment: IXMLDOMComment): HResult; stdcall;
    function createCDATASection(const data: WideString; out cdata: IXMLDOMCDATASection): HResult; stdcall;
    function createProcessingInstruction(const target: WideString; const data: WideString; 
                                         out pi: IXMLDOMProcessingInstruction): HResult; stdcall;
    function createAttribute(const name: WideString; out attribute: IXMLDOMAttribute): HResult; stdcall;
    function createEntityReference(const name: WideString; out entityRef: IXMLDOMEntityReference): HResult; stdcall;
    function getElementsByTagName(const tagName: WideString; out resultList: IXMLDOMNodeList): HResult; stdcall;
    function createNode(type_: OleVariant; const name: WideString; const namespaceURI: WideString; 
                        out node: IXMLDOMNode): HResult; stdcall;
    function nodeFromID(const idString: WideString; out node: IXMLDOMNode): HResult; stdcall;
    function load(xmlSource: OleVariant; out isSuccessful: WordBool): HResult; stdcall;
    function Get_readyState(out value: Integer): HResult; stdcall;
    function Get_parseError(out errorObj: IXMLDOMParseError): HResult; stdcall;
    function Get_url(out urlString: WideString): HResult; stdcall;
    function Get_async(out isAsync: WordBool): HResult; stdcall;
    function Set_async(isAsync: WordBool): HResult; stdcall;
    function abort: HResult; stdcall;
    function loadXML(const bstrXML: WideString; out isSuccessful: WordBool): HResult; stdcall;
    function save(destination: OleVariant): HResult; stdcall;
    function Get_validateOnParse(out isValidating: WordBool): HResult; stdcall;
    function Set_validateOnParse(isValidating: WordBool): HResult; stdcall;
    function Get_resolveExternals(out isResolving: WordBool): HResult; stdcall;
    function Set_resolveExternals(isResolving: WordBool): HResult; stdcall;
    function Get_preserveWhiteSpace(out isPreserving: WordBool): HResult; stdcall;
    function Set_preserveWhiteSpace(isPreserving: WordBool): HResult; stdcall;
    function Set_onreadystatechange(Param1: OleVariant): HResult; stdcall;
    function Set_ondataavailable(Param1: OleVariant): HResult; stdcall;
    function Set_ontransformnode(Param1: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMDocumentDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF81-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocumentDisp = dispinterface
    ['{2933BF81-7B36-11D2-B20E-00C04F983E60}']
    property doctype[out documentType: IXMLDOMDocumentType]: IXMLDOMDocumentType readonly dispid 38;
    property implementation_[out impl: IXMLDOMImplementation]: IXMLDOMImplementation readonly dispid 39;
    function documentElement(out DOMElement: IXMLDOMElement): IXMLDOMElement; dispid 40;
    function createElement(const tagName: WideString; out element: IXMLDOMElement): IXMLDOMElement; dispid 41;
    function createDocumentFragment(out docFrag: IXMLDOMDocumentFragment): IXMLDOMDocumentFragment; dispid 42;
    function createTextNode(const data: WideString; out text: IXMLDOMText): IXMLDOMText; dispid 43;
    function createComment(const data: WideString; out comment: IXMLDOMComment): IXMLDOMComment; dispid 44;
    function createCDATASection(const data: WideString; out cdata: IXMLDOMCDATASection): IXMLDOMCDATASection; dispid 45;
    function createProcessingInstruction(const target: WideString; const data: WideString; 
                                         out pi: IXMLDOMProcessingInstruction): IXMLDOMProcessingInstruction; dispid 46;
    function createAttribute(const name: WideString; out attribute: IXMLDOMAttribute): IXMLDOMAttribute; dispid 47;
    function createEntityReference(const name: WideString; out entityRef: IXMLDOMEntityReference): IXMLDOMEntityReference; dispid 49;
    function getElementsByTagName(const tagName: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 50;
    function createNode(type_: OleVariant; const name: WideString; const namespaceURI: WideString; 
                        out node: IXMLDOMNode): IXMLDOMNode; dispid 54;
    function nodeFromID(const idString: WideString; out node: IXMLDOMNode): IXMLDOMNode; dispid 56;
    function load(xmlSource: OleVariant; out isSuccessful: WordBool): WordBool; dispid 58;
    property readyState[out value: Integer]: Integer readonly dispid -525;
    property parseError[out errorObj: IXMLDOMParseError]: IXMLDOMParseError readonly dispid 59;
    property url[out urlString: WideString]: WideString readonly dispid 60;
    function async(out isAsync: WordBool): WordBool; dispid 61;
    function abort: HResult; dispid 62;
    function loadXML(const bstrXML: WideString; out isSuccessful: WordBool): WordBool; dispid 63;
    function save(destination: OleVariant): HResult; dispid 64;
    function validateOnParse(out isValidating: WordBool): WordBool; dispid 65;
    function resolveExternals(out isResolving: WordBool): WordBool; dispid 66;
    function preserveWhiteSpace(out isPreserving: WordBool): WordBool; dispid 67;
    property onreadystatechange: HResult writeonly dispid 68;
    property ondataavailable: HResult writeonly dispid 69;
    property ontransformnode: HResult writeonly dispid 70;
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMDocumentType
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8B-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocumentType = interface(IXMLDOMNode)
    ['{2933BF8B-7B36-11D2-B20E-00C04F983E60}']
    function Get_name(out rootName: WideString): HResult; stdcall;
    function Get_entities(out entityMap: IXMLDOMNamedNodeMap): HResult; stdcall;
    function Get_notations(out notationMap: IXMLDOMNamedNodeMap): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMDocumentTypeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8B-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocumentTypeDisp = dispinterface
    ['{2933BF8B-7B36-11D2-B20E-00C04F983E60}']
    property name[out rootName: WideString]: WideString readonly dispid 131;
    property entities[out entityMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 132;
    property notations[out notationMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 133;
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMImplementation
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8F-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMImplementation = interface(IDispatch)
    ['{2933BF8F-7B36-11D2-B20E-00C04F983E60}']
    function hasFeature(const feature: WideString; const version: WideString; 
                        out hasFeature: WordBool): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMImplementationDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8F-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMImplementationDisp = dispinterface
    ['{2933BF8F-7B36-11D2-B20E-00C04F983E60}']
    function hasFeature(const feature: WideString; const version: WideString; 
                        out hasFeature: WordBool): WordBool; dispid 145;
  end;

// *********************************************************************//
// Interface: IXMLDOMElement
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF86-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMElement = interface(IXMLDOMNode)
    ['{2933BF86-7B36-11D2-B20E-00C04F983E60}']
    function Get_tagName(out tagName: WideString): HResult; stdcall;
    function getAttribute(const name: WideString; out value: OleVariant): HResult; stdcall;
    function setAttribute(const name: WideString; value: OleVariant): HResult; stdcall;
    function removeAttribute(const name: WideString): HResult; stdcall;
    function getAttributeNode(const name: WideString; out attributeNode: IXMLDOMAttribute): HResult; stdcall;
    function setAttributeNode(const DOMAttribute: IXMLDOMAttribute; 
                              out attributeNode: IXMLDOMAttribute): HResult; stdcall;
    function removeAttributeNode(const DOMAttribute: IXMLDOMAttribute; 
                                 out attributeNode: IXMLDOMAttribute): HResult; stdcall;
    function getElementsByTagName(const tagName: WideString; out resultList: IXMLDOMNodeList): HResult; stdcall;
    function normalize: HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMElementDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF86-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMElementDisp = dispinterface
    ['{2933BF86-7B36-11D2-B20E-00C04F983E60}']
    property tagName[out tagName: WideString]: WideString readonly dispid 97;
    function getAttribute(const name: WideString; out value: OleVariant): OleVariant; dispid 99;
    function setAttribute(const name: WideString; value: OleVariant): HResult; dispid 100;
    function removeAttribute(const name: WideString): HResult; dispid 101;
    function getAttributeNode(const name: WideString; out attributeNode: IXMLDOMAttribute): IXMLDOMAttribute; dispid 102;
    function setAttributeNode(const DOMAttribute: IXMLDOMAttribute; 
                              out attributeNode: IXMLDOMAttribute): IXMLDOMAttribute; dispid 103;
    function removeAttributeNode(const DOMAttribute: IXMLDOMAttribute; 
                                 out attributeNode: IXMLDOMAttribute): IXMLDOMAttribute; dispid 104;
    function getElementsByTagName(const tagName: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 105;
    function normalize: HResult; dispid 106;
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMAttribute
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF85-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMAttribute = interface(IXMLDOMNode)
    ['{2933BF85-7B36-11D2-B20E-00C04F983E60}']
    function Get_name(out attributeName: WideString): HResult; stdcall;
    function Get_value(out attributeValue: OleVariant): HResult; stdcall;
    function Set_value(attributeValue: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMAttributeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF85-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMAttributeDisp = dispinterface
    ['{2933BF85-7B36-11D2-B20E-00C04F983E60}']
    property name[out attributeName: WideString]: WideString readonly dispid 118;
    function value(out attributeValue: OleVariant): OleVariant; dispid 120;
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMDocumentFragment
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA413-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMDocumentFragment = interface(IXMLDOMNode)
    ['{3EFAA413-272F-11D2-836F-0000F87A7782}']
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMDocumentFragmentDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA413-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMDocumentFragmentDisp = dispinterface
    ['{3EFAA413-272F-11D2-836F-0000F87A7782}']
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMCharacterData
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF84-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMCharacterData = interface(IXMLDOMNode)
    ['{2933BF84-7B36-11D2-B20E-00C04F983E60}']
    function Get_data(out data: WideString): HResult; stdcall;
    function Set_data(const data: WideString): HResult; stdcall;
    function Get_length(out dataLength: Integer): HResult; stdcall;
    function substringData(offset: Integer; count: Integer; out data: WideString): HResult; stdcall;
    function appendData(const data: WideString): HResult; stdcall;
    function insertData(offset: Integer; const data: WideString): HResult; stdcall;
    function deleteData(offset: Integer; count: Integer): HResult; stdcall;
    function replaceData(offset: Integer; count: Integer; const data: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMCharacterDataDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF84-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMCharacterDataDisp = dispinterface
    ['{2933BF84-7B36-11D2-B20E-00C04F983E60}']
    function data(out data: WideString): WideString; dispid 109;
    property length[out dataLength: Integer]: Integer readonly dispid 110;
    function substringData(offset: Integer; count: Integer; out data: WideString): WideString; dispid 111;
    function appendData(const data: WideString): HResult; dispid 112;
    function insertData(offset: Integer; const data: WideString): HResult; dispid 113;
    function deleteData(offset: Integer; count: Integer): HResult; dispid 114;
    function replaceData(offset: Integer; count: Integer; const data: WideString): HResult; dispid 115;
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMText
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF87-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMText = interface(IXMLDOMCharacterData)
    ['{2933BF87-7B36-11D2-B20E-00C04F983E60}']
    function splitText(offset: Integer; out rightHandTextNode: IXMLDOMText): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMTextDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF87-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMTextDisp = dispinterface
    ['{2933BF87-7B36-11D2-B20E-00C04F983E60}']
    function splitText(offset: Integer; out rightHandTextNode: IXMLDOMText): IXMLDOMText; dispid 123;
    function data(out data: WideString): WideString; dispid 109;
    property length[out dataLength: Integer]: Integer readonly dispid 110;
    function substringData(offset: Integer; count: Integer; out data: WideString): WideString; dispid 111;
    function appendData(const data: WideString): HResult; dispid 112;
    function insertData(offset: Integer; const data: WideString): HResult; dispid 113;
    function deleteData(offset: Integer; count: Integer): HResult; dispid 114;
    function replaceData(offset: Integer; count: Integer; const data: WideString): HResult; dispid 115;
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMComment
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF88-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMComment = interface(IXMLDOMCharacterData)
    ['{2933BF88-7B36-11D2-B20E-00C04F983E60}']
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMCommentDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF88-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMCommentDisp = dispinterface
    ['{2933BF88-7B36-11D2-B20E-00C04F983E60}']
    function data(out data: WideString): WideString; dispid 109;
    property length[out dataLength: Integer]: Integer readonly dispid 110;
    function substringData(offset: Integer; count: Integer; out data: WideString): WideString; dispid 111;
    function appendData(const data: WideString): HResult; dispid 112;
    function insertData(offset: Integer; const data: WideString): HResult; dispid 113;
    function deleteData(offset: Integer; count: Integer): HResult; dispid 114;
    function replaceData(offset: Integer; count: Integer; const data: WideString): HResult; dispid 115;
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMCDATASection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8A-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMCDATASection = interface(IXMLDOMText)
    ['{2933BF8A-7B36-11D2-B20E-00C04F983E60}']
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMCDATASectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8A-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMCDATASectionDisp = dispinterface
    ['{2933BF8A-7B36-11D2-B20E-00C04F983E60}']
    function splitText(offset: Integer; out rightHandTextNode: IXMLDOMText): IXMLDOMText; dispid 123;
    function data(out data: WideString): WideString; dispid 109;
    property length[out dataLength: Integer]: Integer readonly dispid 110;
    function substringData(offset: Integer; count: Integer; out data: WideString): WideString; dispid 111;
    function appendData(const data: WideString): HResult; dispid 112;
    function insertData(offset: Integer; const data: WideString): HResult; dispid 113;
    function deleteData(offset: Integer; count: Integer): HResult; dispid 114;
    function replaceData(offset: Integer; count: Integer; const data: WideString): HResult; dispid 115;
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMProcessingInstruction
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF89-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMProcessingInstruction = interface(IXMLDOMNode)
    ['{2933BF89-7B36-11D2-B20E-00C04F983E60}']
    function Get_target(out name: WideString): HResult; stdcall;
    function Get_data(out value: WideString): HResult; stdcall;
    function Set_data(const value: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMProcessingInstructionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF89-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMProcessingInstructionDisp = dispinterface
    ['{2933BF89-7B36-11D2-B20E-00C04F983E60}']
    property target[out name: WideString]: WideString readonly dispid 127;
    function data(out value: WideString): WideString; dispid 128;
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMEntityReference
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8E-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMEntityReference = interface(IXMLDOMNode)
    ['{2933BF8E-7B36-11D2-B20E-00C04F983E60}']
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMEntityReferenceDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8E-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMEntityReferenceDisp = dispinterface
    ['{2933BF8E-7B36-11D2-B20E-00C04F983E60}']
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMParseError
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA426-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMParseError = interface(IDispatch)
    ['{3EFAA426-272F-11D2-836F-0000F87A7782}']
    function Get_errorCode(out errorCode: Integer): HResult; stdcall;
    function Get_url(out urlString: WideString): HResult; stdcall;
    function Get_reason(out reasonString: WideString): HResult; stdcall;
    function Get_srcText(out sourceString: WideString): HResult; stdcall;
    function Get_line(out lineNumber: Integer): HResult; stdcall;
    function Get_linepos(out linePosition: Integer): HResult; stdcall;
    function Get_filepos(out filePosition: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMParseErrorDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA426-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMParseErrorDisp = dispinterface
    ['{3EFAA426-272F-11D2-836F-0000F87A7782}']
    property errorCode[out errorCode: Integer]: Integer readonly dispid 0; default;
    property url[out urlString: WideString]: WideString readonly dispid 179;
    property reason[out reasonString: WideString]: WideString readonly dispid 180;
    property srcText[out sourceString: WideString]: WideString readonly dispid 181;
    property line[out lineNumber: Integer]: Integer readonly dispid 182;
    property linepos[out linePosition: Integer]: Integer readonly dispid 183;
    property filepos[out filePosition: Integer]: Integer readonly dispid 184;
  end;

// *********************************************************************//
// Interface: IXMLDOMNotation
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8C-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNotation = interface(IXMLDOMNode)
    ['{2933BF8C-7B36-11D2-B20E-00C04F983E60}']
    function Get_publicId(out publicId: OleVariant): HResult; stdcall;
    function Get_systemId(out systemId: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMNotationDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8C-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMNotationDisp = dispinterface
    ['{2933BF8C-7B36-11D2-B20E-00C04F983E60}']
    property publicId[out publicId: OleVariant]: OleVariant readonly dispid 136;
    property systemId[out systemId: OleVariant]: OleVariant readonly dispid 137;
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMEntity
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8D-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMEntity = interface(IXMLDOMNode)
    ['{2933BF8D-7B36-11D2-B20E-00C04F983E60}']
    function Get_publicId(out publicId: OleVariant): HResult; stdcall;
    function Get_systemId(out systemId: OleVariant): HResult; stdcall;
    function Get_notationName(out name: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMEntityDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF8D-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMEntityDisp = dispinterface
    ['{2933BF8D-7B36-11D2-B20E-00C04F983E60}']
    property publicId[out publicId: OleVariant]: OleVariant readonly dispid 140;
    property systemId[out systemId: OleVariant]: OleVariant readonly dispid 141;
    property notationName[out name: WideString]: WideString readonly dispid 142;
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMParseError2
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA428-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMParseError2 = interface(IXMLDOMParseError)
    ['{3EFAA428-272F-11D2-836F-0000F87A7782}']
    function Get_errorXPath(out xpathexpr: WideString): HResult; stdcall;
    function Get_allErrors(out allErrors: IXMLDOMParseErrorCollection): HResult; stdcall;
    function errorParameters(index: Integer; out param: WideString): HResult; stdcall;
    function Get_errorParametersCount(out count: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMParseError2Disp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA428-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMParseError2Disp = dispinterface
    ['{3EFAA428-272F-11D2-836F-0000F87A7782}']
    property errorXPath[out xpathexpr: WideString]: WideString readonly dispid 190;
    property allErrors[out allErrors: IXMLDOMParseErrorCollection]: IXMLDOMParseErrorCollection readonly dispid 187;
    function errorParameters(index: Integer; out param: WideString): WideString; dispid 188;
    property errorParametersCount[out count: Integer]: Integer readonly dispid 189;
    property errorCode[out errorCode: Integer]: Integer readonly dispid 0; default;
    property url[out urlString: WideString]: WideString readonly dispid 179;
    property reason[out reasonString: WideString]: WideString readonly dispid 180;
    property srcText[out sourceString: WideString]: WideString readonly dispid 181;
    property line[out lineNumber: Integer]: Integer readonly dispid 182;
    property linepos[out linePosition: Integer]: Integer readonly dispid 183;
    property filepos[out filePosition: Integer]: Integer readonly dispid 184;
  end;

// *********************************************************************//
// Interface: IXMLDOMParseErrorCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA429-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMParseErrorCollection = interface(IDispatch)
    ['{3EFAA429-272F-11D2-836F-0000F87A7782}']
    function Get_item(index: Integer; out error: IXMLDOMParseError2): HResult; stdcall;
    function Get_length(out length: Integer): HResult; stdcall;
    function Get_next(out error: IXMLDOMParseError2): HResult; stdcall;
    function reset: HResult; stdcall;
    function Get__newEnum(out ppUnk: IUnknown): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMParseErrorCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA429-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXMLDOMParseErrorCollectionDisp = dispinterface
    ['{3EFAA429-272F-11D2-836F-0000F87A7782}']
    property item[index: Integer; out error: IXMLDOMParseError2]: IXMLDOMParseError2 readonly dispid 0;
    property length[out length: Integer]: Integer readonly dispid 193;
    property next[out error: IXMLDOMParseError2]: IXMLDOMParseError2 readonly dispid 194;
    function reset: HResult; dispid 195;
    property _newEnum[out ppUnk: IUnknown]: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IXTLRuntime
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA425-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXTLRuntime = interface(IXMLDOMNode)
    ['{3EFAA425-272F-11D2-836F-0000F87A7782}']
    function uniqueID(const pNode: IXMLDOMNode; out pID: Integer): HResult; stdcall;
    function depth(const pNode: IXMLDOMNode; out pDepth: Integer): HResult; stdcall;
    function childNumber(const pNode: IXMLDOMNode; out pNumber: Integer): HResult; stdcall;
    function ancestorChildNumber(const bstrNodeName: WideString; const pNode: IXMLDOMNode; 
                                 out pNumber: Integer): HResult; stdcall;
    function absoluteChildNumber(const pNode: IXMLDOMNode; out pNumber: Integer): HResult; stdcall;
    function formatIndex(lIndex: Integer; const bstrFormat: WideString; 
                         out pbstrFormattedString: WideString): HResult; stdcall;
    function formatNumber(dblNumber: Double; const bstrFormat: WideString; 
                          out pbstrFormattedString: WideString): HResult; stdcall;
    function formatDate(varDate: OleVariant; const bstrFormat: WideString; 
                        varDestLocale: OleVariant; out pbstrFormattedString: WideString): HResult; stdcall;
    function formatTime(varTime: OleVariant; const bstrFormat: WideString; 
                        varDestLocale: OleVariant; out pbstrFormattedString: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXTLRuntimeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3EFAA425-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  IXTLRuntimeDisp = dispinterface
    ['{3EFAA425-272F-11D2-836F-0000F87A7782}']
    function uniqueID(const pNode: IXMLDOMNode; out pID: Integer): Integer; dispid 187;
    function depth(const pNode: IXMLDOMNode; out pDepth: Integer): Integer; dispid 188;
    function childNumber(const pNode: IXMLDOMNode; out pNumber: Integer): Integer; dispid 189;
    function ancestorChildNumber(const bstrNodeName: WideString; const pNode: IXMLDOMNode; 
                                 out pNumber: Integer): Integer; dispid 190;
    function absoluteChildNumber(const pNode: IXMLDOMNode; out pNumber: Integer): Integer; dispid 191;
    function formatIndex(lIndex: Integer; const bstrFormat: WideString; 
                         out pbstrFormattedString: WideString): WideString; dispid 192;
    function formatNumber(dblNumber: Double; const bstrFormat: WideString; 
                          out pbstrFormattedString: WideString): WideString; dispid 193;
    function formatDate(varDate: OleVariant; const bstrFormat: WideString; 
                        varDestLocale: OleVariant; out pbstrFormattedString: WideString): WideString; dispid 194;
    function formatTime(varTime: OleVariant; const bstrFormat: WideString; 
                        varDestLocale: OleVariant; out pbstrFormattedString: WideString): WideString; dispid 195;
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: ISAXXMLReader
// Flags:     (16) Hidden
// GUID:      {A4F96ED0-F829-476E-81C0-CDC7BD2A0802}
// *********************************************************************//
  ISAXXMLReader = interface(IUnknown)
    ['{A4F96ED0-F829-476E-81C0-CDC7BD2A0802}']
    function getFeature(var pwchName: Word; out pvfValue: WordBool): HResult; stdcall;
    function putFeature(var pwchName: Word; vfValue: WordBool): HResult; stdcall;
    function getProperty(var pwchName: Word; out pvarValue: OleVariant): HResult; stdcall;
    function putProperty(var pwchName: Word; varValue: OleVariant): HResult; stdcall;
    function getEntityResolver(out ppResolver: ISAXEntityResolver): HResult; stdcall;
    function putEntityResolver(const pResolver: ISAXEntityResolver): HResult; stdcall;
    function getContentHandler(out ppHandler: ISAXContentHandler): HResult; stdcall;
    function putContentHandler(const pHandler: ISAXContentHandler): HResult; stdcall;
    function getDTDHandler(out ppHandler: ISAXDTDHandler): HResult; stdcall;
    function putDTDHandler(const pHandler: ISAXDTDHandler): HResult; stdcall;
    function getErrorHandler(out ppHandler: ISAXErrorHandler): HResult; stdcall;
    function putErrorHandler(const pHandler: ISAXErrorHandler): HResult; stdcall;
    function getBaseURL(out ppwchBaseUrl: PWord1): HResult; stdcall;
    function putBaseURL(var pwchBaseUrl: Word): HResult; stdcall;
    function getSecureBaseURL(out ppwchSecureBaseUrl: PWord1): HResult; stdcall;
    function putSecureBaseURL(var pwchSecureBaseUrl: Word): HResult; stdcall;
    function parse(varInput: OleVariant): HResult; stdcall;
    function parseURL(var pwchUrl: Word): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXEntityResolver
// Flags:     (16) Hidden
// GUID:      {99BCA7BD-E8C4-4D5F-A0CF-6D907901FF07}
// *********************************************************************//
  ISAXEntityResolver = interface(IUnknown)
    ['{99BCA7BD-E8C4-4D5F-A0CF-6D907901FF07}']
    function resolveEntity(var pwchPublicId: Word; var pwchSystemId: Word; out pvarInput: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXContentHandler
// Flags:     (16) Hidden
// GUID:      {1545CDFA-9E4E-4497-A8A4-2BF7D0112C44}
// *********************************************************************//
  ISAXContentHandler = interface(IUnknown)
    ['{1545CDFA-9E4E-4497-A8A4-2BF7D0112C44}']
    function putDocumentLocator(const pLocator: ISAXLocator): HResult; stdcall;
    function startDocument: HResult; stdcall;
    function endDocument: HResult; stdcall;
    function startPrefixMapping(var pwchPrefix: Word; cchPrefix: SYSINT; var pwchUri: Word; 
                                cchUri: SYSINT): HResult; stdcall;
    function endPrefixMapping(var pwchPrefix: Word; cchPrefix: SYSINT): HResult; stdcall;
    function startElement(var pwchNamespaceUri: Word; cchNamespaceUri: SYSINT; 
                          var pwchLocalName: Word; cchLocalName: SYSINT; var pwchQName: Word; 
                          cchQName: SYSINT; const pAttributes: ISAXAttributes): HResult; stdcall;
    function endElement(var pwchNamespaceUri: Word; cchNamespaceUri: SYSINT; 
                        var pwchLocalName: Word; cchLocalName: SYSINT; var pwchQName: Word; 
                        cchQName: SYSINT): HResult; stdcall;
    function characters(var pwchChars: Word; cchChars: SYSINT): HResult; stdcall;
    function ignorableWhitespace(var pwchChars: Word; cchChars: SYSINT): HResult; stdcall;
    function processingInstruction(var pwchTarget: Word; cchTarget: SYSINT; var pwchData: Word; 
                                   cchData: SYSINT): HResult; stdcall;
    function skippedEntity(var pwchName: Word; cchName: SYSINT): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXLocator
// Flags:     (16) Hidden
// GUID:      {9B7E472A-0DE4-4640-BFF3-84D38A051C31}
// *********************************************************************//
  ISAXLocator = interface(IUnknown)
    ['{9B7E472A-0DE4-4640-BFF3-84D38A051C31}']
    function getColumnNumber(out pnColumn: SYSINT): HResult; stdcall;
    function getLineNumber(out pnLine: SYSINT): HResult; stdcall;
    function getPublicId(out ppwchPublicId: PWord1): HResult; stdcall;
    function getSystemId(out ppwchSystemId: PWord1): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXAttributes
// Flags:     (16) Hidden
// GUID:      {F078ABE1-45D2-4832-91EA-4466CE2F25C9}
// *********************************************************************//
  ISAXAttributes = interface(IUnknown)
    ['{F078ABE1-45D2-4832-91EA-4466CE2F25C9}']
    function getLength(out pnLength: SYSINT): HResult; stdcall;
    function getURI(nIndex: SYSINT; out ppwchUri: PWord1; out pcchUri: SYSINT): HResult; stdcall;
    function getLocalName(nIndex: SYSINT; out ppwchLocalName: PWord1; out pcchLocalName: SYSINT): HResult; stdcall;
    function getQName(nIndex: SYSINT; out ppwchQName: PWord1; out pcchQName: SYSINT): HResult; stdcall;
    function getName(nIndex: SYSINT; out ppwchUri: PWord1; out pcchUri: SYSINT; 
                     out ppwchLocalName: PWord1; out pcchLocalName: SYSINT; out ppwchQName: PWord1; 
                     out pcchQName: SYSINT): HResult; stdcall;
    function getIndexFromName(var pwchUri: Word; cchUri: SYSINT; var pwchLocalName: Word; 
                              cchLocalName: SYSINT; out pnIndex: SYSINT): HResult; stdcall;
    function getIndexFromQName(var pwchQName: Word; cchQName: SYSINT; out pnIndex: SYSINT): HResult; stdcall;
    function getType(nIndex: SYSINT; out ppwchType: PWord1; out pcchType: SYSINT): HResult; stdcall;
    function getTypeFromName(var pwchUri: Word; cchUri: SYSINT; var pwchLocalName: Word; 
                             cchLocalName: SYSINT; out ppwchType: PWord1; out pcchType: SYSINT): HResult; stdcall;
    function getTypeFromQName(var pwchQName: Word; cchQName: SYSINT; out ppwchType: PWord1; 
                              out pcchType: SYSINT): HResult; stdcall;
    function getValue(nIndex: SYSINT; out ppwchValue: PWord1; out pcchValue: SYSINT): HResult; stdcall;
    function getValueFromName(var pwchUri: Word; cchUri: SYSINT; var pwchLocalName: Word; 
                              cchLocalName: SYSINT; out ppwchValue: PWord1; out pcchValue: SYSINT): HResult; stdcall;
    function getValueFromQName(var pwchQName: Word; cchQName: SYSINT; out ppwchValue: PWord1; 
                               out pcchValue: SYSINT): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXDTDHandler
// Flags:     (16) Hidden
// GUID:      {E15C1BAF-AFB3-4D60-8C36-19A8C45DEFED}
// *********************************************************************//
  ISAXDTDHandler = interface(IUnknown)
    ['{E15C1BAF-AFB3-4D60-8C36-19A8C45DEFED}']
    function notationDecl(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; 
                          cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT): HResult; stdcall;
    function unparsedEntityDecl(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; 
                                cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT; 
                                var pwchNotationName: Word; cchNotationName: SYSINT): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXErrorHandler
// Flags:     (16) Hidden
// GUID:      {A60511C4-CCF5-479E-98A3-DC8DC545B7D0}
// *********************************************************************//
  ISAXErrorHandler = interface(IUnknown)
    ['{A60511C4-CCF5-479E-98A3-DC8DC545B7D0}']
    function error(const pLocator: ISAXLocator; var pwchErrorMessage: Word; hrErrorCode: HResult): HResult; stdcall;
    function fatalError(const pLocator: ISAXLocator; var pwchErrorMessage: Word; 
                        hrErrorCode: HResult): HResult; stdcall;
    function ignorableWarning(const pLocator: ISAXLocator; var pwchErrorMessage: Word; 
                              hrErrorCode: HResult): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXXMLFilter
// Flags:     (16) Hidden
// GUID:      {70409222-CA09-4475-ACB8-40312FE8D145}
// *********************************************************************//
  ISAXXMLFilter = interface(ISAXXMLReader)
    ['{70409222-CA09-4475-ACB8-40312FE8D145}']
    function getParent(out ppReader: ISAXXMLReader): HResult; stdcall;
    function putParent(const pReader: ISAXXMLReader): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IVBSAXXMLFilter
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {1299EB1B-5B88-433E-82DE-82CA75AD4E04}
// *********************************************************************//
  IVBSAXXMLFilter = interface(IDispatch)
    ['{1299EB1B-5B88-433E-82DE-82CA75AD4E04}']
    function Get_parent(out oReader: IVBSAXXMLReader): HResult; stdcall;
    function _Set_parent(const oReader: IVBSAXXMLReader): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXXMLFilterDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {1299EB1B-5B88-433E-82DE-82CA75AD4E04}
// *********************************************************************//
  IVBSAXXMLFilterDisp = dispinterface
    ['{1299EB1B-5B88-433E-82DE-82CA75AD4E04}']
    function parent(out oReader: IVBSAXXMLReader): IVBSAXXMLReader; dispid 1309;
  end;

// *********************************************************************//
// Interface: IVBSAXXMLReader
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {8C033CAA-6CD6-4F73-B728-4531AF74945F}
// *********************************************************************//
  IVBSAXXMLReader = interface(IDispatch)
    ['{8C033CAA-6CD6-4F73-B728-4531AF74945F}']
    function getFeature(const strName: WideString; out fValue: WordBool): HResult; stdcall;
    function putFeature(const strName: WideString; fValue: WordBool): HResult; stdcall;
    function getProperty(const strName: WideString; out varValue: OleVariant): HResult; stdcall;
    function putProperty(const strName: WideString; varValue: OleVariant): HResult; stdcall;
    function Get_entityResolver(out oResolver: IVBSAXEntityResolver): HResult; stdcall;
    function _Set_entityResolver(const oResolver: IVBSAXEntityResolver): HResult; stdcall;
    function Get_contentHandler(out oHandler: IVBSAXContentHandler): HResult; stdcall;
    function _Set_contentHandler(const oHandler: IVBSAXContentHandler): HResult; stdcall;
    function Get_dtdHandler(out oHandler: IVBSAXDTDHandler): HResult; stdcall;
    function _Set_dtdHandler(const oHandler: IVBSAXDTDHandler): HResult; stdcall;
    function Get_errorHandler(out oHandler: IVBSAXErrorHandler): HResult; stdcall;
    function _Set_errorHandler(const oHandler: IVBSAXErrorHandler): HResult; stdcall;
    function Get_baseURL(out strBaseURL: WideString): HResult; stdcall;
    function Set_baseURL(const strBaseURL: WideString): HResult; stdcall;
    function Get_secureBaseURL(out strSecureBaseURL: WideString): HResult; stdcall;
    function Set_secureBaseURL(const strSecureBaseURL: WideString): HResult; stdcall;
    function parse(varInput: OleVariant): HResult; stdcall;
    function parseURL(const strURL: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXXMLReaderDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {8C033CAA-6CD6-4F73-B728-4531AF74945F}
// *********************************************************************//
  IVBSAXXMLReaderDisp = dispinterface
    ['{8C033CAA-6CD6-4F73-B728-4531AF74945F}']
    function getFeature(const strName: WideString; out fValue: WordBool): WordBool; dispid 1282;
    function putFeature(const strName: WideString; fValue: WordBool): HResult; dispid 1283;
    function getProperty(const strName: WideString; out varValue: OleVariant): OleVariant; dispid 1284;
    function putProperty(const strName: WideString; varValue: OleVariant): HResult; dispid 1285;
    function entityResolver(out oResolver: IVBSAXEntityResolver): IVBSAXEntityResolver; dispid 1286;
    function contentHandler(out oHandler: IVBSAXContentHandler): IVBSAXContentHandler; dispid 1287;
    function dtdHandler(out oHandler: IVBSAXDTDHandler): IVBSAXDTDHandler; dispid 1288;
    function errorHandler(out oHandler: IVBSAXErrorHandler): IVBSAXErrorHandler; dispid 1289;
    function baseURL(out strBaseURL: WideString): WideString; dispid 1290;
    function secureBaseURL(out strSecureBaseURL: WideString): WideString; dispid 1291;
    function parse(varInput: OleVariant): HResult; dispid 1292;
    function parseURL(const strURL: WideString): HResult; dispid 1293;
  end;

// *********************************************************************//
// Interface: IVBSAXEntityResolver
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}
// *********************************************************************//
  IVBSAXEntityResolver = interface(IDispatch)
    ['{0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}']
    function resolveEntity(var strPublicId: WideString; var strSystemId: WideString; 
                           out varInput: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXEntityResolverDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}
// *********************************************************************//
  IVBSAXEntityResolverDisp = dispinterface
    ['{0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}']
    function resolveEntity(var strPublicId: WideString; var strSystemId: WideString; 
                           out varInput: OleVariant): OleVariant; dispid 1319;
  end;

// *********************************************************************//
// Interface: IVBSAXContentHandler
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}
// *********************************************************************//
  IVBSAXContentHandler = interface(IDispatch)
    ['{2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}']
    function _Set_documentLocator(const Param1: IVBSAXLocator): HResult; stdcall;
    function startDocument: HResult; stdcall;
    function endDocument: HResult; stdcall;
    function startPrefixMapping(var strPrefix: WideString; var strURI: WideString): HResult; stdcall;
    function endPrefixMapping(var strPrefix: WideString): HResult; stdcall;
    function startElement(var strNamespaceURI: WideString; var strLocalName: WideString; 
                          var strQName: WideString; const oAttributes: IVBSAXAttributes): HResult; stdcall;
    function endElement(var strNamespaceURI: WideString; var strLocalName: WideString; 
                        var strQName: WideString): HResult; stdcall;
    function characters(var strChars: WideString): HResult; stdcall;
    function ignorableWhitespace(var strChars: WideString): HResult; stdcall;
    function processingInstruction(var strTarget: WideString; var strData: WideString): HResult; stdcall;
    function skippedEntity(var strName: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXContentHandlerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}
// *********************************************************************//
  IVBSAXContentHandlerDisp = dispinterface
    ['{2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}']
    property documentLocator: HResult writeonly dispid 1322;
    function startDocument: HResult; dispid 1323;
    function endDocument: HResult; dispid 1324;
    function startPrefixMapping(var strPrefix: WideString; var strURI: WideString): HResult; dispid 1325;
    function endPrefixMapping(var strPrefix: WideString): HResult; dispid 1326;
    function startElement(var strNamespaceURI: WideString; var strLocalName: WideString; 
                          var strQName: WideString; const oAttributes: IVBSAXAttributes): HResult; dispid 1327;
    function endElement(var strNamespaceURI: WideString; var strLocalName: WideString; 
                        var strQName: WideString): HResult; dispid 1328;
    function characters(var strChars: WideString): HResult; dispid 1329;
    function ignorableWhitespace(var strChars: WideString): HResult; dispid 1330;
    function processingInstruction(var strTarget: WideString; var strData: WideString): HResult; dispid 1331;
    function skippedEntity(var strName: WideString): HResult; dispid 1332;
  end;

// *********************************************************************//
// Interface: IVBSAXLocator
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}
// *********************************************************************//
  IVBSAXLocator = interface(IDispatch)
    ['{796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}']
    function Get_columnNumber(out nColumn: SYSINT): HResult; stdcall;
    function Get_lineNumber(out nLine: SYSINT): HResult; stdcall;
    function Get_publicId(out strPublicId: WideString): HResult; stdcall;
    function Get_systemId(out strSystemId: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXLocatorDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}
// *********************************************************************//
  IVBSAXLocatorDisp = dispinterface
    ['{796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}']
    property columnNumber[out nColumn: SYSINT]: SYSINT readonly dispid 1313;
    property lineNumber[out nLine: SYSINT]: SYSINT readonly dispid 1314;
    property publicId[out strPublicId: WideString]: WideString readonly dispid 1315;
    property systemId[out strSystemId: WideString]: WideString readonly dispid 1316;
  end;

// *********************************************************************//
// Interface: IVBSAXAttributes
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}
// *********************************************************************//
  IVBSAXAttributes = interface(IDispatch)
    ['{10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}']
    function Get_length(out nLength: SYSINT): HResult; stdcall;
    function getURI(nIndex: SYSINT; out strURI: WideString): HResult; stdcall;
    function getLocalName(nIndex: SYSINT; out strLocalName: WideString): HResult; stdcall;
    function getQName(nIndex: SYSINT; out strQName: WideString): HResult; stdcall;
    function getIndexFromName(const strURI: WideString; const strLocalName: WideString; 
                              out nIndex: SYSINT): HResult; stdcall;
    function getIndexFromQName(const strQName: WideString; out nIndex: SYSINT): HResult; stdcall;
    function getType(nIndex: SYSINT; out strType: WideString): HResult; stdcall;
    function getTypeFromName(const strURI: WideString; const strLocalName: WideString; 
                             out strType: WideString): HResult; stdcall;
    function getTypeFromQName(const strQName: WideString; out strType: WideString): HResult; stdcall;
    function getValue(nIndex: SYSINT; out strValue: WideString): HResult; stdcall;
    function getValueFromName(const strURI: WideString; const strLocalName: WideString; 
                              out strValue: WideString): HResult; stdcall;
    function getValueFromQName(const strQName: WideString; out strValue: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXAttributesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}
// *********************************************************************//
  IVBSAXAttributesDisp = dispinterface
    ['{10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}']
    property length[out nLength: SYSINT]: SYSINT readonly dispid 1344;
    function getURI(nIndex: SYSINT; out strURI: WideString): WideString; dispid 1345;
    function getLocalName(nIndex: SYSINT; out strLocalName: WideString): WideString; dispid 1346;
    function getQName(nIndex: SYSINT; out strQName: WideString): WideString; dispid 1347;
    function getIndexFromName(const strURI: WideString; const strLocalName: WideString; 
                              out nIndex: SYSINT): SYSINT; dispid 1348;
    function getIndexFromQName(const strQName: WideString; out nIndex: SYSINT): SYSINT; dispid 1349;
    function getType(nIndex: SYSINT; out strType: WideString): WideString; dispid 1350;
    function getTypeFromName(const strURI: WideString; const strLocalName: WideString; 
                             out strType: WideString): WideString; dispid 1351;
    function getTypeFromQName(const strQName: WideString; out strType: WideString): WideString; dispid 1352;
    function getValue(nIndex: SYSINT; out strValue: WideString): WideString; dispid 1353;
    function getValueFromName(const strURI: WideString; const strLocalName: WideString; 
                              out strValue: WideString): WideString; dispid 1354;
    function getValueFromQName(const strQName: WideString; out strValue: WideString): WideString; dispid 1355;
  end;

// *********************************************************************//
// Interface: IVBSAXDTDHandler
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {24FB3297-302D-4620-BA39-3A732D850558}
// *********************************************************************//
  IVBSAXDTDHandler = interface(IDispatch)
    ['{24FB3297-302D-4620-BA39-3A732D850558}']
    function notationDecl(var strName: WideString; var strPublicId: WideString; 
                          var strSystemId: WideString): HResult; stdcall;
    function unparsedEntityDecl(var strName: WideString; var strPublicId: WideString; 
                                var strSystemId: WideString; var strNotationName: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXDTDHandlerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {24FB3297-302D-4620-BA39-3A732D850558}
// *********************************************************************//
  IVBSAXDTDHandlerDisp = dispinterface
    ['{24FB3297-302D-4620-BA39-3A732D850558}']
    function notationDecl(var strName: WideString; var strPublicId: WideString; 
                          var strSystemId: WideString): HResult; dispid 1335;
    function unparsedEntityDecl(var strName: WideString; var strPublicId: WideString; 
                                var strSystemId: WideString; var strNotationName: WideString): HResult; dispid 1336;
  end;

// *********************************************************************//
// Interface: IVBSAXErrorHandler
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {D963D3FE-173C-4862-9095-B92F66995F52}
// *********************************************************************//
  IVBSAXErrorHandler = interface(IDispatch)
    ['{D963D3FE-173C-4862-9095-B92F66995F52}']
    function error(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; 
                   nErrorCode: Integer): HResult; stdcall;
    function fatalError(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; 
                        nErrorCode: Integer): HResult; stdcall;
    function ignorableWarning(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; 
                              nErrorCode: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXErrorHandlerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {D963D3FE-173C-4862-9095-B92F66995F52}
// *********************************************************************//
  IVBSAXErrorHandlerDisp = dispinterface
    ['{D963D3FE-173C-4862-9095-B92F66995F52}']
    function error(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; 
                   nErrorCode: Integer): HResult; dispid 1339;
    function fatalError(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; 
                        nErrorCode: Integer): HResult; dispid 1340;
    function ignorableWarning(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; 
                              nErrorCode: Integer): HResult; dispid 1341;
  end;

// *********************************************************************//
// Interface: IMXReaderControl
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {808F4E35-8D5A-4FBE-8466-33A41279ED30}
// *********************************************************************//
  IMXReaderControl = interface(IDispatch)
    ['{808F4E35-8D5A-4FBE-8466-33A41279ED30}']
    function abort: HResult; stdcall;
    function resume: HResult; stdcall;
    function suspend: HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IMXReaderControlDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {808F4E35-8D5A-4FBE-8466-33A41279ED30}
// *********************************************************************//
  IMXReaderControlDisp = dispinterface
    ['{808F4E35-8D5A-4FBE-8466-33A41279ED30}']
    function abort: HResult; dispid 1398;
    function resume: HResult; dispid 1399;
    function suspend: HResult; dispid 1400;
  end;

// *********************************************************************//
// Interface: IMXSchemaDeclHandler
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}
// *********************************************************************//
  IMXSchemaDeclHandler = interface(IDispatch)
    ['{FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}']
    function schemaElementDecl(const oSchemaElement: ISchemaElement): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IMXSchemaDeclHandlerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}
// *********************************************************************//
  IMXSchemaDeclHandlerDisp = dispinterface
    ['{FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}']
    function schemaElementDecl(const oSchemaElement: ISchemaElement): HResult; dispid 1403;
  end;

// *********************************************************************//
// Interface: ISchemaItem
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaItem = interface(IDispatch)
    ['{50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_name(out name: WideString): HResult; stdcall;
    function Get_namespaceURI(out namespaceURI: WideString): HResult; stdcall;
    function Get_schema(out schema: ISchema): HResult; stdcall;
    function Get_id(out id: WideString): HResult; stdcall;
    function Get_itemType(out itemType: SOMITEMTYPE): HResult; stdcall;
    function Get_unhandledAttributes(out attributes: IVBSAXAttributes): HResult; stdcall;
    function writeAnnotation(const annotationSink: IUnknown; out isWritten: WordBool): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ISchemaItemDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaItemDisp = dispinterface
    ['{50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}']
    property name[out name: WideString]: WideString readonly dispid 1457;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 1459;
    property schema[out schema: ISchema]: ISchema readonly dispid 1467;
    property id[out id: WideString]: WideString readonly dispid 1440;
    property itemType[out itemType: SOMITEMTYPE]: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes[out attributes: IVBSAXAttributes]: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown; out isWritten: WordBool): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaParticle
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaParticle = interface(ISchemaItem)
    ['{50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_minOccurs(out minOccurs: OleVariant): HResult; stdcall;
    function Get_maxOccurs(out maxOccurs: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ISchemaParticleDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaParticleDisp = dispinterface
    ['{50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}']
    property minOccurs[out minOccurs: OleVariant]: OleVariant readonly dispid 1455;
    property maxOccurs[out maxOccurs: OleVariant]: OleVariant readonly dispid 1451;
    property name[out name: WideString]: WideString readonly dispid 1457;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 1459;
    property schema[out schema: ISchema]: ISchema readonly dispid 1467;
    property id[out id: WideString]: WideString readonly dispid 1440;
    property itemType[out itemType: SOMITEMTYPE]: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes[out attributes: IVBSAXAttributes]: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown; out isWritten: WordBool): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaElement
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaElement = interface(ISchemaParticle)
    ['{50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_type_(out type_: ISchemaType): HResult; stdcall;
    function Get_scope(out scope: ISchemaComplexType): HResult; stdcall;
    function Get_defaultValue(out defaultValue: WideString): HResult; stdcall;
    function Get_fixedValue(out fixedValue: WideString): HResult; stdcall;
    function Get_isNillable(out nillable: WordBool): HResult; stdcall;
    function Get_identityConstraints(out constraints: ISchemaItemCollection): HResult; stdcall;
    function Get_substitutionGroup(out element: ISchemaElement): HResult; stdcall;
    function Get_substitutionGroupExclusions(out exclusions: SCHEMADERIVATIONMETHOD): HResult; stdcall;
    function Get_disallowedSubstitutions(out disallowed: SCHEMADERIVATIONMETHOD): HResult; stdcall;
    function Get_isAbstract(out abstract: WordBool): HResult; stdcall;
    function Get_isReference(out reference: WordBool): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ISchemaElementDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaElementDisp = dispinterface
    ['{50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}']
    property type_[out type_: ISchemaType]: ISchemaType readonly dispid 1476;
    property scope[out scope: ISchemaComplexType]: ISchemaComplexType readonly dispid 1469;
    property defaultValue[out defaultValue: WideString]: WideString readonly dispid 1431;
    property fixedValue[out fixedValue: WideString]: WideString readonly dispid 1438;
    property isNillable[out nillable: WordBool]: WordBool readonly dispid 1443;
    property identityConstraints[out constraints: ISchemaItemCollection]: ISchemaItemCollection readonly dispid 1441;
    property substitutionGroup[out element: ISchemaElement]: ISchemaElement readonly dispid 1471;
    property substitutionGroupExclusions[out exclusions: SCHEMADERIVATIONMETHOD]: SCHEMADERIVATIONMETHOD readonly dispid 1472;
    property disallowedSubstitutions[out disallowed: SCHEMADERIVATIONMETHOD]: SCHEMADERIVATIONMETHOD readonly dispid 1433;
    property isAbstract[out abstract: WordBool]: WordBool readonly dispid 1442;
    property isReference[out reference: WordBool]: WordBool readonly dispid 1444;
    property minOccurs[out minOccurs: OleVariant]: OleVariant readonly dispid 1455;
    property maxOccurs[out maxOccurs: OleVariant]: OleVariant readonly dispid 1451;
    property name[out name: WideString]: WideString readonly dispid 1457;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 1459;
    property schema[out schema: ISchema]: ISchema readonly dispid 1467;
    property id[out id: WideString]: WideString readonly dispid 1440;
    property itemType[out itemType: SOMITEMTYPE]: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes[out attributes: IVBSAXAttributes]: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown; out isWritten: WordBool): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchema
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchema = interface(ISchemaItem)
    ['{50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_targetNamespace(out targetNamespace: WideString): HResult; stdcall;
    function Get_version(out version: WideString): HResult; stdcall;
    function Get_types(out types: ISchemaItemCollection): HResult; stdcall;
    function Get_elements(out elements: ISchemaItemCollection): HResult; stdcall;
    function Get_attributes(out attributes: ISchemaItemCollection): HResult; stdcall;
    function Get_attributeGroups(out attributeGroups: ISchemaItemCollection): HResult; stdcall;
    function Get_modelGroups(out modelGroups: ISchemaItemCollection): HResult; stdcall;
    function Get_notations(out notations: ISchemaItemCollection): HResult; stdcall;
    function Get_schemaLocations(out schemaLocations: ISchemaStringCollection): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ISchemaDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaDisp = dispinterface
    ['{50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}']
    property targetNamespace[out targetNamespace: WideString]: WideString readonly dispid 1474;
    property version[out version: WideString]: WideString readonly dispid 1481;
    property types[out types: ISchemaItemCollection]: ISchemaItemCollection readonly dispid 1477;
    property elements[out elements: ISchemaItemCollection]: ISchemaItemCollection readonly dispid 1434;
    property attributes[out attributes: ISchemaItemCollection]: ISchemaItemCollection readonly dispid 1427;
    property attributeGroups[out attributeGroups: ISchemaItemCollection]: ISchemaItemCollection readonly dispid 1426;
    property modelGroups[out modelGroups: ISchemaItemCollection]: ISchemaItemCollection readonly dispid 1456;
    property notations[out notations: ISchemaItemCollection]: ISchemaItemCollection readonly dispid 1460;
    property schemaLocations[out schemaLocations: ISchemaStringCollection]: ISchemaStringCollection readonly dispid 1468;
    property name[out name: WideString]: WideString readonly dispid 1457;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 1459;
    property schema[out schema: ISchema]: ISchema readonly dispid 1467;
    property id[out id: WideString]: WideString readonly dispid 1440;
    property itemType[out itemType: SOMITEMTYPE]: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes[out attributes: IVBSAXAttributes]: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown; out isWritten: WordBool): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaItemCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaItemCollection = interface(IDispatch)
    ['{50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_item(index: Integer; out item: ISchemaItem): HResult; stdcall;
    function itemByName(const name: WideString; out item: ISchemaItem): HResult; stdcall;
    function itemByQName(const name: WideString; const namespaceURI: WideString; 
                         out item: ISchemaItem): HResult; stdcall;
    function Get_length(out length: Integer): HResult; stdcall;
    function Get__newEnum(out ppUnk: IUnknown): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ISchemaItemCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaItemCollectionDisp = dispinterface
    ['{50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}']
    property item[index: Integer; out item: ISchemaItem]: ISchemaItem readonly dispid 0;
    function itemByName(const name: WideString; out item: ISchemaItem): ISchemaItem; dispid 1423;
    function itemByQName(const name: WideString; const namespaceURI: WideString; 
                         out item: ISchemaItem): ISchemaItem; dispid 1424;
    property length[out length: Integer]: Integer readonly dispid 1447;
    property _newEnum[out ppUnk: IUnknown]: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: ISchemaStringCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaStringCollection = interface(IDispatch)
    ['{50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_item(index: Integer; out bstr: WideString): HResult; stdcall;
    function Get_length(out length: Integer): HResult; stdcall;
    function Get__newEnum(out ppUnk: IUnknown): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ISchemaStringCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaStringCollectionDisp = dispinterface
    ['{50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}']
    property item[index: Integer; out bstr: WideString]: WideString readonly dispid 0;
    property length[out length: Integer]: Integer readonly dispid 1447;
    property _newEnum[out ppUnk: IUnknown]: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: ISchemaType
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaType = interface(ISchemaItem)
    ['{50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_baseTypes(out baseTypes: ISchemaItemCollection): HResult; stdcall;
    function Get_final(out final: SCHEMADERIVATIONMETHOD): HResult; stdcall;
    function Get_variety(out variety: SCHEMATYPEVARIETY): HResult; stdcall;
    function Get_derivedBy(out derivedBy: SCHEMADERIVATIONMETHOD): HResult; stdcall;
    function isValid(const data: WideString; out valid: WordBool): HResult; stdcall;
    function Get_minExclusive(out minExclusive: WideString): HResult; stdcall;
    function Get_minInclusive(out minInclusive: WideString): HResult; stdcall;
    function Get_maxExclusive(out maxExclusive: WideString): HResult; stdcall;
    function Get_maxInclusive(out maxInclusive: WideString): HResult; stdcall;
    function Get_totalDigits(out totalDigits: OleVariant): HResult; stdcall;
    function Get_fractionDigits(out fractionDigits: OleVariant): HResult; stdcall;
    function Get_length(out length: OleVariant): HResult; stdcall;
    function Get_minLength(out minLength: OleVariant): HResult; stdcall;
    function Get_maxLength(out maxLength: OleVariant): HResult; stdcall;
    function Get_enumeration(out enumeration: ISchemaStringCollection): HResult; stdcall;
    function Get_whitespace(out whitespace: SCHEMAWHITESPACE): HResult; stdcall;
    function Get_patterns(out patterns: ISchemaStringCollection): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ISchemaTypeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaTypeDisp = dispinterface
    ['{50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}']
    property baseTypes[out baseTypes: ISchemaItemCollection]: ISchemaItemCollection readonly dispid 1428;
    property final[out final: SCHEMADERIVATIONMETHOD]: SCHEMADERIVATIONMETHOD readonly dispid 1437;
    property variety[out variety: SCHEMATYPEVARIETY]: SCHEMATYPEVARIETY readonly dispid 1480;
    property derivedBy[out derivedBy: SCHEMADERIVATIONMETHOD]: SCHEMADERIVATIONMETHOD readonly dispid 1432;
    function isValid(const data: WideString; out valid: WordBool): WordBool; dispid 1445;
    property minExclusive[out minExclusive: WideString]: WideString readonly dispid 1452;
    property minInclusive[out minInclusive: WideString]: WideString readonly dispid 1453;
    property maxExclusive[out maxExclusive: WideString]: WideString readonly dispid 1448;
    property maxInclusive[out maxInclusive: WideString]: WideString readonly dispid 1449;
    property totalDigits[out totalDigits: OleVariant]: OleVariant readonly dispid 1475;
    property fractionDigits[out fractionDigits: OleVariant]: OleVariant readonly dispid 1439;
    property length[out length: OleVariant]: OleVariant readonly dispid 1447;
    property minLength[out minLength: OleVariant]: OleVariant readonly dispid 1454;
    property maxLength[out maxLength: OleVariant]: OleVariant readonly dispid 1450;
    property enumeration[out enumeration: ISchemaStringCollection]: ISchemaStringCollection readonly dispid 1435;
    property whitespace[out whitespace: SCHEMAWHITESPACE]: SCHEMAWHITESPACE readonly dispid 1482;
    property patterns[out patterns: ISchemaStringCollection]: ISchemaStringCollection readonly dispid 1462;
    property name[out name: WideString]: WideString readonly dispid 1457;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 1459;
    property schema[out schema: ISchema]: ISchema readonly dispid 1467;
    property id[out id: WideString]: WideString readonly dispid 1440;
    property itemType[out itemType: SOMITEMTYPE]: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes[out attributes: IVBSAXAttributes]: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown; out isWritten: WordBool): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaComplexType
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaComplexType = interface(ISchemaType)
    ['{50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_isAbstract(out abstract: WordBool): HResult; stdcall;
    function Get_anyAttribute(out anyAttribute: ISchemaAny): HResult; stdcall;
    function Get_attributes(out attributes: ISchemaItemCollection): HResult; stdcall;
    function Get_contentType(out contentType: SCHEMACONTENTTYPE): HResult; stdcall;
    function Get_contentModel(out contentModel: ISchemaModelGroup): HResult; stdcall;
    function Get_prohibitedSubstitutions(out prohibited: SCHEMADERIVATIONMETHOD): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ISchemaComplexTypeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaComplexTypeDisp = dispinterface
    ['{50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}']
    property isAbstract[out abstract: WordBool]: WordBool readonly dispid 1442;
    property anyAttribute[out anyAttribute: ISchemaAny]: ISchemaAny readonly dispid 1425;
    property attributes[out attributes: ISchemaItemCollection]: ISchemaItemCollection readonly dispid 1427;
    property contentType[out contentType: SCHEMACONTENTTYPE]: SCHEMACONTENTTYPE readonly dispid 1430;
    property contentModel[out contentModel: ISchemaModelGroup]: ISchemaModelGroup readonly dispid 1429;
    property prohibitedSubstitutions[out prohibited: SCHEMADERIVATIONMETHOD]: SCHEMADERIVATIONMETHOD readonly dispid 1464;
    property baseTypes[out baseTypes: ISchemaItemCollection]: ISchemaItemCollection readonly dispid 1428;
    property final[out final: SCHEMADERIVATIONMETHOD]: SCHEMADERIVATIONMETHOD readonly dispid 1437;
    property variety[out variety: SCHEMATYPEVARIETY]: SCHEMATYPEVARIETY readonly dispid 1480;
    property derivedBy[out derivedBy: SCHEMADERIVATIONMETHOD]: SCHEMADERIVATIONMETHOD readonly dispid 1432;
    function isValid(const data: WideString; out valid: WordBool): WordBool; dispid 1445;
    property minExclusive[out minExclusive: WideString]: WideString readonly dispid 1452;
    property minInclusive[out minInclusive: WideString]: WideString readonly dispid 1453;
    property maxExclusive[out maxExclusive: WideString]: WideString readonly dispid 1448;
    property maxInclusive[out maxInclusive: WideString]: WideString readonly dispid 1449;
    property totalDigits[out totalDigits: OleVariant]: OleVariant readonly dispid 1475;
    property fractionDigits[out fractionDigits: OleVariant]: OleVariant readonly dispid 1439;
    property length[out length: OleVariant]: OleVariant readonly dispid 1447;
    property minLength[out minLength: OleVariant]: OleVariant readonly dispid 1454;
    property maxLength[out maxLength: OleVariant]: OleVariant readonly dispid 1450;
    property enumeration[out enumeration: ISchemaStringCollection]: ISchemaStringCollection readonly dispid 1435;
    property whitespace[out whitespace: SCHEMAWHITESPACE]: SCHEMAWHITESPACE readonly dispid 1482;
    property patterns[out patterns: ISchemaStringCollection]: ISchemaStringCollection readonly dispid 1462;
    property name[out name: WideString]: WideString readonly dispid 1457;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 1459;
    property schema[out schema: ISchema]: ISchema readonly dispid 1467;
    property id[out id: WideString]: WideString readonly dispid 1440;
    property itemType[out itemType: SOMITEMTYPE]: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes[out attributes: IVBSAXAttributes]: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown; out isWritten: WordBool): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaAny
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaAny = interface(ISchemaParticle)
    ['{50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_namespaces(out namespaces: ISchemaStringCollection): HResult; stdcall;
    function Get_processContents(out processContents: SCHEMAPROCESSCONTENTS): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ISchemaAnyDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaAnyDisp = dispinterface
    ['{50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}']
    property namespaces[out namespaces: ISchemaStringCollection]: ISchemaStringCollection readonly dispid 1458;
    property processContents[out processContents: SCHEMAPROCESSCONTENTS]: SCHEMAPROCESSCONTENTS readonly dispid 1463;
    property minOccurs[out minOccurs: OleVariant]: OleVariant readonly dispid 1455;
    property maxOccurs[out maxOccurs: OleVariant]: OleVariant readonly dispid 1451;
    property name[out name: WideString]: WideString readonly dispid 1457;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 1459;
    property schema[out schema: ISchema]: ISchema readonly dispid 1467;
    property id[out id: WideString]: WideString readonly dispid 1440;
    property itemType[out itemType: SOMITEMTYPE]: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes[out attributes: IVBSAXAttributes]: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown; out isWritten: WordBool): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaModelGroup
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaModelGroup = interface(ISchemaParticle)
    ['{50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_particles(out particles: ISchemaItemCollection): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ISchemaModelGroupDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaModelGroupDisp = dispinterface
    ['{50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}']
    property particles[out particles: ISchemaItemCollection]: ISchemaItemCollection readonly dispid 1461;
    property minOccurs[out minOccurs: OleVariant]: OleVariant readonly dispid 1455;
    property maxOccurs[out maxOccurs: OleVariant]: OleVariant readonly dispid 1451;
    property name[out name: WideString]: WideString readonly dispid 1457;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 1459;
    property schema[out schema: ISchema]: ISchema readonly dispid 1467;
    property id[out id: WideString]: WideString readonly dispid 1440;
    property itemType[out itemType: SOMITEMTYPE]: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes[out attributes: IVBSAXAttributes]: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown; out isWritten: WordBool): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: IMXXMLFilter
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C90352F7-643C-4FBC-BB23-E996EB2D51FD}
// *********************************************************************//
  IMXXMLFilter = interface(IDispatch)
    ['{C90352F7-643C-4FBC-BB23-E996EB2D51FD}']
    function getFeature(const strName: WideString; out fValue: WordBool): HResult; stdcall;
    function putFeature(const strName: WideString; fValue: WordBool): HResult; stdcall;
    function getProperty(const strName: WideString; out varValue: OleVariant): HResult; stdcall;
    function putProperty(const strName: WideString; varValue: OleVariant): HResult; stdcall;
    function Get_entityResolver(out oResolver: IUnknown): HResult; stdcall;
    function _Set_entityResolver(const oResolver: IUnknown): HResult; stdcall;
    function Get_contentHandler(out oHandler: IUnknown): HResult; stdcall;
    function _Set_contentHandler(const oHandler: IUnknown): HResult; stdcall;
    function Get_dtdHandler(out oHandler: IUnknown): HResult; stdcall;
    function _Set_dtdHandler(const oHandler: IUnknown): HResult; stdcall;
    function Get_errorHandler(out oHandler: IUnknown): HResult; stdcall;
    function _Set_errorHandler(const oHandler: IUnknown): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IMXXMLFilterDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C90352F7-643C-4FBC-BB23-E996EB2D51FD}
// *********************************************************************//
  IMXXMLFilterDisp = dispinterface
    ['{C90352F7-643C-4FBC-BB23-E996EB2D51FD}']
    function getFeature(const strName: WideString; out fValue: WordBool): WordBool; dispid 1423;
    function putFeature(const strName: WideString; fValue: WordBool): HResult; dispid 1425;
    function getProperty(const strName: WideString; out varValue: OleVariant): OleVariant; dispid 1424;
    function putProperty(const strName: WideString; varValue: OleVariant): HResult; dispid 1426;
    function entityResolver(out oResolver: IUnknown): IUnknown; dispid 1421;
    function contentHandler(out oHandler: IUnknown): IUnknown; dispid 1419;
    function dtdHandler(out oHandler: IUnknown): IUnknown; dispid 1420;
    function errorHandler(out oHandler: IUnknown): IUnknown; dispid 1422;
  end;

// *********************************************************************//
// Interface: ISchemaAttribute
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaAttribute = interface(ISchemaItem)
    ['{50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_type_(out type_: ISchemaType): HResult; stdcall;
    function Get_scope(out scope: ISchemaComplexType): HResult; stdcall;
    function Get_defaultValue(out defaultValue: WideString): HResult; stdcall;
    function Get_fixedValue(out fixedValue: WideString): HResult; stdcall;
    function Get_use(out use: SCHEMAUSE): HResult; stdcall;
    function Get_isReference(out reference: WordBool): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ISchemaAttributeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaAttributeDisp = dispinterface
    ['{50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}']
    property type_[out type_: ISchemaType]: ISchemaType readonly dispid 1476;
    property scope[out scope: ISchemaComplexType]: ISchemaComplexType readonly dispid 1469;
    property defaultValue[out defaultValue: WideString]: WideString readonly dispid 1431;
    property fixedValue[out fixedValue: WideString]: WideString readonly dispid 1438;
    property use[out use: SCHEMAUSE]: SCHEMAUSE readonly dispid 1479;
    property isReference[out reference: WordBool]: WordBool readonly dispid 1444;
    property name[out name: WideString]: WideString readonly dispid 1457;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 1459;
    property schema[out schema: ISchema]: ISchema readonly dispid 1467;
    property id[out id: WideString]: WideString readonly dispid 1440;
    property itemType[out itemType: SOMITEMTYPE]: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes[out attributes: IVBSAXAttributes]: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown; out isWritten: WordBool): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaAttributeGroup
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaAttributeGroup = interface(ISchemaItem)
    ['{50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_anyAttribute(out anyAttribute: ISchemaAny): HResult; stdcall;
    function Get_attributes(out attributes: ISchemaItemCollection): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ISchemaAttributeGroupDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaAttributeGroupDisp = dispinterface
    ['{50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}']
    property anyAttribute[out anyAttribute: ISchemaAny]: ISchemaAny readonly dispid 1425;
    property attributes[out attributes: ISchemaItemCollection]: ISchemaItemCollection readonly dispid 1427;
    property name[out name: WideString]: WideString readonly dispid 1457;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 1459;
    property schema[out schema: ISchema]: ISchema readonly dispid 1467;
    property id[out id: WideString]: WideString readonly dispid 1440;
    property itemType[out itemType: SOMITEMTYPE]: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes[out attributes: IVBSAXAttributes]: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown; out isWritten: WordBool): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaIdentityConstraint
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaIdentityConstraint = interface(ISchemaItem)
    ['{50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_selector(out selector: WideString): HResult; stdcall;
    function Get_fields(out fields: ISchemaStringCollection): HResult; stdcall;
    function Get_referencedKey(out key: ISchemaIdentityConstraint): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ISchemaIdentityConstraintDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaIdentityConstraintDisp = dispinterface
    ['{50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}']
    property selector[out selector: WideString]: WideString readonly dispid 1470;
    property fields[out fields: ISchemaStringCollection]: ISchemaStringCollection readonly dispid 1436;
    property referencedKey[out key: ISchemaIdentityConstraint]: ISchemaIdentityConstraint readonly dispid 1466;
    property name[out name: WideString]: WideString readonly dispid 1457;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 1459;
    property schema[out schema: ISchema]: ISchema readonly dispid 1467;
    property id[out id: WideString]: WideString readonly dispid 1440;
    property itemType[out itemType: SOMITEMTYPE]: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes[out attributes: IVBSAXAttributes]: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown; out isWritten: WordBool): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: ISchemaNotation
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaNotation = interface(ISchemaItem)
    ['{50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_systemIdentifier(out uri: WideString): HResult; stdcall;
    function Get_publicIdentifier(out uri: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ISchemaNotationDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  ISchemaNotationDisp = dispinterface
    ['{50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}']
    property systemIdentifier[out uri: WideString]: WideString readonly dispid 1473;
    property publicIdentifier[out uri: WideString]: WideString readonly dispid 1465;
    property name[out name: WideString]: WideString readonly dispid 1457;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 1459;
    property schema[out schema: ISchema]: ISchema readonly dispid 1467;
    property id[out id: WideString]: WideString readonly dispid 1440;
    property itemType[out itemType: SOMITEMTYPE]: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes[out attributes: IVBSAXAttributes]: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(const annotationSink: IUnknown; out isWritten: WordBool): WordBool; dispid 1483;
  end;

// *********************************************************************//
// Interface: IXMLDOMSelection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AA634FC7-5888-44A7-A257-3A47150D3A0E}
// *********************************************************************//
  IXMLDOMSelection = interface(IXMLDOMNodeList)
    ['{AA634FC7-5888-44A7-A257-3A47150D3A0E}']
    function Get_expr(out expression: WideString): HResult; stdcall;
    function Set_expr(const expression: WideString): HResult; stdcall;
    function Get_context(out ppNode: IXMLDOMNode): HResult; stdcall;
    function _Set_context(const ppNode: IXMLDOMNode): HResult; stdcall;
    function peekNode(out ppNode: IXMLDOMNode): HResult; stdcall;
    function matches(const pNode: IXMLDOMNode; out ppNode: IXMLDOMNode): HResult; stdcall;
    function removeNext(out ppNode: IXMLDOMNode): HResult; stdcall;
    function removeAll: HResult; stdcall;
    function clone(out ppNode: IXMLDOMSelection): HResult; stdcall;
    function getProperty(const name: WideString; out value: OleVariant): HResult; stdcall;
    function setProperty(const name: WideString; value: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMSelectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AA634FC7-5888-44A7-A257-3A47150D3A0E}
// *********************************************************************//
  IXMLDOMSelectionDisp = dispinterface
    ['{AA634FC7-5888-44A7-A257-3A47150D3A0E}']
    function expr(out expression: WideString): WideString; dispid 81;
    function context(out ppNode: IXMLDOMNode): IXMLDOMNode; dispid 82;
    function peekNode(out ppNode: IXMLDOMNode): IXMLDOMNode; dispid 83;
    function matches(const pNode: IXMLDOMNode; out ppNode: IXMLDOMNode): IXMLDOMNode; dispid 84;
    function removeNext(out ppNode: IXMLDOMNode): IXMLDOMNode; dispid 85;
    function removeAll: HResult; dispid 86;
    function clone(out ppNode: IXMLDOMSelection): IXMLDOMSelection; dispid 87;
    function getProperty(const name: WideString; out value: OleVariant): OleVariant; dispid 88;
    function setProperty(const name: WideString; value: OleVariant): HResult; dispid 89;
    property item[index: Integer; out listItem: IXMLDOMNode]: IXMLDOMNode readonly dispid 0;
    property length[out listLength: Integer]: Integer readonly dispid 74;
    function nextNode(out nextItem: IXMLDOMNode): IXMLDOMNode; dispid 76;
    function reset: HResult; dispid 77;
    property _newEnum[out ppUnk: IUnknown]: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// DispIntf:  XMLDOMDocumentEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {3EFAA427-272F-11D2-836F-0000F87A7782}
// *********************************************************************//
  XMLDOMDocumentEvents = dispinterface
    ['{3EFAA427-272F-11D2-836F-0000F87A7782}']
    function ondataavailable: HResult; dispid 198;
    function onreadystatechange: HResult; dispid -609;
  end;

// *********************************************************************//
// Interface: IXMLDOMDocument2
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF95-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocument2 = interface(IXMLDOMDocument)
    ['{2933BF95-7B36-11D2-B20E-00C04F983E60}']
    function Get_namespaces(out namespaceCollection: IXMLDOMSchemaCollection): HResult; stdcall;
    function Get_schemas(out otherCollection: OleVariant): HResult; stdcall;
    function _Set_schemas(otherCollection: OleVariant): HResult; stdcall;
    function validate(out errorObj: IXMLDOMParseError): HResult; stdcall;
    function setProperty(const name: WideString; value: OleVariant): HResult; stdcall;
    function getProperty(const name: WideString; out value: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMDocument2Disp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF95-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocument2Disp = dispinterface
    ['{2933BF95-7B36-11D2-B20E-00C04F983E60}']
    property namespaces[out namespaceCollection: IXMLDOMSchemaCollection]: IXMLDOMSchemaCollection readonly dispid 201;
    function schemas(out otherCollection: OleVariant): OleVariant; dispid 202;
    function validate(out errorObj: IXMLDOMParseError): IXMLDOMParseError; dispid 203;
    function setProperty(const name: WideString; value: OleVariant): HResult; dispid 204;
    function getProperty(const name: WideString; out value: OleVariant): OleVariant; dispid 205;
    property doctype[out documentType: IXMLDOMDocumentType]: IXMLDOMDocumentType readonly dispid 38;
    property implementation_[out impl: IXMLDOMImplementation]: IXMLDOMImplementation readonly dispid 39;
    function documentElement(out DOMElement: IXMLDOMElement): IXMLDOMElement; dispid 40;
    function createElement(const tagName: WideString; out element: IXMLDOMElement): IXMLDOMElement; dispid 41;
    function createDocumentFragment(out docFrag: IXMLDOMDocumentFragment): IXMLDOMDocumentFragment; dispid 42;
    function createTextNode(const data: WideString; out text: IXMLDOMText): IXMLDOMText; dispid 43;
    function createComment(const data: WideString; out comment: IXMLDOMComment): IXMLDOMComment; dispid 44;
    function createCDATASection(const data: WideString; out cdata: IXMLDOMCDATASection): IXMLDOMCDATASection; dispid 45;
    function createProcessingInstruction(const target: WideString; const data: WideString; 
                                         out pi: IXMLDOMProcessingInstruction): IXMLDOMProcessingInstruction; dispid 46;
    function createAttribute(const name: WideString; out attribute: IXMLDOMAttribute): IXMLDOMAttribute; dispid 47;
    function createEntityReference(const name: WideString; out entityRef: IXMLDOMEntityReference): IXMLDOMEntityReference; dispid 49;
    function getElementsByTagName(const tagName: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 50;
    function createNode(type_: OleVariant; const name: WideString; const namespaceURI: WideString; 
                        out node: IXMLDOMNode): IXMLDOMNode; dispid 54;
    function nodeFromID(const idString: WideString; out node: IXMLDOMNode): IXMLDOMNode; dispid 56;
    function load(xmlSource: OleVariant; out isSuccessful: WordBool): WordBool; dispid 58;
    property readyState[out value: Integer]: Integer readonly dispid -525;
    property parseError[out errorObj: IXMLDOMParseError]: IXMLDOMParseError readonly dispid 59;
    property url[out urlString: WideString]: WideString readonly dispid 60;
    function async(out isAsync: WordBool): WordBool; dispid 61;
    function abort: HResult; dispid 62;
    function loadXML(const bstrXML: WideString; out isSuccessful: WordBool): WordBool; dispid 63;
    function save(destination: OleVariant): HResult; dispid 64;
    function validateOnParse(out isValidating: WordBool): WordBool; dispid 65;
    function resolveExternals(out isResolving: WordBool): WordBool; dispid 66;
    function preserveWhiteSpace(out isPreserving: WordBool): WordBool; dispid 67;
    property onreadystatechange: HResult writeonly dispid 68;
    property ondataavailable: HResult writeonly dispid 69;
    property ontransformnode: HResult writeonly dispid 70;
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMDocument3
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF96-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocument3 = interface(IXMLDOMDocument2)
    ['{2933BF96-7B36-11D2-B20E-00C04F983E60}']
    function validateNode(const node: IXMLDOMNode; out errorObj: IXMLDOMParseError): HResult; stdcall;
    function importNode(const node: IXMLDOMNode; deep: WordBool; out clone: IXMLDOMNode): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMDocument3Disp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF96-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXMLDOMDocument3Disp = dispinterface
    ['{2933BF96-7B36-11D2-B20E-00C04F983E60}']
    function validateNode(const node: IXMLDOMNode; out errorObj: IXMLDOMParseError): IXMLDOMParseError; dispid 208;
    function importNode(const node: IXMLDOMNode; deep: WordBool; out clone: IXMLDOMNode): IXMLDOMNode; dispid 209;
    property namespaces[out namespaceCollection: IXMLDOMSchemaCollection]: IXMLDOMSchemaCollection readonly dispid 201;
    function schemas(out otherCollection: OleVariant): OleVariant; dispid 202;
    function validate(out errorObj: IXMLDOMParseError): IXMLDOMParseError; dispid 203;
    function setProperty(const name: WideString; value: OleVariant): HResult; dispid 204;
    function getProperty(const name: WideString; out value: OleVariant): OleVariant; dispid 205;
    property doctype[out documentType: IXMLDOMDocumentType]: IXMLDOMDocumentType readonly dispid 38;
    property implementation_[out impl: IXMLDOMImplementation]: IXMLDOMImplementation readonly dispid 39;
    function documentElement(out DOMElement: IXMLDOMElement): IXMLDOMElement; dispid 40;
    function createElement(const tagName: WideString; out element: IXMLDOMElement): IXMLDOMElement; dispid 41;
    function createDocumentFragment(out docFrag: IXMLDOMDocumentFragment): IXMLDOMDocumentFragment; dispid 42;
    function createTextNode(const data: WideString; out text: IXMLDOMText): IXMLDOMText; dispid 43;
    function createComment(const data: WideString; out comment: IXMLDOMComment): IXMLDOMComment; dispid 44;
    function createCDATASection(const data: WideString; out cdata: IXMLDOMCDATASection): IXMLDOMCDATASection; dispid 45;
    function createProcessingInstruction(const target: WideString; const data: WideString; 
                                         out pi: IXMLDOMProcessingInstruction): IXMLDOMProcessingInstruction; dispid 46;
    function createAttribute(const name: WideString; out attribute: IXMLDOMAttribute): IXMLDOMAttribute; dispid 47;
    function createEntityReference(const name: WideString; out entityRef: IXMLDOMEntityReference): IXMLDOMEntityReference; dispid 49;
    function getElementsByTagName(const tagName: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 50;
    function createNode(type_: OleVariant; const name: WideString; const namespaceURI: WideString; 
                        out node: IXMLDOMNode): IXMLDOMNode; dispid 54;
    function nodeFromID(const idString: WideString; out node: IXMLDOMNode): IXMLDOMNode; dispid 56;
    function load(xmlSource: OleVariant; out isSuccessful: WordBool): WordBool; dispid 58;
    property readyState[out value: Integer]: Integer readonly dispid -525;
    property parseError[out errorObj: IXMLDOMParseError]: IXMLDOMParseError readonly dispid 59;
    property url[out urlString: WideString]: WideString readonly dispid 60;
    function async(out isAsync: WordBool): WordBool; dispid 61;
    function abort: HResult; dispid 62;
    function loadXML(const bstrXML: WideString; out isSuccessful: WordBool): WordBool; dispid 63;
    function save(destination: OleVariant): HResult; dispid 64;
    function validateOnParse(out isValidating: WordBool): WordBool; dispid 65;
    function resolveExternals(out isResolving: WordBool): WordBool; dispid 66;
    function preserveWhiteSpace(out isPreserving: WordBool): WordBool; dispid 67;
    property onreadystatechange: HResult writeonly dispid 68;
    property ondataavailable: HResult writeonly dispid 69;
    property ontransformnode: HResult writeonly dispid 70;
    property nodeName[out name: WideString]: WideString readonly dispid 2;
    function nodeValue(out value: OleVariant): OleVariant; dispid 3;
    property nodeType[out type_: DOMNodeType]: DOMNodeType readonly dispid 4;
    property parentNode[out parent: IXMLDOMNode]: IXMLDOMNode readonly dispid 6;
    property childNodes[out childList: IXMLDOMNodeList]: IXMLDOMNodeList readonly dispid 7;
    property firstChild[out firstChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 8;
    property lastChild[out lastChild: IXMLDOMNode]: IXMLDOMNode readonly dispid 9;
    property previousSibling[out previousSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 10;
    property nextSibling[out nextSibling: IXMLDOMNode]: IXMLDOMNode readonly dispid 11;
    property attributes[out attributeMap: IXMLDOMNamedNodeMap]: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant; 
                          out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode; 
                          out outOldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode; out oldChild: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode; out outNewChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes(out hasChild: WordBool): WordBool; dispid 17;
    property ownerDocument[out XMLDOMDocument: IXMLDOMDocument]: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): IXMLDOMNode; dispid 19;
    property nodeTypeString[out nodeType: WideString]: WideString readonly dispid 21;
    function text(out text: WideString): WideString; dispid 24;
    property specified[out isSpecified: WordBool]: WordBool readonly dispid 22;
    property definition[out definitionNode: IXMLDOMNode]: IXMLDOMNode readonly dispid 23;
    function nodeTypedValue(out typedValue: OleVariant): OleVariant; dispid 25;
    function dataType(out dataTypeName: OleVariant): OleVariant; dispid 26;
    property xml[out xmlString: WideString]: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode; out xmlString: WideString): WideString; dispid 28;
    function selectNodes(const queryString: WideString; out resultList: IXMLDOMNodeList): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString; out resultNode: IXMLDOMNode): IXMLDOMNode; dispid 30;
    property parsed[out isParsed: WordBool]: WordBool readonly dispid 31;
    property namespaceURI[out namespaceURI: WideString]: WideString readonly dispid 32;
    property prefix[out prefixString: WideString]: WideString readonly dispid 33;
    property baseName[out nameString: WideString]: WideString readonly dispid 34;
    function transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant): HResult; dispid 35;
  end;

// *********************************************************************//
// Interface: IXMLDOMSchemaCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {373984C8-B845-449B-91E7-45AC83036ADE}
// *********************************************************************//
  IXMLDOMSchemaCollection = interface(IDispatch)
    ['{373984C8-B845-449B-91E7-45AC83036ADE}']
    function add(const namespaceURI: WideString; var_: OleVariant): HResult; stdcall;
    function get(const namespaceURI: WideString; out schemaNode: IXMLDOMNode): HResult; stdcall;
    function remove(const namespaceURI: WideString): HResult; stdcall;
    function Get_length(out length: Integer): HResult; stdcall;
    function Get_namespaceURI(index: Integer; out length: WideString): HResult; stdcall;
    function addCollection(const otherCollection: IXMLDOMSchemaCollection): HResult; stdcall;
    function Get__newEnum(out ppUnk: IUnknown): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMSchemaCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {373984C8-B845-449B-91E7-45AC83036ADE}
// *********************************************************************//
  IXMLDOMSchemaCollectionDisp = dispinterface
    ['{373984C8-B845-449B-91E7-45AC83036ADE}']
    function add(const namespaceURI: WideString; var_: OleVariant): HResult; dispid 3;
    function get(const namespaceURI: WideString; out schemaNode: IXMLDOMNode): IXMLDOMNode; dispid 4;
    function remove(const namespaceURI: WideString): HResult; dispid 5;
    property length[out length: Integer]: Integer readonly dispid 6;
    property namespaceURI[index: Integer; out length: WideString]: WideString readonly dispid 0;
    function addCollection(const otherCollection: IXMLDOMSchemaCollection): HResult; dispid 8;
    property _newEnum[out ppUnk: IUnknown]: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IXMLDOMSchemaCollection2
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  IXMLDOMSchemaCollection2 = interface(IXMLDOMSchemaCollection)
    ['{50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}']
    function validate: HResult; stdcall;
    function Set_validateOnLoad(validateOnLoad: WordBool): HResult; stdcall;
    function Get_validateOnLoad(out validateOnLoad: WordBool): HResult; stdcall;
    function getSchema(const namespaceURI: WideString; out schema: ISchema): HResult; stdcall;
    function getDeclaration(const node: IXMLDOMNode; out item: ISchemaItem): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLDOMSchemaCollection2Disp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}
// *********************************************************************//
  IXMLDOMSchemaCollection2Disp = dispinterface
    ['{50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}']
    function validate: HResult; dispid 1419;
    function validateOnLoad: HResult; dispid 1420;
    function getSchema(const namespaceURI: WideString; out schema: ISchema): ISchema; dispid 1421;
    function getDeclaration(const node: IXMLDOMNode; out item: ISchemaItem): ISchemaItem; dispid 1422;
    function add(const namespaceURI: WideString; var_: OleVariant): HResult; dispid 3;
    function get(const namespaceURI: WideString; out schemaNode: IXMLDOMNode): IXMLDOMNode; dispid 4;
    function remove(const namespaceURI: WideString): HResult; dispid 5;
    property length[out length: Integer]: Integer readonly dispid 6;
    property namespaceURI[index: Integer; out length: WideString]: WideString readonly dispid 0;
    function addCollection(const otherCollection: IXMLDOMSchemaCollection): HResult; dispid 8;
    property _newEnum[out ppUnk: IUnknown]: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IXSLTemplate
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF93-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXSLTemplate = interface(IDispatch)
    ['{2933BF93-7B36-11D2-B20E-00C04F983E60}']
    function _Set_stylesheet(const stylesheet: IXMLDOMNode): HResult; stdcall;
    function Get_stylesheet(out stylesheet: IXMLDOMNode): HResult; stdcall;
    function createProcessor(out ppProcessor: IXSLProcessor): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXSLTemplateDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF93-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXSLTemplateDisp = dispinterface
    ['{2933BF93-7B36-11D2-B20E-00C04F983E60}']
    function stylesheet: HResult; dispid 2;
    function createProcessor(out ppProcessor: IXSLProcessor): IXSLProcessor; dispid 3;
  end;

// *********************************************************************//
// Interface: IXSLProcessor
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF92-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXSLProcessor = interface(IDispatch)
    ['{2933BF92-7B36-11D2-B20E-00C04F983E60}']
    function Set_input(pVar: OleVariant): HResult; stdcall;
    function Get_input(out pVar: OleVariant): HResult; stdcall;
    function Get_ownerTemplate(out ppTemplate: IXSLTemplate): HResult; stdcall;
    function setStartMode(const mode: WideString; const namespaceURI: WideString): HResult; stdcall;
    function Get_startMode(out mode: WideString): HResult; stdcall;
    function Get_startModeURI(out namespaceURI: WideString): HResult; stdcall;
    function Set_output(pOutput: OleVariant): HResult; stdcall;
    function Get_output(out pOutput: OleVariant): HResult; stdcall;
    function transform(out pDone: WordBool): HResult; stdcall;
    function reset: HResult; stdcall;
    function Get_readyState(out pReadyState: Integer): HResult; stdcall;
    function addParameter(const baseName: WideString; parameter: OleVariant; 
                          const namespaceURI: WideString): HResult; stdcall;
    function addObject(const obj: IDispatch; const namespaceURI: WideString): HResult; stdcall;
    function Get_stylesheet(out stylesheet: IXMLDOMNode): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXSLProcessorDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2933BF92-7B36-11D2-B20E-00C04F983E60}
// *********************************************************************//
  IXSLProcessorDisp = dispinterface
    ['{2933BF92-7B36-11D2-B20E-00C04F983E60}']
    function input: HResult; dispid 2;
    property ownerTemplate[out ppTemplate: IXSLTemplate]: IXSLTemplate readonly dispid 3;
    function setStartMode(const mode: WideString; const namespaceURI: WideString): HResult; dispid 4;
    property startMode[out mode: WideString]: WideString readonly dispid 5;
    property startModeURI[out namespaceURI: WideString]: WideString readonly dispid 6;
    function output: HResult; dispid 7;
    function transform(out pDone: WordBool): WordBool; dispid 8;
    function reset: HResult; dispid 9;
    property readyState[out pReadyState: Integer]: Integer readonly dispid 10;
    function addParameter(const baseName: WideString; parameter: OleVariant; 
                          const namespaceURI: WideString): HResult; dispid 11;
    function addObject(const obj: IDispatch; const namespaceURI: WideString): HResult; dispid 12;
    property stylesheet[out stylesheet: IXMLDOMNode]: IXMLDOMNode readonly dispid 13;
  end;

// *********************************************************************//
// Interface: IXMLHTTPRequest
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {ED8C108D-4349-11D2-91A4-00C04F7969E8}
// *********************************************************************//
  IXMLHTTPRequest = interface(IDispatch)
    ['{ED8C108D-4349-11D2-91A4-00C04F7969E8}']
    function open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                  bstrUser: OleVariant; bstrPassword: OleVariant): HResult; stdcall;
    function setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString): HResult; stdcall;
    function getResponseHeader(const bstrHeader: WideString; out pbstrValue: WideString): HResult; stdcall;
    function getAllResponseHeaders(out pbstrHeaders: WideString): HResult; stdcall;
    function send(varBody: OleVariant): HResult; stdcall;
    function abort: HResult; stdcall;
    function Get_status(out plStatus: Integer): HResult; stdcall;
    function Get_statusText(out pbstrStatus: WideString): HResult; stdcall;
    function Get_responseXML(out ppBody: IDispatch): HResult; stdcall;
    function Get_responseText(out pbstrBody: WideString): HResult; stdcall;
    function Get_responseBody(out pvarBody: OleVariant): HResult; stdcall;
    function Get_responseStream(out pvarBody: OleVariant): HResult; stdcall;
    function Get_readyState(out plState: Integer): HResult; stdcall;
    function Set_onreadystatechange(const Param1: IDispatch): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IXMLHTTPRequestDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {ED8C108D-4349-11D2-91A4-00C04F7969E8}
// *********************************************************************//
  IXMLHTTPRequestDisp = dispinterface
    ['{ED8C108D-4349-11D2-91A4-00C04F7969E8}']
    function open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                  bstrUser: OleVariant; bstrPassword: OleVariant): HResult; dispid 1;
    function setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString): HResult; dispid 2;
    function getResponseHeader(const bstrHeader: WideString; out pbstrValue: WideString): WideString; dispid 3;
    function getAllResponseHeaders(out pbstrHeaders: WideString): WideString; dispid 4;
    function send(varBody: OleVariant): HResult; dispid 5;
    function abort: HResult; dispid 6;
    property status[out plStatus: Integer]: Integer readonly dispid 7;
    property statusText[out pbstrStatus: WideString]: WideString readonly dispid 8;
    property responseXML[out ppBody: IDispatch]: IDispatch readonly dispid 9;
    property responseText[out pbstrBody: WideString]: WideString readonly dispid 10;
    property responseBody[out pvarBody: OleVariant]: OleVariant readonly dispid 11;
    property responseStream[out pvarBody: OleVariant]: OleVariant readonly dispid 12;
    property readyState[out plState: Integer]: Integer readonly dispid 13;
    property onreadystatechange: HResult writeonly dispid 14;
  end;

// *********************************************************************//
// Interface: IXMLHTTPRequest2
// Flags:     (0)
// GUID:      {E5D37DC0-552A-4D52-9CC0-A14D546FBD04}
// *********************************************************************//
  IXMLHTTPRequest2 = interface(IUnknown)
    ['{E5D37DC0-552A-4D52-9CC0-A14D546FBD04}']
    function open(pwszMethod: PWideChar; pwszUrl: PWideChar; 
                  const pStatusCallback: IXMLHTTPRequest2Callback; pwszUserName: PWideChar; 
                  pwszPassword: PWideChar; pwszProxyUserName: PWideChar; 
                  pwszProxyPassword: PWideChar): HResult; stdcall;
    function send(const pBody: ISequentialStream; cbBody: Largeuint): HResult; stdcall;
    function abort: HResult; stdcall;
    function SetCookie(var pCookie: tagXHR_COOKIE; out pdwCookieState: LongWord): HResult; stdcall;
    function SetCustomResponseStream(const pSequentialStream: ISequentialStream): HResult; stdcall;
    function setProperty(eProperty: XHR_PROPERTY; ullValue: Largeuint): HResult; stdcall;
    function setRequestHeader(pwszHeader: PWideChar; pwszValue: PWideChar): HResult; stdcall;
    function getAllResponseHeaders(out ppwszHeaders: PWideChar): HResult; stdcall;
    function GetCookie(pwszUrl: PWideChar; pwszName: PWideChar; dwFlags: LongWord; 
                       out pcCookies: LongWord; out ppCookies: PUserType1): HResult; stdcall;
    function getResponseHeader(pwszHeader: PWideChar; out ppwszValue: PWideChar): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IXMLHTTPRequest2Callback
// Flags:     (0)
// GUID:      {A44A9299-E321-40DE-8866-341B41669162}
// *********************************************************************//
  IXMLHTTPRequest2Callback = interface(IUnknown)
    ['{A44A9299-E321-40DE-8866-341B41669162}']
    function OnRedirect(const pXHR: IXMLHTTPRequest2; pwszRedirectUrl: PWideChar): HResult; stdcall;
    function OnHeadersAvailable(const pXHR: IXMLHTTPRequest2; dwStatus: LongWord; 
                                pwszStatus: PWideChar): HResult; stdcall;
    function ondataavailable(const pXHR: IXMLHTTPRequest2; const pResponseStream: ISequentialStream): HResult; stdcall;
    function OnResponseReceived(const pXHR: IXMLHTTPRequest2; 
                                const pResponseStream: ISequentialStream): HResult; stdcall;
    function OnError(const pXHR: IXMLHTTPRequest2; hrError: HResult): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISequentialStream
// Flags:     (0)
// GUID:      {0C733A30-2A1C-11CE-ADE5-00AA0044773D}
// *********************************************************************//
  ISequentialStream = interface(IUnknown)
    ['{0C733A30-2A1C-11CE-ADE5-00AA0044773D}']
    function RemoteRead(out pv: Byte; cb: LongWord; out pcbRead: LongWord): HResult; stdcall;
    function RemoteWrite(var pv: Byte; cb: LongWord; out pcbWritten: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IServerXMLHTTPRequest
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2E9196BF-13BA-4DD4-91CA-6C571F281495}
// *********************************************************************//
  IServerXMLHTTPRequest = interface(IXMLHTTPRequest)
    ['{2E9196BF-13BA-4DD4-91CA-6C571F281495}']
    function setTimeouts(resolveTimeout: Integer; connectTimeout: Integer; sendTimeout: Integer; 
                         receiveTimeout: Integer): HResult; stdcall;
    function waitForResponse(timeoutInSeconds: OleVariant; out isSuccessful: WordBool): HResult; stdcall;
    function getOption(option: SERVERXMLHTTP_OPTION; out value: OleVariant): HResult; stdcall;
    function setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IServerXMLHTTPRequestDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2E9196BF-13BA-4DD4-91CA-6C571F281495}
// *********************************************************************//
  IServerXMLHTTPRequestDisp = dispinterface
    ['{2E9196BF-13BA-4DD4-91CA-6C571F281495}']
    function setTimeouts(resolveTimeout: Integer; connectTimeout: Integer; sendTimeout: Integer; 
                         receiveTimeout: Integer): HResult; dispid 15;
    function waitForResponse(timeoutInSeconds: OleVariant; out isSuccessful: WordBool): WordBool; dispid 16;
    function getOption(option: SERVERXMLHTTP_OPTION; out value: OleVariant): OleVariant; dispid 17;
    function setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant): HResult; dispid 18;
    function open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                  bstrUser: OleVariant; bstrPassword: OleVariant): HResult; dispid 1;
    function setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString): HResult; dispid 2;
    function getResponseHeader(const bstrHeader: WideString; out pbstrValue: WideString): WideString; dispid 3;
    function getAllResponseHeaders(out pbstrHeaders: WideString): WideString; dispid 4;
    function send(varBody: OleVariant): HResult; dispid 5;
    function abort: HResult; dispid 6;
    property status[out plStatus: Integer]: Integer readonly dispid 7;
    property statusText[out pbstrStatus: WideString]: WideString readonly dispid 8;
    property responseXML[out ppBody: IDispatch]: IDispatch readonly dispid 9;
    property responseText[out pbstrBody: WideString]: WideString readonly dispid 10;
    property responseBody[out pvarBody: OleVariant]: OleVariant readonly dispid 11;
    property responseStream[out pvarBody: OleVariant]: OleVariant readonly dispid 12;
    property readyState[out plState: Integer]: Integer readonly dispid 13;
    property onreadystatechange: HResult writeonly dispid 14;
  end;

// *********************************************************************//
// Interface: IServerXMLHTTPRequest2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}
// *********************************************************************//
  IServerXMLHTTPRequest2 = interface(IServerXMLHTTPRequest)
    ['{2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}']
    function setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer: OleVariant; 
                      varBypassList: OleVariant): HResult; stdcall;
    function setProxyCredentials(const bstrUserName: WideString; const bstrPassword: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IServerXMLHTTPRequest2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}
// *********************************************************************//
  IServerXMLHTTPRequest2Disp = dispinterface
    ['{2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}']
    function setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer: OleVariant; 
                      varBypassList: OleVariant): HResult; dispid 19;
    function setProxyCredentials(const bstrUserName: WideString; const bstrPassword: WideString): HResult; dispid 20;
    function setTimeouts(resolveTimeout: Integer; connectTimeout: Integer; sendTimeout: Integer; 
                         receiveTimeout: Integer): HResult; dispid 15;
    function waitForResponse(timeoutInSeconds: OleVariant; out isSuccessful: WordBool): WordBool; dispid 16;
    function getOption(option: SERVERXMLHTTP_OPTION; out value: OleVariant): OleVariant; dispid 17;
    function setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant): HResult; dispid 18;
    function open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                  bstrUser: OleVariant; bstrPassword: OleVariant): HResult; dispid 1;
    function setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString): HResult; dispid 2;
    function getResponseHeader(const bstrHeader: WideString; out pbstrValue: WideString): WideString; dispid 3;
    function getAllResponseHeaders(out pbstrHeaders: WideString): WideString; dispid 4;
    function send(varBody: OleVariant): HResult; dispid 5;
    function abort: HResult; dispid 6;
    property status[out plStatus: Integer]: Integer readonly dispid 7;
    property statusText[out pbstrStatus: WideString]: WideString readonly dispid 8;
    property responseXML[out ppBody: IDispatch]: IDispatch readonly dispid 9;
    property responseText[out pbstrBody: WideString]: WideString readonly dispid 10;
    property responseBody[out pvarBody: OleVariant]: OleVariant readonly dispid 11;
    property responseStream[out pvarBody: OleVariant]: OleVariant readonly dispid 12;
    property readyState[out plState: Integer]: Integer readonly dispid 13;
    property onreadystatechange: HResult writeonly dispid 14;
  end;

// *********************************************************************//
// Interface: IMXWriter
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}
// *********************************************************************//
  IMXWriter = interface(IDispatch)
    ['{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}']
    function Set_output(varDestination: OleVariant): HResult; stdcall;
    function Get_output(out varDestination: OleVariant): HResult; stdcall;
    function Set_encoding(const strEncoding: WideString): HResult; stdcall;
    function Get_encoding(out strEncoding: WideString): HResult; stdcall;
    function Set_byteOrderMark(fWriteByteOrderMark: WordBool): HResult; stdcall;
    function Get_byteOrderMark(out fWriteByteOrderMark: WordBool): HResult; stdcall;
    function Set_indent(fIndentMode: WordBool): HResult; stdcall;
    function Get_indent(out fIndentMode: WordBool): HResult; stdcall;
    function Set_standalone(fValue: WordBool): HResult; stdcall;
    function Get_standalone(out fValue: WordBool): HResult; stdcall;
    function Set_omitXMLDeclaration(fValue: WordBool): HResult; stdcall;
    function Get_omitXMLDeclaration(out fValue: WordBool): HResult; stdcall;
    function Set_version(const strVersion: WideString): HResult; stdcall;
    function Get_version(out strVersion: WideString): HResult; stdcall;
    function Set_disableOutputEscaping(fValue: WordBool): HResult; stdcall;
    function Get_disableOutputEscaping(out fValue: WordBool): HResult; stdcall;
    function flush: HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IMXWriterDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}
// *********************************************************************//
  IMXWriterDisp = dispinterface
    ['{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}']
    function output: HResult; dispid 1385;
    function encoding: HResult; dispid 1387;
    function byteOrderMark: HResult; dispid 1388;
    function indent: HResult; dispid 1389;
    function standalone: HResult; dispid 1390;
    function omitXMLDeclaration: HResult; dispid 1391;
    function version: HResult; dispid 1392;
    function disableOutputEscaping: HResult; dispid 1393;
    function flush: HResult; dispid 1394;
  end;

// *********************************************************************//
// Interface: ISAXDeclHandler
// Flags:     (16) Hidden
// GUID:      {862629AC-771A-47B2-8337-4E6843C1BE90}
// *********************************************************************//
  ISAXDeclHandler = interface(IUnknown)
    ['{862629AC-771A-47B2-8337-4E6843C1BE90}']
    function elementDecl(var pwchName: Word; cchName: SYSINT; var pwchModel: Word; cchModel: SYSINT): HResult; stdcall;
    function attributeDecl(var pwchElementName: Word; cchElementName: SYSINT; 
                           var pwchAttributeName: Word; cchAttributeName: SYSINT; 
                           var pwchType: Word; cchType: SYSINT; var pwchValueDefault: Word; 
                           cchValueDefault: SYSINT; var pwchValue: Word; cchValue: SYSINT): HResult; stdcall;
    function internalEntityDecl(var pwchName: Word; cchName: SYSINT; var pwchValue: Word; 
                                cchValue: SYSINT): HResult; stdcall;
    function externalEntityDecl(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; 
                                cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISAXLexicalHandler
// Flags:     (16) Hidden
// GUID:      {7F85D5F5-47A8-4497-BDA5-84BA04819EA6}
// *********************************************************************//
  ISAXLexicalHandler = interface(IUnknown)
    ['{7F85D5F5-47A8-4497-BDA5-84BA04819EA6}']
    function startDTD(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; 
                      cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT): HResult; stdcall;
    function endDTD: HResult; stdcall;
    function startEntity(var pwchName: Word; cchName: SYSINT): HResult; stdcall;
    function endEntity(var pwchName: Word; cchName: SYSINT): HResult; stdcall;
    function startCDATA: HResult; stdcall;
    function endCDATA: HResult; stdcall;
    function comment(var pwchChars: Word; cchChars: SYSINT): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IVBSAXDeclHandler
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {E8917260-7579-4BE1-B5DD-7AFBFA6F077B}
// *********************************************************************//
  IVBSAXDeclHandler = interface(IDispatch)
    ['{E8917260-7579-4BE1-B5DD-7AFBFA6F077B}']
    function elementDecl(var strName: WideString; var strModel: WideString): HResult; stdcall;
    function attributeDecl(var strElementName: WideString; var strAttributeName: WideString; 
                           var strType: WideString; var strValueDefault: WideString; 
                           var strValue: WideString): HResult; stdcall;
    function internalEntityDecl(var strName: WideString; var strValue: WideString): HResult; stdcall;
    function externalEntityDecl(var strName: WideString; var strPublicId: WideString; 
                                var strSystemId: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXDeclHandlerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {E8917260-7579-4BE1-B5DD-7AFBFA6F077B}
// *********************************************************************//
  IVBSAXDeclHandlerDisp = dispinterface
    ['{E8917260-7579-4BE1-B5DD-7AFBFA6F077B}']
    function elementDecl(var strName: WideString; var strModel: WideString): HResult; dispid 1367;
    function attributeDecl(var strElementName: WideString; var strAttributeName: WideString; 
                           var strType: WideString; var strValueDefault: WideString; 
                           var strValue: WideString): HResult; dispid 1368;
    function internalEntityDecl(var strName: WideString; var strValue: WideString): HResult; dispid 1369;
    function externalEntityDecl(var strName: WideString; var strPublicId: WideString; 
                                var strSystemId: WideString): HResult; dispid 1370;
  end;

// *********************************************************************//
// Interface: IVBSAXLexicalHandler
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {032AAC35-8C0E-4D9D-979F-E3B702935576}
// *********************************************************************//
  IVBSAXLexicalHandler = interface(IDispatch)
    ['{032AAC35-8C0E-4D9D-979F-E3B702935576}']
    function startDTD(var strName: WideString; var strPublicId: WideString; 
                      var strSystemId: WideString): HResult; stdcall;
    function endDTD: HResult; stdcall;
    function startEntity(var strName: WideString): HResult; stdcall;
    function endEntity(var strName: WideString): HResult; stdcall;
    function startCDATA: HResult; stdcall;
    function endCDATA: HResult; stdcall;
    function comment(var strChars: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IVBSAXLexicalHandlerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {032AAC35-8C0E-4D9D-979F-E3B702935576}
// *********************************************************************//
  IVBSAXLexicalHandlerDisp = dispinterface
    ['{032AAC35-8C0E-4D9D-979F-E3B702935576}']
    function startDTD(var strName: WideString; var strPublicId: WideString; 
                      var strSystemId: WideString): HResult; dispid 1358;
    function endDTD: HResult; dispid 1359;
    function startEntity(var strName: WideString): HResult; dispid 1360;
    function endEntity(var strName: WideString): HResult; dispid 1361;
    function startCDATA: HResult; dispid 1362;
    function endCDATA: HResult; dispid 1363;
    function comment(var strChars: WideString): HResult; dispid 1364;
  end;

// *********************************************************************//
// Interface: IMXAttributes
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}
// *********************************************************************//
  IMXAttributes = interface(IDispatch)
    ['{F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}']
    function addAttribute(const strURI: WideString; const strLocalName: WideString; 
                          const strQName: WideString; const strType: WideString; 
                          const strValue: WideString): HResult; stdcall;
    function addAttributeFromIndex(varAtts: OleVariant; nIndex: SYSINT): HResult; stdcall;
    function clear: HResult; stdcall;
    function removeAttribute(nIndex: SYSINT): HResult; stdcall;
    function setAttribute(nIndex: SYSINT; const strURI: WideString; const strLocalName: WideString; 
                          const strQName: WideString; const strType: WideString; 
                          const strValue: WideString): HResult; stdcall;
    function setAttributes(varAtts: OleVariant): HResult; stdcall;
    function setLocalName(nIndex: SYSINT; const strLocalName: WideString): HResult; stdcall;
    function setQName(nIndex: SYSINT; const strQName: WideString): HResult; stdcall;
    function setType(nIndex: SYSINT; const strType: WideString): HResult; stdcall;
    function setURI(nIndex: SYSINT; const strURI: WideString): HResult; stdcall;
    function setValue(nIndex: SYSINT; const strValue: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IMXAttributesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}
// *********************************************************************//
  IMXAttributesDisp = dispinterface
    ['{F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}']
    function addAttribute(const strURI: WideString; const strLocalName: WideString; 
                          const strQName: WideString; const strType: WideString; 
                          const strValue: WideString): HResult; dispid 1373;
    function addAttributeFromIndex(varAtts: OleVariant; nIndex: SYSINT): HResult; dispid 1383;
    function clear: HResult; dispid 1374;
    function removeAttribute(nIndex: SYSINT): HResult; dispid 1375;
    function setAttribute(nIndex: SYSINT; const strURI: WideString; const strLocalName: WideString; 
                          const strQName: WideString; const strType: WideString; 
                          const strValue: WideString): HResult; dispid 1376;
    function setAttributes(varAtts: OleVariant): HResult; dispid 1377;
    function setLocalName(nIndex: SYSINT; const strLocalName: WideString): HResult; dispid 1378;
    function setQName(nIndex: SYSINT; const strQName: WideString): HResult; dispid 1379;
    function setType(nIndex: SYSINT; const strType: WideString): HResult; dispid 1380;
    function setURI(nIndex: SYSINT; const strURI: WideString): HResult; dispid 1381;
    function setValue(nIndex: SYSINT; const strValue: WideString): HResult; dispid 1382;
  end;

// *********************************************************************//
// Interface: IVBMXNamespaceManager
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C90352F5-643C-4FBC-BB23-E996EB2D51FD}
// *********************************************************************//
  IVBMXNamespaceManager = interface(IDispatch)
    ['{C90352F5-643C-4FBC-BB23-E996EB2D51FD}']
    function Set_allowOverride(fOverride: WordBool): HResult; stdcall;
    function Get_allowOverride(out fOverride: WordBool): HResult; stdcall;
    function reset: HResult; stdcall;
    function pushContext: HResult; stdcall;
    function pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool): HResult; stdcall;
    function popContext: HResult; stdcall;
    function declarePrefix(const prefix: WideString; const namespaceURI: WideString): HResult; stdcall;
    function getDeclaredPrefixes(out prefixes: IMXNamespacePrefixes): HResult; stdcall;
    function getPrefixes(const namespaceURI: WideString; out prefixes: IMXNamespacePrefixes): HResult; stdcall;
    function getURI(const prefix: WideString; out uri: OleVariant): HResult; stdcall;
    function getURIFromNode(const strPrefix: WideString; const contextNode: IXMLDOMNode; 
                            out uri: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IVBMXNamespaceManagerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C90352F5-643C-4FBC-BB23-E996EB2D51FD}
// *********************************************************************//
  IVBMXNamespaceManagerDisp = dispinterface
    ['{C90352F5-643C-4FBC-BB23-E996EB2D51FD}']
    function allowOverride: HResult; dispid 1406;
    function reset: HResult; dispid 1407;
    function pushContext: HResult; dispid 1408;
    function pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool): HResult; dispid 1409;
    function popContext: HResult; dispid 1410;
    function declarePrefix(const prefix: WideString; const namespaceURI: WideString): HResult; dispid 1411;
    function getDeclaredPrefixes(out prefixes: IMXNamespacePrefixes): IMXNamespacePrefixes; dispid 1412;
    function getPrefixes(const namespaceURI: WideString; out prefixes: IMXNamespacePrefixes): IMXNamespacePrefixes; dispid 1413;
    function getURI(const prefix: WideString; out uri: OleVariant): OleVariant; dispid 1414;
    function getURIFromNode(const strPrefix: WideString; const contextNode: IXMLDOMNode; 
                            out uri: OleVariant): OleVariant; dispid 1415;
  end;

// *********************************************************************//
// Interface: IMXNamespaceManager
// Flags:     (16) Hidden
// GUID:      {C90352F6-643C-4FBC-BB23-E996EB2D51FD}
// *********************************************************************//
  IMXNamespaceManager = interface(IUnknown)
    ['{C90352F6-643C-4FBC-BB23-E996EB2D51FD}']
    function putAllowOverride(fOverride: WordBool): HResult; stdcall;
    function getAllowOverride(out fOverride: WordBool): HResult; stdcall;
    function reset: HResult; stdcall;
    function pushContext: HResult; stdcall;
    function pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool): HResult; stdcall;
    function popContext: HResult; stdcall;
    function declarePrefix(prefix: PWideChar; namespaceURI: PWideChar): HResult; stdcall;
    function getDeclaredPrefix(nIndex: Integer; var pwchPrefix: Word; var pcchPrefix: SYSINT): HResult; stdcall;
    function getPrefix(pwszNamespaceURI: PWideChar; nIndex: Integer; var pwchPrefix: Word; 
                       var pcchPrefix: SYSINT): HResult; stdcall;
    function getURI(pwchPrefix: PWideChar; const pContextNode: IXMLDOMNode; var pwchUri: Word; 
                    var pcchUri: SYSINT): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMXNamespacePrefixes
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C90352F4-643C-4FBC-BB23-E996EB2D51FD}
// *********************************************************************//
  IMXNamespacePrefixes = interface(IDispatch)
    ['{C90352F4-643C-4FBC-BB23-E996EB2D51FD}']
    function Get_item(index: Integer; out prefix: WideString): HResult; stdcall;
    function Get_length(out length: Integer): HResult; stdcall;
    function Get__newEnum(out ppUnk: IUnknown): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IMXNamespacePrefixesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C90352F4-643C-4FBC-BB23-E996EB2D51FD}
// *********************************************************************//
  IMXNamespacePrefixesDisp = dispinterface
    ['{C90352F4-643C-4FBC-BB23-E996EB2D51FD}']
    property item[index: Integer; out prefix: WideString]: WideString readonly dispid 0;
    property length[out length: Integer]: Integer readonly dispid 1416;
    property _newEnum[out ppUnk: IUnknown]: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// The Class CoDOMDocument60 provides a Create and CreateRemote method to          
// create instances of the default interface IXMLDOMDocument3 exposed by              
// the CoClass DOMDocument60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDOMDocument60 = class
    class function Create: IXMLDOMDocument3;
    class function CreateRemote(const MachineName: string): IXMLDOMDocument3;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDOMDocument60
// Help String      : W3C-DOM XML Document 6.0 (Apartment)
// Default Interface: IXMLDOMDocument3
// Def. Intf. DISP? : No
// Event   Interface: XMLDOMDocumentEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TDOMDocument60 = class(TOleServer)
  private
    FOnondataavailable: TNotifyEvent;
    FOnonreadystatechange: TNotifyEvent;
    FIntf: IXMLDOMDocument3;
    function GetDefaultInterface: IXMLDOMDocument3;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
    function validateNode(const node: IXMLDOMNode; out errorObj: IXMLDOMParseError): HResult;
    function importNode(const node: IXMLDOMNode; deep: WordBool; out clone: IXMLDOMNode): HResult;
    property DefaultInterface: IXMLDOMDocument3 read GetDefaultInterface;
  published
    property Onondataavailable: TNotifyEvent read FOnondataavailable write FOnondataavailable;
    property Ononreadystatechange: TNotifyEvent read FOnonreadystatechange write FOnonreadystatechange;
  end;

// *********************************************************************//
// The Class CoFreeThreadedDOMDocument60 provides a Create and CreateRemote method to          
// create instances of the default interface IXMLDOMDocument3 exposed by              
// the CoClass FreeThreadedDOMDocument60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFreeThreadedDOMDocument60 = class
    class function Create: IXMLDOMDocument3;
    class function CreateRemote(const MachineName: string): IXMLDOMDocument3;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TFreeThreadedDOMDocument60
// Help String      : W3C-DOM XML Document 6.0 (Free threaded)
// Default Interface: IXMLDOMDocument3
// Def. Intf. DISP? : No
// Event   Interface: XMLDOMDocumentEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TFreeThreadedDOMDocument60 = class(TOleServer)
  private
    FOnondataavailable: TNotifyEvent;
    FOnonreadystatechange: TNotifyEvent;
    FIntf: IXMLDOMDocument3;
    function GetDefaultInterface: IXMLDOMDocument3;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
    function validateNode(const node: IXMLDOMNode; out errorObj: IXMLDOMParseError): HResult;
    function importNode(const node: IXMLDOMNode; deep: WordBool; out clone: IXMLDOMNode): HResult;
    property DefaultInterface: IXMLDOMDocument3 read GetDefaultInterface;
  published
    property Onondataavailable: TNotifyEvent read FOnondataavailable write FOnondataavailable;
    property Ononreadystatechange: TNotifyEvent read FOnonreadystatechange write FOnonreadystatechange;
  end;

// *********************************************************************//
// The Class CoXMLSchemaCache60 provides a Create and CreateRemote method to          
// create instances of the default interface IXMLDOMSchemaCollection2 exposed by              
// the CoClass XMLSchemaCache60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoXMLSchemaCache60 = class
    class function Create: IXMLDOMSchemaCollection2;
    class function CreateRemote(const MachineName: string): IXMLDOMSchemaCollection2;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TXMLSchemaCache60
// Help String      : XML Schema Cache 6.0
// Default Interface: IXMLDOMSchemaCollection2
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TXMLSchemaCache60 = class(TOleServer)
  private
    FIntf: IXMLDOMSchemaCollection2;
    function GetDefaultInterface: IXMLDOMSchemaCollection2;
  protected
    procedure InitServerData; override;
    function Set_validateOnLoad(validateOnLoad: WordBool): HResult;
    function Get_validateOnLoad(out validateOnLoad: WordBool): HResult;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IXMLDOMSchemaCollection2);
    procedure Disconnect; override;
    function validate: HResult;
    function getSchema(const namespaceURI: WideString; out schema: ISchema): HResult;
    function getDeclaration(const node: IXMLDOMNode; out item: ISchemaItem): HResult;
    property DefaultInterface: IXMLDOMSchemaCollection2 read GetDefaultInterface;
  published
  end;

// *********************************************************************//
// The Class CoXSLTemplate60 provides a Create and CreateRemote method to          
// create instances of the default interface IXSLTemplate exposed by              
// the CoClass XSLTemplate60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoXSLTemplate60 = class
    class function Create: IXSLTemplate;
    class function CreateRemote(const MachineName: string): IXSLTemplate;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TXSLTemplate60
// Help String      : XSL Stylesheet Cache 6.0
// Default Interface: IXSLTemplate
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TXSLTemplate60 = class(TOleServer)
  private
    FIntf: IXSLTemplate;
    function GetDefaultInterface: IXSLTemplate;
  protected
    procedure InitServerData; override;
    function _Set_stylesheet(const stylesheet: IXMLDOMNode): HResult;
    function Get_stylesheet(out stylesheet: IXMLDOMNode): HResult;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IXSLTemplate);
    procedure Disconnect; override;
    function createProcessor(out ppProcessor: IXSLProcessor): HResult;
    property DefaultInterface: IXSLTemplate read GetDefaultInterface;
  published
  end;

// *********************************************************************//
// The Class CoXMLHTTP60 provides a Create and CreateRemote method to          
// create instances of the default interface IXMLHTTPRequest exposed by              
// the CoClass XMLHTTP60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoXMLHTTP60 = class
    class function Create: IXMLHTTPRequest;
    class function CreateRemote(const MachineName: string): IXMLHTTPRequest;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TXMLHTTP60
// Help String      : XML HTTP Request class 6.0
// Default Interface: IXMLHTTPRequest
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TXMLHTTP60 = class(TOleServer)
  private
    FIntf: IXMLHTTPRequest;
    function GetDefaultInterface: IXMLHTTPRequest;
  protected
    procedure InitServerData; override;
    function Get_status(out plStatus: Integer): HResult;
    function Get_statusText(out pbstrStatus: WideString): HResult;
    function Get_responseXML(out ppBody: IDispatch): HResult;
    function Get_responseText(out pbstrBody: WideString): HResult;
    function Get_responseBody(out pvarBody: OleVariant): HResult;
    function Get_responseStream(out pvarBody: OleVariant): HResult;
    function Get_readyState(out plState: Integer): HResult;
    function Set_onreadystatechange(const Param1: IDispatch): HResult;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IXMLHTTPRequest);
    procedure Disconnect; override;
    function open(const bstrMethod: WideString; const bstrUrl: WideString): HResult; overload;
    function open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant): HResult; overload;
    function open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                  bstrUser: OleVariant): HResult; overload;
    function open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                  bstrUser: OleVariant; bstrPassword: OleVariant): HResult; overload;
    function setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString): HResult;
    function getResponseHeader(const bstrHeader: WideString; out pbstrValue: WideString): HResult;
    function getAllResponseHeaders(out pbstrHeaders: WideString): HResult;
    function send: HResult; overload;
    function send(varBody: OleVariant): HResult; overload;
    function abort: HResult;
    property DefaultInterface: IXMLHTTPRequest read GetDefaultInterface;
  published
  end;

// *********************************************************************//
// The Class CoFreeThreadedXMLHTTP60 provides a Create and CreateRemote method to          
// create instances of the default interface IXMLHTTPRequest2 exposed by              
// the CoClass FreeThreadedXMLHTTP60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFreeThreadedXMLHTTP60 = class
    class function Create: IXMLHTTPRequest2;
    class function CreateRemote(const MachineName: string): IXMLHTTPRequest2;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TFreeThreadedXMLHTTP60
// Help String      : Free Threaded XML HTTP Request class 6.0
// Default Interface: IXMLHTTPRequest2
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TFreeThreadedXMLHTTP60 = class(TOleServer)
  private
    FIntf: IXMLHTTPRequest2;
    function GetDefaultInterface: IXMLHTTPRequest2;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IXMLHTTPRequest2);
    procedure Disconnect; override;
    function open(pwszMethod: PWideChar; pwszUrl: PWideChar; 
                  const pStatusCallback: IXMLHTTPRequest2Callback; pwszUserName: PWideChar; 
                  pwszPassword: PWideChar; pwszProxyUserName: PWideChar; 
                  pwszProxyPassword: PWideChar): HResult;
    function send(const pBody: ISequentialStream; cbBody: Largeuint): HResult;
    function abort: HResult;
    function SetCookie(var pCookie: tagXHR_COOKIE; out pdwCookieState: LongWord): HResult;
    function SetCustomResponseStream(const pSequentialStream: ISequentialStream): HResult;
    function setProperty(eProperty: XHR_PROPERTY; ullValue: Largeuint): HResult;
    function setRequestHeader(pwszHeader: PWideChar; pwszValue: PWideChar): HResult;
    function getAllResponseHeaders(out ppwszHeaders: PWideChar): HResult;
    function GetCookie(pwszUrl: PWideChar; pwszName: PWideChar; dwFlags: LongWord; 
                       out pcCookies: LongWord; out ppCookies: PUserType1): HResult;
    function getResponseHeader(pwszHeader: PWideChar; out ppwszValue: PWideChar): HResult;
    property DefaultInterface: IXMLHTTPRequest2 read GetDefaultInterface;
  published
  end;

// *********************************************************************//
// The Class CoServerXMLHTTP60 provides a Create and CreateRemote method to          
// create instances of the default interface IServerXMLHTTPRequest2 exposed by              
// the CoClass ServerXMLHTTP60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoServerXMLHTTP60 = class
    class function Create: IServerXMLHTTPRequest2;
    class function CreateRemote(const MachineName: string): IServerXMLHTTPRequest2;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TServerXMLHTTP60
// Help String      : Server XML HTTP Request 6.0 
// Default Interface: IServerXMLHTTPRequest2
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TServerXMLHTTP60 = class(TOleServer)
  private
    FIntf: IServerXMLHTTPRequest2;
    function GetDefaultInterface: IServerXMLHTTPRequest2;
  protected
    procedure InitServerData; override;
    function Get_status(out plStatus: Integer): HResult;
    function Get_statusText(out pbstrStatus: WideString): HResult;
    function Get_responseXML(out ppBody: IDispatch): HResult;
    function Get_responseText(out pbstrBody: WideString): HResult;
    function Get_responseBody(out pvarBody: OleVariant): HResult;
    function Get_responseStream(out pvarBody: OleVariant): HResult;
    function Get_readyState(out plState: Integer): HResult;
    function Set_onreadystatechange(const Param1: IDispatch): HResult;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IServerXMLHTTPRequest2);
    procedure Disconnect; override;
    function open(const bstrMethod: WideString; const bstrUrl: WideString): HResult; overload;
    function open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant): HResult; overload;
    function open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                  bstrUser: OleVariant): HResult; overload;
    function open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; 
                  bstrUser: OleVariant; bstrPassword: OleVariant): HResult; overload;
    function setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString): HResult;
    function getResponseHeader(const bstrHeader: WideString; out pbstrValue: WideString): HResult;
    function getAllResponseHeaders(out pbstrHeaders: WideString): HResult;
    function send: HResult; overload;
    function send(varBody: OleVariant): HResult; overload;
    function abort: HResult;
    function setTimeouts(resolveTimeout: Integer; connectTimeout: Integer; sendTimeout: Integer; 
                         receiveTimeout: Integer): HResult;
    function waitForResponse(timeoutInSeconds: OleVariant; out isSuccessful: WordBool): HResult;
    function getOption(option: SERVERXMLHTTP_OPTION; out value: OleVariant): HResult;
    function setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant): HResult;
    function setProxy(proxySetting: SXH_PROXY_SETTING): HResult; overload;
    function setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer: OleVariant): HResult; overload;
    function setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer: OleVariant; 
                      varBypassList: OleVariant): HResult; overload;
    function setProxyCredentials(const bstrUserName: WideString; const bstrPassword: WideString): HResult;
    property DefaultInterface: IServerXMLHTTPRequest2 read GetDefaultInterface;
  published
  end;

// *********************************************************************//
// The Class CoSAXXMLReader60 provides a Create and CreateRemote method to          
// create instances of the default interface IVBSAXXMLReader exposed by              
// the CoClass SAXXMLReader60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSAXXMLReader60 = class
    class function Create: IVBSAXXMLReader;
    class function CreateRemote(const MachineName: string): IVBSAXXMLReader;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSAXXMLReader60
// Help String      : SAX XML Reader 6.0
// Default Interface: IVBSAXXMLReader
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TSAXXMLReader60 = class(TOleServer)
  private
    FIntf: IVBSAXXMLReader;
    function GetDefaultInterface: IVBSAXXMLReader;
  protected
    procedure InitServerData; override;
    function Get_entityResolver(out oResolver: IVBSAXEntityResolver): HResult;
    function _Set_entityResolver(const oResolver: IVBSAXEntityResolver): HResult;
    function Get_contentHandler(out oHandler: IVBSAXContentHandler): HResult;
    function _Set_contentHandler(const oHandler: IVBSAXContentHandler): HResult;
    function Get_dtdHandler(out oHandler: IVBSAXDTDHandler): HResult;
    function _Set_dtdHandler(const oHandler: IVBSAXDTDHandler): HResult;
    function Get_errorHandler(out oHandler: IVBSAXErrorHandler): HResult;
    function _Set_errorHandler(const oHandler: IVBSAXErrorHandler): HResult;
    function Get_baseURL(out strBaseURL: WideString): HResult;
    function Set_baseURL(const strBaseURL: WideString): HResult;
    function Get_secureBaseURL(out strSecureBaseURL: WideString): HResult;
    function Set_secureBaseURL(const strSecureBaseURL: WideString): HResult;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IVBSAXXMLReader);
    procedure Disconnect; override;
    function getFeature(const strName: WideString; out fValue: WordBool): HResult;
    function putFeature(const strName: WideString; fValue: WordBool): HResult;
    function getProperty(const strName: WideString; out varValue: OleVariant): HResult;
    function putProperty(const strName: WideString; varValue: OleVariant): HResult;
    function parse: HResult; overload;
    function parse(varInput: OleVariant): HResult; overload;
    function parseURL(const strURL: WideString): HResult;
    property DefaultInterface: IVBSAXXMLReader read GetDefaultInterface;
  published
  end;

// *********************************************************************//
// The Class CoMXXMLWriter60 provides a Create and CreateRemote method to          
// create instances of the default interface IMXWriter exposed by              
// the CoClass MXXMLWriter60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMXXMLWriter60 = class
    class function Create: IMXWriter;
    class function CreateRemote(const MachineName: string): IMXWriter;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMXXMLWriter60
// Help String      : Microsoft XML Writer 6.0
// Default Interface: IMXWriter
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TMXXMLWriter60 = class(TOleServer)
  private
    FIntf: IMXWriter;
    function GetDefaultInterface: IMXWriter;
  protected
    procedure InitServerData; override;
    function Set_output(varDestination: OleVariant): HResult;
    function Get_output(out varDestination: OleVariant): HResult;
    function Set_encoding(const strEncoding: WideString): HResult;
    function Get_encoding(out strEncoding: WideString): HResult;
    function Set_byteOrderMark(fWriteByteOrderMark: WordBool): HResult;
    function Get_byteOrderMark(out fWriteByteOrderMark: WordBool): HResult;
    function Set_indent(fIndentMode: WordBool): HResult;
    function Get_indent(out fIndentMode: WordBool): HResult;
    function Set_standalone(fValue: WordBool): HResult;
    function Get_standalone(out fValue: WordBool): HResult;
    function Set_omitXMLDeclaration(fValue: WordBool): HResult;
    function Get_omitXMLDeclaration(out fValue: WordBool): HResult;
    function Set_version(const strVersion: WideString): HResult;
    function Get_version(out strVersion: WideString): HResult;
    function Set_disableOutputEscaping(fValue: WordBool): HResult;
    function Get_disableOutputEscaping(out fValue: WordBool): HResult;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMXWriter);
    procedure Disconnect; override;
    function flush: HResult;
    property DefaultInterface: IMXWriter read GetDefaultInterface;
  published
  end;

// *********************************************************************//
// The Class CoMXHTMLWriter60 provides a Create and CreateRemote method to          
// create instances of the default interface IMXWriter exposed by              
// the CoClass MXHTMLWriter60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMXHTMLWriter60 = class
    class function Create: IMXWriter;
    class function CreateRemote(const MachineName: string): IMXWriter;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMXHTMLWriter60
// Help String      : Microsoft HTML Writer 6.0
// Default Interface: IMXWriter
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TMXHTMLWriter60 = class(TOleServer)
  private
    FIntf: IMXWriter;
    function GetDefaultInterface: IMXWriter;
  protected
    procedure InitServerData; override;
    function Set_output(varDestination: OleVariant): HResult;
    function Get_output(out varDestination: OleVariant): HResult;
    function Set_encoding(const strEncoding: WideString): HResult;
    function Get_encoding(out strEncoding: WideString): HResult;
    function Set_byteOrderMark(fWriteByteOrderMark: WordBool): HResult;
    function Get_byteOrderMark(out fWriteByteOrderMark: WordBool): HResult;
    function Set_indent(fIndentMode: WordBool): HResult;
    function Get_indent(out fIndentMode: WordBool): HResult;
    function Set_standalone(fValue: WordBool): HResult;
    function Get_standalone(out fValue: WordBool): HResult;
    function Set_omitXMLDeclaration(fValue: WordBool): HResult;
    function Get_omitXMLDeclaration(out fValue: WordBool): HResult;
    function Set_version(const strVersion: WideString): HResult;
    function Get_version(out strVersion: WideString): HResult;
    function Set_disableOutputEscaping(fValue: WordBool): HResult;
    function Get_disableOutputEscaping(out fValue: WordBool): HResult;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMXWriter);
    procedure Disconnect; override;
    function flush: HResult;
    property DefaultInterface: IMXWriter read GetDefaultInterface;
  published
  end;

// *********************************************************************//
// The Class CoSAXAttributes60 provides a Create and CreateRemote method to          
// create instances of the default interface IMXAttributes exposed by              
// the CoClass SAXAttributes60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSAXAttributes60 = class
    class function Create: IMXAttributes;
    class function CreateRemote(const MachineName: string): IMXAttributes;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSAXAttributes60
// Help String      : SAX Attributes 6.0
// Default Interface: IMXAttributes
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TSAXAttributes60 = class(TOleServer)
  private
    FIntf: IMXAttributes;
    function GetDefaultInterface: IMXAttributes;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMXAttributes);
    procedure Disconnect; override;
    function addAttribute(const strURI: WideString; const strLocalName: WideString; 
                          const strQName: WideString; const strType: WideString; 
                          const strValue: WideString): HResult;
    function addAttributeFromIndex(varAtts: OleVariant; nIndex: SYSINT): HResult;
    function clear: HResult;
    function removeAttribute(nIndex: SYSINT): HResult;
    function setAttribute(nIndex: SYSINT; const strURI: WideString; const strLocalName: WideString; 
                          const strQName: WideString; const strType: WideString; 
                          const strValue: WideString): HResult;
    function setAttributes(varAtts: OleVariant): HResult;
    function setLocalName(nIndex: SYSINT; const strLocalName: WideString): HResult;
    function setQName(nIndex: SYSINT; const strQName: WideString): HResult;
    function setType(nIndex: SYSINT; const strType: WideString): HResult;
    function setURI(nIndex: SYSINT; const strURI: WideString): HResult;
    function setValue(nIndex: SYSINT; const strValue: WideString): HResult;
    property DefaultInterface: IMXAttributes read GetDefaultInterface;
  published
  end;

// *********************************************************************//
// The Class CoMXNamespaceManager60 provides a Create and CreateRemote method to          
// create instances of the default interface IVBMXNamespaceManager exposed by              
// the CoClass MXNamespaceManager60. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMXNamespaceManager60 = class
    class function Create: IVBMXNamespaceManager;
    class function CreateRemote(const MachineName: string): IVBMXNamespaceManager;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMXNamespaceManager60
// Help String      : MX Namespace Manager 6.0
// Default Interface: IVBMXNamespaceManager
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TMXNamespaceManager60 = class(TOleServer)
  private
    FIntf: IVBMXNamespaceManager;
    function GetDefaultInterface: IVBMXNamespaceManager;
  protected
    procedure InitServerData; override;
    function Set_allowOverride(fOverride: WordBool): HResult;
    function Get_allowOverride(out fOverride: WordBool): HResult;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IVBMXNamespaceManager);
    procedure Disconnect; override;
    function reset: HResult;
    function pushContext: HResult;
    function pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool): HResult;
    function popContext: HResult;
    function declarePrefix(const prefix: WideString; const namespaceURI: WideString): HResult;
    function getDeclaredPrefixes(out prefixes: IMXNamespacePrefixes): HResult;
    function getPrefixes(const namespaceURI: WideString; out prefixes: IMXNamespacePrefixes): HResult;
    function getURI(const prefix: WideString; out uri: OleVariant): HResult;
    function getURIFromNode(const strPrefix: WideString; const contextNode: IXMLDOMNode; 
                            out uri: OleVariant): HResult;
    property DefaultInterface: IVBMXNamespaceManager read GetDefaultInterface;
  published
  end;

procedure Register;

resourcestring
  dtlServerPage = 'Servers';

  dtlOcxPage = 'ActiveX';

implementation

uses System.Win.ComObj;

class function CoDOMDocument60.Create: IXMLDOMDocument3;
begin
  Result := CreateComObject(CLASS_DOMDocument60) as IXMLDOMDocument3;
end;

class function CoDOMDocument60.CreateRemote(const MachineName: string): IXMLDOMDocument3;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DOMDocument60) as IXMLDOMDocument3;
end;

procedure TDOMDocument60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A05-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{2933BF96-7B36-11D2-B20E-00C04F983E60}';
    EventIID:  '{3EFAA427-272F-11D2-836F-0000F87A7782}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDOMDocument60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IXMLDOMDocument3;
  end;
end;

procedure TDOMDocument60.ConnectTo(svrIntf: IXMLDOMDocument3);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TDOMDocument60.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TDOMDocument60.GetDefaultInterface: IXMLDOMDocument3;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TDOMDocument60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TDOMDocument60.Destroy;
begin
  inherited Destroy;
end;

procedure TDOMDocument60.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    198: if Assigned(FOnondataavailable) then
         FOnondataavailable(Self);
    -609: if Assigned(FOnonreadystatechange) then
         FOnonreadystatechange(Self);
  end; {case DispID}
end;

function TDOMDocument60.validateNode(const node: IXMLDOMNode; out errorObj: IXMLDOMParseError): HResult;
begin
  Result := DefaultInterface.validateNode(node, errorObj);
end;

function TDOMDocument60.importNode(const node: IXMLDOMNode; deep: WordBool; out clone: IXMLDOMNode): HResult;
begin
  Result := DefaultInterface.importNode(node, deep, clone);
end;

class function CoFreeThreadedDOMDocument60.Create: IXMLDOMDocument3;
begin
  Result := CreateComObject(CLASS_FreeThreadedDOMDocument60) as IXMLDOMDocument3;
end;

class function CoFreeThreadedDOMDocument60.CreateRemote(const MachineName: string): IXMLDOMDocument3;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FreeThreadedDOMDocument60) as IXMLDOMDocument3;
end;

procedure TFreeThreadedDOMDocument60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A06-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{2933BF96-7B36-11D2-B20E-00C04F983E60}';
    EventIID:  '{3EFAA427-272F-11D2-836F-0000F87A7782}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TFreeThreadedDOMDocument60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IXMLDOMDocument3;
  end;
end;

procedure TFreeThreadedDOMDocument60.ConnectTo(svrIntf: IXMLDOMDocument3);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TFreeThreadedDOMDocument60.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TFreeThreadedDOMDocument60.GetDefaultInterface: IXMLDOMDocument3;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TFreeThreadedDOMDocument60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TFreeThreadedDOMDocument60.Destroy;
begin
  inherited Destroy;
end;

procedure TFreeThreadedDOMDocument60.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    198: if Assigned(FOnondataavailable) then
         FOnondataavailable(Self);
    -609: if Assigned(FOnonreadystatechange) then
         FOnonreadystatechange(Self);
  end; {case DispID}
end;

function TFreeThreadedDOMDocument60.validateNode(const node: IXMLDOMNode; 
                                                 out errorObj: IXMLDOMParseError): HResult;
begin
  Result := DefaultInterface.validateNode(node, errorObj);
end;

function TFreeThreadedDOMDocument60.importNode(const node: IXMLDOMNode; deep: WordBool; 
                                               out clone: IXMLDOMNode): HResult;
begin
  Result := DefaultInterface.importNode(node, deep, clone);
end;

class function CoXMLSchemaCache60.Create: IXMLDOMSchemaCollection2;
begin
  Result := CreateComObject(CLASS_XMLSchemaCache60) as IXMLDOMSchemaCollection2;
end;

class function CoXMLSchemaCache60.CreateRemote(const MachineName: string): IXMLDOMSchemaCollection2;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_XMLSchemaCache60) as IXMLDOMSchemaCollection2;
end;

procedure TXMLSchemaCache60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A07-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TXMLSchemaCache60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IXMLDOMSchemaCollection2;
  end;
end;

procedure TXMLSchemaCache60.ConnectTo(svrIntf: IXMLDOMSchemaCollection2);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TXMLSchemaCache60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TXMLSchemaCache60.GetDefaultInterface: IXMLDOMSchemaCollection2;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TXMLSchemaCache60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TXMLSchemaCache60.Destroy;
begin
  inherited Destroy;
end;

function TXMLSchemaCache60.Set_validateOnLoad(validateOnLoad: WordBool): HResult;
begin
  Result := DefaultInterface.Set_validateOnLoad(validateOnLoad);
end;

function TXMLSchemaCache60.Get_validateOnLoad(out validateOnLoad: WordBool): HResult;
begin
  Result := DefaultInterface.Get_validateOnLoad(validateOnLoad);
end;

function TXMLSchemaCache60.validate: HResult;
begin
  Result := DefaultInterface.validate;
end;

function TXMLSchemaCache60.getSchema(const namespaceURI: WideString; out schema: ISchema): HResult;
begin
  Result := DefaultInterface.getSchema(namespaceURI, schema);
end;

function TXMLSchemaCache60.getDeclaration(const node: IXMLDOMNode; out item: ISchemaItem): HResult;
begin
  Result := DefaultInterface.getDeclaration(node, item);
end;

class function CoXSLTemplate60.Create: IXSLTemplate;
begin
  Result := CreateComObject(CLASS_XSLTemplate60) as IXSLTemplate;
end;

class function CoXSLTemplate60.CreateRemote(const MachineName: string): IXSLTemplate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_XSLTemplate60) as IXSLTemplate;
end;

procedure TXSLTemplate60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A08-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{2933BF93-7B36-11D2-B20E-00C04F983E60}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TXSLTemplate60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IXSLTemplate;
  end;
end;

procedure TXSLTemplate60.ConnectTo(svrIntf: IXSLTemplate);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TXSLTemplate60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TXSLTemplate60.GetDefaultInterface: IXSLTemplate;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TXSLTemplate60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TXSLTemplate60.Destroy;
begin
  inherited Destroy;
end;

function TXSLTemplate60._Set_stylesheet(const stylesheet: IXMLDOMNode): HResult;
begin
  Result := DefaultInterface._Set_stylesheet(stylesheet);
end;

function TXSLTemplate60.Get_stylesheet(out stylesheet: IXMLDOMNode): HResult;
begin
  Result := DefaultInterface.Get_stylesheet(stylesheet);
end;

function TXSLTemplate60.createProcessor(out ppProcessor: IXSLProcessor): HResult;
begin
  Result := DefaultInterface.createProcessor(ppProcessor);
end;

class function CoXMLHTTP60.Create: IXMLHTTPRequest;
begin
  Result := CreateComObject(CLASS_XMLHTTP60) as IXMLHTTPRequest;
end;

class function CoXMLHTTP60.CreateRemote(const MachineName: string): IXMLHTTPRequest;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_XMLHTTP60) as IXMLHTTPRequest;
end;

procedure TXMLHTTP60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A0A-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{ED8C108D-4349-11D2-91A4-00C04F7969E8}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TXMLHTTP60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IXMLHTTPRequest;
  end;
end;

procedure TXMLHTTP60.ConnectTo(svrIntf: IXMLHTTPRequest);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TXMLHTTP60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TXMLHTTP60.GetDefaultInterface: IXMLHTTPRequest;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TXMLHTTP60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TXMLHTTP60.Destroy;
begin
  inherited Destroy;
end;

function TXMLHTTP60.Get_status(out plStatus: Integer): HResult;
begin
  Result := DefaultInterface.Get_status(plStatus);
end;

function TXMLHTTP60.Get_statusText(out pbstrStatus: WideString): HResult;
begin
  Result := DefaultInterface.Get_statusText(pbstrStatus);
end;

function TXMLHTTP60.Get_responseXML(out ppBody: IDispatch): HResult;
begin
  Result := DefaultInterface.Get_responseXML(ppBody);
end;

function TXMLHTTP60.Get_responseText(out pbstrBody: WideString): HResult;
begin
  Result := DefaultInterface.Get_responseText(pbstrBody);
end;

function TXMLHTTP60.Get_responseBody(out pvarBody: OleVariant): HResult;
begin
  Result := DefaultInterface.Get_responseBody(pvarBody);
end;

function TXMLHTTP60.Get_responseStream(out pvarBody: OleVariant): HResult;
begin
  Result := DefaultInterface.Get_responseStream(pvarBody);
end;

function TXMLHTTP60.Get_readyState(out plState: Integer): HResult;
begin
  Result := DefaultInterface.Get_readyState(plState);
end;

function TXMLHTTP60.Set_onreadystatechange(const Param1: IDispatch): HResult;
begin
  Result := DefaultInterface.Set_onreadystatechange(Param1);
end;

function TXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString): HResult;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.open(bstrMethod, bstrUrl, EmptyParam, EmptyParam, EmptyParam);
end;

function TXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString; 
                         varAsync: OleVariant): HResult;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.open(bstrMethod, bstrUrl, varAsync, EmptyParam, EmptyParam);
end;

function TXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString; 
                         varAsync: OleVariant; bstrUser: OleVariant): HResult;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.open(bstrMethod, bstrUrl, varAsync, bstrUser, EmptyParam);
end;

function TXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString; 
                         varAsync: OleVariant; bstrUser: OleVariant; bstrPassword: OleVariant): HResult;
begin
  Result := DefaultInterface.open(bstrMethod, bstrUrl, varAsync, bstrUser, bstrPassword);
end;

function TXMLHTTP60.setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString): HResult;
begin
  Result := DefaultInterface.setRequestHeader(bstrHeader, bstrValue);
end;

function TXMLHTTP60.getResponseHeader(const bstrHeader: WideString; out pbstrValue: WideString): HResult;
begin
  Result := DefaultInterface.getResponseHeader(bstrHeader, pbstrValue);
end;

function TXMLHTTP60.getAllResponseHeaders(out pbstrHeaders: WideString): HResult;
begin
  Result := DefaultInterface.getAllResponseHeaders(pbstrHeaders);
end;

function TXMLHTTP60.send: HResult;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.send(EmptyParam);
end;

function TXMLHTTP60.send(varBody: OleVariant): HResult;
begin
  Result := DefaultInterface.send(varBody);
end;

function TXMLHTTP60.abort: HResult;
begin
  Result := DefaultInterface.abort;
end;

class function CoFreeThreadedXMLHTTP60.Create: IXMLHTTPRequest2;
begin
  Result := CreateComObject(CLASS_FreeThreadedXMLHTTP60) as IXMLHTTPRequest2;
end;

class function CoFreeThreadedXMLHTTP60.CreateRemote(const MachineName: string): IXMLHTTPRequest2;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FreeThreadedXMLHTTP60) as IXMLHTTPRequest2;
end;

procedure TFreeThreadedXMLHTTP60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A09-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{E5D37DC0-552A-4D52-9CC0-A14D546FBD04}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TFreeThreadedXMLHTTP60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IXMLHTTPRequest2;
  end;
end;

procedure TFreeThreadedXMLHTTP60.ConnectTo(svrIntf: IXMLHTTPRequest2);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TFreeThreadedXMLHTTP60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TFreeThreadedXMLHTTP60.GetDefaultInterface: IXMLHTTPRequest2;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TFreeThreadedXMLHTTP60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TFreeThreadedXMLHTTP60.Destroy;
begin
  inherited Destroy;
end;

function TFreeThreadedXMLHTTP60.open(pwszMethod: PWideChar; pwszUrl: PWideChar; 
                                     const pStatusCallback: IXMLHTTPRequest2Callback; 
                                     pwszUserName: PWideChar; pwszPassword: PWideChar; 
                                     pwszProxyUserName: PWideChar; pwszProxyPassword: PWideChar): HResult;
begin
  Result := DefaultInterface.open(pwszMethod, pwszUrl, pStatusCallback, pwszUserName, pwszPassword, 
                                  pwszProxyUserName, pwszProxyPassword);
end;

function TFreeThreadedXMLHTTP60.send(const pBody: ISequentialStream; cbBody: Largeuint): HResult;
begin
  Result := DefaultInterface.send(pBody, cbBody);
end;

function TFreeThreadedXMLHTTP60.abort: HResult;
begin
  Result := DefaultInterface.abort;
end;

function TFreeThreadedXMLHTTP60.SetCookie(var pCookie: tagXHR_COOKIE; out pdwCookieState: LongWord): HResult;
begin
  Result := DefaultInterface.SetCookie(pCookie, pdwCookieState);
end;

function TFreeThreadedXMLHTTP60.SetCustomResponseStream(const pSequentialStream: ISequentialStream): HResult;
begin
  Result := DefaultInterface.SetCustomResponseStream(pSequentialStream);
end;

function TFreeThreadedXMLHTTP60.setProperty(eProperty: XHR_PROPERTY; ullValue: Largeuint): HResult;
begin
  Result := DefaultInterface.setProperty(eProperty, ullValue);
end;

function TFreeThreadedXMLHTTP60.setRequestHeader(pwszHeader: PWideChar; pwszValue: PWideChar): HResult;
begin
  Result := DefaultInterface.setRequestHeader(pwszHeader, pwszValue);
end;

function TFreeThreadedXMLHTTP60.getAllResponseHeaders(out ppwszHeaders: PWideChar): HResult;
begin
  Result := DefaultInterface.getAllResponseHeaders(ppwszHeaders);
end;

function TFreeThreadedXMLHTTP60.GetCookie(pwszUrl: PWideChar; pwszName: PWideChar; 
                                          dwFlags: LongWord; out pcCookies: LongWord; 
                                          out ppCookies: PUserType1): HResult;
begin
  Result := DefaultInterface.GetCookie(pwszUrl, pwszName, dwFlags, pcCookies, ppCookies);
end;

function TFreeThreadedXMLHTTP60.getResponseHeader(pwszHeader: PWideChar; out ppwszValue: PWideChar): HResult;
begin
  Result := DefaultInterface.getResponseHeader(pwszHeader, ppwszValue);
end;

class function CoServerXMLHTTP60.Create: IServerXMLHTTPRequest2;
begin
  Result := CreateComObject(CLASS_ServerXMLHTTP60) as IServerXMLHTTPRequest2;
end;

class function CoServerXMLHTTP60.CreateRemote(const MachineName: string): IServerXMLHTTPRequest2;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ServerXMLHTTP60) as IServerXMLHTTPRequest2;
end;

procedure TServerXMLHTTP60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A0B-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TServerXMLHTTP60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IServerXMLHTTPRequest2;
  end;
end;

procedure TServerXMLHTTP60.ConnectTo(svrIntf: IServerXMLHTTPRequest2);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TServerXMLHTTP60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TServerXMLHTTP60.GetDefaultInterface: IServerXMLHTTPRequest2;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TServerXMLHTTP60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TServerXMLHTTP60.Destroy;
begin
  inherited Destroy;
end;

function TServerXMLHTTP60.Get_status(out plStatus: Integer): HResult;
begin
  Result := DefaultInterface.Get_status(plStatus);
end;

function TServerXMLHTTP60.Get_statusText(out pbstrStatus: WideString): HResult;
begin
  Result := DefaultInterface.Get_statusText(pbstrStatus);
end;

function TServerXMLHTTP60.Get_responseXML(out ppBody: IDispatch): HResult;
begin
  Result := DefaultInterface.Get_responseXML(ppBody);
end;

function TServerXMLHTTP60.Get_responseText(out pbstrBody: WideString): HResult;
begin
  Result := DefaultInterface.Get_responseText(pbstrBody);
end;

function TServerXMLHTTP60.Get_responseBody(out pvarBody: OleVariant): HResult;
begin
  Result := DefaultInterface.Get_responseBody(pvarBody);
end;

function TServerXMLHTTP60.Get_responseStream(out pvarBody: OleVariant): HResult;
begin
  Result := DefaultInterface.Get_responseStream(pvarBody);
end;

function TServerXMLHTTP60.Get_readyState(out plState: Integer): HResult;
begin
  Result := DefaultInterface.Get_readyState(plState);
end;

function TServerXMLHTTP60.Set_onreadystatechange(const Param1: IDispatch): HResult;
begin
  Result := DefaultInterface.Set_onreadystatechange(Param1);
end;

function TServerXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString): HResult;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.open(bstrMethod, bstrUrl, EmptyParam, EmptyParam, EmptyParam);
end;

function TServerXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString; 
                               varAsync: OleVariant): HResult;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.open(bstrMethod, bstrUrl, varAsync, EmptyParam, EmptyParam);
end;

function TServerXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString; 
                               varAsync: OleVariant; bstrUser: OleVariant): HResult;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.open(bstrMethod, bstrUrl, varAsync, bstrUser, EmptyParam);
end;

function TServerXMLHTTP60.open(const bstrMethod: WideString; const bstrUrl: WideString; 
                               varAsync: OleVariant; bstrUser: OleVariant; bstrPassword: OleVariant): HResult;
begin
  Result := DefaultInterface.open(bstrMethod, bstrUrl, varAsync, bstrUser, bstrPassword);
end;

function TServerXMLHTTP60.setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString): HResult;
begin
  Result := DefaultInterface.setRequestHeader(bstrHeader, bstrValue);
end;

function TServerXMLHTTP60.getResponseHeader(const bstrHeader: WideString; out pbstrValue: WideString): HResult;
begin
  Result := DefaultInterface.getResponseHeader(bstrHeader, pbstrValue);
end;

function TServerXMLHTTP60.getAllResponseHeaders(out pbstrHeaders: WideString): HResult;
begin
  Result := DefaultInterface.getAllResponseHeaders(pbstrHeaders);
end;

function TServerXMLHTTP60.send: HResult;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.send(EmptyParam);
end;

function TServerXMLHTTP60.send(varBody: OleVariant): HResult;
begin
  Result := DefaultInterface.send(varBody);
end;

function TServerXMLHTTP60.abort: HResult;
begin
  Result := DefaultInterface.abort;
end;

function TServerXMLHTTP60.setTimeouts(resolveTimeout: Integer; connectTimeout: Integer; 
                                      sendTimeout: Integer; receiveTimeout: Integer): HResult;
begin
  Result := DefaultInterface.setTimeouts(resolveTimeout, connectTimeout, sendTimeout, receiveTimeout);
end;

function TServerXMLHTTP60.waitForResponse(timeoutInSeconds: OleVariant; out isSuccessful: WordBool): HResult;
begin
  Result := DefaultInterface.waitForResponse(timeoutInSeconds, isSuccessful);
end;

function TServerXMLHTTP60.getOption(option: SERVERXMLHTTP_OPTION; out value: OleVariant): HResult;
begin
  Result := DefaultInterface.getOption(option, value);
end;

function TServerXMLHTTP60.setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant): HResult;
begin
  Result := DefaultInterface.setOption(option, value);
end;

function TServerXMLHTTP60.setProxy(proxySetting: SXH_PROXY_SETTING): HResult;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.setProxy(proxySetting, EmptyParam, EmptyParam);
end;

function TServerXMLHTTP60.setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer: OleVariant): HResult;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.setProxy(proxySetting, varProxyServer, EmptyParam);
end;

function TServerXMLHTTP60.setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer: OleVariant; 
                                   varBypassList: OleVariant): HResult;
begin
  Result := DefaultInterface.setProxy(proxySetting, varProxyServer, varBypassList);
end;

function TServerXMLHTTP60.setProxyCredentials(const bstrUserName: WideString; 
                                              const bstrPassword: WideString): HResult;
begin
  Result := DefaultInterface.setProxyCredentials(bstrUserName, bstrPassword);
end;

class function CoSAXXMLReader60.Create: IVBSAXXMLReader;
begin
  Result := CreateComObject(CLASS_SAXXMLReader60) as IVBSAXXMLReader;
end;

class function CoSAXXMLReader60.CreateRemote(const MachineName: string): IVBSAXXMLReader;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SAXXMLReader60) as IVBSAXXMLReader;
end;

procedure TSAXXMLReader60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A0C-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{8C033CAA-6CD6-4F73-B728-4531AF74945F}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSAXXMLReader60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IVBSAXXMLReader;
  end;
end;

procedure TSAXXMLReader60.ConnectTo(svrIntf: IVBSAXXMLReader);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSAXXMLReader60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSAXXMLReader60.GetDefaultInterface: IVBSAXXMLReader;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSAXXMLReader60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSAXXMLReader60.Destroy;
begin
  inherited Destroy;
end;

function TSAXXMLReader60.Get_entityResolver(out oResolver: IVBSAXEntityResolver): HResult;
begin
  Result := DefaultInterface.Get_entityResolver(oResolver);
end;

function TSAXXMLReader60._Set_entityResolver(const oResolver: IVBSAXEntityResolver): HResult;
begin
  Result := DefaultInterface._Set_entityResolver(oResolver);
end;

function TSAXXMLReader60.Get_contentHandler(out oHandler: IVBSAXContentHandler): HResult;
begin
  Result := DefaultInterface.Get_contentHandler(oHandler);
end;

function TSAXXMLReader60._Set_contentHandler(const oHandler: IVBSAXContentHandler): HResult;
begin
  Result := DefaultInterface._Set_contentHandler(oHandler);
end;

function TSAXXMLReader60.Get_dtdHandler(out oHandler: IVBSAXDTDHandler): HResult;
begin
  Result := DefaultInterface.Get_dtdHandler(oHandler);
end;

function TSAXXMLReader60._Set_dtdHandler(const oHandler: IVBSAXDTDHandler): HResult;
begin
  Result := DefaultInterface._Set_dtdHandler(oHandler);
end;

function TSAXXMLReader60.Get_errorHandler(out oHandler: IVBSAXErrorHandler): HResult;
begin
  Result := DefaultInterface.Get_errorHandler(oHandler);
end;

function TSAXXMLReader60._Set_errorHandler(const oHandler: IVBSAXErrorHandler): HResult;
begin
  Result := DefaultInterface._Set_errorHandler(oHandler);
end;

function TSAXXMLReader60.Get_baseURL(out strBaseURL: WideString): HResult;
begin
  Result := DefaultInterface.Get_baseURL(strBaseURL);
end;

function TSAXXMLReader60.Set_baseURL(const strBaseURL: WideString): HResult;
begin
  Result := DefaultInterface.Set_baseURL(strBaseURL);
end;

function TSAXXMLReader60.Get_secureBaseURL(out strSecureBaseURL: WideString): HResult;
begin
  Result := DefaultInterface.Get_secureBaseURL(strSecureBaseURL);
end;

function TSAXXMLReader60.Set_secureBaseURL(const strSecureBaseURL: WideString): HResult;
begin
  Result := DefaultInterface.Set_secureBaseURL(strSecureBaseURL);
end;

function TSAXXMLReader60.getFeature(const strName: WideString; out fValue: WordBool): HResult;
begin
  Result := DefaultInterface.getFeature(strName, fValue);
end;

function TSAXXMLReader60.putFeature(const strName: WideString; fValue: WordBool): HResult;
begin
  Result := DefaultInterface.putFeature(strName, fValue);
end;

function TSAXXMLReader60.getProperty(const strName: WideString; out varValue: OleVariant): HResult;
begin
  Result := DefaultInterface.getProperty(strName, varValue);
end;

function TSAXXMLReader60.putProperty(const strName: WideString; varValue: OleVariant): HResult;
begin
  Result := DefaultInterface.putProperty(strName, varValue);
end;

function TSAXXMLReader60.parse: HResult;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.parse(EmptyParam);
end;

function TSAXXMLReader60.parse(varInput: OleVariant): HResult;
begin
  Result := DefaultInterface.parse(varInput);
end;

function TSAXXMLReader60.parseURL(const strURL: WideString): HResult;
begin
  Result := DefaultInterface.parseURL(strURL);
end;

class function CoMXXMLWriter60.Create: IMXWriter;
begin
  Result := CreateComObject(CLASS_MXXMLWriter60) as IMXWriter;
end;

class function CoMXXMLWriter60.CreateRemote(const MachineName: string): IMXWriter;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MXXMLWriter60) as IMXWriter;
end;

procedure TMXXMLWriter60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A0F-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMXXMLWriter60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMXWriter;
  end;
end;

procedure TMXXMLWriter60.ConnectTo(svrIntf: IMXWriter);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TMXXMLWriter60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TMXXMLWriter60.GetDefaultInterface: IMXWriter;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TMXXMLWriter60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TMXXMLWriter60.Destroy;
begin
  inherited Destroy;
end;

function TMXXMLWriter60.Set_output(varDestination: OleVariant): HResult;
begin
  Result := DefaultInterface.Set_output(varDestination);
end;

function TMXXMLWriter60.Get_output(out varDestination: OleVariant): HResult;
begin
  Result := DefaultInterface.Get_output(varDestination);
end;

function TMXXMLWriter60.Set_encoding(const strEncoding: WideString): HResult;
begin
  Result := DefaultInterface.Set_encoding(strEncoding);
end;

function TMXXMLWriter60.Get_encoding(out strEncoding: WideString): HResult;
begin
  Result := DefaultInterface.Get_encoding(strEncoding);
end;

function TMXXMLWriter60.Set_byteOrderMark(fWriteByteOrderMark: WordBool): HResult;
begin
  Result := DefaultInterface.Set_byteOrderMark(fWriteByteOrderMark);
end;

function TMXXMLWriter60.Get_byteOrderMark(out fWriteByteOrderMark: WordBool): HResult;
begin
  Result := DefaultInterface.Get_byteOrderMark(fWriteByteOrderMark);
end;

function TMXXMLWriter60.Set_indent(fIndentMode: WordBool): HResult;
begin
  Result := DefaultInterface.Set_indent(fIndentMode);
end;

function TMXXMLWriter60.Get_indent(out fIndentMode: WordBool): HResult;
begin
  Result := DefaultInterface.Get_indent(fIndentMode);
end;

function TMXXMLWriter60.Set_standalone(fValue: WordBool): HResult;
begin
  Result := DefaultInterface.Set_standalone(fValue);
end;

function TMXXMLWriter60.Get_standalone(out fValue: WordBool): HResult;
begin
  Result := DefaultInterface.Get_standalone(fValue);
end;

function TMXXMLWriter60.Set_omitXMLDeclaration(fValue: WordBool): HResult;
begin
  Result := DefaultInterface.Set_omitXMLDeclaration(fValue);
end;

function TMXXMLWriter60.Get_omitXMLDeclaration(out fValue: WordBool): HResult;
begin
  Result := DefaultInterface.Get_omitXMLDeclaration(fValue);
end;

function TMXXMLWriter60.Set_version(const strVersion: WideString): HResult;
begin
  Result := DefaultInterface.Set_version(strVersion);
end;

function TMXXMLWriter60.Get_version(out strVersion: WideString): HResult;
begin
  Result := DefaultInterface.Get_version(strVersion);
end;

function TMXXMLWriter60.Set_disableOutputEscaping(fValue: WordBool): HResult;
begin
  Result := DefaultInterface.Set_disableOutputEscaping(fValue);
end;

function TMXXMLWriter60.Get_disableOutputEscaping(out fValue: WordBool): HResult;
begin
  Result := DefaultInterface.Get_disableOutputEscaping(fValue);
end;

function TMXXMLWriter60.flush: HResult;
begin
  Result := DefaultInterface.flush;
end;

class function CoMXHTMLWriter60.Create: IMXWriter;
begin
  Result := CreateComObject(CLASS_MXHTMLWriter60) as IMXWriter;
end;

class function CoMXHTMLWriter60.CreateRemote(const MachineName: string): IMXWriter;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MXHTMLWriter60) as IMXWriter;
end;

procedure TMXHTMLWriter60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A10-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMXHTMLWriter60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMXWriter;
  end;
end;

procedure TMXHTMLWriter60.ConnectTo(svrIntf: IMXWriter);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TMXHTMLWriter60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TMXHTMLWriter60.GetDefaultInterface: IMXWriter;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TMXHTMLWriter60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TMXHTMLWriter60.Destroy;
begin
  inherited Destroy;
end;

function TMXHTMLWriter60.Set_output(varDestination: OleVariant): HResult;
begin
  Result := DefaultInterface.Set_output(varDestination);
end;

function TMXHTMLWriter60.Get_output(out varDestination: OleVariant): HResult;
begin
  Result := DefaultInterface.Get_output(varDestination);
end;

function TMXHTMLWriter60.Set_encoding(const strEncoding: WideString): HResult;
begin
  Result := DefaultInterface.Set_encoding(strEncoding);
end;

function TMXHTMLWriter60.Get_encoding(out strEncoding: WideString): HResult;
begin
  Result := DefaultInterface.Get_encoding(strEncoding);
end;

function TMXHTMLWriter60.Set_byteOrderMark(fWriteByteOrderMark: WordBool): HResult;
begin
  Result := DefaultInterface.Set_byteOrderMark(fWriteByteOrderMark);
end;

function TMXHTMLWriter60.Get_byteOrderMark(out fWriteByteOrderMark: WordBool): HResult;
begin
  Result := DefaultInterface.Get_byteOrderMark(fWriteByteOrderMark);
end;

function TMXHTMLWriter60.Set_indent(fIndentMode: WordBool): HResult;
begin
  Result := DefaultInterface.Set_indent(fIndentMode);
end;

function TMXHTMLWriter60.Get_indent(out fIndentMode: WordBool): HResult;
begin
  Result := DefaultInterface.Get_indent(fIndentMode);
end;

function TMXHTMLWriter60.Set_standalone(fValue: WordBool): HResult;
begin
  Result := DefaultInterface.Set_standalone(fValue);
end;

function TMXHTMLWriter60.Get_standalone(out fValue: WordBool): HResult;
begin
  Result := DefaultInterface.Get_standalone(fValue);
end;

function TMXHTMLWriter60.Set_omitXMLDeclaration(fValue: WordBool): HResult;
begin
  Result := DefaultInterface.Set_omitXMLDeclaration(fValue);
end;

function TMXHTMLWriter60.Get_omitXMLDeclaration(out fValue: WordBool): HResult;
begin
  Result := DefaultInterface.Get_omitXMLDeclaration(fValue);
end;

function TMXHTMLWriter60.Set_version(const strVersion: WideString): HResult;
begin
  Result := DefaultInterface.Set_version(strVersion);
end;

function TMXHTMLWriter60.Get_version(out strVersion: WideString): HResult;
begin
  Result := DefaultInterface.Get_version(strVersion);
end;

function TMXHTMLWriter60.Set_disableOutputEscaping(fValue: WordBool): HResult;
begin
  Result := DefaultInterface.Set_disableOutputEscaping(fValue);
end;

function TMXHTMLWriter60.Get_disableOutputEscaping(out fValue: WordBool): HResult;
begin
  Result := DefaultInterface.Get_disableOutputEscaping(fValue);
end;

function TMXHTMLWriter60.flush: HResult;
begin
  Result := DefaultInterface.flush;
end;

class function CoSAXAttributes60.Create: IMXAttributes;
begin
  Result := CreateComObject(CLASS_SAXAttributes60) as IMXAttributes;
end;

class function CoSAXAttributes60.CreateRemote(const MachineName: string): IMXAttributes;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SAXAttributes60) as IMXAttributes;
end;

procedure TSAXAttributes60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A0E-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSAXAttributes60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMXAttributes;
  end;
end;

procedure TSAXAttributes60.ConnectTo(svrIntf: IMXAttributes);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSAXAttributes60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSAXAttributes60.GetDefaultInterface: IMXAttributes;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSAXAttributes60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSAXAttributes60.Destroy;
begin
  inherited Destroy;
end;

function TSAXAttributes60.addAttribute(const strURI: WideString; const strLocalName: WideString; 
                                       const strQName: WideString; const strType: WideString; 
                                       const strValue: WideString): HResult;
begin
  Result := DefaultInterface.addAttribute(strURI, strLocalName, strQName, strType, strValue);
end;

function TSAXAttributes60.addAttributeFromIndex(varAtts: OleVariant; nIndex: SYSINT): HResult;
begin
  Result := DefaultInterface.addAttributeFromIndex(varAtts, nIndex);
end;

function TSAXAttributes60.clear: HResult;
begin
  Result := DefaultInterface.clear;
end;

function TSAXAttributes60.removeAttribute(nIndex: SYSINT): HResult;
begin
  Result := DefaultInterface.removeAttribute(nIndex);
end;

function TSAXAttributes60.setAttribute(nIndex: SYSINT; const strURI: WideString; 
                                       const strLocalName: WideString; const strQName: WideString; 
                                       const strType: WideString; const strValue: WideString): HResult;
begin
  Result := DefaultInterface.setAttribute(nIndex, strURI, strLocalName, strQName, strType, strValue);
end;

function TSAXAttributes60.setAttributes(varAtts: OleVariant): HResult;
begin
  Result := DefaultInterface.setAttributes(varAtts);
end;

function TSAXAttributes60.setLocalName(nIndex: SYSINT; const strLocalName: WideString): HResult;
begin
  Result := DefaultInterface.setLocalName(nIndex, strLocalName);
end;

function TSAXAttributes60.setQName(nIndex: SYSINT; const strQName: WideString): HResult;
begin
  Result := DefaultInterface.setQName(nIndex, strQName);
end;

function TSAXAttributes60.setType(nIndex: SYSINT; const strType: WideString): HResult;
begin
  Result := DefaultInterface.setType(nIndex, strType);
end;

function TSAXAttributes60.setURI(nIndex: SYSINT; const strURI: WideString): HResult;
begin
  Result := DefaultInterface.setURI(nIndex, strURI);
end;

function TSAXAttributes60.setValue(nIndex: SYSINT; const strValue: WideString): HResult;
begin
  Result := DefaultInterface.setValue(nIndex, strValue);
end;

class function CoMXNamespaceManager60.Create: IVBMXNamespaceManager;
begin
  Result := CreateComObject(CLASS_MXNamespaceManager60) as IVBMXNamespaceManager;
end;

class function CoMXNamespaceManager60.CreateRemote(const MachineName: string): IVBMXNamespaceManager;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MXNamespaceManager60) as IVBMXNamespaceManager;
end;

procedure TMXNamespaceManager60.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{88D96A11-F192-11D4-A65F-0040963251E5}';
    IntfIID:   '{C90352F5-643C-4FBC-BB23-E996EB2D51FD}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMXNamespaceManager60.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IVBMXNamespaceManager;
  end;
end;

procedure TMXNamespaceManager60.ConnectTo(svrIntf: IVBMXNamespaceManager);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TMXNamespaceManager60.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TMXNamespaceManager60.GetDefaultInterface: IVBMXNamespaceManager;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TMXNamespaceManager60.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TMXNamespaceManager60.Destroy;
begin
  inherited Destroy;
end;

function TMXNamespaceManager60.Set_allowOverride(fOverride: WordBool): HResult;
begin
  Result := DefaultInterface.Set_allowOverride(fOverride);
end;

function TMXNamespaceManager60.Get_allowOverride(out fOverride: WordBool): HResult;
begin
  Result := DefaultInterface.Get_allowOverride(fOverride);
end;

function TMXNamespaceManager60.reset: HResult;
begin
  Result := DefaultInterface.reset;
end;

function TMXNamespaceManager60.pushContext: HResult;
begin
  Result := DefaultInterface.pushContext;
end;

function TMXNamespaceManager60.pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool): HResult;
begin
  Result := DefaultInterface.pushNodeContext(contextNode, fDeep);
end;

function TMXNamespaceManager60.popContext: HResult;
begin
  Result := DefaultInterface.popContext;
end;

function TMXNamespaceManager60.declarePrefix(const prefix: WideString; 
                                             const namespaceURI: WideString): HResult;
begin
  Result := DefaultInterface.declarePrefix(prefix, namespaceURI);
end;

function TMXNamespaceManager60.getDeclaredPrefixes(out prefixes: IMXNamespacePrefixes): HResult;
begin
  Result := DefaultInterface.getDeclaredPrefixes(prefixes);
end;

function TMXNamespaceManager60.getPrefixes(const namespaceURI: WideString; 
                                           out prefixes: IMXNamespacePrefixes): HResult;
begin
  Result := DefaultInterface.getPrefixes(namespaceURI, prefixes);
end;

function TMXNamespaceManager60.getURI(const prefix: WideString; out uri: OleVariant): HResult;
begin
  Result := DefaultInterface.getURI(prefix, uri);
end;

function TMXNamespaceManager60.getURIFromNode(const strPrefix: WideString; 
                                              const contextNode: IXMLDOMNode; out uri: OleVariant): HResult;
begin
  Result := DefaultInterface.getURIFromNode(strPrefix, contextNode, uri);
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TDOMDocument60, TFreeThreadedDOMDocument60, TXMLSchemaCache60, TXSLTemplate60, 
    TXMLHTTP60, TFreeThreadedXMLHTTP60, TServerXMLHTTP60, TSAXXMLReader60, TMXXMLWriter60, 
    TMXHTMLWriter60, TSAXAttributes60, TMXNamespaceManager60]);
end;

end.
