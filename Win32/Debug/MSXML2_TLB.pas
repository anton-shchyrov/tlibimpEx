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
    function Get_nodeName(out name: WideString): HRESULT; stdcall;
    function Get_nodeValue(out value: OleVariant): HRESULT; stdcall;
    function Set_nodeValue(value: OleVariant): HRESULT; stdcall;
    function Get_nodeType(out type_: DOMNodeType): HRESULT; stdcall;
    function Get_parentNode(out parent: IXMLDOMNode): HRESULT; stdcall;
    function Get_childNodes(out childList: IXMLDOMNodeList): HRESULT; stdcall;
    function Get_firstChild(out firstChild: IXMLDOMNode): HRESULT; stdcall;
    function Get_lastChild(out lastChild: IXMLDOMNode): HRESULT; stdcall;
    function Get_previousSibling(out previousSibling: IXMLDOMNode): HRESULT; stdcall;
    function Get_nextSibling(out nextSibling: IXMLDOMNode): HRESULT; stdcall;
    function Get_attributes(out attributeMap: IXMLDOMNamedNodeMap): HRESULT; stdcall;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant;
      out outNewChild: IXMLDOMNode): HRESULT; stdcall;
    function replaceChild(const newChild: IXMLDOMNode;
      const oldChild: IXMLDOMNode; out outOldChild: IXMLDOMNode): HRESULT; stdcall;
    function removeChild(const childNode: IXMLDOMNode;
      out oldChild: IXMLDOMNode): HRESULT; stdcall;
    function appendChild(const newChild: IXMLDOMNode;
      out outNewChild: IXMLDOMNode): HRESULT; stdcall;
    function hasChildNodes(out hasChild: WordBool): HRESULT; stdcall;
    function Get_ownerDocument(out XMLDOMDocument: IXMLDOMDocument): HRESULT; stdcall;
    function cloneNode(deep: WordBool; out cloneRoot: IXMLDOMNode): HRESULT; stdcall;
    function Get_nodeTypeString(out nodeType: WideString): HRESULT; stdcall;
    function Get_text(out text: WideString): HRESULT; stdcall;
    function Set_text(const text: WideString): HRESULT; stdcall;
    function Get_specified(out isSpecified: WordBool): HRESULT; stdcall;
    function Get_definition(out definitionNode: IXMLDOMNode): HRESULT; stdcall;
    function Get_nodeTypedValue(out typedValue: OleVariant): HRESULT; stdcall;
    function Set_nodeTypedValue(typedValue: OleVariant): HRESULT; stdcall;
    function Get_dataType(out dataTypeName: OleVariant): HRESULT; stdcall;
    function Set_dataType(const dataTypeName: WideString): HRESULT; stdcall;
    function Get_xml(out xmlString: WideString): HRESULT; stdcall;
    function transformNode(const stylesheet: IXMLDOMNode;
      out xmlString: WideString): HRESULT; stdcall;
    function selectNodes(const queryString: WideString;
      out resultList: IXMLDOMNodeList): HRESULT; stdcall;
    function selectSingleNode(const queryString: WideString;
      out resultNode: IXMLDOMNode): HRESULT; stdcall;
    function Get_parsed(out isParsed: WordBool): HRESULT; stdcall;
    function Get_namespaceURI(out namespaceURI: WideString): HRESULT; stdcall;
    function Get_prefix(out prefixString: WideString): HRESULT; stdcall;
    function Get_baseName(out nameString: WideString): HRESULT; stdcall;
    function transformNodeToObject(const stylesheet: IXMLDOMNode;
      outputObject: OleVariant): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMNodeList = interface(IDispatch)
    ['{2933BF82-7B36-11D2-B20E-00C04F983E60}']
    function Get_item(index: Integer; out listItem: IXMLDOMNode): HRESULT; stdcall;
    function Get_length(out listLength: Integer): HRESULT; stdcall;
    function nextNode(out nextItem: IXMLDOMNode): HRESULT; stdcall;
    function rese): HRESULT; stdcall;
    function Get__newEnum(out ppUnk: IUnknown): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMNamedNodeMap = interface(IDispatch)
    ['{2933BF83-7B36-11D2-B20E-00C04F983E60}']
    function getNamedItem(const name: WideString; out namedItem: IXMLDOMNode): HRESULT; stdcall;
    function setNamedItem(const newItem: IXMLDOMNode;
      out nameItem: IXMLDOMNode): HRESULT; stdcall;
    function removeNamedItem(const name: WideString;
      out namedItem: IXMLDOMNode): HRESULT; stdcall;
    function Get_item(index: Integer; out listItem: IXMLDOMNode): HRESULT; stdcall;
    function Get_length(out listLength: Integer): HRESULT; stdcall;
    function getQualifiedItem(const baseName: WideString;
      const namespaceURI: WideString; out qualifiedItem: IXMLDOMNode): HRESULT; stdcall;
    function removeQualifiedItem(const baseName: WideString;
      const namespaceURI: WideString; out qualifiedItem: IXMLDOMNode): HRESULT; stdcall;
    function nextNode(out nextItem: IXMLDOMNode): HRESULT; stdcall;
    function rese): HRESULT; stdcall;
    function Get__newEnum(out ppUnk: IUnknown): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMDocument = interface(IXMLDOMNode)
    ['{2933BF81-7B36-11D2-B20E-00C04F983E60}']
    function Get_doctype(out documentType: IXMLDOMDocumentType): HRESULT; stdcall;
    function Get_implementation_(out impl: IXMLDOMImplementation): HRESULT; stdcall;
    function Get_documentElement(out DOMElement: IXMLDOMElement): HRESULT; stdcall;
    function Set_documentElement(const DOMElement: IXMLDOMElement): HRESULT; stdcall;
    function createElement(const tagName: WideString;
      out element: IXMLDOMElement): HRESULT; stdcall;
    function createDocumentFragment(out docFrag: IXMLDOMDocumentFragment): HRESULT; stdcall;
    function createTextNode(const data: WideString; out text: IXMLDOMText): HRESULT; stdcall;
    function createComment(const data: WideString;
      out comment: IXMLDOMComment): HRESULT; stdcall;
    function createCDATASection(const data: WideString;
      out cdata: IXMLDOMCDATASection): HRESULT; stdcall;
    function createProcessingInstruction(const target: WideString;
      const data: WideString; out pi: IXMLDOMProcessingInstruction): HRESULT; stdcall;
    function createAttribute(const name: WideString;
      out attribute: IXMLDOMAttribute): HRESULT; stdcall;
    function createEntityReference(const name: WideString;
      out entityRef: IXMLDOMEntityReference): HRESULT; stdcall;
    function getElementsByTagName(const tagName: WideString;
      out resultList: IXMLDOMNodeList): HRESULT; stdcall;
    function createNode(type_: OleVariant; const name: WideString;
      const namespaceURI: WideString; out node: IXMLDOMNode): HRESULT; stdcall;
    function nodeFromID(const idString: WideString; out node: IXMLDOMNode): HRESULT; stdcall;
    function load(xmlSource: OleVariant; out isSuccessful: WordBool): HRESULT; stdcall;
    function Get_readyState(out value: Integer): HRESULT; stdcall;
    function Get_parseError(out errorObj: IXMLDOMParseError): HRESULT; stdcall;
    function Get_url(out urlString: WideString): HRESULT; stdcall;
    function Get_async(out isAsync: WordBool): HRESULT; stdcall;
    function Set_async(isAsync: WordBool): HRESULT; stdcall;
    function abor): HRESULT; stdcall;
    function loadXML(const bstrXML: WideString; out isSuccessful: WordBool): HRESULT; stdcall;
    function save(destination: OleVariant): HRESULT; stdcall;
    function Get_validateOnParse(out isValidating: WordBool): HRESULT; stdcall;
    function Set_validateOnParse(isValidating: WordBool): HRESULT; stdcall;
    function Get_resolveExternals(out isResolving: WordBool): HRESULT; stdcall;
    function Set_resolveExternals(isResolving: WordBool): HRESULT; stdcall;
    function Get_preserveWhiteSpace(out isPreserving: WordBool): HRESULT; stdcall;
    function Set_preserveWhiteSpace(isPreserving: WordBool): HRESULT; stdcall;
    function Set_onreadystatechange(: OleVariant): HRESULT; stdcall;
    function Set_ondataavailable(: OleVariant): HRESULT; stdcall;
    function Set_ontransformnode(: OleVariant): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMDocumentType = interface(IXMLDOMNode)
    ['{2933BF8B-7B36-11D2-B20E-00C04F983E60}']
    function Get_name(out rootName: WideString): HRESULT; stdcall;
    function Get_entities(out entityMap: IXMLDOMNamedNodeMap): HRESULT; stdcall;
    function Get_notations(out notationMap: IXMLDOMNamedNodeMap): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMImplementation = interface(IDispatch)
    ['{2933BF8F-7B36-11D2-B20E-00C04F983E60}']
    function hasFeature(const feature: WideString; const version: WideString;
      out hasFeature: WordBool): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMElement = interface(IXMLDOMNode)
    ['{2933BF86-7B36-11D2-B20E-00C04F983E60}']
    function Get_tagName(out tagName: WideString): HRESULT; stdcall;
    function getAttribute(const name: WideString; out value: OleVariant): HRESULT; stdcall;
    function setAttribute(const name: WideString; value: OleVariant): HRESULT; stdcall;
    function removeAttribute(const name: WideString): HRESULT; stdcall;
    function getAttributeNode(const name: WideString;
      out attributeNode: IXMLDOMAttribute): HRESULT; stdcall;
    function setAttributeNode(const DOMAttribute: IXMLDOMAttribute;
      out attributeNode: IXMLDOMAttribute): HRESULT; stdcall;
    function removeAttributeNode(const DOMAttribute: IXMLDOMAttribute;
      out attributeNode: IXMLDOMAttribute): HRESULT; stdcall;
    function getElementsByTagName(const tagName: WideString;
      out resultList: IXMLDOMNodeList): HRESULT; stdcall;
    function normaliz): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMAttribute = interface(IXMLDOMNode)
    ['{2933BF85-7B36-11D2-B20E-00C04F983E60}']
    function Get_name(out attributeName: WideString): HRESULT; stdcall;
    function Get_value(out attributeValue: OleVariant): HRESULT; stdcall;
    function Set_value(attributeValue: OleVariant): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMDocumentFragment = interface(IXMLDOMNode)
    ['{3EFAA413-272F-11D2-836F-0000F87A7782}']
  end;

  Disp!!!
  IXMLDOMText = interface(IXMLDOMCharacterData)
    ['{2933BF87-7B36-11D2-B20E-00C04F983E60}']
    function splitText(offset: Integer; out rightHandTextNode: IXMLDOMText): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMCharacterData = interface(IXMLDOMNode)
    ['{2933BF84-7B36-11D2-B20E-00C04F983E60}']
    function Get_data(out data: WideString): HRESULT; stdcall;
    function Set_data(const data: WideString): HRESULT; stdcall;
    function Get_length(out dataLength: Integer): HRESULT; stdcall;
    function substringData(offset: Integer; count: Integer;
      out data: WideString): HRESULT; stdcall;
    function appendData(const data: WideString): HRESULT; stdcall;
    function insertData(offset: Integer; const data: WideString): HRESULT; stdcall;
    function deleteData(offset: Integer; count: Integer): HRESULT; stdcall;
    function replaceData(offset: Integer; count: Integer;
      const data: WideString): HRESULT; stdcall;
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
    function Get_target(out name: WideString): HRESULT; stdcall;
    function Get_data(out value: WideString): HRESULT; stdcall;
    function Set_data(const value: WideString): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMEntityReference = interface(IXMLDOMNode)
    ['{2933BF8E-7B36-11D2-B20E-00C04F983E60}']
  end;

  Disp!!!
  IXMLDOMParseError = interface(IDispatch)
    ['{3EFAA426-272F-11D2-836F-0000F87A7782}']
    function Get_errorCode(out errorCode: Integer): HRESULT; stdcall;
    function Get_url(out urlString: WideString): HRESULT; stdcall;
    function Get_reason(out reasonString: WideString): HRESULT; stdcall;
    function Get_srcText(out sourceString: WideString): HRESULT; stdcall;
    function Get_line(out lineNumber: Integer): HRESULT; stdcall;
    function Get_linepos(out linePosition: Integer): HRESULT; stdcall;
    function Get_filepos(out filePosition: Integer): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMNotation = interface(IXMLDOMNode)
    ['{2933BF8C-7B36-11D2-B20E-00C04F983E60}']
    function Get_publicId(out publicId: OleVariant): HRESULT; stdcall;
    function Get_systemId(out systemId: OleVariant): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMEntity = interface(IXMLDOMNode)
    ['{2933BF8D-7B36-11D2-B20E-00C04F983E60}']
    function Get_publicId(out publicId: OleVariant): HRESULT; stdcall;
    function Get_systemId(out systemId: OleVariant): HRESULT; stdcall;
    function Get_notationName(out name: WideString): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMParseError2 = interface(IXMLDOMParseError)
    ['{3EFAA428-272F-11D2-836F-0000F87A7782}']
    function Get_errorXPath(out xpathexpr: WideString): HRESULT; stdcall;
    function Get_allErrors(out allErrors: IXMLDOMParseErrorCollection): HRESULT; stdcall;
    function errorParameters(index: Integer; out param: WideString): HRESULT; stdcall;
    function Get_errorParametersCount(out count: Integer): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMParseErrorCollection = interface(IDispatch)
    ['{3EFAA429-272F-11D2-836F-0000F87A7782}']
    function Get_item(index: Integer; out error: IXMLDOMParseError2): HRESULT; stdcall;
    function Get_length(out length: Integer): HRESULT; stdcall;
    function Get_next(out error: IXMLDOMParseError2): HRESULT; stdcall;
    function rese): HRESULT; stdcall;
    function Get__newEnum(out ppUnk: IUnknown): HRESULT; stdcall;
  end;

  Disp!!!
  IXTLRuntime = interface(IXMLDOMNode)
    ['{3EFAA425-272F-11D2-836F-0000F87A7782}']
    function uniqueID(const pNode: IXMLDOMNode; out pID: Integer): HRESULT; stdcall;
    function depth(const pNode: IXMLDOMNode; out pDepth: Integer): HRESULT; stdcall;
    function childNumber(const pNode: IXMLDOMNode; out pNumber: Integer): HRESULT; stdcall;
    function ancestorChildNumber(const bstrNodeName: WideString;
      const pNode: IXMLDOMNode; out pNumber: Integer): HRESULT; stdcall;
    function absoluteChildNumber(const pNode: IXMLDOMNode;
      out pNumber: Integer): HRESULT; stdcall;
    function formatIndex(lIndex: Integer; const bstrFormat: WideString;
      out pbstrFormattedString: WideString): HRESULT; stdcall;
    function formatNumber(dblNumber: Double; const bstrFormat: WideString;
      out pbstrFormattedString: WideString): HRESULT; stdcall;
    function formatDate(varDate: OleVariant; const bstrFormat: WideString;
      varDestLocale: OleVariant; out pbstrFormattedString: WideString): HRESULT; stdcall;
    function formatTime(varTime: OleVariant; const bstrFormat: WideString;
      varDestLocale: OleVariant; out pbstrFormattedString: WideString): HRESULT; stdcall;
  end;

  ISAXXMLReader = interface(IUnknown)
    ['{A4F96ED0-F829-476E-81C0-CDC7BD2A0802}']
    function getFeature(const pwchName: Word; out pvfValue: WordBool): HRESULT; stdcall;
    function putFeature(const pwchName: Word; vfValue: WordBool): HRESULT; stdcall;
    function getProperty(const pwchName: Word; out pvarValue: OleVariant): HRESULT; stdcall;
    function putProperty(const pwchName: Word; varValue: OleVariant): HRESULT; stdcall;
    function getEntityResolver(out ppResolver: ISAXEntityResolver): HRESULT; stdcall;
    function putEntityResolver(const pResolver: ISAXEntityResolver): HRESULT; stdcall;
    function getContentHandler(out ppHandler: ISAXContentHandler): HRESULT; stdcall;
    function putContentHandler(const pHandler: ISAXContentHandler): HRESULT; stdcall;
    function getDTDHandler(out ppHandler: ISAXDTDHandler): HRESULT; stdcall;
    function putDTDHandler(const pHandler: ISAXDTDHandler): HRESULT; stdcall;
    function getErrorHandler(out ppHandler: ISAXErrorHandler): HRESULT; stdcall;
    function putErrorHandler(const pHandler: ISAXErrorHandler): HRESULT; stdcall;
    function getBaseURL({1} out ppwchBaseUrl: Word): HRESULT; stdcall;
    function putBaseURL(const pwchBaseUrl: Word): HRESULT; stdcall;
    function getSecureBaseURL({1} out ppwchSecureBaseUrl: Word): HRESULT; stdcall;
    function putSecureBaseURL(const pwchSecureBaseUrl: Word): HRESULT; stdcall;
    function parse(varInput: OleVariant): HRESULT; stdcall;
    function parseURL(const pwchUrl: Word): HRESULT; stdcall;
  end;

  ISAXEntityResolver = interface(IUnknown)
    ['{99BCA7BD-E8C4-4D5F-A0CF-6D907901FF07}']
    function resolveEntity(const pwchPublicId: Word; const pwchSystemId: Word;
      out pvarInput: OleVariant): HRESULT; stdcall;
  end;

  ISAXContentHandler = interface(IUnknown)
    ['{1545CDFA-9E4E-4497-A8A4-2BF7D0112C44}']
    function putDocumentLocator(const pLocator: ISAXLocator): HRESULT; stdcall;
    function startDocumen): HRESULT; stdcall;
    function endDocumen): HRESULT; stdcall;
    function startPrefixMapping(const pwchPrefix: Word; cchPrefix: SYSINT;
      const pwchUri: Word; cchUri: SYSINT): HRESULT; stdcall;
    function endPrefixMapping(const pwchPrefix: Word; cchPrefix: SYSINT): HRESULT; stdcall;
    function startElement(const pwchNamespaceUri: Word;
      cchNamespaceUri: SYSINT; const pwchLocalName: Word; cchLocalName: SYSINT;
      const pwchQName: Word; cchQName: SYSINT;
      const pAttributes: ISAXAttributes): HRESULT; stdcall;
    function endElement(const pwchNamespaceUri: Word; cchNamespaceUri: SYSINT;
      const pwchLocalName: Word; cchLocalName: SYSINT; const pwchQName: Word;
      cchQName: SYSINT): HRESULT; stdcall;
    function characters(const pwchChars: Word; cchChars: SYSINT): HRESULT; stdcall;
    function ignorableWhitespace(const pwchChars: Word; cchChars: SYSINT): HRESULT; stdcall;
    function processingInstruction(const pwchTarget: Word; cchTarget: SYSINT;
      const pwchData: Word; cchData: SYSINT): HRESULT; stdcall;
    function skippedEntity(const pwchName: Word; cchName: SYSINT): HRESULT; stdcall;
  end;

  ISAXLocator = interface(IUnknown)
    ['{9B7E472A-0DE4-4640-BFF3-84D38A051C31}']
    function getColumnNumber(out pnColumn: SYSINT): HRESULT; stdcall;
    function getLineNumber(out pnLine: SYSINT): HRESULT; stdcall;
    function getPublicId({1} out ppwchPublicId: Word): HRESULT; stdcall;
    function getSystemId({1} out ppwchSystemId: Word): HRESULT; stdcall;
  end;

  ISAXAttributes = interface(IUnknown)
    ['{F078ABE1-45D2-4832-91EA-4466CE2F25C9}']
    function getLength(out pnLength: SYSINT): HRESULT; stdcall;
    function getURI(nIndex: SYSINT; {1} out ppwchUri: Word;
      out pcchUri: SYSINT): HRESULT; stdcall;
    function getLocalName(nIndex: SYSINT; {1} out ppwchLocalName: Word;
      out pcchLocalName: SYSINT): HRESULT; stdcall;
    function getQName(nIndex: SYSINT; {1} out ppwchQName: Word;
      out pcchQName: SYSINT): HRESULT; stdcall;
    function getName(nIndex: SYSINT; {1} out ppwchUri: Word;
      out pcchUri: SYSINT; {1} out ppwchLocalName: Word;
      out pcchLocalName: SYSINT; {1} out ppwchQName: Word;
      out pcchQName: SYSINT): HRESULT; stdcall;
    function getIndexFromName(const pwchUri: Word; cchUri: SYSINT;
      const pwchLocalName: Word; cchLocalName: SYSINT; out pnIndex: SYSINT): HRESULT; stdcall;
    function getIndexFromQName(const pwchQName: Word; cchQName: SYSINT;
      out pnIndex: SYSINT): HRESULT; stdcall;
    function getType(nIndex: SYSINT; {1} out ppwchType: Word;
      out pcchType: SYSINT): HRESULT; stdcall;
    function getTypeFromName(const pwchUri: Word; cchUri: SYSINT;
      const pwchLocalName: Word; cchLocalName: SYSINT; {1} out ppwchType: Word;
      out pcchType: SYSINT): HRESULT; stdcall;
    function getTypeFromQName(const pwchQName: Word; cchQName: SYSINT;
      {1} out ppwchType: Word; out pcchType: SYSINT): HRESULT; stdcall;
    function getValue(nIndex: SYSINT; {1} out ppwchValue: Word;
      out pcchValue: SYSINT): HRESULT; stdcall;
    function getValueFromName(const pwchUri: Word; cchUri: SYSINT;
      const pwchLocalName: Word; cchLocalName: SYSINT; {1} out ppwchValue: Word;
      out pcchValue: SYSINT): HRESULT; stdcall;
    function getValueFromQName(const pwchQName: Word; cchQName: SYSINT;
      {1} out ppwchValue: Word; out pcchValue: SYSINT): HRESULT; stdcall;
  end;

  ISAXDTDHandler = interface(IUnknown)
    ['{E15C1BAF-AFB3-4D60-8C36-19A8C45DEFED}']
    function notationDecl(const pwchName: Word; cchName: SYSINT;
      const pwchPublicId: Word; cchPublicId: SYSINT; const pwchSystemId: Word;
      cchSystemId: SYSINT): HRESULT; stdcall;
    function unparsedEntityDecl(const pwchName: Word; cchName: SYSINT;
      const pwchPublicId: Word; cchPublicId: SYSINT; const pwchSystemId: Word;
      cchSystemId: SYSINT; const pwchNotationName: Word;
      cchNotationName: SYSINT): HRESULT; stdcall;
  end;

  ISAXErrorHandler = interface(IUnknown)
    ['{A60511C4-CCF5-479E-98A3-DC8DC545B7D0}']
    function error(const pLocator: ISAXLocator; const pwchErrorMessage: Word;
      hrErrorCode: HRESULT): HRESULT; stdcall;
    function fatalError(const pLocator: ISAXLocator;
      const pwchErrorMessage: Word; hrErrorCode: HRESULT): HRESULT; stdcall;
    function ignorableWarning(const pLocator: ISAXLocator;
      const pwchErrorMessage: Word; hrErrorCode: HRESULT): HRESULT; stdcall;
  end;

  ISAXXMLFilter = interface(ISAXXMLReader)
    ['{70409222-CA09-4475-ACB8-40312FE8D145}']
    function getParent(out ppReader: ISAXXMLReader): HRESULT; stdcall;
    function putParent(const pReader: ISAXXMLReader): HRESULT; stdcall;
  end;

  Disp!!!
  IVBSAXXMLFilter = interface(IDispatch)
    ['{1299EB1B-5B88-433E-82DE-82CA75AD4E04}']
    function Get_parent(out oReader: IVBSAXXMLReader): HRESULT; stdcall;
    function Set_parent(const oReader: IVBSAXXMLReader): HRESULT; stdcall;
  end;

  Disp!!!
  IVBSAXXMLReader = interface(IDispatch)
    ['{8C033CAA-6CD6-4F73-B728-4531AF74945F}']
    function getFeature(const strName: WideString; out fValue: WordBool): HRESULT; stdcall;
    function putFeature(const strName: WideString; fValue: WordBool): HRESULT; stdcall;
    function getProperty(const strName: WideString; out varValue: OleVariant): HRESULT; stdcall;
    function putProperty(const strName: WideString; varValue: OleVariant): HRESULT; stdcall;
    function Get_entityResolver(out oResolver: IVBSAXEntityResolver): HRESULT; stdcall;
    function Set_entityResolver(const oResolver: IVBSAXEntityResolver): HRESULT; stdcall;
    function Get_contentHandler(out oHandler: IVBSAXContentHandler): HRESULT; stdcall;
    function Set_contentHandler(const oHandler: IVBSAXContentHandler): HRESULT; stdcall;
    function Get_dtdHandler(out oHandler: IVBSAXDTDHandler): HRESULT; stdcall;
    function Set_dtdHandler(const oHandler: IVBSAXDTDHandler): HRESULT; stdcall;
    function Get_errorHandler(out oHandler: IVBSAXErrorHandler): HRESULT; stdcall;
    function Set_errorHandler(const oHandler: IVBSAXErrorHandler): HRESULT; stdcall;
    function Get_baseURL(out strBaseURL: WideString): HRESULT; stdcall;
    function Set_baseURL(const strBaseURL: WideString): HRESULT; stdcall;
    function Get_secureBaseURL(out strSecureBaseURL: WideString): HRESULT; stdcall;
    function Set_secureBaseURL(const strSecureBaseURL: WideString): HRESULT; stdcall;
    function parse(varInput: OleVariant): HRESULT; stdcall;
    function parseURL(const strURL: WideString): HRESULT; stdcall;
  end;

  Disp!!!
  IVBSAXEntityResolver = interface(IDispatch)
    ['{0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}']
    function resolveEntity(var strPublicId: WideString;
      var strSystemId: WideString; out varInput: OleVariant): HRESULT; stdcall;
  end;

  Disp!!!
  IVBSAXContentHandler = interface(IDispatch)
    ['{2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}']
    function Set_documentLocator(const : IVBSAXLocator): HRESULT; stdcall;
    function startDocumen): HRESULT; stdcall;
    function endDocumen): HRESULT; stdcall;
    function startPrefixMapping(var strPrefix: WideString;
      var strURI: WideString): HRESULT; stdcall;
    function endPrefixMapping(var strPrefix: WideString): HRESULT; stdcall;
    function startElement(var strNamespaceURI: WideString;
      var strLocalName: WideString; var strQName: WideString;
      const oAttributes: IVBSAXAttributes): HRESULT; stdcall;
    function endElement(var strNamespaceURI: WideString;
      var strLocalName: WideString; var strQName: WideString): HRESULT; stdcall;
    function characters(var strChars: WideString): HRESULT; stdcall;
    function ignorableWhitespace(var strChars: WideString): HRESULT; stdcall;
    function processingInstruction(var strTarget: WideString;
      var strData: WideString): HRESULT; stdcall;
    function skippedEntity(var strName: WideString): HRESULT; stdcall;
  end;

  Disp!!!
  IVBSAXLocator = interface(IDispatch)
    ['{796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}']
    function Get_columnNumber(out nColumn: SYSINT): HRESULT; stdcall;
    function Get_lineNumber(out nLine: SYSINT): HRESULT; stdcall;
    function Get_publicId(out strPublicId: WideString): HRESULT; stdcall;
    function Get_systemId(out strSystemId: WideString): HRESULT; stdcall;
  end;

  Disp!!!
  IVBSAXAttributes = interface(IDispatch)
    ['{10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}']
    function Get_length(out nLength: SYSINT): HRESULT; stdcall;
    function getURI(nIndex: SYSINT; out strURI: WideString): HRESULT; stdcall;
    function getLocalName(nIndex: SYSINT; out strLocalName: WideString): HRESULT; stdcall;
    function getQName(nIndex: SYSINT; out strQName: WideString): HRESULT; stdcall;
    function getIndexFromName(const strURI: WideString;
      const strLocalName: WideString; out nIndex: SYSINT): HRESULT; stdcall;
    function getIndexFromQName(const strQName: WideString; out nIndex: SYSINT): HRESULT; stdcall;
    function getType(nIndex: SYSINT; out strType: WideString): HRESULT; stdcall;
    function getTypeFromName(const strURI: WideString;
      const strLocalName: WideString; out strType: WideString): HRESULT; stdcall;
    function getTypeFromQName(const strQName: WideString;
      out strType: WideString): HRESULT; stdcall;
    function getValue(nIndex: SYSINT; out strValue: WideString): HRESULT; stdcall;
    function getValueFromName(const strURI: WideString;
      const strLocalName: WideString; out strValue: WideString): HRESULT; stdcall;
    function getValueFromQName(const strQName: WideString;
      out strValue: WideString): HRESULT; stdcall;
  end;

  Disp!!!
  IVBSAXDTDHandler = interface(IDispatch)
    ['{24FB3297-302D-4620-BA39-3A732D850558}']
    function notationDecl(var strName: WideString;
      var strPublicId: WideString; var strSystemId: WideString): HRESULT; stdcall;
    function unparsedEntityDecl(var strName: WideString;
      var strPublicId: WideString; var strSystemId: WideString;
      var strNotationName: WideString): HRESULT; stdcall;
  end;

  Disp!!!
  IVBSAXErrorHandler = interface(IDispatch)
    ['{D963D3FE-173C-4862-9095-B92F66995F52}']
    function error(const oLocator: IVBSAXLocator;
      var strErrorMessage: WideString; nErrorCode: Integer): HRESULT; stdcall;
    function fatalError(const oLocator: IVBSAXLocator;
      var strErrorMessage: WideString; nErrorCode: Integer): HRESULT; stdcall;
    function ignorableWarning(const oLocator: IVBSAXLocator;
      var strErrorMessage: WideString; nErrorCode: Integer): HRESULT; stdcall;
  end;

  Disp!!!
  IMXReaderControl = interface(IDispatch)
    ['{808F4E35-8D5A-4FBE-8466-33A41279ED30}']
    function abor): HRESULT; stdcall;
    function resum): HRESULT; stdcall;
    function suspen): HRESULT; stdcall;
  end;

  Disp!!!
  IMXSchemaDeclHandler = interface(IDispatch)
    ['{FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}']
    function schemaElementDecl(const oSchemaElement: ISchemaElement): HRESULT; stdcall;
  end;

  Disp!!!
  ISchemaElement = interface(ISchemaParticle)
    ['{50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_type_(out type_: ISchemaType): HRESULT; stdcall;
    function Get_scope(out scope: ISchemaComplexType): HRESULT; stdcall;
    function Get_defaultValue(out defaultValue: WideString): HRESULT; stdcall;
    function Get_fixedValue(out fixedValue: WideString): HRESULT; stdcall;
    function Get_isNillable(out nillable: WordBool): HRESULT; stdcall;
    function Get_identityConstraints(out constraints: ISchemaItemCollection): HRESULT; stdcall;
    function Get_substitutionGroup(out element: ISchemaElement): HRESULT; stdcall;
    function Get_substitutionGroupExclusions(
      out exclusions: SCHEMADERIVATIONMETHOD): HRESULT; stdcall;
    function Get_disallowedSubstitutions(
      out disallowed: SCHEMADERIVATIONMETHOD): HRESULT; stdcall;
    function Get_isAbstract(out abstract: WordBool): HRESULT; stdcall;
    function Get_isReference(out reference: WordBool): HRESULT; stdcall;
  end;

  Disp!!!
  ISchemaParticle = interface(ISchemaItem)
    ['{50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_minOccurs(out minOccurs: OleVariant): HRESULT; stdcall;
    function Get_maxOccurs(out maxOccurs: OleVariant): HRESULT; stdcall;
  end;

  Disp!!!
  ISchemaItem = interface(IDispatch)
    ['{50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_name(out name: WideString): HRESULT; stdcall;
    function Get_namespaceURI(out namespaceURI: WideString): HRESULT; stdcall;
    function Get_schema(out schema: ISchema): HRESULT; stdcall;
    function Get_id(out id: WideString): HRESULT; stdcall;
    function Get_itemType(out itemType: SOMITEMTYPE): HRESULT; stdcall;
    function Get_unhandledAttributes(out attributes: IVBSAXAttributes): HRESULT; stdcall;
    function writeAnnotation(const annotationSink: IUnknown;
      out isWritten: WordBool): HRESULT; stdcall;
  end;

  Disp!!!
  ISchema = interface(ISchemaItem)
    ['{50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_targetNamespace(out targetNamespace: WideString): HRESULT; stdcall;
    function Get_version(out version: WideString): HRESULT; stdcall;
    function Get_types(out types: ISchemaItemCollection): HRESULT; stdcall;
    function Get_elements(out elements: ISchemaItemCollection): HRESULT; stdcall;
    function Get_attributes(out attributes: ISchemaItemCollection): HRESULT; stdcall;
    function Get_attributeGroups(out attributeGroups: ISchemaItemCollection): HRESULT; stdcall;
    function Get_modelGroups(out modelGroups: ISchemaItemCollection): HRESULT; stdcall;
    function Get_notations(out notations: ISchemaItemCollection): HRESULT; stdcall;
    function Get_schemaLocations(out schemaLocations: ISchemaStringCollection): HRESULT; stdcall;
  end;

  Disp!!!
  ISchemaItemCollection = interface(IDispatch)
    ['{50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_item(index: Integer; out item: ISchemaItem): HRESULT; stdcall;
    function itemByName(const name: WideString; out item: ISchemaItem): HRESULT; stdcall;
    function itemByQName(const name: WideString;
      const namespaceURI: WideString; out item: ISchemaItem): HRESULT; stdcall;
    function Get_length(out length: Integer): HRESULT; stdcall;
    function Get__newEnum(out ppUnk: IUnknown): HRESULT; stdcall;
  end;

  Disp!!!
  ISchemaStringCollection = interface(IDispatch)
    ['{50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_item(index: Integer; out bstr: WideString): HRESULT; stdcall;
    function Get_length(out length: Integer): HRESULT; stdcall;
    function Get__newEnum(out ppUnk: IUnknown): HRESULT; stdcall;
  end;

  Disp!!!
  ISchemaType = interface(ISchemaItem)
    ['{50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_baseTypes(out baseTypes: ISchemaItemCollection): HRESULT; stdcall;
    function Get_final(out final: SCHEMADERIVATIONMETHOD): HRESULT; stdcall;
    function Get_variety(out variety: SCHEMATYPEVARIETY): HRESULT; stdcall;
    function Get_derivedBy(out derivedBy: SCHEMADERIVATIONMETHOD): HRESULT; stdcall;
    function isValid(const data: WideString; out valid: WordBool): HRESULT; stdcall;
    function Get_minExclusive(out minExclusive: WideString): HRESULT; stdcall;
    function Get_minInclusive(out minInclusive: WideString): HRESULT; stdcall;
    function Get_maxExclusive(out maxExclusive: WideString): HRESULT; stdcall;
    function Get_maxInclusive(out maxInclusive: WideString): HRESULT; stdcall;
    function Get_totalDigits(out totalDigits: OleVariant): HRESULT; stdcall;
    function Get_fractionDigits(out fractionDigits: OleVariant): HRESULT; stdcall;
    function Get_length(out length: OleVariant): HRESULT; stdcall;
    function Get_minLength(out minLength: OleVariant): HRESULT; stdcall;
    function Get_maxLength(out maxLength: OleVariant): HRESULT; stdcall;
    function Get_enumeration(out enumeration: ISchemaStringCollection): HRESULT; stdcall;
    function Get_whitespace(out whitespace: SCHEMAWHITESPACE): HRESULT; stdcall;
    function Get_patterns(out patterns: ISchemaStringCollection): HRESULT; stdcall;
  end;

  Disp!!!
  ISchemaComplexType = interface(ISchemaType)
    ['{50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_isAbstract(out abstract: WordBool): HRESULT; stdcall;
    function Get_anyAttribute(out anyAttribute: ISchemaAny): HRESULT; stdcall;
    function Get_attributes(out attributes: ISchemaItemCollection): HRESULT; stdcall;
    function Get_contentType(out contentType: SCHEMACONTENTTYPE): HRESULT; stdcall;
    function Get_contentModel(out contentModel: ISchemaModelGroup): HRESULT; stdcall;
    function Get_prohibitedSubstitutions(
      out prohibited: SCHEMADERIVATIONMETHOD): HRESULT; stdcall;
  end;

  Disp!!!
  ISchemaAny = interface(ISchemaParticle)
    ['{50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_namespaces(out namespaces: ISchemaStringCollection): HRESULT; stdcall;
    function Get_processContents(out processContents: SCHEMAPROCESSCONTENTS): HRESULT; stdcall;
  end;

  Disp!!!
  ISchemaModelGroup = interface(ISchemaParticle)
    ['{50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_particles(out particles: ISchemaItemCollection): HRESULT; stdcall;
  end;

  Disp!!!
  IMXXMLFilter = interface(IDispatch)
    ['{C90352F7-643C-4FBC-BB23-E996EB2D51FD}']
    function getFeature(const strName: WideString; out fValue: WordBool): HRESULT; stdcall;
    function putFeature(const strName: WideString; fValue: WordBool): HRESULT; stdcall;
    function getProperty(const strName: WideString; out varValue: OleVariant): HRESULT; stdcall;
    function putProperty(const strName: WideString; varValue: OleVariant): HRESULT; stdcall;
    function Get_entityResolver(out oResolver: IUnknown): HRESULT; stdcall;
    function Set_entityResolver(const oResolver: IUnknown): HRESULT; stdcall;
    function Get_contentHandler(out oHandler: IUnknown): HRESULT; stdcall;
    function Set_contentHandler(const oHandler: IUnknown): HRESULT; stdcall;
    function Get_dtdHandler(out oHandler: IUnknown): HRESULT; stdcall;
    function Set_dtdHandler(const oHandler: IUnknown): HRESULT; stdcall;
    function Get_errorHandler(out oHandler: IUnknown): HRESULT; stdcall;
    function Set_errorHandler(const oHandler: IUnknown): HRESULT; stdcall;
  end;

  Disp!!!
  ISchemaAttribute = interface(ISchemaItem)
    ['{50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_type_(out type_: ISchemaType): HRESULT; stdcall;
    function Get_scope(out scope: ISchemaComplexType): HRESULT; stdcall;
    function Get_defaultValue(out defaultValue: WideString): HRESULT; stdcall;
    function Get_fixedValue(out fixedValue: WideString): HRESULT; stdcall;
    function Get_use(out use: SCHEMAUSE): HRESULT; stdcall;
    function Get_isReference(out reference: WordBool): HRESULT; stdcall;
  end;

  Disp!!!
  ISchemaAttributeGroup = interface(ISchemaItem)
    ['{50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_anyAttribute(out anyAttribute: ISchemaAny): HRESULT; stdcall;
    function Get_attributes(out attributes: ISchemaItemCollection): HRESULT; stdcall;
  end;

  Disp!!!
  ISchemaIdentityConstraint = interface(ISchemaItem)
    ['{50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_selector(out selector: WideString): HRESULT; stdcall;
    function Get_fields(out fields: ISchemaStringCollection): HRESULT; stdcall;
    function Get_referencedKey(out key: ISchemaIdentityConstraint): HRESULT; stdcall;
  end;

  Disp!!!
  ISchemaNotation = interface(ISchemaItem)
    ['{50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_systemIdentifier(out uri: WideString): HRESULT; stdcall;
    function Get_publicIdentifier(out uri: WideString): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMSelection = interface(IXMLDOMNodeList)
    ['{AA634FC7-5888-44A7-A257-3A47150D3A0E}']
    function Get_expr(out expression: WideString): HRESULT; stdcall;
    function Set_expr(const expression: WideString): HRESULT; stdcall;
    function Get_context(out ppNode: IXMLDOMNode): HRESULT; stdcall;
    function Set_context(const ppNode: IXMLDOMNode): HRESULT; stdcall;
    function peekNode(out ppNode: IXMLDOMNode): HRESULT; stdcall;
    function matches(const pNode: IXMLDOMNode; out ppNode: IXMLDOMNode): HRESULT; stdcall;
    function removeNext(out ppNode: IXMLDOMNode): HRESULT; stdcall;
    function removeAl): HRESULT; stdcall;
    function clone(out ppNode: IXMLDOMSelection): HRESULT; stdcall;
    function getProperty(const name: WideString; out value: OleVariant): HRESULT; stdcall;
    function setProperty(const name: WideString; value: OleVariant): HRESULT; stdcall;
  end;

  Disp!!!
  XMLDOMDocumentEvents = interface(IDispatch)
    ['{3EFAA427-272F-11D2-836F-0000F87A7782}']
    function ondataavailabl): HRESULT; stdcall;
    function onreadystatechang): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMDocument3 = interface(IXMLDOMDocument2)
    ['{2933BF96-7B36-11D2-B20E-00C04F983E60}']
    function validateNode(const node: IXMLDOMNode;
      out errorObj: IXMLDOMParseError): HRESULT; stdcall;
    function importNode(const node: IXMLDOMNode; deep: WordBool;
      out clone: IXMLDOMNode): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMDocument2 = interface(IXMLDOMDocument)
    ['{2933BF95-7B36-11D2-B20E-00C04F983E60}']
    function Get_namespaces(out namespaceCollection: IXMLDOMSchemaCollection): HRESULT; stdcall;
    function Get_schemas(out otherCollection: OleVariant): HRESULT; stdcall;
    function Set_schemas(otherCollection: OleVariant): HRESULT; stdcall;
    function validate(out errorObj: IXMLDOMParseError): HRESULT; stdcall;
    function setProperty(const name: WideString; value: OleVariant): HRESULT; stdcall;
    function getProperty(const name: WideString; out value: OleVariant): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMSchemaCollection = interface(IDispatch)
    ['{373984C8-B845-449B-91E7-45AC83036ADE}']
    function add(const namespaceURI: WideString; var_: OleVariant): HRESULT; stdcall;
    function get(const namespaceURI: WideString; out schemaNode: IXMLDOMNode): HRESULT; stdcall;
    function remove(const namespaceURI: WideString): HRESULT; stdcall;
    function Get_length(out length: Integer): HRESULT; stdcall;
    function Get_namespaceURI(index: Integer; out length: WideString): HRESULT; stdcall;
    function addCollection(const otherCollection: IXMLDOMSchemaCollection): HRESULT; stdcall;
    function Get__newEnum(out ppUnk: IUnknown): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLDOMSchemaCollection2 = interface(IXMLDOMSchemaCollection)
    ['{50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}']
    function validat): HRESULT; stdcall;
    function Set_validateOnLoad(validateOnLoad: WordBool): HRESULT; stdcall;
    function Get_validateOnLoad(out validateOnLoad: WordBool): HRESULT; stdcall;
    function getSchema(const namespaceURI: WideString; out schema: ISchema): HRESULT; stdcall;
    function getDeclaration(const node: IXMLDOMNode; out item: ISchemaItem): HRESULT; stdcall;
  end;

  Disp!!!
  IXSLTemplate = interface(IDispatch)
    ['{2933BF93-7B36-11D2-B20E-00C04F983E60}']
    function Set_stylesheet(const stylesheet: IXMLDOMNode): HRESULT; stdcall;
    function Get_stylesheet(out stylesheet: IXMLDOMNode): HRESULT; stdcall;
    function createProcessor(out ppProcessor: IXSLProcessor): HRESULT; stdcall;
  end;

  Disp!!!
  IXSLProcessor = interface(IDispatch)
    ['{2933BF92-7B36-11D2-B20E-00C04F983E60}']
    function Set_input(pVar: OleVariant): HRESULT; stdcall;
    function Get_input(out pVar: OleVariant): HRESULT; stdcall;
    function Get_ownerTemplate(out ppTemplate: IXSLTemplate): HRESULT; stdcall;
    function setStartMode(const mode: WideString;
      const namespaceURI: WideString): HRESULT; stdcall;
    function Get_startMode(out mode: WideString): HRESULT; stdcall;
    function Get_startModeURI(out namespaceURI: WideString): HRESULT; stdcall;
    function Set_output(pOutput: OleVariant): HRESULT; stdcall;
    function Get_output(out pOutput: OleVariant): HRESULT; stdcall;
    function transform(out pDone: WordBool): HRESULT; stdcall;
    function rese): HRESULT; stdcall;
    function Get_readyState(out pReadyState: Integer): HRESULT; stdcall;
    function addParameter(const baseName: WideString; parameter: OleVariant;
      const namespaceURI: WideString): HRESULT; stdcall;
    function addObject(const obj: IDispatch; const namespaceURI: WideString): HRESULT; stdcall;
    function Get_stylesheet(out stylesheet: IXMLDOMNode): HRESULT; stdcall;
  end;

  Disp!!!
  IXMLHTTPRequest = interface(IDispatch)
    ['{ED8C108D-4349-11D2-91A4-00C04F7969E8}']
    function open(const bstrMethod: WideString; const bstrUrl: WideString;
      varAsync: OleVariant; bstrUser: OleVariant; bstrPassword: OleVariant): HRESULT; stdcall;
    function setRequestHeader(const bstrHeader: WideString;
      const bstrValue: WideString): HRESULT; stdcall;
    function getResponseHeader(const bstrHeader: WideString;
      out pbstrValue: WideString): HRESULT; stdcall;
    function getAllResponseHeaders(out pbstrHeaders: WideString): HRESULT; stdcall;
    function send(varBody: OleVariant): HRESULT; stdcall;
    function abor): HRESULT; stdcall;
    function Get_status(out plStatus: Integer): HRESULT; stdcall;
    function Get_statusText(out pbstrStatus: WideString): HRESULT; stdcall;
    function Get_responseXML(out ppBody: IDispatch): HRESULT; stdcall;
    function Get_responseText(out pbstrBody: WideString): HRESULT; stdcall;
    function Get_responseBody(out pvarBody: OleVariant): HRESULT; stdcall;
    function Get_responseStream(out pvarBody: OleVariant): HRESULT; stdcall;
    function Get_readyState(out plState: Integer): HRESULT; stdcall;
    function Set_onreadystatechange(const : IDispatch): HRESULT; stdcall;
  end;

  IXMLHTTPRequest2 = interface(IUnknown)
    ['{E5D37DC0-552A-4D52-9CC0-A14D546FBD04}']
    function open(pwszMethod: PWideChar; pwszUrl: PWideChar;
      const pStatusCallback: IXMLHTTPRequest2Callback; pwszUserName: PWideChar;
      pwszPassword: PWideChar; pwszProxyUserName: PWideChar;
      pwszProxyPassword: PWideChar): HRESULT; stdcall;
    function send(const pBody: ISequentialStream; cbBody: UInt64): HRESULT; stdcall;
    function abor): HRESULT; stdcall;
    function SetCookie(const pCookie: tagXHR_COOKIE;
      out pdwCookieState: Cardinal): HRESULT; stdcall;
    function SetCustomResponseStream(
      const pSequentialStream: ISequentialStream): HRESULT; stdcall;
    function setProperty(eProperty: XHR_PROPERTY; ullValue: UInt64): HRESULT; stdcall;
    function setRequestHeader(pwszHeader: PWideChar; pwszValue: PWideChar): HRESULT; stdcall;
    function getAllResponseHeaders(out ppwszHeaders: PWideChar): HRESULT; stdcall;
    function GetCookie(pwszUrl: PWideChar; pwszName: PWideChar;
      dwFlags: Cardinal; out pcCookies: Cardinal;
      {1} out ppCookies: tagXHR_COOKIE): HRESULT; stdcall;
    function getResponseHeader(pwszHeader: PWideChar;
      out ppwszValue: PWideChar): HRESULT; stdcall;
  end;

  IXMLHTTPRequest2Callback = interface(IUnknown)
    ['{A44A9299-E321-40DE-8866-341B41669162}']
    function OnRedirect(const pXHR: IXMLHTTPRequest2;
      pwszRedirectUrl: PWideChar): HRESULT; stdcall;
    function OnHeadersAvailable(const pXHR: IXMLHTTPRequest2;
      dwStatus: Cardinal; pwszStatus: PWideChar): HRESULT; stdcall;
    function ondataavailable(const pXHR: IXMLHTTPRequest2;
      const pResponseStream: ISequentialStream): HRESULT; stdcall;
    function OnResponseReceived(const pXHR: IXMLHTTPRequest2;
      const pResponseStream: ISequentialStream): HRESULT; stdcall;
    function OnError(const pXHR: IXMLHTTPRequest2; hrError: HRESULT): HRESULT; stdcall;
  end;

  ISequentialStream = interface(IUnknown)
    ['{0C733A30-2A1C-11CE-ADE5-00AA0044773D}']
    function RemoteRead(out pv: Byte; cb: Cardinal; out pcbRead: Cardinal): HRESULT; stdcall;
    function RemoteWrite(const pv: Byte; cb: Cardinal;
      out pcbWritten: Cardinal): HRESULT; stdcall;
  end;

  Disp!!!
  IServerXMLHTTPRequest2 = interface(IServerXMLHTTPRequest)
    ['{2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}']
    function setProxy(proxySetting: SXH_PROXY_SETTING;
      varProxyServer: OleVariant; varBypassList: OleVariant): HRESULT; stdcall;
    function setProxyCredentials(const bstrUserName: WideString;
      const bstrPassword: WideString): HRESULT; stdcall;
  end;

  Disp!!!
  IServerXMLHTTPRequest = interface(IXMLHTTPRequest)
    ['{2E9196BF-13BA-4DD4-91CA-6C571F281495}']
    function setTimeouts(resolveTimeout: Integer; connectTimeout: Integer;
      sendTimeout: Integer; receiveTimeout: Integer): HRESULT; stdcall;
    function waitForResponse(timeoutInSeconds: OleVariant;
      out isSuccessful: WordBool): HRESULT; stdcall;
    function getOption(option: SERVERXMLHTTP_OPTION; out value: OleVariant): HRESULT; stdcall;
    function setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant): HRESULT; stdcall;
  end;

  Disp!!!
  IMXWriter = interface(IDispatch)
    ['{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}']
    function Set_output(varDestination: OleVariant): HRESULT; stdcall;
    function Get_output(out varDestination: OleVariant): HRESULT; stdcall;
    function Set_encoding(const strEncoding: WideString): HRESULT; stdcall;
    function Get_encoding(out strEncoding: WideString): HRESULT; stdcall;
    function Set_byteOrderMark(fWriteByteOrderMark: WordBool): HRESULT; stdcall;
    function Get_byteOrderMark(out fWriteByteOrderMark: WordBool): HRESULT; stdcall;
    function Set_indent(fIndentMode: WordBool): HRESULT; stdcall;
    function Get_indent(out fIndentMode: WordBool): HRESULT; stdcall;
    function Set_standalone(fValue: WordBool): HRESULT; stdcall;
    function Get_standalone(out fValue: WordBool): HRESULT; stdcall;
    function Set_omitXMLDeclaration(fValue: WordBool): HRESULT; stdcall;
    function Get_omitXMLDeclaration(out fValue: WordBool): HRESULT; stdcall;
    function Set_version(const strVersion: WideString): HRESULT; stdcall;
    function Get_version(out strVersion: WideString): HRESULT; stdcall;
    function Set_disableOutputEscaping(fValue: WordBool): HRESULT; stdcall;
    function Get_disableOutputEscaping(out fValue: WordBool): HRESULT; stdcall;
    function flus): HRESULT; stdcall;
  end;

  ISAXDeclHandler = interface(IUnknown)
    ['{862629AC-771A-47B2-8337-4E6843C1BE90}']
    function elementDecl(const pwchName: Word; cchName: SYSINT;
      const pwchModel: Word; cchModel: SYSINT): HRESULT; stdcall;
    function attributeDecl(const pwchElementName: Word;
      cchElementName: SYSINT; const pwchAttributeName: Word;
      cchAttributeName: SYSINT; const pwchType: Word; cchType: SYSINT;
      const pwchValueDefault: Word; cchValueDefault: SYSINT;
      const pwchValue: Word; cchValue: SYSINT): HRESULT; stdcall;
    function internalEntityDecl(const pwchName: Word; cchName: SYSINT;
      const pwchValue: Word; cchValue: SYSINT): HRESULT; stdcall;
    function externalEntityDecl(const pwchName: Word; cchName: SYSINT;
      const pwchPublicId: Word; cchPublicId: SYSINT; const pwchSystemId: Word;
      cchSystemId: SYSINT): HRESULT; stdcall;
  end;

  ISAXLexicalHandler = interface(IUnknown)
    ['{7F85D5F5-47A8-4497-BDA5-84BA04819EA6}']
    function startDTD(const pwchName: Word; cchName: SYSINT;
      const pwchPublicId: Word; cchPublicId: SYSINT; const pwchSystemId: Word;
      cchSystemId: SYSINT): HRESULT; stdcall;
    function endDT): HRESULT; stdcall;
    function startEntity(const pwchName: Word; cchName: SYSINT): HRESULT; stdcall;
    function endEntity(const pwchName: Word; cchName: SYSINT): HRESULT; stdcall;
    function startCDAT): HRESULT; stdcall;
    function endCDAT): HRESULT; stdcall;
    function comment(const pwchChars: Word; cchChars: SYSINT): HRESULT; stdcall;
  end;

  Disp!!!
  IVBSAXDeclHandler = interface(IDispatch)
    ['{E8917260-7579-4BE1-B5DD-7AFBFA6F077B}']
    function elementDecl(var strName: WideString; var strModel: WideString): HRESULT; stdcall;
    function attributeDecl(var strElementName: WideString;
      var strAttributeName: WideString; var strType: WideString;
      var strValueDefault: WideString; var strValue: WideString): HRESULT; stdcall;
    function internalEntityDecl(var strName: WideString;
      var strValue: WideString): HRESULT; stdcall;
    function externalEntityDecl(var strName: WideString;
      var strPublicId: WideString; var strSystemId: WideString): HRESULT; stdcall;
  end;

  Disp!!!
  IVBSAXLexicalHandler = interface(IDispatch)
    ['{032AAC35-8C0E-4D9D-979F-E3B702935576}']
    function startDTD(var strName: WideString; var strPublicId: WideString;
      var strSystemId: WideString): HRESULT; stdcall;
    function endDT): HRESULT; stdcall;
    function startEntity(var strName: WideString): HRESULT; stdcall;
    function endEntity(var strName: WideString): HRESULT; stdcall;
    function startCDAT): HRESULT; stdcall;
    function endCDAT): HRESULT; stdcall;
    function comment(var strChars: WideString): HRESULT; stdcall;
  end;

  Disp!!!
  IMXAttributes = interface(IDispatch)
    ['{F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}']
    function addAttribute(const strURI: WideString;
      const strLocalName: WideString; const strQName: WideString;
      const strType: WideString; const strValue: WideString): HRESULT; stdcall;
    function addAttributeFromIndex(varAtts: OleVariant; nIndex: SYSINT): HRESULT; stdcall;
    function clea): HRESULT; stdcall;
    function removeAttribute(nIndex: SYSINT): HRESULT; stdcall;
    function setAttribute(nIndex: SYSINT; const strURI: WideString;
      const strLocalName: WideString; const strQName: WideString;
      const strType: WideString; const strValue: WideString): HRESULT; stdcall;
    function setAttributes(varAtts: OleVariant): HRESULT; stdcall;
    function setLocalName(nIndex: SYSINT; const strLocalName: WideString): HRESULT; stdcall;
    function setQName(nIndex: SYSINT; const strQName: WideString): HRESULT; stdcall;
    function setType(nIndex: SYSINT; const strType: WideString): HRESULT; stdcall;
    function setURI(nIndex: SYSINT; const strURI: WideString): HRESULT; stdcall;
    function setValue(nIndex: SYSINT; const strValue: WideString): HRESULT; stdcall;
  end;

  Disp!!!
  IVBMXNamespaceManager = interface(IDispatch)
    ['{C90352F5-643C-4FBC-BB23-E996EB2D51FD}']
    function Set_allowOverride(fOverride: WordBool): HRESULT; stdcall;
    function Get_allowOverride(out fOverride: WordBool): HRESULT; stdcall;
    function rese): HRESULT; stdcall;
    function pushContex): HRESULT; stdcall;
    function pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool): HRESULT; stdcall;
    function popContex): HRESULT; stdcall;
    function declarePrefix(const prefix: WideString;
      const namespaceURI: WideString): HRESULT; stdcall;
    function getDeclaredPrefixes(out prefixes: IMXNamespacePrefixes): HRESULT; stdcall;
    function getPrefixes(const namespaceURI: WideString;
      out prefixes: IMXNamespacePrefixes): HRESULT; stdcall;
    function getURI(const prefix: WideString; out uri: OleVariant): HRESULT; stdcall;
    function getURIFromNode(const strPrefix: WideString;
      const contextNode: IXMLDOMNode; out uri: OleVariant): HRESULT; stdcall;
  end;

  Disp!!!
  IMXNamespacePrefixes = interface(IDispatch)
    ['{C90352F4-643C-4FBC-BB23-E996EB2D51FD}']
    function Get_item(index: Integer; out prefix: WideString): HRESULT; stdcall;
    function Get_length(out length: Integer): HRESULT; stdcall;
    function Get__newEnum(out ppUnk: IUnknown): HRESULT; stdcall;
  end;

  IMXNamespaceManager = interface(IUnknown)
    ['{C90352F6-643C-4FBC-BB23-E996EB2D51FD}']
    function putAllowOverride(fOverride: WordBool): HRESULT; stdcall;
    function getAllowOverride(out fOverride: WordBool): HRESULT; stdcall;
    function rese): HRESULT; stdcall;
    function pushContex): HRESULT; stdcall;
    function pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool): HRESULT; stdcall;
    function popContex): HRESULT; stdcall;
    function declarePrefix(prefix: PWideChar; namespaceURI: PWideChar): HRESULT; stdcall;
    function getDeclaredPrefix(nIndex: Integer; var pwchPrefix: Word;
      var pcchPrefix: SYSINT): HRESULT; stdcall;
    function getPrefix(pwszNamespaceURI: PWideChar; nIndex: Integer;
      var pwchPrefix: Word; var pcchPrefix: SYSINT): HRESULT; stdcall;
    function getURI(pwchPrefix: PWideChar; const pContextNode: IXMLDOMNode;
      var pwchUri: Word; var pcchUri: SYSINT): HRESULT; stdcall;
  end;


