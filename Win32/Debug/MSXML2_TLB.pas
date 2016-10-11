unit MSXML2_TLB;

interface

uses
  Winapi.ActiveX;

const
  MSXML2MajorVersion = 6;
  MSXML2MinorVersion = 0;

  LIBID_MSXML2: TGUID = '{F5078F18-C551-11D3-89B9-0000F81FE221}';

  // CLASSID constants
  CLASS_DOMDocument60: TGUID = '{88D96A05-F192-11D4-A65F-0040963251E5}';
  CLASS_FreeThreadedDOMDocument60: TGUID = '{88D96A06-F192-11D4-A65F-0040963251E5}';
  CLASS_XMLSchemaCache60: TGUID = '{88D96A07-F192-11D4-A65F-0040963251E5}';
  CLASS_XSLTemplate60: TGUID = '{88D96A08-F192-11D4-A65F-0040963251E5}';
  CLASS_XMLHTTP60: TGUID = '{88D96A0A-F192-11D4-A65F-0040963251E5}';
  CLASS_FreeThreadedXMLHTTP60: TGUID = '{88D96A09-F192-11D4-A65F-0040963251E5}';
  CLASS_ServerXMLHTTP60: TGUID = '{88D96A0B-F192-11D4-A65F-0040963251E5}';
  CLASS_SAXXMLReader60: TGUID = '{88D96A0C-F192-11D4-A65F-0040963251E5}';
  CLASS_MXXMLWriter60: TGUID = '{88D96A0F-F192-11D4-A65F-0040963251E5}';
  CLASS_MXHTMLWriter60: TGUID = '{88D96A10-F192-11D4-A65F-0040963251E5}';
  CLASS_SAXAttributes60: TGUID = '{88D96A0E-F192-11D4-A65F-0040963251E5}';
  CLASS_MXNamespaceManager60: TGUID = '{88D96A11-F192-11D4-A65F-0040963251E5}';

  // IID constants
  IID_IXMLDOMNode: TGUID = '{2933BF80-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMNodeList: TGUID = '{2933BF82-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMNamedNodeMap: TGUID = '{2933BF83-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMDocument: TGUID = '{2933BF81-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMDocumentType: TGUID = '{2933BF8B-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMImplementation: TGUID = '{2933BF8F-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMElement: TGUID = '{2933BF86-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMAttribute: TGUID = '{2933BF85-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMDocumentFragment: TGUID = '{3EFAA413-272F-11D2-836F-0000F87A7782}';
  IID_IXMLDOMText: TGUID = '{2933BF87-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMCharacterData: TGUID = '{2933BF84-7B36-11D2-B20E-00C04F983E60}';
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
  IID_ISchemaElement: TGUID = '{50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaParticle: TGUID = '{50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_ISchemaItem: TGUID = '{50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}';
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
  IID_IXMLDOMDocument3: TGUID = '{2933BF96-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMDocument2: TGUID = '{2933BF95-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLDOMSchemaCollection: TGUID = '{373984C8-B845-449B-91E7-45AC83036ADE}';
  IID_IXMLDOMSchemaCollection2: TGUID = '{50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}';
  IID_IXSLTemplate: TGUID = '{2933BF93-7B36-11D2-B20E-00C04F983E60}';
  IID_IXSLProcessor: TGUID = '{2933BF92-7B36-11D2-B20E-00C04F983E60}';
  IID_IXMLHTTPRequest: TGUID = '{ED8C108D-4349-11D2-91A4-00C04F7969E8}';
  IID_IXMLHTTPRequest2: TGUID = '{E5D37DC0-552A-4D52-9CC0-A14D546FBD04}';
  IID_IXMLHTTPRequest2Callback: TGUID = '{A44A9299-E321-40DE-8866-341B41669162}';
  IID_ISequentialStream: TGUID = '{0C733A30-2A1C-11CE-ADE5-00AA0044773D}';
  IID_IServerXMLHTTPRequest2: TGUID = '{2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}';
  IID_IServerXMLHTTPRequest: TGUID = '{2E9196BF-13BA-4DD4-91CA-6C571F281495}';
  IID_IMXWriter: TGUID = '{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}';
  IID_ISAXDeclHandler: TGUID = '{862629AC-771A-47B2-8337-4E6843C1BE90}';
  IID_ISAXLexicalHandler: TGUID = '{7F85D5F5-47A8-4497-BDA5-84BA04819EA6}';
  IID_IVBSAXDeclHandler: TGUID = '{E8917260-7579-4BE1-B5DD-7AFBFA6F077B}';
  IID_IVBSAXLexicalHandler: TGUID = '{032AAC35-8C0E-4D9D-979F-E3B702935576}';
  IID_IMXAttributes: TGUID = '{F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}';
  IID_IVBMXNamespaceManager: TGUID = '{C90352F5-643C-4FBC-BB23-E996EB2D51FD}';
  IID_IMXNamespacePrefixes: TGUID = '{C90352F4-643C-4FBC-BB23-E996EB2D51FD}';
  IID_IMXNamespaceManager: TGUID = '{C90352F6-643C-4FBC-BB23-E996EB2D51FD}';

// Enumerators
type
  tagDOMNodeType = type TOleEnum;
const
  NODE_INVALID = tagDOMNodeType($00000000);
  NODE_ELEMENT = tagDOMNodeType($00000001);
  NODE_ATTRIBUTE = tagDOMNodeType($00000002);
  NODE_TEXT = tagDOMNodeType($00000003);
  NODE_CDATA_SECTION = tagDOMNodeType($00000004);
  NODE_ENTITY_REFERENCE = tagDOMNodeType($00000005);
  NODE_ENTITY = tagDOMNodeType($00000006);
  NODE_PROCESSING_INSTRUCTION = tagDOMNodeType($00000007);
  NODE_COMMENT = tagDOMNodeType($00000008);
  NODE_DOCUMENT = tagDOMNodeType($00000009);
  NODE_DOCUMENT_TYPE = tagDOMNodeType($0000000A);
  NODE_DOCUMENT_FRAGMENT = tagDOMNodeType($0000000B);
  NODE_NOTATION = tagDOMNodeType($0000000C);

type
  _SOMITEMTYPE = type TOleEnum;
const
  SOMITEM_SCHEMA = _SOMITEMTYPE($00001000);
  SOMITEM_ATTRIBUTE = _SOMITEMTYPE($00001001);
  SOMITEM_ATTRIBUTEGROUP = _SOMITEMTYPE($00001002);
  SOMITEM_NOTATION = _SOMITEMTYPE($00001003);
  SOMITEM_ANNOTATION = _SOMITEMTYPE($00001004);
  SOMITEM_IDENTITYCONSTRAINT = _SOMITEMTYPE($00001100);
  SOMITEM_KEY = _SOMITEMTYPE($00001101);
  SOMITEM_KEYREF = _SOMITEMTYPE($00001102);
  SOMITEM_UNIQUE = _SOMITEMTYPE($00001103);
  SOMITEM_ANYTYPE = _SOMITEMTYPE($00002000);
  SOMITEM_DATATYPE = _SOMITEMTYPE($00002100);
  SOMITEM_DATATYPE_ANYTYPE = _SOMITEMTYPE($00002101);
  SOMITEM_DATATYPE_ANYURI = _SOMITEMTYPE($00002102);
  SOMITEM_DATATYPE_BASE64BINARY = _SOMITEMTYPE($00002103);
  SOMITEM_DATATYPE_BOOLEAN = _SOMITEMTYPE($00002104);
  SOMITEM_DATATYPE_BYTE = _SOMITEMTYPE($00002105);
  SOMITEM_DATATYPE_DATE = _SOMITEMTYPE($00002106);
  SOMITEM_DATATYPE_DATETIME = _SOMITEMTYPE($00002107);
  SOMITEM_DATATYPE_DAY = _SOMITEMTYPE($00002108);
  SOMITEM_DATATYPE_DECIMAL = _SOMITEMTYPE($00002109);
  SOMITEM_DATATYPE_DOUBLE = _SOMITEMTYPE($0000210A);
  SOMITEM_DATATYPE_DURATION = _SOMITEMTYPE($0000210B);
  SOMITEM_DATATYPE_ENTITIES = _SOMITEMTYPE($0000210C);
  SOMITEM_DATATYPE_ENTITY = _SOMITEMTYPE($0000210D);
  SOMITEM_DATATYPE_FLOAT = _SOMITEMTYPE($0000210E);
  SOMITEM_DATATYPE_HEXBINARY = _SOMITEMTYPE($0000210F);
  SOMITEM_DATATYPE_ID = _SOMITEMTYPE($00002110);
  SOMITEM_DATATYPE_IDREF = _SOMITEMTYPE($00002111);
  SOMITEM_DATATYPE_IDREFS = _SOMITEMTYPE($00002112);
  SOMITEM_DATATYPE_INT = _SOMITEMTYPE($00002113);
  SOMITEM_DATATYPE_INTEGER = _SOMITEMTYPE($00002114);
  SOMITEM_DATATYPE_LANGUAGE = _SOMITEMTYPE($00002115);
  SOMITEM_DATATYPE_LONG = _SOMITEMTYPE($00002116);
  SOMITEM_DATATYPE_MONTH = _SOMITEMTYPE($00002117);
  SOMITEM_DATATYPE_MONTHDAY = _SOMITEMTYPE($00002118);
  SOMITEM_DATATYPE_NAME = _SOMITEMTYPE($00002119);
  SOMITEM_DATATYPE_NCNAME = _SOMITEMTYPE($0000211A);
  SOMITEM_DATATYPE_NEGATIVEINTEGER = _SOMITEMTYPE($0000211B);
  SOMITEM_DATATYPE_NMTOKEN = _SOMITEMTYPE($0000211C);
  SOMITEM_DATATYPE_NMTOKENS = _SOMITEMTYPE($0000211D);
  SOMITEM_DATATYPE_NONNEGATIVEINTEGER = _SOMITEMTYPE($0000211E);
  SOMITEM_DATATYPE_NONPOSITIVEINTEGER = _SOMITEMTYPE($0000211F);
  SOMITEM_DATATYPE_NORMALIZEDSTRING = _SOMITEMTYPE($00002120);
  SOMITEM_DATATYPE_NOTATION = _SOMITEMTYPE($00002121);
  SOMITEM_DATATYPE_POSITIVEINTEGER = _SOMITEMTYPE($00002122);
  SOMITEM_DATATYPE_QNAME = _SOMITEMTYPE($00002123);
  SOMITEM_DATATYPE_SHORT = _SOMITEMTYPE($00002124);
  SOMITEM_DATATYPE_STRING = _SOMITEMTYPE($00002125);
  SOMITEM_DATATYPE_TIME = _SOMITEMTYPE($00002126);
  SOMITEM_DATATYPE_TOKEN = _SOMITEMTYPE($00002127);
  SOMITEM_DATATYPE_UNSIGNEDBYTE = _SOMITEMTYPE($00002128);
  SOMITEM_DATATYPE_UNSIGNEDINT = _SOMITEMTYPE($00002129);
  SOMITEM_DATATYPE_UNSIGNEDLONG = _SOMITEMTYPE($0000212A);
  SOMITEM_DATATYPE_UNSIGNEDSHORT = _SOMITEMTYPE($0000212B);
  SOMITEM_DATATYPE_YEAR = _SOMITEMTYPE($0000212C);
  SOMITEM_DATATYPE_YEARMONTH = _SOMITEMTYPE($0000212D);
  SOMITEM_DATATYPE_ANYSIMPLETYPE = _SOMITEMTYPE($000021FF);
  SOMITEM_SIMPLETYPE = _SOMITEMTYPE($00002200);
  SOMITEM_COMPLEXTYPE = _SOMITEMTYPE($00002400);
  SOMITEM_PARTICLE = _SOMITEMTYPE($00004000);
  SOMITEM_ANY = _SOMITEMTYPE($00004001);
  SOMITEM_ANYATTRIBUTE = _SOMITEMTYPE($00004002);
  SOMITEM_ELEMENT = _SOMITEMTYPE($00004003);
  SOMITEM_GROUP = _SOMITEMTYPE($00004100);
  SOMITEM_ALL = _SOMITEMTYPE($00004101);
  SOMITEM_CHOICE = _SOMITEMTYPE($00004102);
  SOMITEM_SEQUENCE = _SOMITEMTYPE($00004103);
  SOMITEM_EMPTYPARTICLE = _SOMITEMTYPE($00004104);
  SOMITEM_NULL = _SOMITEMTYPE($00000800);
  SOMITEM_NULL_TYPE = _SOMITEMTYPE($00002800);
  SOMITEM_NULL_ANY = _SOMITEMTYPE($00004801);
  SOMITEM_NULL_ANYATTRIBUTE = _SOMITEMTYPE($00004802);
  SOMITEM_NULL_ELEMENT = _SOMITEMTYPE($00004803);

type
  _SCHEMADERIVATIONMETHOD = type TOleEnum;
const
  SCHEMADERIVATIONMETHOD_EMPTY = _SCHEMADERIVATIONMETHOD($00000000);
  SCHEMADERIVATIONMETHOD_SUBSTITUTION = _SCHEMADERIVATIONMETHOD($00000001);
  SCHEMADERIVATIONMETHOD_EXTENSION = _SCHEMADERIVATIONMETHOD($00000002);
  SCHEMADERIVATIONMETHOD_RESTRICTION = _SCHEMADERIVATIONMETHOD($00000004);
  SCHEMADERIVATIONMETHOD_LIST = _SCHEMADERIVATIONMETHOD($00000008);
  SCHEMADERIVATIONMETHOD_UNION = _SCHEMADERIVATIONMETHOD($00000010);
  SCHEMADERIVATIONMETHOD_ALL = _SCHEMADERIVATIONMETHOD($000000FF);
  SCHEMADERIVATIONMETHOD_NONE = _SCHEMADERIVATIONMETHOD($00000100);

type
  _SCHEMATYPEVARIETY = type TOleEnum;
const
  SCHEMATYPEVARIETY_NONE = _SCHEMATYPEVARIETY($FFFFFFFF);
  SCHEMATYPEVARIETY_ATOMIC = _SCHEMATYPEVARIETY($00000000);
  SCHEMATYPEVARIETY_LIST = _SCHEMATYPEVARIETY($00000001);
  SCHEMATYPEVARIETY_UNION = _SCHEMATYPEVARIETY($00000002);

type
  _SCHEMAWHITESPACE = type TOleEnum;
const
  SCHEMAWHITESPACE_NONE = _SCHEMAWHITESPACE($FFFFFFFF);
  SCHEMAWHITESPACE_PRESERVE = _SCHEMAWHITESPACE($00000000);
  SCHEMAWHITESPACE_REPLACE = _SCHEMAWHITESPACE($00000001);
  SCHEMAWHITESPACE_COLLAPSE = _SCHEMAWHITESPACE($00000002);

type
  _SCHEMAPROCESSCONTENTS = type TOleEnum;
const
  SCHEMAPROCESSCONTENTS_NONE = _SCHEMAPROCESSCONTENTS($00000000);
  SCHEMAPROCESSCONTENTS_SKIP = _SCHEMAPROCESSCONTENTS($00000001);
  SCHEMAPROCESSCONTENTS_LAX = _SCHEMAPROCESSCONTENTS($00000002);
  SCHEMAPROCESSCONTENTS_STRICT = _SCHEMAPROCESSCONTENTS($00000003);

type
  _SCHEMACONTENTTYPE = type TOleEnum;
const
  SCHEMACONTENTTYPE_EMPTY = _SCHEMACONTENTTYPE($00000000);
  SCHEMACONTENTTYPE_TEXTONLY = _SCHEMACONTENTTYPE($00000001);
  SCHEMACONTENTTYPE_ELEMENTONLY = _SCHEMACONTENTTYPE($00000002);
  SCHEMACONTENTTYPE_MIXED = _SCHEMACONTENTTYPE($00000003);

type
  _SCHEMAUSE = type TOleEnum;
const
  SCHEMAUSE_OPTIONAL = _SCHEMAUSE($00000000);
  SCHEMAUSE_PROHIBITED = _SCHEMAUSE($00000001);
  SCHEMAUSE_REQUIRED = _SCHEMAUSE($00000002);

type
  _SERVERXMLHTTP_OPTION = type TOleEnum;
const
  SXH_OPTION_URL = _SERVERXMLHTTP_OPTION($FFFFFFFF);
  SXH_OPTION_URL_CODEPAGE = _SERVERXMLHTTP_OPTION($00000000);
  SXH_OPTION_ESCAPE_PERCENT_IN_URL = _SERVERXMLHTTP_OPTION($00000001);
  SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS = _SERVERXMLHTTP_OPTION($00000002);
  SXH_OPTION_SELECT_CLIENT_SSL_CERT = _SERVERXMLHTTP_OPTION($00000003);

type
  _SXH_SERVER_CERT_OPTION = type TOleEnum;
const
  SXH_SERVER_CERT_IGNORE_UNKNOWN_CA = _SXH_SERVER_CERT_OPTION($00000100);
  SXH_SERVER_CERT_IGNORE_WRONG_USAGE = _SXH_SERVER_CERT_OPTION($00000200);
  SXH_SERVER_CERT_IGNORE_CERT_CN_INVALID = _SXH_SERVER_CERT_OPTION($00001000);
  SXH_SERVER_CERT_IGNORE_CERT_DATE_INVALID = _SXH_SERVER_CERT_OPTION($00002000);
  SXH_SERVER_CERT_IGNORE_ALL_SERVER_ERRORS = _SXH_SERVER_CERT_OPTION($00003300);

type
  _SXH_PROXY_SETTING = type TOleEnum;
const
  SXH_PROXY_SET_DEFAULT = _SXH_PROXY_SETTING($00000000);
  SXH_PROXY_SET_PRECONFIG = _SXH_PROXY_SETTING($00000000);
  SXH_PROXY_SET_DIRECT = _SXH_PROXY_SETTING($00000001);
  SXH_PROXY_SET_PROXY = _SXH_PROXY_SETTING($00000002);

type
  _XHR_PROPERTY = type TOleEnum;
const
  XHR_PROP_NO_CRED_PROMPT = _XHR_PROPERTY($00000000);
  XHR_PROP_NO_AUTH = _XHR_PROPERTY($00000001);
  XHR_PROP_TIMEOUT = _XHR_PROPERTY($00000002);
  XHR_PROP_NO_DEFAULT_HEADERS = _XHR_PROPERTY($00000003);
  XHR_PROP_REPORT_REDIRECT_STATUS = _XHR_PROPERTY($00000004);
  XHR_PROP_NO_CACHE = _XHR_PROPERTY($00000005);
  XHR_PROP_EXTENDED_ERROR = _XHR_PROPERTY($00000006);
  XHR_PROP_QUERY_STRING_UTF8 = _XHR_PROPERTY($00000007);
  XHR_PROP_IGNORE_CERT_ERRORS = _XHR_PROPERTY($00000008);

type
  // Interfaces forward declarations
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
  IXMLDOMText = interface;
  IXMLDOMTextDisp = dispinterface;
  IXMLDOMCharacterData = interface;
  IXMLDOMCharacterDataDisp = dispinterface;
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
  ISchemaElement = interface;
  ISchemaElementDisp = dispinterface;
  ISchemaParticle = interface;
  ISchemaParticleDisp = dispinterface;
  ISchemaItem = interface;
  ISchemaItemDisp = dispinterface;
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
  IXMLDOMDocument3 = interface;
  IXMLDOMDocument3Disp = dispinterface;
  IXMLDOMDocument2 = interface;
  IXMLDOMDocument2Disp = dispinterface;
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
  IServerXMLHTTPRequest2 = interface;
  IServerXMLHTTPRequest2Disp = dispinterface;
  IServerXMLHTTPRequest = interface;
  IServerXMLHTTPRequestDisp = dispinterface;
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
  IMXNamespacePrefixes = interface;
  IMXNamespacePrefixesDisp = dispinterface;
  IMXNamespaceManager = interface;

type
  // CoClasses as default interface
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

type
  // Aliaces
  DOMNodeType = type tagDOMNodeType;
  SOMITEMTYPE = type _SOMITEMTYPE;
  SCHEMADERIVATIONMETHOD = type _SCHEMADERIVATIONMETHOD;
  SCHEMATYPEVARIETY = type _SCHEMATYPEVARIETY;
  SCHEMAWHITESPACE = type _SCHEMAWHITESPACE;
  SCHEMAPROCESSCONTENTS = type _SCHEMAPROCESSCONTENTS;
  SCHEMACONTENTTYPE = type _SCHEMACONTENTTYPE;
  SCHEMAUSE = type _SCHEMAUSE;
  SERVERXMLHTTP_OPTION = type _SERVERXMLHTTP_OPTION;
  SXH_SERVER_CERT_OPTION = type _SXH_SERVER_CERT_OPTION;
  SXH_PROXY_SETTING = type _SXH_PROXY_SETTING;
  XHR_PROPERTY = type _XHR_PROPERTY;

type
  // Records
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

  tagXHR_COOKIE = record
    pwszUrl: PWideChar;
    pwszName: PWideChar;
    pwszValue: PWideChar;
    pwszP3PPolicy: PWideChar;
    ftExpires: _FILETIME;
    dwFlags: Cardinal;
  end;

  _FILETIME = record
    dwLowDateTime: Cardinal;
    dwHighDateTime: Cardinal;
  end;


type
  // Interfaces
  Disp!!!
  IXMLDOMNode = interface(IDispatch)
    ['{2933BF80-7B36-11D2-B20E-00C04F983E60}']
    nodeName;
    nodeValue;
    nodeValue;
    nodeType;
    parentNode;
    childNodes;
    firstChild;
    lastChild;
    previousSibling;
    nextSibling;
    attributes;
    insertBefore;
    replaceChild;
    removeChild;
    appendChild;
    hasChildNodes;
    ownerDocument;
    cloneNode;
    nodeTypeString;
    text;
    text;
    specified;
    definition;
    nodeTypedValue;
    nodeTypedValue;
    dataType;
    dataType;
    xml;
    transformNode;
    selectNodes;
    selectSingleNode;
    parsed;
    namespaceURI;
    prefix;
    baseName;
    transformNodeToObject;
  end;

  Disp!!!
  IXMLDOMNodeList = interface(IDispatch)
    ['{2933BF82-7B36-11D2-B20E-00C04F983E60}']
    item;
    length;
    nextNode;
    reset;
    _newEnum;
  end;

  Disp!!!
  IXMLDOMNamedNodeMap = interface(IDispatch)
    ['{2933BF83-7B36-11D2-B20E-00C04F983E60}']
    getNamedItem;
    setNamedItem;
    removeNamedItem;
    item;
    length;
    getQualifiedItem;
    removeQualifiedItem;
    nextNode;
    reset;
    _newEnum;
  end;

  Disp!!!
  IXMLDOMDocument = interface(IXMLDOMNode)
    ['{2933BF81-7B36-11D2-B20E-00C04F983E60}']
    doctype;
    implementation;
    documentElement;
    documentElement;
    createElement;
    createDocumentFragment;
    createTextNode;
    createComment;
    createCDATASection;
    createProcessingInstruction;
    createAttribute;
    createEntityReference;
    getElementsByTagName;
    createNode;
    nodeFromID;
    load;
    readyState;
    parseError;
    url;
    async;
    async;
    abort;
    loadXML;
    save;
    validateOnParse;
    validateOnParse;
    resolveExternals;
    resolveExternals;
    preserveWhiteSpace;
    preserveWhiteSpace;
    onreadystatechange;
    ondataavailable;
    ontransformnode;
  end;

  Disp!!!
  IXMLDOMDocumentType = interface(IXMLDOMNode)
    ['{2933BF8B-7B36-11D2-B20E-00C04F983E60}']
    name;
    entities;
    notations;
  end;

  Disp!!!
  IXMLDOMImplementation = interface(IDispatch)
    ['{2933BF8F-7B36-11D2-B20E-00C04F983E60}']
    hasFeature;
  end;

  Disp!!!
  IXMLDOMElement = interface(IXMLDOMNode)
    ['{2933BF86-7B36-11D2-B20E-00C04F983E60}']
    tagName;
    getAttribute;
    setAttribute;
    removeAttribute;
    getAttributeNode;
    setAttributeNode;
    removeAttributeNode;
    getElementsByTagName;
    normalize;
  end;

  Disp!!!
  IXMLDOMAttribute = interface(IXMLDOMNode)
    ['{2933BF85-7B36-11D2-B20E-00C04F983E60}']
    name;
    value;
    value;
  end;

  Disp!!!
  IXMLDOMDocumentFragment = interface(IXMLDOMNode)
    ['{3EFAA413-272F-11D2-836F-0000F87A7782}']
  end;

  Disp!!!
  IXMLDOMText = interface(IXMLDOMCharacterData)
    ['{2933BF87-7B36-11D2-B20E-00C04F983E60}']
    splitText;
  end;

  Disp!!!
  IXMLDOMCharacterData = interface(IXMLDOMNode)
    ['{2933BF84-7B36-11D2-B20E-00C04F983E60}']
    data;
    data;
    length;
    substringData;
    appendData;
    insertData;
    deleteData;
    replaceData;
  end;

  Disp!!!
  IXMLDOMComment = interface(IXMLDOMCharacterData)
    ['{2933BF88-7B36-11D2-B20E-00C04F983E60}']
  end;

  Disp!!!
  IXMLDOMCDATASection = interface(IXMLDOMText)
    ['{2933BF8A-7B36-11D2-B20E-00C04F983E60}']
  end;

  Disp!!!
  IXMLDOMProcessingInstruction = interface(IXMLDOMNode)
    ['{2933BF89-7B36-11D2-B20E-00C04F983E60}']
    target;
    data;
    data;
  end;

  Disp!!!
  IXMLDOMEntityReference = interface(IXMLDOMNode)
    ['{2933BF8E-7B36-11D2-B20E-00C04F983E60}']
  end;

  Disp!!!
  IXMLDOMParseError = interface(IDispatch)
    ['{3EFAA426-272F-11D2-836F-0000F87A7782}']
    errorCode;
    url;
    reason;
    srcText;
    line;
    linepos;
    filepos;
  end;

  Disp!!!
  IXMLDOMNotation = interface(IXMLDOMNode)
    ['{2933BF8C-7B36-11D2-B20E-00C04F983E60}']
    publicId;
    systemId;
  end;

  Disp!!!
  IXMLDOMEntity = interface(IXMLDOMNode)
    ['{2933BF8D-7B36-11D2-B20E-00C04F983E60}']
    publicId;
    systemId;
    notationName;
  end;

  Disp!!!
  IXMLDOMParseError2 = interface(IXMLDOMParseError)
    ['{3EFAA428-272F-11D2-836F-0000F87A7782}']
    errorXPath;
    allErrors;
    errorParameters;
    errorParametersCount;
  end;

  Disp!!!
  IXMLDOMParseErrorCollection = interface(IDispatch)
    ['{3EFAA429-272F-11D2-836F-0000F87A7782}']
    item;
    length;
    next;
    reset;
    _newEnum;
  end;

  Disp!!!
  IXTLRuntime = interface(IXMLDOMNode)
    ['{3EFAA425-272F-11D2-836F-0000F87A7782}']
    uniqueID;
    depth;
    childNumber;
    ancestorChildNumber;
    absoluteChildNumber;
    formatIndex;
    formatNumber;
    formatDate;
    formatTime;
  end;

  ISAXXMLReader = interface(IUnknown)
    ['{A4F96ED0-F829-476E-81C0-CDC7BD2A0802}']
    getFeature;
    putFeature;
    getProperty;
    putProperty;
    getEntityResolver;
    putEntityResolver;
    getContentHandler;
    putContentHandler;
    getDTDHandler;
    putDTDHandler;
    getErrorHandler;
    putErrorHandler;
    getBaseURL;
    putBaseURL;
    getSecureBaseURL;
    putSecureBaseURL;
    parse;
    parseURL;
  end;

  ISAXEntityResolver = interface(IUnknown)
    ['{99BCA7BD-E8C4-4D5F-A0CF-6D907901FF07}']
    resolveEntity;
  end;

  ISAXContentHandler = interface(IUnknown)
    ['{1545CDFA-9E4E-4497-A8A4-2BF7D0112C44}']
    putDocumentLocator;
    startDocument;
    endDocument;
    startPrefixMapping;
    endPrefixMapping;
    startElement;
    endElement;
    characters;
    ignorableWhitespace;
    processingInstruction;
    skippedEntity;
  end;

  ISAXLocator = interface(IUnknown)
    ['{9B7E472A-0DE4-4640-BFF3-84D38A051C31}']
    getColumnNumber;
    getLineNumber;
    getPublicId;
    getSystemId;
  end;

  ISAXAttributes = interface(IUnknown)
    ['{F078ABE1-45D2-4832-91EA-4466CE2F25C9}']
    getLength;
    getURI;
    getLocalName;
    getQName;
    getName;
    getIndexFromName;
    getIndexFromQName;
    getType;
    getTypeFromName;
    getTypeFromQName;
    getValue;
    getValueFromName;
    getValueFromQName;
  end;

  ISAXDTDHandler = interface(IUnknown)
    ['{E15C1BAF-AFB3-4D60-8C36-19A8C45DEFED}']
    notationDecl;
    unparsedEntityDecl;
  end;

  ISAXErrorHandler = interface(IUnknown)
    ['{A60511C4-CCF5-479E-98A3-DC8DC545B7D0}']
    error;
    fatalError;
    ignorableWarning;
  end;

  ISAXXMLFilter = interface(ISAXXMLReader)
    ['{70409222-CA09-4475-ACB8-40312FE8D145}']
    getParent;
    putParent;
  end;

  Disp!!!
  IVBSAXXMLFilter = interface(IDispatch)
    ['{1299EB1B-5B88-433E-82DE-82CA75AD4E04}']
    parent;
    parent;
  end;

  Disp!!!
  IVBSAXXMLReader = interface(IDispatch)
    ['{8C033CAA-6CD6-4F73-B728-4531AF74945F}']
    getFeature;
    putFeature;
    getProperty;
    putProperty;
    entityResolver;
    entityResolver;
    contentHandler;
    contentHandler;
    dtdHandler;
    dtdHandler;
    errorHandler;
    errorHandler;
    baseURL;
    baseURL;
    secureBaseURL;
    secureBaseURL;
    parse;
    parseURL;
  end;

  Disp!!!
  IVBSAXEntityResolver = interface(IDispatch)
    ['{0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}']
    resolveEntity;
  end;

  Disp!!!
  IVBSAXContentHandler = interface(IDispatch)
    ['{2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}']
    documentLocator;
    startDocument;
    endDocument;
    startPrefixMapping;
    endPrefixMapping;
    startElement;
    endElement;
    characters;
    ignorableWhitespace;
    processingInstruction;
    skippedEntity;
  end;

  Disp!!!
  IVBSAXLocator = interface(IDispatch)
    ['{796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}']
    columnNumber;
    lineNumber;
    publicId;
    systemId;
  end;

  Disp!!!
  IVBSAXAttributes = interface(IDispatch)
    ['{10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}']
    length;
    getURI;
    getLocalName;
    getQName;
    getIndexFromName;
    getIndexFromQName;
    getType;
    getTypeFromName;
    getTypeFromQName;
    getValue;
    getValueFromName;
    getValueFromQName;
  end;

  Disp!!!
  IVBSAXDTDHandler = interface(IDispatch)
    ['{24FB3297-302D-4620-BA39-3A732D850558}']
    notationDecl;
    unparsedEntityDecl;
  end;

  Disp!!!
  IVBSAXErrorHandler = interface(IDispatch)
    ['{D963D3FE-173C-4862-9095-B92F66995F52}']
    error;
    fatalError;
    ignorableWarning;
  end;

  Disp!!!
  IMXReaderControl = interface(IDispatch)
    ['{808F4E35-8D5A-4FBE-8466-33A41279ED30}']
    abort;
    resume;
    suspend;
  end;

  Disp!!!
  IMXSchemaDeclHandler = interface(IDispatch)
    ['{FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}']
    schemaElementDecl;
  end;

  Disp!!!
  ISchemaElement = interface(ISchemaParticle)
    ['{50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}']
    type;
    scope;
    defaultValue;
    fixedValue;
    isNillable;
    identityConstraints;
    substitutionGroup;
    substitutionGroupExclusions;
    disallowedSubstitutions;
    isAbstract;
    isReference;
  end;

  Disp!!!
  ISchemaParticle = interface(ISchemaItem)
    ['{50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}']
    minOccurs;
    maxOccurs;
  end;

  Disp!!!
  ISchemaItem = interface(IDispatch)
    ['{50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}']
    name;
    namespaceURI;
    schema;
    id;
    itemType;
    unhandledAttributes;
    writeAnnotation;
  end;

  Disp!!!
  ISchema = interface(ISchemaItem)
    ['{50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}']
    targetNamespace;
    version;
    types;
    elements;
    attributes;
    attributeGroups;
    modelGroups;
    notations;
    schemaLocations;
  end;

  Disp!!!
  ISchemaItemCollection = interface(IDispatch)
    ['{50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}']
    item;
    itemByName;
    itemByQName;
    length;
    _newEnum;
  end;

  Disp!!!
  ISchemaStringCollection = interface(IDispatch)
    ['{50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}']
    item;
    length;
    _newEnum;
  end;

  Disp!!!
  ISchemaType = interface(ISchemaItem)
    ['{50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}']
    baseTypes;
    final;
    variety;
    derivedBy;
    isValid;
    minExclusive;
    minInclusive;
    maxExclusive;
    maxInclusive;
    totalDigits;
    fractionDigits;
    length;
    minLength;
    maxLength;
    enumeration;
    whitespace;
    patterns;
  end;

  Disp!!!
  ISchemaComplexType = interface(ISchemaType)
    ['{50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}']
    isAbstract;
    anyAttribute;
    attributes;
    contentType;
    contentModel;
    prohibitedSubstitutions;
  end;

  Disp!!!
  ISchemaAny = interface(ISchemaParticle)
    ['{50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}']
    namespaces;
    processContents;
  end;

  Disp!!!
  ISchemaModelGroup = interface(ISchemaParticle)
    ['{50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}']
    particles;
  end;

  Disp!!!
  IMXXMLFilter = interface(IDispatch)
    ['{C90352F7-643C-4FBC-BB23-E996EB2D51FD}']
    getFeature;
    putFeature;
    getProperty;
    putProperty;
    entityResolver;
    entityResolver;
    contentHandler;
    contentHandler;
    dtdHandler;
    dtdHandler;
    errorHandler;
    errorHandler;
  end;

  Disp!!!
  ISchemaAttribute = interface(ISchemaItem)
    ['{50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}']
    type;
    scope;
    defaultValue;
    fixedValue;
    use;
    isReference;
  end;

  Disp!!!
  ISchemaAttributeGroup = interface(ISchemaItem)
    ['{50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}']
    anyAttribute;
    attributes;
  end;

  Disp!!!
  ISchemaIdentityConstraint = interface(ISchemaItem)
    ['{50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}']
    selector;
    fields;
    referencedKey;
  end;

  Disp!!!
  ISchemaNotation = interface(ISchemaItem)
    ['{50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}']
    systemIdentifier;
    publicIdentifier;
  end;

  Disp!!!
  IXMLDOMSelection = interface(IXMLDOMNodeList)
    ['{AA634FC7-5888-44A7-A257-3A47150D3A0E}']
    expr;
    expr;
    context;
    context;
    peekNode;
    matches;
    removeNext;
    removeAll;
    clone;
    getProperty;
    setProperty;
  end;

  Disp!!!
  XMLDOMDocumentEvents = interface(IDispatch)
    ['{3EFAA427-272F-11D2-836F-0000F87A7782}']
    ondataavailable;
    onreadystatechange;
  end;

  Disp!!!
  IXMLDOMDocument3 = interface(IXMLDOMDocument2)
    ['{2933BF96-7B36-11D2-B20E-00C04F983E60}']
    validateNode;
    importNode;
  end;

  Disp!!!
  IXMLDOMDocument2 = interface(IXMLDOMDocument)
    ['{2933BF95-7B36-11D2-B20E-00C04F983E60}']
    namespaces;
    schemas;
    schemas;
    validate;
    setProperty;
    getProperty;
  end;

  Disp!!!
  IXMLDOMSchemaCollection = interface(IDispatch)
    ['{373984C8-B845-449B-91E7-45AC83036ADE}']
    add;
    get;
    remove;
    length;
    namespaceURI;
    addCollection;
    _newEnum;
  end;

  Disp!!!
  IXMLDOMSchemaCollection2 = interface(IXMLDOMSchemaCollection)
    ['{50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}']
    validate;
    validateOnLoad;
    validateOnLoad;
    getSchema;
    getDeclaration;
  end;

  Disp!!!
  IXSLTemplate = interface(IDispatch)
    ['{2933BF93-7B36-11D2-B20E-00C04F983E60}']
    stylesheet;
    stylesheet;
    createProcessor;
  end;

  Disp!!!
  IXSLProcessor = interface(IDispatch)
    ['{2933BF92-7B36-11D2-B20E-00C04F983E60}']
    input;
    input;
    ownerTemplate;
    setStartMode;
    startMode;
    startModeURI;
    output;
    output;
    transform;
    reset;
    readyState;
    addParameter;
    addObject;
    stylesheet;
  end;

  Disp!!!
  IXMLHTTPRequest = interface(IDispatch)
    ['{ED8C108D-4349-11D2-91A4-00C04F7969E8}']
    open;
    setRequestHeader;
    getResponseHeader;
    getAllResponseHeaders;
    send;
    abort;
    status;
    statusText;
    responseXML;
    responseText;
    responseBody;
    responseStream;
    readyState;
    onreadystatechange;
  end;

  IXMLHTTPRequest2 = interface(IUnknown)
    ['{E5D37DC0-552A-4D52-9CC0-A14D546FBD04}']
    open;
    send;
    abort;
    SetCookie;
    SetCustomResponseStream;
    setProperty;
    setRequestHeader;
    getAllResponseHeaders;
    GetCookie;
    getResponseHeader;
  end;

  IXMLHTTPRequest2Callback = interface(IUnknown)
    ['{A44A9299-E321-40DE-8866-341B41669162}']
    OnRedirect;
    OnHeadersAvailable;
    ondataavailable;
    OnResponseReceived;
    OnError;
  end;

  ISequentialStream = interface(IUnknown)
    ['{0C733A30-2A1C-11CE-ADE5-00AA0044773D}']
    RemoteRead;
    RemoteWrite;
  end;

  Disp!!!
  IServerXMLHTTPRequest2 = interface(IServerXMLHTTPRequest)
    ['{2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}']
    setProxy;
    setProxyCredentials;
  end;

  Disp!!!
  IServerXMLHTTPRequest = interface(IXMLHTTPRequest)
    ['{2E9196BF-13BA-4DD4-91CA-6C571F281495}']
    setTimeouts;
    waitForResponse;
    getOption;
    setOption;
  end;

  Disp!!!
  IMXWriter = interface(IDispatch)
    ['{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}']
    output;
    output;
    encoding;
    encoding;
    byteOrderMark;
    byteOrderMark;
    indent;
    indent;
    standalone;
    standalone;
    omitXMLDeclaration;
    omitXMLDeclaration;
    version;
    version;
    disableOutputEscaping;
    disableOutputEscaping;
    flush;
  end;

  ISAXDeclHandler = interface(IUnknown)
    ['{862629AC-771A-47B2-8337-4E6843C1BE90}']
    elementDecl;
    attributeDecl;
    internalEntityDecl;
    externalEntityDecl;
  end;

  ISAXLexicalHandler = interface(IUnknown)
    ['{7F85D5F5-47A8-4497-BDA5-84BA04819EA6}']
    startDTD;
    endDTD;
    startEntity;
    endEntity;
    startCDATA;
    endCDATA;
    comment;
  end;

  Disp!!!
  IVBSAXDeclHandler = interface(IDispatch)
    ['{E8917260-7579-4BE1-B5DD-7AFBFA6F077B}']
    elementDecl;
    attributeDecl;
    internalEntityDecl;
    externalEntityDecl;
  end;

  Disp!!!
  IVBSAXLexicalHandler = interface(IDispatch)
    ['{032AAC35-8C0E-4D9D-979F-E3B702935576}']
    startDTD;
    endDTD;
    startEntity;
    endEntity;
    startCDATA;
    endCDATA;
    comment;
  end;

  Disp!!!
  IMXAttributes = interface(IDispatch)
    ['{F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}']
    addAttribute;
    addAttributeFromIndex;
    clear;
    removeAttribute;
    setAttribute;
    setAttributes;
    setLocalName;
    setQName;
    setType;
    setURI;
    setValue;
  end;

  Disp!!!
  IVBMXNamespaceManager = interface(IDispatch)
    ['{C90352F5-643C-4FBC-BB23-E996EB2D51FD}']
    allowOverride;
    allowOverride;
    reset;
    pushContext;
    pushNodeContext;
    popContext;
    declarePrefix;
    getDeclaredPrefixes;
    getPrefixes;
    getURI;
    getURIFromNode;
  end;

  Disp!!!
  IMXNamespacePrefixes = interface(IDispatch)
    ['{C90352F4-643C-4FBC-BB23-E996EB2D51FD}']
    item;
    length;
    _newEnum;
  end;

  IMXNamespaceManager = interface(IUnknown)
    ['{C90352F6-643C-4FBC-BB23-E996EB2D51FD}']
    putAllowOverride;
    getAllowOverride;
    reset;
    pushContext;
    pushNodeContext;
    popContext;
    declarePrefix;
    getDeclaredPrefix;
    getPrefix;
    getURI;
  end;


