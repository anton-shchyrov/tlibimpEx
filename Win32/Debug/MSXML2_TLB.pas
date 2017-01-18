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
{$MINENUMSIZE 4}

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

  // Custom aliaces
  PtagXHR_COOKIE = ^tagXHR_COOKIE;

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

  // Records
  {$ALIGN 4}
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

  {$ALIGN 4}
  _FILETIME = record
    dwLowDateTime: Cardinal;
    dwHighDateTime: Cardinal;
  end;

  {$ALIGN 4}
  tagXHR_COOKIE = record
    pwszUrl: PWideChar;
    pwszName: PWideChar;
    pwszValue: PWideChar;
    pwszP3PPolicy: PWideChar;
    ftExpires: _FILETIME;
    dwFlags: Cardinal;
  end;

  // Interfaces
  IXMLDOMNode = interface(IDispatch)
    ['{2933BF80-7B36-11D2-B20E-00C04F983E60}']
    function Get_nodeName: WideString; safecall;
    function Get_nodeValue: OleVariant; safecall;
    procedure Set_nodeValue(value: OleVariant); safecall;
    function Get_nodeType: DOMNodeType; safecall;
    function Get_parentNode: IXMLDOMNode; safecall;
    function Get_childNodes: IXMLDOMNodeList; safecall;
    function Get_firstChild: IXMLDOMNode; safecall;
    function Get_lastChild: IXMLDOMNode; safecall;
    function Get_previousSibling: IXMLDOMNode; safecall;
    function Get_nextSibling: IXMLDOMNode; safecall;
    function Get_attributes: IXMLDOMNamedNodeMap; safecall;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; safecall;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; safecall;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; safecall;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; safecall;
    function hasChildNodes: WordBool; safecall;
    function Get_ownerDocument: IXMLDOMDocument; safecall;
    function cloneNode(deep: WordBool): IXMLDOMNode; safecall;
    function Get_nodeTypeString: WideString; safecall;
    function Get_text: WideString; safecall;
    procedure Set_text(const text: WideString); safecall;
    function Get_specified: WordBool; safecall;
    function Get_definition: IXMLDOMNode; safecall;
    function Get_nodeTypedValue: OleVariant; safecall;
    procedure Set_nodeTypedValue(typedValue: OleVariant); safecall;
    function Get_dataType: OleVariant; safecall;
    procedure Set_dataType(const dataTypeName: WideString); safecall;
    function Get_xml: WideString; safecall;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; safecall;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; safecall;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; safecall;
    function Get_parsed: WordBool; safecall;
    function Get_namespaceURI: WideString; safecall;
    function Get_prefix: WideString; safecall;
    function Get_baseName: WideString; safecall;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); safecall;
    property nodeName: WideString read Get_nodeName;
    property nodeValue: OleVariant read Get_nodeValue write Set_nodeValue;
    property nodeType: DOMNodeType read Get_nodeType;
    property parentNode: IXMLDOMNode read Get_parentNode;
    property childNodes: IXMLDOMNodeList read Get_childNodes;
    property firstChild: IXMLDOMNode read Get_firstChild;
    property lastChild: IXMLDOMNode read Get_lastChild;
    property previousSibling: IXMLDOMNode read Get_previousSibling;
    property nextSibling: IXMLDOMNode read Get_nextSibling;
    property attributes: IXMLDOMNamedNodeMap read Get_attributes;
    property ownerDocument: IXMLDOMDocument read Get_ownerDocument;
    property nodeTypeString: WideString read Get_nodeTypeString;
    property text: WideString read Get_text write Set_text;
    property specified: WordBool read Get_specified;
    property definition: IXMLDOMNode read Get_definition;
    property nodeTypedValue: OleVariant read Get_nodeTypedValue write Set_nodeTypedValue;
    // property dataType: OleVariant read Get_dataType write Set_dataType;
    property xml: WideString read Get_xml;
    property parsed: WordBool read Get_parsed;
    property namespaceURI: WideString read Get_namespaceURI;
    property prefix: WideString read Get_prefix;
    property baseName: WideString read Get_baseName;
  end;

  IXMLDOMNodeDisp = dispinterface
    ['{2933BF80-7B36-11D2-B20E-00C04F983E60}']
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property text: WideString dispid 24;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMNodeList = interface(IDispatch)
    ['{2933BF82-7B36-11D2-B20E-00C04F983E60}']
    function Get_item(index: Integer): IXMLDOMNode; safecall;
    function Get_length: Integer; safecall;
    function nextNode: IXMLDOMNode; safecall;
    procedure reset; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: IXMLDOMNode read Get_item; default;
    property length: Integer read Get_length;
    property _newEnum: IUnknown read Get__newEnum;
  end;

  IXMLDOMNodeListDisp = dispinterface
    ['{2933BF82-7B36-11D2-B20E-00C04F983E60}']
    function nextNode: IXMLDOMNode; dispid 76;
    procedure reset; dispid 77;
    property _newEnum: IUnknown readonly dispid -4;
    property item[index: Integer]: IXMLDOMNode readonly dispid 0;
    property length: Integer readonly dispid 74;
  end;

  IXMLDOMNamedNodeMap = interface(IDispatch)
    ['{2933BF83-7B36-11D2-B20E-00C04F983E60}']
    function getNamedItem(const name: WideString): IXMLDOMNode; safecall;
    function setNamedItem(const newItem: IXMLDOMNode): IXMLDOMNode; safecall;
    function removeNamedItem(const name: WideString): IXMLDOMNode; safecall;
    function Get_item(index: Integer): IXMLDOMNode; safecall;
    function Get_length: Integer; safecall;
    function getQualifiedItem(const baseName: WideString; const namespaceURI: WideString): IXMLDOMNode; safecall;
    function removeQualifiedItem(const baseName: WideString; const namespaceURI: WideString): IXMLDOMNode; safecall;
    function nextNode: IXMLDOMNode; safecall;
    procedure reset; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: IXMLDOMNode read Get_item; default;
    property length: Integer read Get_length;
    property _newEnum: IUnknown read Get__newEnum;
  end;

  IXMLDOMNamedNodeMapDisp = dispinterface
    ['{2933BF83-7B36-11D2-B20E-00C04F983E60}']
    function getNamedItem(const name: WideString): IXMLDOMNode; dispid 83;
    function setNamedItem(const newItem: IXMLDOMNode): IXMLDOMNode; dispid 84;
    function removeNamedItem(const name: WideString): IXMLDOMNode; dispid 85;
    function getQualifiedItem(const baseName: WideString; const namespaceURI: WideString): IXMLDOMNode; dispid 87;
    function removeQualifiedItem(const baseName: WideString; const namespaceURI: WideString): IXMLDOMNode; dispid 88;
    function nextNode: IXMLDOMNode; dispid 89;
    procedure reset; dispid 90;
    property _newEnum: IUnknown readonly dispid -4;
    property item[index: Integer]: IXMLDOMNode readonly dispid 0;
    property length: Integer readonly dispid 74;
  end;

  IXMLDOMDocument = interface(IXMLDOMNode)
    ['{2933BF81-7B36-11D2-B20E-00C04F983E60}']
    function Get_doctype: IXMLDOMDocumentType; safecall;
    function Get_implementation_: IXMLDOMImplementation; safecall;
    function Get_documentElement: IXMLDOMElement; safecall;
    procedure Set_documentElement(const DOMElement: IXMLDOMElement); safecall;
    function createElement(const tagName: WideString): IXMLDOMElement; safecall;
    function createDocumentFragment: IXMLDOMDocumentFragment; safecall;
    function createTextNode(const data: WideString): IXMLDOMText; safecall;
    function createComment(const data: WideString): IXMLDOMComment; safecall;
    function createCDATASection(const data: WideString): IXMLDOMCDATASection; safecall;
    function createProcessingInstruction(const target: WideString; const data: WideString): IXMLDOMProcessingInstruction; safecall;
    function createAttribute(const name: WideString): IXMLDOMAttribute; safecall;
    function createEntityReference(const name: WideString): IXMLDOMEntityReference; safecall;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; safecall;
    function createNode(type_: OleVariant; const name: WideString; const namespaceURI: WideString): IXMLDOMNode; safecall;
    function nodeFromID(const idString: WideString): IXMLDOMNode; safecall;
    function load(xmlSource: OleVariant): WordBool; safecall;
    function Get_readyState: Integer; safecall;
    function Get_parseError: IXMLDOMParseError; safecall;
    function Get_url: WideString; safecall;
    function Get_async: WordBool; safecall;
    procedure Set_async(isAsync: WordBool); safecall;
    procedure abort; safecall;
    function loadXML(const bstrXML: WideString): WordBool; safecall;
    procedure save(destination: OleVariant); safecall;
    function Get_validateOnParse: WordBool; safecall;
    procedure Set_validateOnParse(isValidating: WordBool); safecall;
    function Get_resolveExternals: WordBool; safecall;
    procedure Set_resolveExternals(isResolving: WordBool); safecall;
    function Get_preserveWhiteSpace: WordBool; safecall;
    procedure Set_preserveWhiteSpace(isPreserving: WordBool); safecall;
    procedure Set_onreadystatechange(Param1: OleVariant); safecall;
    procedure Set_ondataavailable(Param1: OleVariant); safecall;
    procedure Set_ontransformnode(Param1: OleVariant); safecall;
    property doctype: IXMLDOMDocumentType read Get_doctype;
    property implementation_: IXMLDOMImplementation read Get_implementation_;
    property documentElement: IXMLDOMElement read Get_documentElement write Set_documentElement;
    property readyState: Integer read Get_readyState;
    property parseError: IXMLDOMParseError read Get_parseError;
    property url: WideString read Get_url;
    property async: WordBool read Get_async write Set_async;
    property validateOnParse: WordBool read Get_validateOnParse write Set_validateOnParse;
    property resolveExternals: WordBool read Get_resolveExternals write Set_resolveExternals;
    property preserveWhiteSpace: WordBool read Get_preserveWhiteSpace write Set_preserveWhiteSpace;
    property onreadystatechange: OleVariant write Set_onreadystatechange;
    property ondataavailable: OleVariant write Set_ondataavailable;
    property ontransformnode: OleVariant write Set_ontransformnode;
  end;

  IXMLDOMDocumentDisp = dispinterface
    ['{2933BF81-7B36-11D2-B20E-00C04F983E60}']
    function createElement(const tagName: WideString): IXMLDOMElement; dispid 41;
    function createDocumentFragment: IXMLDOMDocumentFragment; dispid 42;
    function createTextNode(const data: WideString): IXMLDOMText; dispid 43;
    function createComment(const data: WideString): IXMLDOMComment; dispid 44;
    function createCDATASection(const data: WideString): IXMLDOMCDATASection; dispid 45;
    function createProcessingInstruction(const target: WideString; const data: WideString): IXMLDOMProcessingInstruction; dispid 46;
    function createAttribute(const name: WideString): IXMLDOMAttribute; dispid 47;
    function createEntityReference(const name: WideString): IXMLDOMEntityReference; dispid 49;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; dispid 50;
    function createNode(type_: OleVariant; const name: WideString; const namespaceURI: WideString): IXMLDOMNode; dispid 54;
    function nodeFromID(const idString: WideString): IXMLDOMNode; dispid 56;
    function load(xmlSource: OleVariant): WordBool; dispid 58;
    procedure abort; dispid 62;
    function loadXML(const bstrXML: WideString): WordBool; dispid 63;
    procedure save(destination: OleVariant); dispid 64;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property readyState: Integer readonly dispid -525;
    property doctype: IXMLDOMDocumentType readonly dispid 38;
    property implementation_: IXMLDOMImplementation readonly dispid 39;
    property documentElement: IXMLDOMElement dispid 40;
    property parseError: IXMLDOMParseError readonly dispid 59;
    property url: WideString readonly dispid 60;
    property async: WordBool dispid 61;
    property validateOnParse: WordBool dispid 65;
    property resolveExternals: WordBool dispid 66;
    property preserveWhiteSpace: WordBool dispid 67;
    property onreadystatechange: OleVariant writeonly dispid 68;
    property ondataavailable: OleVariant writeonly dispid 69;
    property ontransformnode: OleVariant writeonly dispid 70;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMDocumentType = interface(IXMLDOMNode)
    ['{2933BF8B-7B36-11D2-B20E-00C04F983E60}']
    function Get_name: WideString; safecall;
    function Get_entities: IXMLDOMNamedNodeMap; safecall;
    function Get_notations: IXMLDOMNamedNodeMap; safecall;
    property name: WideString read Get_name;
    property entities: IXMLDOMNamedNodeMap read Get_entities;
    property notations: IXMLDOMNamedNodeMap read Get_notations;
  end;

  IXMLDOMDocumentTypeDisp = dispinterface
    ['{2933BF8B-7B36-11D2-B20E-00C04F983E60}']
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property name: WideString readonly dispid 131;
    property entities: IXMLDOMNamedNodeMap readonly dispid 132;
    property notations: IXMLDOMNamedNodeMap readonly dispid 133;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMImplementation = interface(IDispatch)
    ['{2933BF8F-7B36-11D2-B20E-00C04F983E60}']
    function hasFeature(const feature: WideString; const version: WideString): WordBool; safecall;
  end;

  IXMLDOMImplementationDisp = dispinterface
    ['{2933BF8F-7B36-11D2-B20E-00C04F983E60}']
    function hasFeature(const feature: WideString; const version: WideString): WordBool; dispid 145;
  end;

  IXMLDOMElement = interface(IXMLDOMNode)
    ['{2933BF86-7B36-11D2-B20E-00C04F983E60}']
    function Get_tagName: WideString; safecall;
    function getAttribute(const name: WideString): OleVariant; safecall;
    procedure setAttribute(const name: WideString; value: OleVariant); safecall;
    procedure removeAttribute(const name: WideString); safecall;
    function getAttributeNode(const name: WideString): IXMLDOMAttribute; safecall;
    function setAttributeNode(const DOMAttribute: IXMLDOMAttribute): IXMLDOMAttribute; safecall;
    function removeAttributeNode(const DOMAttribute: IXMLDOMAttribute): IXMLDOMAttribute; safecall;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; safecall;
    procedure normalize; safecall;
    property tagName: WideString read Get_tagName;
  end;

  IXMLDOMElementDisp = dispinterface
    ['{2933BF86-7B36-11D2-B20E-00C04F983E60}']
    function getAttribute(const name: WideString): OleVariant; dispid 99;
    procedure setAttribute(const name: WideString; value: OleVariant); dispid 100;
    procedure removeAttribute(const name: WideString); dispid 101;
    function getAttributeNode(const name: WideString): IXMLDOMAttribute; dispid 102;
    function setAttributeNode(const DOMAttribute: IXMLDOMAttribute): IXMLDOMAttribute; dispid 103;
    function removeAttributeNode(const DOMAttribute: IXMLDOMAttribute): IXMLDOMAttribute; dispid 104;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; dispid 105;
    procedure normalize; dispid 106;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property tagName: WideString readonly dispid 97;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMAttribute = interface(IXMLDOMNode)
    ['{2933BF85-7B36-11D2-B20E-00C04F983E60}']
    function Get_name: WideString; safecall;
    function Get_value: OleVariant; safecall;
    procedure Set_value(attributeValue: OleVariant); safecall;
    property name: WideString read Get_name;
    property value: OleVariant read Get_value write Set_value;
  end;

  IXMLDOMAttributeDisp = dispinterface
    ['{2933BF85-7B36-11D2-B20E-00C04F983E60}']
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property name: WideString readonly dispid 118;
    property value: OleVariant dispid 120;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMDocumentFragment = interface(IXMLDOMNode)
    ['{3EFAA413-272F-11D2-836F-0000F87A7782}']
  end;

  IXMLDOMDocumentFragmentDisp = dispinterface
    ['{3EFAA413-272F-11D2-836F-0000F87A7782}']
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMCharacterData = interface(IXMLDOMNode)
    ['{2933BF84-7B36-11D2-B20E-00C04F983E60}']
    function Get_data: WideString; safecall;
    procedure Set_data(const data: WideString); safecall;
    function Get_length: Integer; safecall;
    function substringData(offset: Integer; count: Integer): WideString; safecall;
    procedure appendData(const data: WideString); safecall;
    procedure insertData(offset: Integer; const data: WideString); safecall;
    procedure deleteData(offset: Integer; count: Integer); safecall;
    procedure replaceData(offset: Integer; count: Integer; const data: WideString); safecall;
    property data: WideString read Get_data write Set_data;
    property length: Integer read Get_length;
  end;

  IXMLDOMCharacterDataDisp = dispinterface
    ['{2933BF84-7B36-11D2-B20E-00C04F983E60}']
    function substringData(offset: Integer; count: Integer): WideString; dispid 111;
    procedure appendData(const data: WideString); dispid 112;
    procedure insertData(offset: Integer; const data: WideString); dispid 113;
    procedure deleteData(offset: Integer; count: Integer); dispid 114;
    procedure replaceData(offset: Integer; count: Integer; const data: WideString); dispid 115;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property data: WideString dispid 109;
    property length: Integer readonly dispid 110;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMText = interface(IXMLDOMCharacterData)
    ['{2933BF87-7B36-11D2-B20E-00C04F983E60}']
    function splitText(offset: Integer): IXMLDOMText; safecall;
  end;

  IXMLDOMTextDisp = dispinterface
    ['{2933BF87-7B36-11D2-B20E-00C04F983E60}']
    function splitText(offset: Integer): IXMLDOMText; dispid 123;
    function substringData(offset: Integer; count: Integer): WideString; dispid 111;
    procedure appendData(const data: WideString); dispid 112;
    procedure insertData(offset: Integer; const data: WideString); dispid 113;
    procedure deleteData(offset: Integer; count: Integer); dispid 114;
    procedure replaceData(offset: Integer; count: Integer; const data: WideString); dispid 115;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property data: WideString dispid 109;
    property length: Integer readonly dispid 110;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMComment = interface(IXMLDOMCharacterData)
    ['{2933BF88-7B36-11D2-B20E-00C04F983E60}']
  end;

  IXMLDOMCommentDisp = dispinterface
    ['{2933BF88-7B36-11D2-B20E-00C04F983E60}']
    function substringData(offset: Integer; count: Integer): WideString; dispid 111;
    procedure appendData(const data: WideString); dispid 112;
    procedure insertData(offset: Integer; const data: WideString); dispid 113;
    procedure deleteData(offset: Integer; count: Integer); dispid 114;
    procedure replaceData(offset: Integer; count: Integer; const data: WideString); dispid 115;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property data: WideString dispid 109;
    property length: Integer readonly dispid 110;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMCDATASection = interface(IXMLDOMText)
    ['{2933BF8A-7B36-11D2-B20E-00C04F983E60}']
  end;

  IXMLDOMCDATASectionDisp = dispinterface
    ['{2933BF8A-7B36-11D2-B20E-00C04F983E60}']
    function splitText(offset: Integer): IXMLDOMText; dispid 123;
    function substringData(offset: Integer; count: Integer): WideString; dispid 111;
    procedure appendData(const data: WideString); dispid 112;
    procedure insertData(offset: Integer; const data: WideString); dispid 113;
    procedure deleteData(offset: Integer; count: Integer); dispid 114;
    procedure replaceData(offset: Integer; count: Integer; const data: WideString); dispid 115;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property data: WideString dispid 109;
    property length: Integer readonly dispid 110;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMProcessingInstruction = interface(IXMLDOMNode)
    ['{2933BF89-7B36-11D2-B20E-00C04F983E60}']
    function Get_target: WideString; safecall;
    function Get_data: WideString; safecall;
    procedure Set_data(const value: WideString); safecall;
    property target: WideString read Get_target;
    property data: WideString read Get_data write Set_data;
  end;

  IXMLDOMProcessingInstructionDisp = dispinterface
    ['{2933BF89-7B36-11D2-B20E-00C04F983E60}']
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property target: WideString readonly dispid 127;
    property data: WideString dispid 128;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMEntityReference = interface(IXMLDOMNode)
    ['{2933BF8E-7B36-11D2-B20E-00C04F983E60}']
  end;

  IXMLDOMEntityReferenceDisp = dispinterface
    ['{2933BF8E-7B36-11D2-B20E-00C04F983E60}']
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMParseError = interface(IDispatch)
    ['{3EFAA426-272F-11D2-836F-0000F87A7782}']
    function Get_errorCode: Integer; safecall;
    function Get_url: WideString; safecall;
    function Get_reason: WideString; safecall;
    function Get_srcText: WideString; safecall;
    function Get_line: Integer; safecall;
    function Get_linepos: Integer; safecall;
    function Get_filepos: Integer; safecall;
    property errorCode: Integer read Get_errorCode;
    property url: WideString read Get_url;
    property reason: WideString read Get_reason;
    property srcText: WideString read Get_srcText;
    property line: Integer read Get_line;
    property linepos: Integer read Get_linepos;
    property filepos: Integer read Get_filepos;
  end;

  IXMLDOMParseErrorDisp = dispinterface
    ['{3EFAA426-272F-11D2-836F-0000F87A7782}']
    property errorCode: Integer readonly dispid 0;
    property url: WideString readonly dispid 179;
    property reason: WideString readonly dispid 180;
    property srcText: WideString readonly dispid 181;
    property line: Integer readonly dispid 182;
    property linepos: Integer readonly dispid 183;
    property filepos: Integer readonly dispid 184;
  end;

  IXMLDOMNotation = interface(IXMLDOMNode)
    ['{2933BF8C-7B36-11D2-B20E-00C04F983E60}']
    function Get_publicId: OleVariant; safecall;
    function Get_systemId: OleVariant; safecall;
    property publicId: OleVariant read Get_publicId;
    property systemId: OleVariant read Get_systemId;
  end;

  IXMLDOMNotationDisp = dispinterface
    ['{2933BF8C-7B36-11D2-B20E-00C04F983E60}']
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property publicId: OleVariant readonly dispid 136;
    property systemId: OleVariant readonly dispid 137;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMEntity = interface(IXMLDOMNode)
    ['{2933BF8D-7B36-11D2-B20E-00C04F983E60}']
    function Get_publicId: OleVariant; safecall;
    function Get_systemId: OleVariant; safecall;
    function Get_notationName: WideString; safecall;
    property publicId: OleVariant read Get_publicId;
    property systemId: OleVariant read Get_systemId;
    property notationName: WideString read Get_notationName;
  end;

  IXMLDOMEntityDisp = dispinterface
    ['{2933BF8D-7B36-11D2-B20E-00C04F983E60}']
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property publicId: OleVariant readonly dispid 140;
    property systemId: OleVariant readonly dispid 141;
    property notationName: WideString readonly dispid 142;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMParseError2 = interface(IXMLDOMParseError)
    ['{3EFAA428-272F-11D2-836F-0000F87A7782}']
    function Get_errorXPath: WideString; safecall;
    function Get_allErrors: IXMLDOMParseErrorCollection; safecall;
    function errorParameters(index: Integer): WideString; safecall;
    function Get_errorParametersCount: Integer; safecall;
    property errorXPath: WideString read Get_errorXPath;
    property allErrors: IXMLDOMParseErrorCollection read Get_allErrors;
    property errorParametersCount: Integer read Get_errorParametersCount;
  end;

  IXMLDOMParseError2Disp = dispinterface
    ['{3EFAA428-272F-11D2-836F-0000F87A7782}']
    function errorParameters(index: Integer): WideString; dispid 188;
    property allErrors: IXMLDOMParseErrorCollection readonly dispid 187;
    property errorParametersCount: Integer readonly dispid 189;
    property errorXPath: WideString readonly dispid 190;
    property errorCode: Integer readonly dispid 0;
    property url: WideString readonly dispid 179;
    property reason: WideString readonly dispid 180;
    property srcText: WideString readonly dispid 181;
    property line: Integer readonly dispid 182;
    property linepos: Integer readonly dispid 183;
    property filepos: Integer readonly dispid 184;
  end;

  IXMLDOMParseErrorCollection = interface(IDispatch)
    ['{3EFAA429-272F-11D2-836F-0000F87A7782}']
    function Get_item(index: Integer): IXMLDOMParseError2; safecall;
    function Get_length: Integer; safecall;
    function Get_next: IXMLDOMParseError2; safecall;
    procedure reset; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: IXMLDOMParseError2 read Get_item; default;
    property length: Integer read Get_length;
    property next: IXMLDOMParseError2 read Get_next;
    property _newEnum: IUnknown read Get__newEnum;
  end;

  IXMLDOMParseErrorCollectionDisp = dispinterface
    ['{3EFAA429-272F-11D2-836F-0000F87A7782}']
    procedure reset; dispid 195;
    property _newEnum: IUnknown readonly dispid -4;
    property item[index: Integer]: IXMLDOMParseError2 readonly dispid 0;
    property length: Integer readonly dispid 193;
    property next: IXMLDOMParseError2 readonly dispid 194;
  end;

  IXTLRuntime = interface(IXMLDOMNode)
    ['{3EFAA425-272F-11D2-836F-0000F87A7782}']
    function uniqueID(const pNode: IXMLDOMNode): Integer; safecall;
    function depth(const pNode: IXMLDOMNode): Integer; safecall;
    function childNumber(const pNode: IXMLDOMNode): Integer; safecall;
    function ancestorChildNumber(const bstrNodeName: WideString; const pNode: IXMLDOMNode): Integer; safecall;
    function absoluteChildNumber(const pNode: IXMLDOMNode): Integer; safecall;
    function formatIndex(lIndex: Integer; const bstrFormat: WideString): WideString; safecall;
    function formatNumber(dblNumber: Double; const bstrFormat: WideString): WideString; safecall;
    function formatDate(varDate: OleVariant; const bstrFormat: WideString; varDestLocale: OleVariant): WideString; safecall;
    function formatTime(varTime: OleVariant; const bstrFormat: WideString; varDestLocale: OleVariant): WideString; safecall;
  end;

  IXTLRuntimeDisp = dispinterface
    ['{3EFAA425-272F-11D2-836F-0000F87A7782}']
    function uniqueID(const pNode: IXMLDOMNode): Integer; dispid 187;
    function depth(const pNode: IXMLDOMNode): Integer; dispid 188;
    function childNumber(const pNode: IXMLDOMNode): Integer; dispid 189;
    function ancestorChildNumber(const bstrNodeName: WideString; const pNode: IXMLDOMNode): Integer; dispid 190;
    function absoluteChildNumber(const pNode: IXMLDOMNode): Integer; dispid 191;
    function formatIndex(lIndex: Integer; const bstrFormat: WideString): WideString; dispid 192;
    function formatNumber(dblNumber: Double; const bstrFormat: WideString): WideString; dispid 193;
    function formatDate(varDate: OleVariant; const bstrFormat: WideString; varDestLocale: OleVariant): WideString; dispid 194;
    function formatTime(varTime: OleVariant; const bstrFormat: WideString; varDestLocale: OleVariant): WideString; dispid 195;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  ISAXXMLReader = interface(IUnknown)
    ['{A4F96ED0-F829-476E-81C0-CDC7BD2A0802}']
    function getFeature(var pwchName: Word; out pvfValue: WordBool): HRESULT; stdcall;
    function putFeature(var pwchName: Word; vfValue: WordBool): HRESULT; stdcall;
    function getProperty(var pwchName: Word; out pvarValue: OleVariant): HRESULT; stdcall;
    function putProperty(var pwchName: Word; varValue: OleVariant): HRESULT; stdcall;
    function getEntityResolver(out ppResolver: ISAXEntityResolver): HRESULT; stdcall;
    function putEntityResolver(const pResolver: ISAXEntityResolver): HRESULT; stdcall;
    function getContentHandler(out ppHandler: ISAXContentHandler): HRESULT; stdcall;
    function putContentHandler(const pHandler: ISAXContentHandler): HRESULT; stdcall;
    function getDTDHandler(out ppHandler: ISAXDTDHandler): HRESULT; stdcall;
    function putDTDHandler(const pHandler: ISAXDTDHandler): HRESULT; stdcall;
    function getErrorHandler(out ppHandler: ISAXErrorHandler): HRESULT; stdcall;
    function putErrorHandler(const pHandler: ISAXErrorHandler): HRESULT; stdcall;
    function getBaseURL(out ppwchBaseUrl: PWord): HRESULT; stdcall;
    function putBaseURL(var pwchBaseUrl: Word): HRESULT; stdcall;
    function getSecureBaseURL(out ppwchSecureBaseUrl: PWord): HRESULT; stdcall;
    function putSecureBaseURL(var pwchSecureBaseUrl: Word): HRESULT; stdcall;
    function parse(varInput: OleVariant): HRESULT; stdcall;
    function parseURL(var pwchUrl: Word): HRESULT; stdcall;
  end;

  ISAXEntityResolver = interface(IUnknown)
    ['{99BCA7BD-E8C4-4D5F-A0CF-6D907901FF07}']
    function resolveEntity(var pwchPublicId: Word; var pwchSystemId: Word; out pvarInput: OleVariant): HRESULT; stdcall;
  end;

  ISAXContentHandler = interface(IUnknown)
    ['{1545CDFA-9E4E-4497-A8A4-2BF7D0112C44}']
    function putDocumentLocator(const pLocator: ISAXLocator): HRESULT; stdcall;
    function startDocument: HRESULT; stdcall;
    function endDocument: HRESULT; stdcall;
    function startPrefixMapping(var pwchPrefix: Word; cchPrefix: SYSINT; var pwchUri: Word; cchUri: SYSINT): HRESULT; stdcall;
    function endPrefixMapping(var pwchPrefix: Word; cchPrefix: SYSINT): HRESULT; stdcall;
    function startElement(var pwchNamespaceUri: Word; cchNamespaceUri: SYSINT; var pwchLocalName: Word; cchLocalName: SYSINT; var pwchQName: Word; cchQName: SYSINT;
      const pAttributes: ISAXAttributes): HRESULT; stdcall;
    function endElement(var pwchNamespaceUri: Word; cchNamespaceUri: SYSINT; var pwchLocalName: Word; cchLocalName: SYSINT; var pwchQName: Word; cchQName: SYSINT): HRESULT; stdcall;
    function characters(var pwchChars: Word; cchChars: SYSINT): HRESULT; stdcall;
    function ignorableWhitespace(var pwchChars: Word; cchChars: SYSINT): HRESULT; stdcall;
    function processingInstruction(var pwchTarget: Word; cchTarget: SYSINT; var pwchData: Word; cchData: SYSINT): HRESULT; stdcall;
    function skippedEntity(var pwchName: Word; cchName: SYSINT): HRESULT; stdcall;
  end;

  ISAXLocator = interface(IUnknown)
    ['{9B7E472A-0DE4-4640-BFF3-84D38A051C31}']
    function getColumnNumber(out pnColumn: SYSINT): HRESULT; stdcall;
    function getLineNumber(out pnLine: SYSINT): HRESULT; stdcall;
    function getPublicId(out ppwchPublicId: PWord): HRESULT; stdcall;
    function getSystemId(out ppwchSystemId: PWord): HRESULT; stdcall;
  end;

  ISAXAttributes = interface(IUnknown)
    ['{F078ABE1-45D2-4832-91EA-4466CE2F25C9}']
    function getLength(out pnLength: SYSINT): HRESULT; stdcall;
    function getURI(nIndex: SYSINT; out ppwchUri: PWord; out pcchUri: SYSINT): HRESULT; stdcall;
    function getLocalName(nIndex: SYSINT; out ppwchLocalName: PWord; out pcchLocalName: SYSINT): HRESULT; stdcall;
    function getQName(nIndex: SYSINT; out ppwchQName: PWord; out pcchQName: SYSINT): HRESULT; stdcall;
    function getName(nIndex: SYSINT; out ppwchUri: PWord; out pcchUri: SYSINT; out ppwchLocalName: PWord; out pcchLocalName: SYSINT; out ppwchQName: PWord; out pcchQName: SYSINT): HRESULT; stdcall;
    function getIndexFromName(var pwchUri: Word; cchUri: SYSINT; var pwchLocalName: Word; cchLocalName: SYSINT; out pnIndex: SYSINT): HRESULT; stdcall;
    function getIndexFromQName(var pwchQName: Word; cchQName: SYSINT; out pnIndex: SYSINT): HRESULT; stdcall;
    function getType(nIndex: SYSINT; out ppwchType: PWord; out pcchType: SYSINT): HRESULT; stdcall;
    function getTypeFromName(var pwchUri: Word; cchUri: SYSINT; var pwchLocalName: Word; cchLocalName: SYSINT; out ppwchType: PWord; out pcchType: SYSINT): HRESULT; stdcall;
    function getTypeFromQName(var pwchQName: Word; cchQName: SYSINT; out ppwchType: PWord; out pcchType: SYSINT): HRESULT; stdcall;
    function getValue(nIndex: SYSINT; out ppwchValue: PWord; out pcchValue: SYSINT): HRESULT; stdcall;
    function getValueFromName(var pwchUri: Word; cchUri: SYSINT; var pwchLocalName: Word; cchLocalName: SYSINT; out ppwchValue: PWord; out pcchValue: SYSINT): HRESULT; stdcall;
    function getValueFromQName(var pwchQName: Word; cchQName: SYSINT; out ppwchValue: PWord; out pcchValue: SYSINT): HRESULT; stdcall;
  end;

  ISAXDTDHandler = interface(IUnknown)
    ['{E15C1BAF-AFB3-4D60-8C36-19A8C45DEFED}']
    function notationDecl(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT): HRESULT; stdcall;
    function unparsedEntityDecl(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT;
      var pwchNotationName: Word; cchNotationName: SYSINT): HRESULT; stdcall;
  end;

  ISAXErrorHandler = interface(IUnknown)
    ['{A60511C4-CCF5-479E-98A3-DC8DC545B7D0}']
    function error(const pLocator: ISAXLocator; var pwchErrorMessage: Word; hrErrorCode: HRESULT): HRESULT; stdcall;
    function fatalError(const pLocator: ISAXLocator; var pwchErrorMessage: Word; hrErrorCode: HRESULT): HRESULT; stdcall;
    function ignorableWarning(const pLocator: ISAXLocator; var pwchErrorMessage: Word; hrErrorCode: HRESULT): HRESULT; stdcall;
  end;

  ISAXXMLFilter = interface(ISAXXMLReader)
    ['{70409222-CA09-4475-ACB8-40312FE8D145}']
    function getParent(out ppReader: ISAXXMLReader): HRESULT; stdcall;
    function putParent(const pReader: ISAXXMLReader): HRESULT; stdcall;
  end;

  IVBSAXXMLFilter = interface(IDispatch)
    ['{1299EB1B-5B88-433E-82DE-82CA75AD4E04}']
    function Get_parent: IVBSAXXMLReader; safecall;
    procedure Set_parent(const oReader: IVBSAXXMLReader); safecall;
    property parent: IVBSAXXMLReader read Get_parent write Set_parent;
  end;

  IVBSAXXMLFilterDisp = dispinterface
    ['{1299EB1B-5B88-433E-82DE-82CA75AD4E04}']
    property parent: IVBSAXXMLReader dispid 1309;
  end;

  IVBSAXXMLReader = interface(IDispatch)
    ['{8C033CAA-6CD6-4F73-B728-4531AF74945F}']
    function getFeature(const strName: WideString): WordBool; safecall;
    procedure putFeature(const strName: WideString; fValue: WordBool); safecall;
    function getProperty(const strName: WideString): OleVariant; safecall;
    procedure putProperty(const strName: WideString; varValue: OleVariant); safecall;
    function Get_entityResolver: IVBSAXEntityResolver; safecall;
    procedure Set_entityResolver(const oResolver: IVBSAXEntityResolver); safecall;
    function Get_contentHandler: IVBSAXContentHandler; safecall;
    procedure Set_contentHandler(const oHandler: IVBSAXContentHandler); safecall;
    function Get_dtdHandler: IVBSAXDTDHandler; safecall;
    procedure Set_dtdHandler(const oHandler: IVBSAXDTDHandler); safecall;
    function Get_errorHandler: IVBSAXErrorHandler; safecall;
    procedure Set_errorHandler(const oHandler: IVBSAXErrorHandler); safecall;
    function Get_baseURL: WideString; safecall;
    procedure Set_baseURL(const strBaseURL: WideString); safecall;
    function Get_secureBaseURL: WideString; safecall;
    procedure Set_secureBaseURL(const strSecureBaseURL: WideString); safecall;
    procedure parse(varInput: OleVariant); safecall;
    procedure parseURL(const strURL: WideString); safecall;
    property entityResolver: IVBSAXEntityResolver read Get_entityResolver write Set_entityResolver;
    property contentHandler: IVBSAXContentHandler read Get_contentHandler write Set_contentHandler;
    property dtdHandler: IVBSAXDTDHandler read Get_dtdHandler write Set_dtdHandler;
    property errorHandler: IVBSAXErrorHandler read Get_errorHandler write Set_errorHandler;
    property baseURL: WideString read Get_baseURL write Set_baseURL;
    property secureBaseURL: WideString read Get_secureBaseURL write Set_secureBaseURL;
  end;

  IVBSAXXMLReaderDisp = dispinterface
    ['{8C033CAA-6CD6-4F73-B728-4531AF74945F}']
    function getFeature(const strName: WideString): WordBool; dispid 1282;
    procedure putFeature(const strName: WideString; fValue: WordBool); dispid 1283;
    function getProperty(const strName: WideString): OleVariant; dispid 1284;
    procedure putProperty(const strName: WideString; varValue: OleVariant); dispid 1285;
    procedure parse(varInput: OleVariant); dispid 1292;
    procedure parseURL(const strURL: WideString); dispid 1293;
    property entityResolver: IVBSAXEntityResolver dispid 1286;
    property contentHandler: IVBSAXContentHandler dispid 1287;
    property dtdHandler: IVBSAXDTDHandler dispid 1288;
    property errorHandler: IVBSAXErrorHandler dispid 1289;
    property baseURL: WideString dispid 1290;
    property secureBaseURL: WideString dispid 1291;
  end;

  IVBSAXEntityResolver = interface(IDispatch)
    ['{0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}']
    function resolveEntity(var strPublicId: WideString; var strSystemId: WideString): OleVariant; safecall;
  end;

  IVBSAXEntityResolverDisp = dispinterface
    ['{0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}']
    function resolveEntity(var strPublicId: WideString; var strSystemId: WideString): OleVariant; dispid 1319;
  end;

  IVBSAXContentHandler = interface(IDispatch)
    ['{2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}']
    procedure Set_documentLocator(const Param1: IVBSAXLocator); safecall;
    procedure startDocument; safecall;
    procedure endDocument; safecall;
    procedure startPrefixMapping(var strPrefix: WideString; var strURI: WideString); safecall;
    procedure endPrefixMapping(var strPrefix: WideString); safecall;
    procedure startElement(var strNamespaceURI: WideString; var strLocalName: WideString; var strQName: WideString; const oAttributes: IVBSAXAttributes); safecall;
    procedure endElement(var strNamespaceURI: WideString; var strLocalName: WideString; var strQName: WideString); safecall;
    procedure characters(var strChars: WideString); safecall;
    procedure ignorableWhitespace(var strChars: WideString); safecall;
    procedure processingInstruction(var strTarget: WideString; var strData: WideString); safecall;
    procedure skippedEntity(var strName: WideString); safecall;
    property documentLocator: IVBSAXLocator write Set_documentLocator;
  end;

  IVBSAXContentHandlerDisp = dispinterface
    ['{2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}']
    procedure startDocument; dispid 1323;
    procedure endDocument; dispid 1324;
    procedure startPrefixMapping(var strPrefix: WideString; var strURI: WideString); dispid 1325;
    procedure endPrefixMapping(var strPrefix: WideString); dispid 1326;
    procedure startElement(var strNamespaceURI: WideString; var strLocalName: WideString; var strQName: WideString; const oAttributes: IVBSAXAttributes); dispid 1327;
    procedure endElement(var strNamespaceURI: WideString; var strLocalName: WideString; var strQName: WideString); dispid 1328;
    procedure characters(var strChars: WideString); dispid 1329;
    procedure ignorableWhitespace(var strChars: WideString); dispid 1330;
    procedure processingInstruction(var strTarget: WideString; var strData: WideString); dispid 1331;
    procedure skippedEntity(var strName: WideString); dispid 1332;
    property documentLocator: IVBSAXLocator writeonly dispid 1322;
  end;

  IVBSAXLocator = interface(IDispatch)
    ['{796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}']
    function Get_columnNumber: SYSINT; safecall;
    function Get_lineNumber: SYSINT; safecall;
    function Get_publicId: WideString; safecall;
    function Get_systemId: WideString; safecall;
    property columnNumber: SYSINT read Get_columnNumber;
    property lineNumber: SYSINT read Get_lineNumber;
    property publicId: WideString read Get_publicId;
    property systemId: WideString read Get_systemId;
  end;

  IVBSAXLocatorDisp = dispinterface
    ['{796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}']
    property columnNumber: SYSINT readonly dispid 1313;
    property lineNumber: SYSINT readonly dispid 1314;
    property publicId: WideString readonly dispid 1315;
    property systemId: WideString readonly dispid 1316;
  end;

  IVBSAXAttributes = interface(IDispatch)
    ['{10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}']
    function Get_length: SYSINT; safecall;
    function getURI(nIndex: SYSINT): WideString; safecall;
    function getLocalName(nIndex: SYSINT): WideString; safecall;
    function getQName(nIndex: SYSINT): WideString; safecall;
    function getIndexFromName(const strURI: WideString; const strLocalName: WideString): SYSINT; safecall;
    function getIndexFromQName(const strQName: WideString): SYSINT; safecall;
    function getType(nIndex: SYSINT): WideString; safecall;
    function getTypeFromName(const strURI: WideString; const strLocalName: WideString): WideString; safecall;
    function getTypeFromQName(const strQName: WideString): WideString; safecall;
    function getValue(nIndex: SYSINT): WideString; safecall;
    function getValueFromName(const strURI: WideString; const strLocalName: WideString): WideString; safecall;
    function getValueFromQName(const strQName: WideString): WideString; safecall;
    property length: SYSINT read Get_length;
  end;

  IVBSAXAttributesDisp = dispinterface
    ['{10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}']
    function getURI(nIndex: SYSINT): WideString; dispid 1345;
    function getLocalName(nIndex: SYSINT): WideString; dispid 1346;
    function getQName(nIndex: SYSINT): WideString; dispid 1347;
    function getIndexFromName(const strURI: WideString; const strLocalName: WideString): SYSINT; dispid 1348;
    function getIndexFromQName(const strQName: WideString): SYSINT; dispid 1349;
    function getType(nIndex: SYSINT): WideString; dispid 1350;
    function getTypeFromName(const strURI: WideString; const strLocalName: WideString): WideString; dispid 1351;
    function getTypeFromQName(const strQName: WideString): WideString; dispid 1352;
    function getValue(nIndex: SYSINT): WideString; dispid 1353;
    function getValueFromName(const strURI: WideString; const strLocalName: WideString): WideString; dispid 1354;
    function getValueFromQName(const strQName: WideString): WideString; dispid 1355;
    property length: SYSINT readonly dispid 1344;
  end;

  IVBSAXDTDHandler = interface(IDispatch)
    ['{24FB3297-302D-4620-BA39-3A732D850558}']
    procedure notationDecl(var strName: WideString; var strPublicId: WideString; var strSystemId: WideString); safecall;
    procedure unparsedEntityDecl(var strName: WideString; var strPublicId: WideString; var strSystemId: WideString; var strNotationName: WideString); safecall;
  end;

  IVBSAXDTDHandlerDisp = dispinterface
    ['{24FB3297-302D-4620-BA39-3A732D850558}']
    procedure notationDecl(var strName: WideString; var strPublicId: WideString; var strSystemId: WideString); dispid 1335;
    procedure unparsedEntityDecl(var strName: WideString; var strPublicId: WideString; var strSystemId: WideString; var strNotationName: WideString); dispid 1336;
  end;

  IVBSAXErrorHandler = interface(IDispatch)
    ['{D963D3FE-173C-4862-9095-B92F66995F52}']
    procedure error(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; nErrorCode: Integer); safecall;
    procedure fatalError(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; nErrorCode: Integer); safecall;
    procedure ignorableWarning(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; nErrorCode: Integer); safecall;
  end;

  IVBSAXErrorHandlerDisp = dispinterface
    ['{D963D3FE-173C-4862-9095-B92F66995F52}']
    procedure error(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; nErrorCode: Integer); dispid 1339;
    procedure fatalError(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; nErrorCode: Integer); dispid 1340;
    procedure ignorableWarning(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; nErrorCode: Integer); dispid 1341;
  end;

  IMXReaderControl = interface(IDispatch)
    ['{808F4E35-8D5A-4FBE-8466-33A41279ED30}']
    procedure abort; safecall;
    procedure resume; safecall;
    procedure suspend; safecall;
  end;

  IMXReaderControlDisp = dispinterface
    ['{808F4E35-8D5A-4FBE-8466-33A41279ED30}']
    procedure abort; dispid 1398;
    procedure resume; dispid 1399;
    procedure suspend; dispid 1400;
  end;

  IMXSchemaDeclHandler = interface(IDispatch)
    ['{FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}']
    procedure schemaElementDecl(const oSchemaElement: ISchemaElement); safecall;
  end;

  IMXSchemaDeclHandlerDisp = dispinterface
    ['{FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}']
    procedure schemaElementDecl(const oSchemaElement: ISchemaElement); dispid 1403;
  end;

  ISchemaItem = interface(IDispatch)
    ['{50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_name: WideString; safecall;
    function Get_namespaceURI: WideString; safecall;
    function Get_schema: ISchema; safecall;
    function Get_id: WideString; safecall;
    function Get_itemType: SOMITEMTYPE; safecall;
    function Get_unhandledAttributes: IVBSAXAttributes; safecall;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; safecall;
    property name: WideString read Get_name;
    property namespaceURI: WideString read Get_namespaceURI;
    property schema: ISchema read Get_schema;
    property id: WideString read Get_id;
    property itemType: SOMITEMTYPE read Get_itemType;
    property unhandledAttributes: IVBSAXAttributes read Get_unhandledAttributes;
  end;

  ISchemaItemDisp = dispinterface
    ['{50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}']
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
  end;

  ISchemaParticle = interface(ISchemaItem)
    ['{50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_minOccurs: OleVariant; safecall;
    function Get_maxOccurs: OleVariant; safecall;
    property minOccurs: OleVariant read Get_minOccurs;
    property maxOccurs: OleVariant read Get_maxOccurs;
  end;

  ISchemaParticleDisp = dispinterface
    ['{50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}']
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
    property maxOccurs: OleVariant readonly dispid 1451;
    property minOccurs: OleVariant readonly dispid 1455;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
  end;

  ISchemaElement = interface(ISchemaParticle)
    ['{50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_type_: ISchemaType; safecall;
    function Get_scope: ISchemaComplexType; safecall;
    function Get_defaultValue: WideString; safecall;
    function Get_fixedValue: WideString; safecall;
    function Get_isNillable: WordBool; safecall;
    function Get_identityConstraints: ISchemaItemCollection; safecall;
    function Get_substitutionGroup: ISchemaElement; safecall;
    function Get_substitutionGroupExclusions: SCHEMADERIVATIONMETHOD; safecall;
    function Get_disallowedSubstitutions: SCHEMADERIVATIONMETHOD; safecall;
    function Get_isAbstract: WordBool; safecall;
    function Get_isReference: WordBool; safecall;
    property type_: ISchemaType read Get_type_;
    property scope: ISchemaComplexType read Get_scope;
    property defaultValue: WideString read Get_defaultValue;
    property fixedValue: WideString read Get_fixedValue;
    property isNillable: WordBool read Get_isNillable;
    property identityConstraints: ISchemaItemCollection read Get_identityConstraints;
    property substitutionGroup: ISchemaElement read Get_substitutionGroup;
    property substitutionGroupExclusions: SCHEMADERIVATIONMETHOD read Get_substitutionGroupExclusions;
    property disallowedSubstitutions: SCHEMADERIVATIONMETHOD read Get_disallowedSubstitutions;
    property isAbstract: WordBool read Get_isAbstract;
    property isReference: WordBool read Get_isReference;
  end;

  ISchemaElementDisp = dispinterface
    ['{50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}']
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
    property defaultValue: WideString readonly dispid 1431;
    property disallowedSubstitutions: SCHEMADERIVATIONMETHOD readonly dispid 1433;
    property fixedValue: WideString readonly dispid 1438;
    property identityConstraints: ISchemaItemCollection readonly dispid 1441;
    property isAbstract: WordBool readonly dispid 1442;
    property isNillable: WordBool readonly dispid 1443;
    property isReference: WordBool readonly dispid 1444;
    property scope: ISchemaComplexType readonly dispid 1469;
    property substitutionGroup: ISchemaElement readonly dispid 1471;
    property substitutionGroupExclusions: SCHEMADERIVATIONMETHOD readonly dispid 1472;
    property type_: ISchemaType readonly dispid 1476;
    property minOccurs: OleVariant readonly dispid 1455;
    property maxOccurs: OleVariant readonly dispid 1451;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
  end;

  ISchema = interface(ISchemaItem)
    ['{50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_targetNamespace: WideString; safecall;
    function Get_version: WideString; safecall;
    function Get_types: ISchemaItemCollection; safecall;
    function Get_elements: ISchemaItemCollection; safecall;
    function Get_attributes: ISchemaItemCollection; safecall;
    function Get_attributeGroups: ISchemaItemCollection; safecall;
    function Get_modelGroups: ISchemaItemCollection; safecall;
    function Get_notations: ISchemaItemCollection; safecall;
    function Get_schemaLocations: ISchemaStringCollection; safecall;
    property targetNamespace: WideString read Get_targetNamespace;
    property version: WideString read Get_version;
    property types: ISchemaItemCollection read Get_types;
    property elements: ISchemaItemCollection read Get_elements;
    property attributes: ISchemaItemCollection read Get_attributes;
    property attributeGroups: ISchemaItemCollection read Get_attributeGroups;
    property modelGroups: ISchemaItemCollection read Get_modelGroups;
    property notations: ISchemaItemCollection read Get_notations;
    property schemaLocations: ISchemaStringCollection read Get_schemaLocations;
  end;

  ISchemaDisp = dispinterface
    ['{50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}']
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
    property attributeGroups: ISchemaItemCollection readonly dispid 1426;
    property attributes: ISchemaItemCollection readonly dispid 1427;
    property elements: ISchemaItemCollection readonly dispid 1434;
    property modelGroups: ISchemaItemCollection readonly dispid 1456;
    property notations: ISchemaItemCollection readonly dispid 1460;
    property schemaLocations: ISchemaStringCollection readonly dispid 1468;
    property targetNamespace: WideString readonly dispid 1474;
    property types: ISchemaItemCollection readonly dispid 1477;
    property version: WideString readonly dispid 1481;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
  end;

  ISchemaItemCollection = interface(IDispatch)
    ['{50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_item(index: Integer): ISchemaItem; safecall;
    function itemByName(const name: WideString): ISchemaItem; safecall;
    function itemByQName(const name: WideString; const namespaceURI: WideString): ISchemaItem; safecall;
    function Get_length: Integer; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: ISchemaItem read Get_item; default;
    property length: Integer read Get_length;
    property _newEnum: IUnknown read Get__newEnum;
  end;

  ISchemaItemCollectionDisp = dispinterface
    ['{50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}']
    function itemByName(const name: WideString): ISchemaItem; dispid 1423;
    function itemByQName(const name: WideString; const namespaceURI: WideString): ISchemaItem; dispid 1424;
    property _newEnum: IUnknown readonly dispid -4;
    property item[index: Integer]: ISchemaItem readonly dispid 0;
    property length: Integer readonly dispid 1447;
  end;

  ISchemaStringCollection = interface(IDispatch)
    ['{50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_item(index: Integer): WideString; safecall;
    function Get_length: Integer; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: WideString read Get_item; default;
    property length: Integer read Get_length;
    property _newEnum: IUnknown read Get__newEnum;
  end;

  ISchemaStringCollectionDisp = dispinterface
    ['{50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}']
    property _newEnum: IUnknown readonly dispid -4;
    property item[index: Integer]: WideString readonly dispid 0;
    property length: Integer readonly dispid 1447;
  end;

  ISchemaType = interface(ISchemaItem)
    ['{50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_baseTypes: ISchemaItemCollection; safecall;
    function Get_final: SCHEMADERIVATIONMETHOD; safecall;
    function Get_variety: SCHEMATYPEVARIETY; safecall;
    function Get_derivedBy: SCHEMADERIVATIONMETHOD; safecall;
    function isValid(const data: WideString): WordBool; safecall;
    function Get_minExclusive: WideString; safecall;
    function Get_minInclusive: WideString; safecall;
    function Get_maxExclusive: WideString; safecall;
    function Get_maxInclusive: WideString; safecall;
    function Get_totalDigits: OleVariant; safecall;
    function Get_fractionDigits: OleVariant; safecall;
    function Get_length: OleVariant; safecall;
    function Get_minLength: OleVariant; safecall;
    function Get_maxLength: OleVariant; safecall;
    function Get_enumeration: ISchemaStringCollection; safecall;
    function Get_whitespace: SCHEMAWHITESPACE; safecall;
    function Get_patterns: ISchemaStringCollection; safecall;
    property baseTypes: ISchemaItemCollection read Get_baseTypes;
    property final: SCHEMADERIVATIONMETHOD read Get_final;
    property variety: SCHEMATYPEVARIETY read Get_variety;
    property derivedBy: SCHEMADERIVATIONMETHOD read Get_derivedBy;
    property minExclusive: WideString read Get_minExclusive;
    property minInclusive: WideString read Get_minInclusive;
    property maxExclusive: WideString read Get_maxExclusive;
    property maxInclusive: WideString read Get_maxInclusive;
    property totalDigits: OleVariant read Get_totalDigits;
    property fractionDigits: OleVariant read Get_fractionDigits;
    property length: OleVariant read Get_length;
    property minLength: OleVariant read Get_minLength;
    property maxLength: OleVariant read Get_maxLength;
    property enumeration: ISchemaStringCollection read Get_enumeration;
    property whitespace: SCHEMAWHITESPACE read Get_whitespace;
    property patterns: ISchemaStringCollection read Get_patterns;
  end;

  ISchemaTypeDisp = dispinterface
    ['{50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}']
    function isValid(const data: WideString): WordBool; dispid 1445;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
    property baseTypes: ISchemaItemCollection readonly dispid 1428;
    property derivedBy: SCHEMADERIVATIONMETHOD readonly dispid 1432;
    property enumeration: ISchemaStringCollection readonly dispid 1435;
    property final: SCHEMADERIVATIONMETHOD readonly dispid 1437;
    property fractionDigits: OleVariant readonly dispid 1439;
    property length: OleVariant readonly dispid 1447;
    property maxExclusive: WideString readonly dispid 1448;
    property maxInclusive: WideString readonly dispid 1449;
    property maxLength: OleVariant readonly dispid 1450;
    property minExclusive: WideString readonly dispid 1452;
    property minInclusive: WideString readonly dispid 1453;
    property minLength: OleVariant readonly dispid 1454;
    property patterns: ISchemaStringCollection readonly dispid 1462;
    property totalDigits: OleVariant readonly dispid 1475;
    property variety: SCHEMATYPEVARIETY readonly dispid 1480;
    property whitespace: SCHEMAWHITESPACE readonly dispid 1482;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
  end;

  ISchemaComplexType = interface(ISchemaType)
    ['{50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_isAbstract: WordBool; safecall;
    function Get_anyAttribute: ISchemaAny; safecall;
    function Get_attributes: ISchemaItemCollection; safecall;
    function Get_contentType: SCHEMACONTENTTYPE; safecall;
    function Get_contentModel: ISchemaModelGroup; safecall;
    function Get_prohibitedSubstitutions: SCHEMADERIVATIONMETHOD; safecall;
    property isAbstract: WordBool read Get_isAbstract;
    property anyAttribute: ISchemaAny read Get_anyAttribute;
    property attributes: ISchemaItemCollection read Get_attributes;
    property contentType: SCHEMACONTENTTYPE read Get_contentType;
    property contentModel: ISchemaModelGroup read Get_contentModel;
    property prohibitedSubstitutions: SCHEMADERIVATIONMETHOD read Get_prohibitedSubstitutions;
  end;

  ISchemaComplexTypeDisp = dispinterface
    ['{50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}']
    function isValid(const data: WideString): WordBool; dispid 1445;
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
    property anyAttribute: ISchemaAny readonly dispid 1425;
    property attributes: ISchemaItemCollection readonly dispid 1427;
    property contentModel: ISchemaModelGroup readonly dispid 1429;
    property contentType: SCHEMACONTENTTYPE readonly dispid 1430;
    property isAbstract: WordBool readonly dispid 1442;
    property prohibitedSubstitutions: SCHEMADERIVATIONMETHOD readonly dispid 1464;
    property baseTypes: ISchemaItemCollection readonly dispid 1428;
    property final: SCHEMADERIVATIONMETHOD readonly dispid 1437;
    property variety: SCHEMATYPEVARIETY readonly dispid 1480;
    property derivedBy: SCHEMADERIVATIONMETHOD readonly dispid 1432;
    property minExclusive: WideString readonly dispid 1452;
    property minInclusive: WideString readonly dispid 1453;
    property maxExclusive: WideString readonly dispid 1448;
    property maxInclusive: WideString readonly dispid 1449;
    property totalDigits: OleVariant readonly dispid 1475;
    property fractionDigits: OleVariant readonly dispid 1439;
    property length: OleVariant readonly dispid 1447;
    property minLength: OleVariant readonly dispid 1454;
    property maxLength: OleVariant readonly dispid 1450;
    property enumeration: ISchemaStringCollection readonly dispid 1435;
    property whitespace: SCHEMAWHITESPACE readonly dispid 1482;
    property patterns: ISchemaStringCollection readonly dispid 1462;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
  end;

  ISchemaAny = interface(ISchemaParticle)
    ['{50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_namespaces: ISchemaStringCollection; safecall;
    function Get_processContents: SCHEMAPROCESSCONTENTS; safecall;
    property namespaces: ISchemaStringCollection read Get_namespaces;
    property processContents: SCHEMAPROCESSCONTENTS read Get_processContents;
  end;

  ISchemaAnyDisp = dispinterface
    ['{50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}']
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
    property namespaces: ISchemaStringCollection readonly dispid 1458;
    property processContents: SCHEMAPROCESSCONTENTS readonly dispid 1463;
    property minOccurs: OleVariant readonly dispid 1455;
    property maxOccurs: OleVariant readonly dispid 1451;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
  end;

  ISchemaModelGroup = interface(ISchemaParticle)
    ['{50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_particles: ISchemaItemCollection; safecall;
    property particles: ISchemaItemCollection read Get_particles;
  end;

  ISchemaModelGroupDisp = dispinterface
    ['{50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}']
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
    property particles: ISchemaItemCollection readonly dispid 1461;
    property minOccurs: OleVariant readonly dispid 1455;
    property maxOccurs: OleVariant readonly dispid 1451;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
  end;

  IMXXMLFilter = interface(IDispatch)
    ['{C90352F7-643C-4FBC-BB23-E996EB2D51FD}']
    function getFeature(const strName: WideString): WordBool; safecall;
    procedure putFeature(const strName: WideString; fValue: WordBool); safecall;
    function getProperty(const strName: WideString): OleVariant; safecall;
    procedure putProperty(const strName: WideString; varValue: OleVariant); safecall;
    function Get_entityResolver: IUnknown; safecall;
    procedure Set_entityResolver(const oResolver: IUnknown); safecall;
    function Get_contentHandler: IUnknown; safecall;
    procedure Set_contentHandler(const oHandler: IUnknown); safecall;
    function Get_dtdHandler: IUnknown; safecall;
    procedure Set_dtdHandler(const oHandler: IUnknown); safecall;
    function Get_errorHandler: IUnknown; safecall;
    procedure Set_errorHandler(const oHandler: IUnknown); safecall;
    property entityResolver: IUnknown read Get_entityResolver write Set_entityResolver;
    property contentHandler: IUnknown read Get_contentHandler write Set_contentHandler;
    property dtdHandler: IUnknown read Get_dtdHandler write Set_dtdHandler;
    property errorHandler: IUnknown read Get_errorHandler write Set_errorHandler;
  end;

  IMXXMLFilterDisp = dispinterface
    ['{C90352F7-643C-4FBC-BB23-E996EB2D51FD}']
    function getFeature(const strName: WideString): WordBool; dispid 1423;
    function getProperty(const strName: WideString): OleVariant; dispid 1424;
    procedure putFeature(const strName: WideString; fValue: WordBool); dispid 1425;
    procedure putProperty(const strName: WideString; varValue: OleVariant); dispid 1426;
    property contentHandler: IUnknown dispid 1419;
    property dtdHandler: IUnknown dispid 1420;
    property entityResolver: IUnknown dispid 1421;
    property errorHandler: IUnknown dispid 1422;
  end;

  ISchemaAttribute = interface(ISchemaItem)
    ['{50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_type_: ISchemaType; safecall;
    function Get_scope: ISchemaComplexType; safecall;
    function Get_defaultValue: WideString; safecall;
    function Get_fixedValue: WideString; safecall;
    function Get_use: SCHEMAUSE; safecall;
    function Get_isReference: WordBool; safecall;
    property type_: ISchemaType read Get_type_;
    property scope: ISchemaComplexType read Get_scope;
    property defaultValue: WideString read Get_defaultValue;
    property fixedValue: WideString read Get_fixedValue;
    property use: SCHEMAUSE read Get_use;
    property isReference: WordBool read Get_isReference;
  end;

  ISchemaAttributeDisp = dispinterface
    ['{50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}']
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
    property defaultValue: WideString readonly dispid 1431;
    property fixedValue: WideString readonly dispid 1438;
    property isReference: WordBool readonly dispid 1444;
    property scope: ISchemaComplexType readonly dispid 1469;
    property type_: ISchemaType readonly dispid 1476;
    property use: SCHEMAUSE readonly dispid 1479;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
  end;

  ISchemaAttributeGroup = interface(ISchemaItem)
    ['{50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_anyAttribute: ISchemaAny; safecall;
    function Get_attributes: ISchemaItemCollection; safecall;
    property anyAttribute: ISchemaAny read Get_anyAttribute;
    property attributes: ISchemaItemCollection read Get_attributes;
  end;

  ISchemaAttributeGroupDisp = dispinterface
    ['{50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}']
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
    property anyAttribute: ISchemaAny readonly dispid 1425;
    property attributes: ISchemaItemCollection readonly dispid 1427;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
  end;

  ISchemaIdentityConstraint = interface(ISchemaItem)
    ['{50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_selector: WideString; safecall;
    function Get_fields: ISchemaStringCollection; safecall;
    function Get_referencedKey: ISchemaIdentityConstraint; safecall;
    property selector: WideString read Get_selector;
    property fields: ISchemaStringCollection read Get_fields;
    property referencedKey: ISchemaIdentityConstraint read Get_referencedKey;
  end;

  ISchemaIdentityConstraintDisp = dispinterface
    ['{50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}']
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
    property fields: ISchemaStringCollection readonly dispid 1436;
    property referencedKey: ISchemaIdentityConstraint readonly dispid 1466;
    property selector: WideString readonly dispid 1470;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
  end;

  ISchemaNotation = interface(ISchemaItem)
    ['{50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_systemIdentifier: WideString; safecall;
    function Get_publicIdentifier: WideString; safecall;
    property systemIdentifier: WideString read Get_systemIdentifier;
    property publicIdentifier: WideString read Get_publicIdentifier;
  end;

  ISchemaNotationDisp = dispinterface
    ['{50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}']
    function writeAnnotation(const annotationSink: IUnknown): WordBool; dispid 1483;
    property publicIdentifier: WideString readonly dispid 1465;
    property systemIdentifier: WideString readonly dispid 1473;
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
  end;

  IXMLDOMSelection = interface(IXMLDOMNodeList)
    ['{AA634FC7-5888-44A7-A257-3A47150D3A0E}']
    function Get_expr: WideString; safecall;
    procedure Set_expr(const expression: WideString); safecall;
    function Get_context: IXMLDOMNode; safecall;
    procedure Set_context(const ppNode: IXMLDOMNode); safecall;
    function peekNode: IXMLDOMNode; safecall;
    function matches(const pNode: IXMLDOMNode): IXMLDOMNode; safecall;
    function removeNext: IXMLDOMNode; safecall;
    procedure removeAll; safecall;
    function clone: IXMLDOMSelection; safecall;
    function getProperty(const name: WideString): OleVariant; safecall;
    procedure setProperty(const name: WideString; value: OleVariant); safecall;
    property expr: WideString read Get_expr write Set_expr;
    property context: IXMLDOMNode read Get_context write Set_context;
  end;

  IXMLDOMSelectionDisp = dispinterface
    ['{AA634FC7-5888-44A7-A257-3A47150D3A0E}']
    function peekNode: IXMLDOMNode; dispid 83;
    function matches(const pNode: IXMLDOMNode): IXMLDOMNode; dispid 84;
    function removeNext: IXMLDOMNode; dispid 85;
    procedure removeAll; dispid 86;
    function clone: IXMLDOMSelection; dispid 87;
    function getProperty(const name: WideString): OleVariant; dispid 88;
    procedure setProperty(const name: WideString; value: OleVariant); dispid 89;
    function nextNode: IXMLDOMNode; dispid 76;
    procedure reset; dispid 77;
    property expr: WideString dispid 81;
    property context: IXMLDOMNode dispid 82;
    property item[index: Integer]: IXMLDOMNode readonly dispid 0;
    property length: Integer readonly dispid 74;
    property _newEnum: IUnknown readonly dispid -4;
  end;

  XMLDOMDocumentEvents = dispinterface
    ['{3EFAA427-272F-11D2-836F-0000F87A7782}']
    procedure onreadystatechange; dispid -609;
    procedure ondataavailable; dispid 198;
  end;

  IXMLDOMDocument2 = interface(IXMLDOMDocument)
    ['{2933BF95-7B36-11D2-B20E-00C04F983E60}']
    function Get_namespaces: IXMLDOMSchemaCollection; safecall;
    function Get_schemas: OleVariant; safecall;
    procedure Set_schemas(otherCollection: OleVariant); safecall;
    function validate: IXMLDOMParseError; safecall;
    procedure setProperty(const name: WideString; value: OleVariant); safecall;
    function getProperty(const name: WideString): OleVariant; safecall;
    property namespaces: IXMLDOMSchemaCollection read Get_namespaces;
    property schemas: OleVariant read Get_schemas write Set_schemas;
  end;

  IXMLDOMDocument2Disp = dispinterface
    ['{2933BF95-7B36-11D2-B20E-00C04F983E60}']
    function validate: IXMLDOMParseError; dispid 203;
    procedure setProperty(const name: WideString; value: OleVariant); dispid 204;
    function getProperty(const name: WideString): OleVariant; dispid 205;
    function createElement(const tagName: WideString): IXMLDOMElement; dispid 41;
    function createDocumentFragment: IXMLDOMDocumentFragment; dispid 42;
    function createTextNode(const data: WideString): IXMLDOMText; dispid 43;
    function createComment(const data: WideString): IXMLDOMComment; dispid 44;
    function createCDATASection(const data: WideString): IXMLDOMCDATASection; dispid 45;
    function createProcessingInstruction(const target: WideString; const data: WideString): IXMLDOMProcessingInstruction; dispid 46;
    function createAttribute(const name: WideString): IXMLDOMAttribute; dispid 47;
    function createEntityReference(const name: WideString): IXMLDOMEntityReference; dispid 49;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; dispid 50;
    function createNode(type_: OleVariant; const name: WideString; const namespaceURI: WideString): IXMLDOMNode; dispid 54;
    function nodeFromID(const idString: WideString): IXMLDOMNode; dispid 56;
    function load(xmlSource: OleVariant): WordBool; dispid 58;
    procedure abort; dispid 62;
    function loadXML(const bstrXML: WideString): WordBool; dispid 63;
    procedure save(destination: OleVariant); dispid 64;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property namespaces: IXMLDOMSchemaCollection readonly dispid 201;
    property schemas: OleVariant dispid 202;
    property doctype: IXMLDOMDocumentType readonly dispid 38;
    property implementation_: IXMLDOMImplementation readonly dispid 39;
    property documentElement: IXMLDOMElement dispid 40;
    property readyState: Integer readonly dispid -525;
    property parseError: IXMLDOMParseError readonly dispid 59;
    property url: WideString readonly dispid 60;
    property async: WordBool dispid 61;
    property validateOnParse: WordBool dispid 65;
    property resolveExternals: WordBool dispid 66;
    property preserveWhiteSpace: WordBool dispid 67;
    property onreadystatechange: OleVariant writeonly dispid 68;
    property ondataavailable: OleVariant writeonly dispid 69;
    property ontransformnode: OleVariant writeonly dispid 70;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMDocument3 = interface(IXMLDOMDocument2)
    ['{2933BF96-7B36-11D2-B20E-00C04F983E60}']
    function validateNode(const node: IXMLDOMNode): IXMLDOMParseError; safecall;
    function importNode(const node: IXMLDOMNode; deep: WordBool): IXMLDOMNode; safecall;
  end;

  IXMLDOMDocument3Disp = dispinterface
    ['{2933BF96-7B36-11D2-B20E-00C04F983E60}']
    function validateNode(const node: IXMLDOMNode): IXMLDOMParseError; dispid 208;
    function importNode(const node: IXMLDOMNode; deep: WordBool): IXMLDOMNode; dispid 209;
    function validate: IXMLDOMParseError; dispid 203;
    procedure setProperty(const name: WideString; value: OleVariant); dispid 204;
    function getProperty(const name: WideString): OleVariant; dispid 205;
    function createElement(const tagName: WideString): IXMLDOMElement; dispid 41;
    function createDocumentFragment: IXMLDOMDocumentFragment; dispid 42;
    function createTextNode(const data: WideString): IXMLDOMText; dispid 43;
    function createComment(const data: WideString): IXMLDOMComment; dispid 44;
    function createCDATASection(const data: WideString): IXMLDOMCDATASection; dispid 45;
    function createProcessingInstruction(const target: WideString; const data: WideString): IXMLDOMProcessingInstruction; dispid 46;
    function createAttribute(const name: WideString): IXMLDOMAttribute; dispid 47;
    function createEntityReference(const name: WideString): IXMLDOMEntityReference; dispid 49;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; dispid 50;
    function createNode(type_: OleVariant; const name: WideString; const namespaceURI: WideString): IXMLDOMNode; dispid 54;
    function nodeFromID(const idString: WideString): IXMLDOMNode; dispid 56;
    function load(xmlSource: OleVariant): WordBool; dispid 58;
    procedure abort; dispid 62;
    function loadXML(const bstrXML: WideString): WordBool; dispid 63;
    procedure save(destination: OleVariant); dispid 64;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild: IXMLDOMNode; const oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
    property namespaces: IXMLDOMSchemaCollection readonly dispid 201;
    property schemas: OleVariant dispid 202;
    property doctype: IXMLDOMDocumentType readonly dispid 38;
    property implementation_: IXMLDOMImplementation readonly dispid 39;
    property documentElement: IXMLDOMElement dispid 40;
    property readyState: Integer readonly dispid -525;
    property parseError: IXMLDOMParseError readonly dispid 59;
    property url: WideString readonly dispid 60;
    property async: WordBool dispid 61;
    property validateOnParse: WordBool dispid 65;
    property resolveExternals: WordBool dispid 66;
    property preserveWhiteSpace: WordBool dispid 67;
    property onreadystatechange: OleVariant writeonly dispid 68;
    property ondataavailable: OleVariant writeonly dispid 69;
    property ontransformnode: OleVariant writeonly dispid 70;
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
  end;

  IXMLDOMSchemaCollection = interface(IDispatch)
    ['{373984C8-B845-449B-91E7-45AC83036ADE}']
    procedure add(const namespaceURI: WideString; var_: OleVariant); safecall;
    function get(const namespaceURI: WideString): IXMLDOMNode; safecall;
    procedure remove(const namespaceURI: WideString); safecall;
    function Get_length: Integer; safecall;
    function Get_namespaceURI(index: Integer): WideString; safecall;
    procedure addCollection(const otherCollection: IXMLDOMSchemaCollection); safecall;
    function Get__newEnum: IUnknown; safecall;
    property length: Integer read Get_length;
    property namespaceURI[index: Integer]: WideString read Get_namespaceURI; default;
    property _newEnum: IUnknown read Get__newEnum;
  end;

  IXMLDOMSchemaCollectionDisp = dispinterface
    ['{373984C8-B845-449B-91E7-45AC83036ADE}']
    procedure add(const namespaceURI: WideString; var_: OleVariant); dispid 3;
    function get(const namespaceURI: WideString): IXMLDOMNode; dispid 4;
    procedure remove(const namespaceURI: WideString); dispid 5;
    procedure addCollection(const otherCollection: IXMLDOMSchemaCollection); dispid 8;
    property _newEnum: IUnknown readonly dispid -4;
    property namespaceURI[index: Integer]: WideString readonly dispid 0;
    property length: Integer readonly dispid 6;
  end;

  IXMLDOMSchemaCollection2 = interface(IXMLDOMSchemaCollection)
    ['{50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}']
    procedure validate; safecall;
    procedure Set_validateOnLoad(validateOnLoad: WordBool); safecall;
    function Get_validateOnLoad: WordBool; safecall;
    function getSchema(const namespaceURI: WideString): ISchema; safecall;
    function getDeclaration(const node: IXMLDOMNode): ISchemaItem; safecall;
    property validateOnLoad: WordBool read Get_validateOnLoad write Set_validateOnLoad;
  end;

  IXMLDOMSchemaCollection2Disp = dispinterface
    ['{50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}']
    procedure validate; dispid 1419;
    function getSchema(const namespaceURI: WideString): ISchema; dispid 1421;
    function getDeclaration(const node: IXMLDOMNode): ISchemaItem; dispid 1422;
    procedure add(const namespaceURI: WideString; var_: OleVariant); dispid 3;
    function get(const namespaceURI: WideString): IXMLDOMNode; dispid 4;
    procedure remove(const namespaceURI: WideString); dispid 5;
    procedure addCollection(const otherCollection: IXMLDOMSchemaCollection); dispid 8;
    property validateOnLoad: WordBool dispid 1420;
    property length: Integer readonly dispid 6;
    property namespaceURI[index: Integer]: WideString readonly dispid 0;
    property _newEnum: IUnknown readonly dispid -4;
  end;

  IXSLTemplate = interface(IDispatch)
    ['{2933BF93-7B36-11D2-B20E-00C04F983E60}']
    procedure Set_stylesheet(const stylesheet: IXMLDOMNode); safecall;
    function Get_stylesheet: IXMLDOMNode; safecall;
    function createProcessor: IXSLProcessor; safecall;
    property stylesheet: IXMLDOMNode read Get_stylesheet write Set_stylesheet;
  end;

  IXSLTemplateDisp = dispinterface
    ['{2933BF93-7B36-11D2-B20E-00C04F983E60}']
    function createProcessor: IXSLProcessor; dispid 3;
    property stylesheet: IXMLDOMNode dispid 2;
  end;

  IXSLProcessor = interface(IDispatch)
    ['{2933BF92-7B36-11D2-B20E-00C04F983E60}']
    procedure Set_input(pVar: OleVariant); safecall;
    function Get_input: OleVariant; safecall;
    function Get_ownerTemplate: IXSLTemplate; safecall;
    procedure setStartMode(const mode: WideString; const namespaceURI: WideString); safecall;
    function Get_startMode: WideString; safecall;
    function Get_startModeURI: WideString; safecall;
    procedure Set_output(pOutput: OleVariant); safecall;
    function Get_output: OleVariant; safecall;
    function transform: WordBool; safecall;
    procedure reset; safecall;
    function Get_readyState: Integer; safecall;
    procedure addParameter(const baseName: WideString; parameter: OleVariant; const namespaceURI: WideString); safecall;
    procedure addObject(const obj: IDispatch; const namespaceURI: WideString); safecall;
    function Get_stylesheet: IXMLDOMNode; safecall;
    property input: OleVariant read Get_input write Set_input;
    property ownerTemplate: IXSLTemplate read Get_ownerTemplate;
    property startMode: WideString read Get_startMode;
    property startModeURI: WideString read Get_startModeURI;
    property output: OleVariant read Get_output write Set_output;
    property readyState: Integer read Get_readyState;
    property stylesheet: IXMLDOMNode read Get_stylesheet;
  end;

  IXSLProcessorDisp = dispinterface
    ['{2933BF92-7B36-11D2-B20E-00C04F983E60}']
    procedure setStartMode(const mode: WideString; const namespaceURI: WideString); dispid 4;
    function transform: WordBool; dispid 8;
    procedure reset; dispid 9;
    procedure addParameter(const baseName: WideString; parameter: OleVariant; const namespaceURI: WideString); dispid 11;
    procedure addObject(const obj: IDispatch; const namespaceURI: WideString); dispid 12;
    property input: OleVariant dispid 2;
    property ownerTemplate: IXSLTemplate readonly dispid 3;
    property startMode: WideString readonly dispid 5;
    property startModeURI: WideString readonly dispid 6;
    property output: OleVariant dispid 7;
    property readyState: Integer readonly dispid 10;
    property stylesheet: IXMLDOMNode readonly dispid 13;
  end;

  IXMLHTTPRequest = interface(IDispatch)
    ['{ED8C108D-4349-11D2-91A4-00C04F7969E8}']
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; bstrUser: OleVariant; bstrPassword: OleVariant); safecall;
    procedure setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString); safecall;
    function getResponseHeader(const bstrHeader: WideString): WideString; safecall;
    function getAllResponseHeaders: WideString; safecall;
    procedure send(varBody: OleVariant); safecall;
    procedure abort; safecall;
    function Get_status: Integer; safecall;
    function Get_statusText: WideString; safecall;
    function Get_responseXML: IDispatch; safecall;
    function Get_responseText: WideString; safecall;
    function Get_responseBody: OleVariant; safecall;
    function Get_responseStream: OleVariant; safecall;
    function Get_readyState: Integer; safecall;
    procedure Set_onreadystatechange(const Param1: IDispatch); safecall;
    property status: Integer read Get_status;
    property statusText: WideString read Get_statusText;
    property responseXML: IDispatch read Get_responseXML;
    property responseText: WideString read Get_responseText;
    property responseBody: OleVariant read Get_responseBody;
    property responseStream: OleVariant read Get_responseStream;
    property readyState: Integer read Get_readyState;
    property onreadystatechange: IDispatch write Set_onreadystatechange;
  end;

  IXMLHTTPRequestDisp = dispinterface
    ['{ED8C108D-4349-11D2-91A4-00C04F7969E8}']
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; bstrUser: OleVariant; bstrPassword: OleVariant); dispid 1;
    procedure setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString); dispid 2;
    function getResponseHeader(const bstrHeader: WideString): WideString; dispid 3;
    function getAllResponseHeaders: WideString; dispid 4;
    procedure send(varBody: OleVariant); dispid 5;
    procedure abort; dispid 6;
    property status: Integer readonly dispid 7;
    property statusText: WideString readonly dispid 8;
    property responseXML: IDispatch readonly dispid 9;
    property responseText: WideString readonly dispid 10;
    property responseBody: OleVariant readonly dispid 11;
    property responseStream: OleVariant readonly dispid 12;
    property readyState: Integer readonly dispid 13;
    property onreadystatechange: IDispatch writeonly dispid 14;
  end;

  IXMLHTTPRequest2 = interface(IUnknown)
    ['{E5D37DC0-552A-4D52-9CC0-A14D546FBD04}']
    function open(pwszMethod: PWideChar; pwszUrl: PWideChar; const pStatusCallback: IXMLHTTPRequest2Callback; pwszUserName: PWideChar; pwszPassword: PWideChar;
      pwszProxyUserName: PWideChar; pwszProxyPassword: PWideChar): HRESULT; stdcall;
    function send(const pBody: ISequentialStream; cbBody: UInt64): HRESULT; stdcall;
    function abort: HRESULT; stdcall;
    function SetCookie(var pCookie: tagXHR_COOKIE; out pdwCookieState: Cardinal): HRESULT; stdcall;
    function SetCustomResponseStream(const pSequentialStream: ISequentialStream): HRESULT; stdcall;
    function setProperty(eProperty: XHR_PROPERTY; ullValue: UInt64): HRESULT; stdcall;
    function setRequestHeader(pwszHeader: PWideChar; pwszValue: PWideChar): HRESULT; stdcall;
    function getAllResponseHeaders(out ppwszHeaders: PWideChar): HRESULT; stdcall;
    function GetCookie(pwszUrl: PWideChar; pwszName: PWideChar; dwFlags: Cardinal; out pcCookies: Cardinal; out ppCookies: PtagXHR_COOKIE): HRESULT; stdcall;
    function getResponseHeader(pwszHeader: PWideChar; out ppwszValue: PWideChar): HRESULT; stdcall;
  end;

  IXMLHTTPRequest2Callback = interface(IUnknown)
    ['{A44A9299-E321-40DE-8866-341B41669162}']
    function OnRedirect(const pXHR: IXMLHTTPRequest2; pwszRedirectUrl: PWideChar): HRESULT; stdcall;
    function OnHeadersAvailable(const pXHR: IXMLHTTPRequest2; dwStatus: Cardinal; pwszStatus: PWideChar): HRESULT; stdcall;
    function ondataavailable(const pXHR: IXMLHTTPRequest2; const pResponseStream: ISequentialStream): HRESULT; stdcall;
    function OnResponseReceived(const pXHR: IXMLHTTPRequest2; const pResponseStream: ISequentialStream): HRESULT; stdcall;
    function OnError(const pXHR: IXMLHTTPRequest2; hrError: HRESULT): HRESULT; stdcall;
  end;

  ISequentialStream = interface(IUnknown)
    ['{0C733A30-2A1C-11CE-ADE5-00AA0044773D}']
    function RemoteRead(out pv: Byte; cb: Cardinal; out pcbRead: Cardinal): HRESULT; stdcall;
    function RemoteWrite(var pv: Byte; cb: Cardinal; out pcbWritten: Cardinal): HRESULT; stdcall;
  end;

  IServerXMLHTTPRequest = interface(IXMLHTTPRequest)
    ['{2E9196BF-13BA-4DD4-91CA-6C571F281495}']
    procedure setTimeouts(resolveTimeout: Integer; connectTimeout: Integer; sendTimeout: Integer; receiveTimeout: Integer); safecall;
    function waitForResponse(timeoutInSeconds: OleVariant): WordBool; safecall;
    function getOption(option: SERVERXMLHTTP_OPTION): OleVariant; safecall;
    procedure setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant); safecall;
  end;

  IServerXMLHTTPRequestDisp = dispinterface
    ['{2E9196BF-13BA-4DD4-91CA-6C571F281495}']
    procedure setTimeouts(resolveTimeout: Integer; connectTimeout: Integer; sendTimeout: Integer; receiveTimeout: Integer); dispid 15;
    function waitForResponse(timeoutInSeconds: OleVariant): WordBool; dispid 16;
    function getOption(option: SERVERXMLHTTP_OPTION): OleVariant; dispid 17;
    procedure setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant); dispid 18;
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; bstrUser: OleVariant; bstrPassword: OleVariant); dispid 1;
    procedure setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString); dispid 2;
    function getResponseHeader(const bstrHeader: WideString): WideString; dispid 3;
    function getAllResponseHeaders: WideString; dispid 4;
    procedure send(varBody: OleVariant); dispid 5;
    procedure abort; dispid 6;
    property status: Integer readonly dispid 7;
    property statusText: WideString readonly dispid 8;
    property responseXML: IDispatch readonly dispid 9;
    property responseText: WideString readonly dispid 10;
    property responseBody: OleVariant readonly dispid 11;
    property responseStream: OleVariant readonly dispid 12;
    property readyState: Integer readonly dispid 13;
    property onreadystatechange: IDispatch writeonly dispid 14;
  end;

  IServerXMLHTTPRequest2 = interface(IServerXMLHTTPRequest)
    ['{2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}']
    procedure setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer: OleVariant; varBypassList: OleVariant); safecall;
    procedure setProxyCredentials(const bstrUserName: WideString; const bstrPassword: WideString); safecall;
  end;

  IServerXMLHTTPRequest2Disp = dispinterface
    ['{2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}']
    procedure setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer: OleVariant; varBypassList: OleVariant); dispid 19;
    procedure setProxyCredentials(const bstrUserName: WideString; const bstrPassword: WideString); dispid 20;
    procedure setTimeouts(resolveTimeout: Integer; connectTimeout: Integer; sendTimeout: Integer; receiveTimeout: Integer); dispid 15;
    function waitForResponse(timeoutInSeconds: OleVariant): WordBool; dispid 16;
    function getOption(option: SERVERXMLHTTP_OPTION): OleVariant; dispid 17;
    procedure setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant); dispid 18;
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; bstrUser: OleVariant; bstrPassword: OleVariant); dispid 1;
    procedure setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString); dispid 2;
    function getResponseHeader(const bstrHeader: WideString): WideString; dispid 3;
    function getAllResponseHeaders: WideString; dispid 4;
    procedure send(varBody: OleVariant); dispid 5;
    procedure abort; dispid 6;
    property status: Integer readonly dispid 7;
    property statusText: WideString readonly dispid 8;
    property responseXML: IDispatch readonly dispid 9;
    property responseText: WideString readonly dispid 10;
    property responseBody: OleVariant readonly dispid 11;
    property responseStream: OleVariant readonly dispid 12;
    property readyState: Integer readonly dispid 13;
    property onreadystatechange: IDispatch writeonly dispid 14;
  end;

  IMXWriter = interface(IDispatch)
    ['{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}']
    procedure Set_output(varDestination: OleVariant); safecall;
    function Get_output: OleVariant; safecall;
    procedure Set_encoding(const strEncoding: WideString); safecall;
    function Get_encoding: WideString; safecall;
    procedure Set_byteOrderMark(fWriteByteOrderMark: WordBool); safecall;
    function Get_byteOrderMark: WordBool; safecall;
    procedure Set_indent(fIndentMode: WordBool); safecall;
    function Get_indent: WordBool; safecall;
    procedure Set_standalone(fValue: WordBool); safecall;
    function Get_standalone: WordBool; safecall;
    procedure Set_omitXMLDeclaration(fValue: WordBool); safecall;
    function Get_omitXMLDeclaration: WordBool; safecall;
    procedure Set_version(const strVersion: WideString); safecall;
    function Get_version: WideString; safecall;
    procedure Set_disableOutputEscaping(fValue: WordBool); safecall;
    function Get_disableOutputEscaping: WordBool; safecall;
    procedure flush; safecall;
    property output: OleVariant read Get_output write Set_output;
    property encoding: WideString read Get_encoding write Set_encoding;
    property byteOrderMark: WordBool read Get_byteOrderMark write Set_byteOrderMark;
    property indent: WordBool read Get_indent write Set_indent;
    property standalone: WordBool read Get_standalone write Set_standalone;
    property omitXMLDeclaration: WordBool read Get_omitXMLDeclaration write Set_omitXMLDeclaration;
    property version: WideString read Get_version write Set_version;
    property disableOutputEscaping: WordBool read Get_disableOutputEscaping write Set_disableOutputEscaping;
  end;

  IMXWriterDisp = dispinterface
    ['{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}']
    procedure flush; dispid 1394;
    property output: OleVariant dispid 1385;
    property encoding: WideString dispid 1387;
    property byteOrderMark: WordBool dispid 1388;
    property indent: WordBool dispid 1389;
    property standalone: WordBool dispid 1390;
    property omitXMLDeclaration: WordBool dispid 1391;
    property version: WideString dispid 1392;
    property disableOutputEscaping: WordBool dispid 1393;
  end;

  ISAXDeclHandler = interface(IUnknown)
    ['{862629AC-771A-47B2-8337-4E6843C1BE90}']
    function elementDecl(var pwchName: Word; cchName: SYSINT; var pwchModel: Word; cchModel: SYSINT): HRESULT; stdcall;
    function attributeDecl(var pwchElementName: Word; cchElementName: SYSINT; var pwchAttributeName: Word; cchAttributeName: SYSINT; var pwchType: Word; cchType: SYSINT;
      var pwchValueDefault: Word; cchValueDefault: SYSINT; var pwchValue: Word; cchValue: SYSINT): HRESULT; stdcall;
    function internalEntityDecl(var pwchName: Word; cchName: SYSINT; var pwchValue: Word; cchValue: SYSINT): HRESULT; stdcall;
    function externalEntityDecl(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT): HRESULT; stdcall;
  end;

  ISAXLexicalHandler = interface(IUnknown)
    ['{7F85D5F5-47A8-4497-BDA5-84BA04819EA6}']
    function startDTD(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT): HRESULT; stdcall;
    function endDTD: HRESULT; stdcall;
    function startEntity(var pwchName: Word; cchName: SYSINT): HRESULT; stdcall;
    function endEntity(var pwchName: Word; cchName: SYSINT): HRESULT; stdcall;
    function startCDATA: HRESULT; stdcall;
    function endCDATA: HRESULT; stdcall;
    function comment(var pwchChars: Word; cchChars: SYSINT): HRESULT; stdcall;
  end;

  IVBSAXDeclHandler = interface(IDispatch)
    ['{E8917260-7579-4BE1-B5DD-7AFBFA6F077B}']
    procedure elementDecl(var strName: WideString; var strModel: WideString); safecall;
    procedure attributeDecl(var strElementName: WideString; var strAttributeName: WideString; var strType: WideString; var strValueDefault: WideString; var strValue: WideString); safecall;
    procedure internalEntityDecl(var strName: WideString; var strValue: WideString); safecall;
    procedure externalEntityDecl(var strName: WideString; var strPublicId: WideString; var strSystemId: WideString); safecall;
  end;

  IVBSAXDeclHandlerDisp = dispinterface
    ['{E8917260-7579-4BE1-B5DD-7AFBFA6F077B}']
    procedure elementDecl(var strName: WideString; var strModel: WideString); dispid 1367;
    procedure attributeDecl(var strElementName: WideString; var strAttributeName: WideString; var strType: WideString; var strValueDefault: WideString; var strValue: WideString); dispid 1368;
    procedure internalEntityDecl(var strName: WideString; var strValue: WideString); dispid 1369;
    procedure externalEntityDecl(var strName: WideString; var strPublicId: WideString; var strSystemId: WideString); dispid 1370;
  end;

  IVBSAXLexicalHandler = interface(IDispatch)
    ['{032AAC35-8C0E-4D9D-979F-E3B702935576}']
    procedure startDTD(var strName: WideString; var strPublicId: WideString; var strSystemId: WideString); safecall;
    procedure endDTD; safecall;
    procedure startEntity(var strName: WideString); safecall;
    procedure endEntity(var strName: WideString); safecall;
    procedure startCDATA; safecall;
    procedure endCDATA; safecall;
    procedure comment(var strChars: WideString); safecall;
  end;

  IVBSAXLexicalHandlerDisp = dispinterface
    ['{032AAC35-8C0E-4D9D-979F-E3B702935576}']
    procedure startDTD(var strName: WideString; var strPublicId: WideString; var strSystemId: WideString); dispid 1358;
    procedure endDTD; dispid 1359;
    procedure startEntity(var strName: WideString); dispid 1360;
    procedure endEntity(var strName: WideString); dispid 1361;
    procedure startCDATA; dispid 1362;
    procedure endCDATA; dispid 1363;
    procedure comment(var strChars: WideString); dispid 1364;
  end;

  IMXAttributes = interface(IDispatch)
    ['{F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}']
    procedure addAttribute(const strURI: WideString; const strLocalName: WideString; const strQName: WideString; const strType: WideString; const strValue: WideString); safecall;
    procedure addAttributeFromIndex(varAtts: OleVariant; nIndex: SYSINT); safecall;
    procedure clear; safecall;
    procedure removeAttribute(nIndex: SYSINT); safecall;
    procedure setAttribute(nIndex: SYSINT; const strURI: WideString; const strLocalName: WideString; const strQName: WideString; const strType: WideString;
      const strValue: WideString); safecall;
    procedure setAttributes(varAtts: OleVariant); safecall;
    procedure setLocalName(nIndex: SYSINT; const strLocalName: WideString); safecall;
    procedure setQName(nIndex: SYSINT; const strQName: WideString); safecall;
    procedure setType(nIndex: SYSINT; const strType: WideString); safecall;
    procedure setURI(nIndex: SYSINT; const strURI: WideString); safecall;
    procedure setValue(nIndex: SYSINT; const strValue: WideString); safecall;
  end;

  IMXAttributesDisp = dispinterface
    ['{F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}']
    procedure addAttribute(const strURI: WideString; const strLocalName: WideString; const strQName: WideString; const strType: WideString; const strValue: WideString); dispid 1373;
    procedure clear; dispid 1374;
    procedure removeAttribute(nIndex: SYSINT); dispid 1375;
    procedure setAttribute(nIndex: SYSINT; const strURI: WideString; const strLocalName: WideString; const strQName: WideString; const strType: WideString;
      const strValue: WideString); dispid 1376;
    procedure setAttributes(varAtts: OleVariant); dispid 1377;
    procedure setLocalName(nIndex: SYSINT; const strLocalName: WideString); dispid 1378;
    procedure setQName(nIndex: SYSINT; const strQName: WideString); dispid 1379;
    procedure setType(nIndex: SYSINT; const strType: WideString); dispid 1380;
    procedure setURI(nIndex: SYSINT; const strURI: WideString); dispid 1381;
    procedure setValue(nIndex: SYSINT; const strValue: WideString); dispid 1382;
    procedure addAttributeFromIndex(varAtts: OleVariant; nIndex: SYSINT); dispid 1383;
  end;

  IVBMXNamespaceManager = interface(IDispatch)
    ['{C90352F5-643C-4FBC-BB23-E996EB2D51FD}']
    procedure Set_allowOverride(fOverride: WordBool); safecall;
    function Get_allowOverride: WordBool; safecall;
    procedure reset; safecall;
    procedure pushContext; safecall;
    procedure pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool); safecall;
    procedure popContext; safecall;
    procedure declarePrefix(const prefix: WideString; const namespaceURI: WideString); safecall;
    function getDeclaredPrefixes: IMXNamespacePrefixes; safecall;
    function getPrefixes(const namespaceURI: WideString): IMXNamespacePrefixes; safecall;
    function getURI(const prefix: WideString): OleVariant; safecall;
    function getURIFromNode(const strPrefix: WideString; const contextNode: IXMLDOMNode): OleVariant; safecall;
    property allowOverride: WordBool read Get_allowOverride write Set_allowOverride;
  end;

  IVBMXNamespaceManagerDisp = dispinterface
    ['{C90352F5-643C-4FBC-BB23-E996EB2D51FD}']
    procedure reset; dispid 1407;
    procedure pushContext; dispid 1408;
    procedure pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool); dispid 1409;
    procedure popContext; dispid 1410;
    procedure declarePrefix(const prefix: WideString; const namespaceURI: WideString); dispid 1411;
    function getDeclaredPrefixes: IMXNamespacePrefixes; dispid 1412;
    function getPrefixes(const namespaceURI: WideString): IMXNamespacePrefixes; dispid 1413;
    function getURI(const prefix: WideString): OleVariant; dispid 1414;
    function getURIFromNode(const strPrefix: WideString; const contextNode: IXMLDOMNode): OleVariant; dispid 1415;
    property allowOverride: WordBool dispid 1406;
  end;

  IMXNamespacePrefixes = interface(IDispatch)
    ['{C90352F4-643C-4FBC-BB23-E996EB2D51FD}']
    function Get_item(index: Integer): WideString; safecall;
    function Get_length: Integer; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: WideString read Get_item; default;
    property length: Integer read Get_length;
    property _newEnum: IUnknown read Get__newEnum;
  end;

  IMXNamespacePrefixesDisp = dispinterface
    ['{C90352F4-643C-4FBC-BB23-E996EB2D51FD}']
    property _newEnum: IUnknown readonly dispid -4;
    property item[index: Integer]: WideString readonly dispid 0;
    property length: Integer readonly dispid 1416;
  end;

  IMXNamespaceManager = interface(IUnknown)
    ['{C90352F6-643C-4FBC-BB23-E996EB2D51FD}']
    function putAllowOverride(fOverride: WordBool): HRESULT; stdcall;
    function getAllowOverride(out fOverride: WordBool): HRESULT; stdcall;
    function reset: HRESULT; stdcall;
    function pushContext: HRESULT; stdcall;
    function pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool): HRESULT; stdcall;
    function popContext: HRESULT; stdcall;
    function declarePrefix(prefix: PWideChar; namespaceURI: PWideChar): HRESULT; stdcall;
    function getDeclaredPrefix(nIndex: Integer; var pwchPrefix: Word; var pcchPrefix: SYSINT): HRESULT; stdcall;
    function getPrefix(pwszNamespaceURI: PWideChar; nIndex: Integer; var pwchPrefix: Word; var pcchPrefix: SYSINT): HRESULT; stdcall;
    function getURI(pwchPrefix: PWideChar; const pContextNode: IXMLDOMNode; var pwchUri: Word; var pcchUri: SYSINT): HRESULT; stdcall;
  end;

  // CoClasses
  CoDOMDocument60 = class
    class function Create: IXMLDOMDocument3;
    class function CreateRemote(const AMachineName: string): IXMLDOMDocument3;
  end;

  TDOMDocument60 = class(TOleServer)
  private
    FIntf: IXMLDOMDocument3;
  private
    FOnondataavailable: TNotifyEvent;
    FOnonreadystatechange: TNotifyEvent;
  private
    function GetDefaultInterface: IXMLDOMDocument3;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(ADispID: TDispID; var AParams: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(const ASvrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
  public  // Implements IXMLDOMDocument3
    function validateNode(const node: IXMLDOMNode): IXMLDOMParseError;
    function importNode(const node: IXMLDOMNode; deep: WordBool): IXMLDOMNode;
  public
    property DefaultInterface: IXMLDOMDocument3 read GetDefaultInterface;
  published
    property Onondataavailable: TNotifyEvent read FOnondataavailable write FOnondataavailable;
    property Ononreadystatechange: TNotifyEvent read FOnonreadystatechange write FOnonreadystatechange;
  end;

  CoFreeThreadedDOMDocument60 = class
    class function Create: IXMLDOMDocument3;
    class function CreateRemote(const AMachineName: string): IXMLDOMDocument3;
  end;

  TFreeThreadedDOMDocument60 = class(TOleServer)
  private
    FIntf: IXMLDOMDocument3;
  private
    FOnondataavailable: TNotifyEvent;
    FOnonreadystatechange: TNotifyEvent;
  private
    function GetDefaultInterface: IXMLDOMDocument3;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(ADispID: TDispID; var AParams: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(const ASvrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
  public  // Implements IXMLDOMDocument3
    function validateNode(const node: IXMLDOMNode): IXMLDOMParseError;
    function importNode(const node: IXMLDOMNode; deep: WordBool): IXMLDOMNode;
  public
    property DefaultInterface: IXMLDOMDocument3 read GetDefaultInterface;
  published
    property Onondataavailable: TNotifyEvent read FOnondataavailable write FOnondataavailable;
    property Ononreadystatechange: TNotifyEvent read FOnonreadystatechange write FOnonreadystatechange;
  end;

  CoXMLSchemaCache60 = class
    class function Create: IXMLDOMSchemaCollection2;
    class function CreateRemote(const AMachineName: string): IXMLDOMSchemaCollection2;
  end;

  TXMLSchemaCache60 = class(TOleServer)
  private
    FIntf: IXMLDOMSchemaCollection2;
  private
    function Get_validateOnLoad: WordBool;
    procedure Set_validateOnLoad(validateOnLoad: WordBool);
  private
    function GetDefaultInterface: IXMLDOMSchemaCollection2;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(ADispID: TDispID; var AParams: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(const ASvrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
  public  // Implements IXMLDOMSchemaCollection2
    procedure validate;
    function getSchema(const namespaceURI: WideString): ISchema;
    function getDeclaration(const node: IXMLDOMNode): ISchemaItem;
    property validateOnLoad: WordBool read Get_validateOnLoad write Set_validateOnLoad;
  public
    property DefaultInterface: IXMLDOMSchemaCollection2 read GetDefaultInterface;
  end;

  CoXSLTemplate60 = class
    class function Create: IXSLTemplate;
    class function CreateRemote(const AMachineName: string): IXSLTemplate;
  end;

  TXSLTemplate60 = class(TOleServer)
  private
    FIntf: IXSLTemplate;
  private
    function Get_stylesheet: IXMLDOMNode;
    procedure Set_stylesheet(const stylesheet: IXMLDOMNode);
  private
    function GetDefaultInterface: IXSLTemplate;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(ADispID: TDispID; var AParams: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(const ASvrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
  public  // Implements IXSLTemplate
    function createProcessor: IXSLProcessor;
    property stylesheet: IXMLDOMNode read Get_stylesheet write Set_stylesheet;
  public
    property DefaultInterface: IXSLTemplate read GetDefaultInterface;
  end;

  CoXMLHTTP60 = class
    class function Create: IXMLHTTPRequest;
    class function CreateRemote(const AMachineName: string): IXMLHTTPRequest;
  end;

  TXMLHTTP60 = class(TOleServer)
  private
    FIntf: IXMLHTTPRequest;
  private
    function Get_status: Integer;
    function Get_statusText: WideString;
    function Get_responseXML: IDispatch;
    function Get_responseText: WideString;
    function Get_responseBody: OleVariant;
    function Get_responseStream: OleVariant;
    function Get_readyState: Integer;
    procedure Set_onreadystatechange(const Param1: IDispatch);
  private
    function GetDefaultInterface: IXMLHTTPRequest;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(ADispID: TDispID; var AParams: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(const ASvrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
  public  // Implements IXMLHTTPRequest
    procedure open(const bstrMethod: WideString; const bstrUrl: WideString; varAsync: OleVariant; bstrUser: OleVariant; bstrPassword: OleVariant);
    procedure setRequestHeader(const bstrHeader: WideString; const bstrValue: WideString);
    function getResponseHeader(const bstrHeader: WideString): WideString;
    function getAllResponseHeaders: WideString;
    procedure send(varBody: OleVariant);
    procedure abort;
    property status: Integer read Get_status;
    property statusText: WideString read Get_statusText;
    property responseXML: IDispatch read Get_responseXML;
    property responseText: WideString read Get_responseText;
    property responseBody: OleVariant read Get_responseBody;
    property responseStream: OleVariant read Get_responseStream;
    property readyState: Integer read Get_readyState;
    property onreadystatechange: IDispatch write Set_onreadystatechange;
  public
    property DefaultInterface: IXMLHTTPRequest read GetDefaultInterface;
  end;

  CoFreeThreadedXMLHTTP60 = class
    class function Create: IXMLHTTPRequest2;
    class function CreateRemote(const AMachineName: string): IXMLHTTPRequest2;
  end;

  TFreeThreadedXMLHTTP60 = class(TOleServer)
  private
    FIntf: IXMLHTTPRequest2;
  private
    function GetDefaultInterface: IXMLHTTPRequest2;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(ADispID: TDispID; var AParams: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(const ASvrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
  public  // Implements IXMLHTTPRequest2
    procedure open(pwszMethod: PWideChar; pwszUrl: PWideChar; const pStatusCallback: IXMLHTTPRequest2Callback; pwszUserName: PWideChar; pwszPassword: PWideChar;
      pwszProxyUserName: PWideChar; pwszProxyPassword: PWideChar);
    procedure send(const pBody: ISequentialStream; cbBody: UInt64);
    procedure abort;
    procedure SetCookie(var pCookie: tagXHR_COOKIE; out pdwCookieState: Cardinal);
    procedure SetCustomResponseStream(const pSequentialStream: ISequentialStream);
    procedure setProperty(eProperty: XHR_PROPERTY; ullValue: UInt64);
    procedure setRequestHeader(pwszHeader: PWideChar; pwszValue: PWideChar);
    procedure getAllResponseHeaders(out ppwszHeaders: PWideChar);
    procedure GetCookie(pwszUrl: PWideChar; pwszName: PWideChar; dwFlags: Cardinal; out pcCookies: Cardinal; out ppCookies: PtagXHR_COOKIE);
    procedure getResponseHeader(pwszHeader: PWideChar; out ppwszValue: PWideChar);
  public
    property DefaultInterface: IXMLHTTPRequest2 read GetDefaultInterface;
  end;

  CoServerXMLHTTP60 = class
    class function Create: IServerXMLHTTPRequest2;
    class function CreateRemote(const AMachineName: string): IServerXMLHTTPRequest2;
  end;

  TServerXMLHTTP60 = class(TOleServer)
  private
    FIntf: IServerXMLHTTPRequest2;
  private
    function GetDefaultInterface: IServerXMLHTTPRequest2;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(ADispID: TDispID; var AParams: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(const ASvrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
  public  // Implements IServerXMLHTTPRequest2
    procedure setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer: OleVariant; varBypassList: OleVariant);
    procedure setProxyCredentials(const bstrUserName: WideString; const bstrPassword: WideString);
  public
    property DefaultInterface: IServerXMLHTTPRequest2 read GetDefaultInterface;
  end;

  CoSAXXMLReader60 = class
    class function Create: IVBSAXXMLReader;
    class function CreateRemote(const AMachineName: string): IVBSAXXMLReader;
  end;

  TSAXXMLReader60 = class(TOleServer)
  private
    FIntf: IVBSAXXMLReader;
  private
    function Get_entityResolver: IVBSAXEntityResolver;
    procedure Set_entityResolver(const oResolver: IVBSAXEntityResolver);
    function Get_contentHandler: IVBSAXContentHandler;
    procedure Set_contentHandler(const oHandler: IVBSAXContentHandler);
    function Get_dtdHandler: IVBSAXDTDHandler;
    procedure Set_dtdHandler(const oHandler: IVBSAXDTDHandler);
    function Get_errorHandler: IVBSAXErrorHandler;
    procedure Set_errorHandler(const oHandler: IVBSAXErrorHandler);
    function Get_baseURL: WideString;
    procedure Set_baseURL(const strBaseURL: WideString);
    function Get_secureBaseURL: WideString;
    procedure Set_secureBaseURL(const strSecureBaseURL: WideString);
  private
    function GetDefaultInterface: IVBSAXXMLReader;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(ADispID: TDispID; var AParams: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(const ASvrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
  public  // Implements IVBSAXXMLReader
    function getFeature(const strName: WideString): WordBool;
    procedure putFeature(const strName: WideString; fValue: WordBool);
    function getProperty(const strName: WideString): OleVariant;
    procedure putProperty(const strName: WideString; varValue: OleVariant);
    procedure parse(varInput: OleVariant);
    procedure parseURL(const strURL: WideString);
    property entityResolver: IVBSAXEntityResolver read Get_entityResolver write Set_entityResolver;
    property contentHandler: IVBSAXContentHandler read Get_contentHandler write Set_contentHandler;
    property dtdHandler: IVBSAXDTDHandler read Get_dtdHandler write Set_dtdHandler;
    property errorHandler: IVBSAXErrorHandler read Get_errorHandler write Set_errorHandler;
    property baseURL: WideString read Get_baseURL write Set_baseURL;
    property secureBaseURL: WideString read Get_secureBaseURL write Set_secureBaseURL;
  public
    property DefaultInterface: IVBSAXXMLReader read GetDefaultInterface;
  end;

  CoMXXMLWriter60 = class
    class function Create: IMXWriter;
    class function CreateRemote(const AMachineName: string): IMXWriter;
  end;

  TMXXMLWriter60 = class(TOleServer)
  private
    FIntf: IMXWriter;
  private
    function Get_output: OleVariant;
    procedure Set_output(varDestination: OleVariant);
    function Get_encoding: WideString;
    procedure Set_encoding(const strEncoding: WideString);
    function Get_byteOrderMark: WordBool;
    procedure Set_byteOrderMark(fWriteByteOrderMark: WordBool);
    function Get_indent: WordBool;
    procedure Set_indent(fIndentMode: WordBool);
    function Get_standalone: WordBool;
    procedure Set_standalone(fValue: WordBool);
    function Get_omitXMLDeclaration: WordBool;
    procedure Set_omitXMLDeclaration(fValue: WordBool);
    function Get_version: WideString;
    procedure Set_version(const strVersion: WideString);
    function Get_disableOutputEscaping: WordBool;
    procedure Set_disableOutputEscaping(fValue: WordBool);
  private
    function GetDefaultInterface: IMXWriter;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(ADispID: TDispID; var AParams: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(const ASvrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
  public  // Implements IMXWriter
    procedure flush;
    property output: OleVariant read Get_output write Set_output;
    property encoding: WideString read Get_encoding write Set_encoding;
    property byteOrderMark: WordBool read Get_byteOrderMark write Set_byteOrderMark;
    property indent: WordBool read Get_indent write Set_indent;
    property standalone: WordBool read Get_standalone write Set_standalone;
    property omitXMLDeclaration: WordBool read Get_omitXMLDeclaration write Set_omitXMLDeclaration;
    property version: WideString read Get_version write Set_version;
    property disableOutputEscaping: WordBool read Get_disableOutputEscaping write Set_disableOutputEscaping;
  public
    property DefaultInterface: IMXWriter read GetDefaultInterface;
  end;

  CoMXHTMLWriter60 = class
    class function Create: IMXWriter;
    class function CreateRemote(const AMachineName: string): IMXWriter;
  end;

  TMXHTMLWriter60 = class(TOleServer)
  private
    FIntf: IMXWriter;
  private
    function Get_output: OleVariant;
    procedure Set_output(varDestination: OleVariant);
    function Get_encoding: WideString;
    procedure Set_encoding(const strEncoding: WideString);
    function Get_byteOrderMark: WordBool;
    procedure Set_byteOrderMark(fWriteByteOrderMark: WordBool);
    function Get_indent: WordBool;
    procedure Set_indent(fIndentMode: WordBool);
    function Get_standalone: WordBool;
    procedure Set_standalone(fValue: WordBool);
    function Get_omitXMLDeclaration: WordBool;
    procedure Set_omitXMLDeclaration(fValue: WordBool);
    function Get_version: WideString;
    procedure Set_version(const strVersion: WideString);
    function Get_disableOutputEscaping: WordBool;
    procedure Set_disableOutputEscaping(fValue: WordBool);
  private
    function GetDefaultInterface: IMXWriter;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(ADispID: TDispID; var AParams: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(const ASvrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
  public  // Implements IMXWriter
    procedure flush;
    property output: OleVariant read Get_output write Set_output;
    property encoding: WideString read Get_encoding write Set_encoding;
    property byteOrderMark: WordBool read Get_byteOrderMark write Set_byteOrderMark;
    property indent: WordBool read Get_indent write Set_indent;
    property standalone: WordBool read Get_standalone write Set_standalone;
    property omitXMLDeclaration: WordBool read Get_omitXMLDeclaration write Set_omitXMLDeclaration;
    property version: WideString read Get_version write Set_version;
    property disableOutputEscaping: WordBool read Get_disableOutputEscaping write Set_disableOutputEscaping;
  public
    property DefaultInterface: IMXWriter read GetDefaultInterface;
  end;

  CoSAXAttributes60 = class
    class function Create: IMXAttributes;
    class function CreateRemote(const AMachineName: string): IMXAttributes;
  end;

  TSAXAttributes60 = class(TOleServer)
  private
    FIntf: IMXAttributes;
  private
    function GetDefaultInterface: IMXAttributes;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(ADispID: TDispID; var AParams: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(const ASvrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
  public  // Implements IMXAttributes
    procedure addAttribute(const strURI: WideString; const strLocalName: WideString; const strQName: WideString; const strType: WideString; const strValue: WideString);
    procedure addAttributeFromIndex(varAtts: OleVariant; nIndex: SYSINT);
    procedure clear;
    procedure removeAttribute(nIndex: SYSINT);
    procedure setAttribute(nIndex: SYSINT; const strURI: WideString; const strLocalName: WideString; const strQName: WideString; const strType: WideString;
      const strValue: WideString);
    procedure setAttributes(varAtts: OleVariant);
    procedure setLocalName(nIndex: SYSINT; const strLocalName: WideString);
    procedure setQName(nIndex: SYSINT; const strQName: WideString);
    procedure setType(nIndex: SYSINT; const strType: WideString);
    procedure setURI(nIndex: SYSINT; const strURI: WideString);
    procedure setValue(nIndex: SYSINT; const strValue: WideString);
  public
    property DefaultInterface: IMXAttributes read GetDefaultInterface;
  end;

  CoMXNamespaceManager60 = class
    class function Create: IVBMXNamespaceManager;
    class function CreateRemote(const AMachineName: string): IVBMXNamespaceManager;
  end;

  TMXNamespaceManager60 = class(TOleServer)
  private
    FIntf: IVBMXNamespaceManager;
  private
    function Get_allowOverride: WordBool;
    procedure Set_allowOverride(fOverride: WordBool);
  private
    function GetDefaultInterface: IVBMXNamespaceManager;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(ADispID: TDispID; var AParams: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(const ASvrIntf: IXMLDOMDocument3);
    procedure Disconnect; override;
  public  // Implements IVBMXNamespaceManager
    procedure reset;
    procedure pushContext;
    procedure pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool);
    procedure popContext;
    procedure declarePrefix(const prefix: WideString; const namespaceURI: WideString);
    function getDeclaredPrefixes: IMXNamespacePrefixes;
    function getPrefixes(const namespaceURI: WideString): IMXNamespacePrefixes;
    function getURI(const prefix: WideString): OleVariant;
    function getURIFromNode(const strPrefix: WideString; const contextNode: IXMLDOMNode): OleVariant;
    property allowOverride: WordBool read Get_allowOverride write Set_allowOverride;
  public
    property DefaultInterface: IVBMXNamespaceManager read GetDefaultInterface;
  end;

implementation

uses
  System.Win.ComObj;

{ CoDOMDocument60 }

class function CoDOMDocument60.Create: IXMLDOMDocument3;
begin
  Result := CreateComObject(CLASS_DOMDocument60) as IXMLDOMDocument3;
end;

class function CoDOMDocument60.CreateRemote(const AMachineName: string): IXMLDOMDocument3;
begin
  Result := CreateRemoteComObject(AMachineName, CLASS_DOMDocument60) as IXMLDOMDocument3;
end;

{ TDOMDocument60 }

{ CoFreeThreadedDOMDocument60 }

class function CoFreeThreadedDOMDocument60.Create: IXMLDOMDocument3;
begin
  Result := CreateComObject(CLASS_FreeThreadedDOMDocument60) as IXMLDOMDocument3;
end;

class function CoFreeThreadedDOMDocument60.CreateRemote(const AMachineName: string): IXMLDOMDocument3;
begin
  Result := CreateRemoteComObject(AMachineName, CLASS_FreeThreadedDOMDocument60) as IXMLDOMDocument3;
end;

{ TFreeThreadedDOMDocument60 }

{ CoXMLSchemaCache60 }

class function CoXMLSchemaCache60.Create: IXMLDOMSchemaCollection2;
begin
  Result := CreateComObject(CLASS_XMLSchemaCache60) as IXMLDOMSchemaCollection2;
end;

class function CoXMLSchemaCache60.CreateRemote(const AMachineName: string): IXMLDOMSchemaCollection2;
begin
  Result := CreateRemoteComObject(AMachineName, CLASS_XMLSchemaCache60) as IXMLDOMSchemaCollection2;
end;

{ TXMLSchemaCache60 }

function TXMLSchemaCache60.Get_validateOnLoad: WordBool;
begin
  Result := DefaultInterface.validateOnLoad;
end;

procedure TXMLSchemaCache60.Set_validateOnLoad(validateOnLoad: WordBool);
begin
  DefaultInterface.validateOnLoad := validateOnLoad;
end;

{ CoXSLTemplate60 }

class function CoXSLTemplate60.Create: IXSLTemplate;
begin
  Result := CreateComObject(CLASS_XSLTemplate60) as IXSLTemplate;
end;

class function CoXSLTemplate60.CreateRemote(const AMachineName: string): IXSLTemplate;
begin
  Result := CreateRemoteComObject(AMachineName, CLASS_XSLTemplate60) as IXSLTemplate;
end;

{ TXSLTemplate60 }

function TXSLTemplate60.Get_stylesheet: IXMLDOMNode;
begin
  Result := DefaultInterface.stylesheet;
end;

procedure TXSLTemplate60.Set_stylesheet(const stylesheet: IXMLDOMNode);
begin
  DefaultInterface.stylesheet := stylesheet;
end;

{ CoXMLHTTP60 }

class function CoXMLHTTP60.Create: IXMLHTTPRequest;
begin
  Result := CreateComObject(CLASS_XMLHTTP60) as IXMLHTTPRequest;
end;

class function CoXMLHTTP60.CreateRemote(const AMachineName: string): IXMLHTTPRequest;
begin
  Result := CreateRemoteComObject(AMachineName, CLASS_XMLHTTP60) as IXMLHTTPRequest;
end;

{ TXMLHTTP60 }

function TXMLHTTP60.Get_status: Integer;
begin
  Result := DefaultInterface.status;
end;

function TXMLHTTP60.Get_statusText: WideString;
begin
  Result := DefaultInterface.statusText;
end;

function TXMLHTTP60.Get_responseXML: IDispatch;
begin
  Result := DefaultInterface.responseXML;
end;

function TXMLHTTP60.Get_responseText: WideString;
begin
  Result := DefaultInterface.responseText;
end;

function TXMLHTTP60.Get_responseBody: OleVariant;
begin
  Result := DefaultInterface.responseBody;
end;

function TXMLHTTP60.Get_responseStream: OleVariant;
begin
  Result := DefaultInterface.responseStream;
end;

function TXMLHTTP60.Get_readyState: Integer;
begin
  Result := DefaultInterface.readyState;
end;

procedure TXMLHTTP60.Set_onreadystatechange(const Param1: IDispatch);
begin
  DefaultInterface.onreadystatechange := Param1;
end;

{ CoFreeThreadedXMLHTTP60 }

class function CoFreeThreadedXMLHTTP60.Create: IXMLHTTPRequest2;
begin
  Result := CreateComObject(CLASS_FreeThreadedXMLHTTP60) as IXMLHTTPRequest2;
end;

class function CoFreeThreadedXMLHTTP60.CreateRemote(const AMachineName: string): IXMLHTTPRequest2;
begin
  Result := CreateRemoteComObject(AMachineName, CLASS_FreeThreadedXMLHTTP60) as IXMLHTTPRequest2;
end;

{ TFreeThreadedXMLHTTP60 }

{ CoServerXMLHTTP60 }

class function CoServerXMLHTTP60.Create: IServerXMLHTTPRequest2;
begin
  Result := CreateComObject(CLASS_ServerXMLHTTP60) as IServerXMLHTTPRequest2;
end;

class function CoServerXMLHTTP60.CreateRemote(const AMachineName: string): IServerXMLHTTPRequest2;
begin
  Result := CreateRemoteComObject(AMachineName, CLASS_ServerXMLHTTP60) as IServerXMLHTTPRequest2;
end;

{ TServerXMLHTTP60 }

{ CoSAXXMLReader60 }

class function CoSAXXMLReader60.Create: IVBSAXXMLReader;
begin
  Result := CreateComObject(CLASS_SAXXMLReader60) as IVBSAXXMLReader;
end;

class function CoSAXXMLReader60.CreateRemote(const AMachineName: string): IVBSAXXMLReader;
begin
  Result := CreateRemoteComObject(AMachineName, CLASS_SAXXMLReader60) as IVBSAXXMLReader;
end;

{ TSAXXMLReader60 }

function TSAXXMLReader60.Get_entityResolver: IVBSAXEntityResolver;
begin
  Result := DefaultInterface.entityResolver;
end;

procedure TSAXXMLReader60.Set_entityResolver(const oResolver: IVBSAXEntityResolver);
begin
  DefaultInterface.entityResolver := oResolver;
end;

function TSAXXMLReader60.Get_contentHandler: IVBSAXContentHandler;
begin
  Result := DefaultInterface.contentHandler;
end;

procedure TSAXXMLReader60.Set_contentHandler(const oHandler: IVBSAXContentHandler);
begin
  DefaultInterface.contentHandler := oHandler;
end;

function TSAXXMLReader60.Get_dtdHandler: IVBSAXDTDHandler;
begin
  Result := DefaultInterface.dtdHandler;
end;

procedure TSAXXMLReader60.Set_dtdHandler(const oHandler: IVBSAXDTDHandler);
begin
  DefaultInterface.dtdHandler := oHandler;
end;

function TSAXXMLReader60.Get_errorHandler: IVBSAXErrorHandler;
begin
  Result := DefaultInterface.errorHandler;
end;

procedure TSAXXMLReader60.Set_errorHandler(const oHandler: IVBSAXErrorHandler);
begin
  DefaultInterface.errorHandler := oHandler;
end;

function TSAXXMLReader60.Get_baseURL: WideString;
begin
  Result := DefaultInterface.baseURL;
end;

procedure TSAXXMLReader60.Set_baseURL(const strBaseURL: WideString);
begin
  DefaultInterface.baseURL := strBaseURL;
end;

function TSAXXMLReader60.Get_secureBaseURL: WideString;
begin
  Result := DefaultInterface.secureBaseURL;
end;

procedure TSAXXMLReader60.Set_secureBaseURL(const strSecureBaseURL: WideString);
begin
  DefaultInterface.secureBaseURL := strSecureBaseURL;
end;

{ CoMXXMLWriter60 }

class function CoMXXMLWriter60.Create: IMXWriter;
begin
  Result := CreateComObject(CLASS_MXXMLWriter60) as IMXWriter;
end;

class function CoMXXMLWriter60.CreateRemote(const AMachineName: string): IMXWriter;
begin
  Result := CreateRemoteComObject(AMachineName, CLASS_MXXMLWriter60) as IMXWriter;
end;

{ TMXXMLWriter60 }

function TMXXMLWriter60.Get_output: OleVariant;
begin
  Result := DefaultInterface.output;
end;

procedure TMXXMLWriter60.Set_output(varDestination: OleVariant);
begin
  DefaultInterface.output := varDestination;
end;

function TMXXMLWriter60.Get_encoding: WideString;
begin
  Result := DefaultInterface.encoding;
end;

procedure TMXXMLWriter60.Set_encoding(const strEncoding: WideString);
begin
  DefaultInterface.encoding := strEncoding;
end;

function TMXXMLWriter60.Get_byteOrderMark: WordBool;
begin
  Result := DefaultInterface.byteOrderMark;
end;

procedure TMXXMLWriter60.Set_byteOrderMark(fWriteByteOrderMark: WordBool);
begin
  DefaultInterface.byteOrderMark := fWriteByteOrderMark;
end;

function TMXXMLWriter60.Get_indent: WordBool;
begin
  Result := DefaultInterface.indent;
end;

procedure TMXXMLWriter60.Set_indent(fIndentMode: WordBool);
begin
  DefaultInterface.indent := fIndentMode;
end;

function TMXXMLWriter60.Get_standalone: WordBool;
begin
  Result := DefaultInterface.standalone;
end;

procedure TMXXMLWriter60.Set_standalone(fValue: WordBool);
begin
  DefaultInterface.standalone := fValue;
end;

function TMXXMLWriter60.Get_omitXMLDeclaration: WordBool;
begin
  Result := DefaultInterface.omitXMLDeclaration;
end;

procedure TMXXMLWriter60.Set_omitXMLDeclaration(fValue: WordBool);
begin
  DefaultInterface.omitXMLDeclaration := fValue;
end;

function TMXXMLWriter60.Get_version: WideString;
begin
  Result := DefaultInterface.version;
end;

procedure TMXXMLWriter60.Set_version(const strVersion: WideString);
begin
  DefaultInterface.version := strVersion;
end;

function TMXXMLWriter60.Get_disableOutputEscaping: WordBool;
begin
  Result := DefaultInterface.disableOutputEscaping;
end;

procedure TMXXMLWriter60.Set_disableOutputEscaping(fValue: WordBool);
begin
  DefaultInterface.disableOutputEscaping := fValue;
end;

{ CoMXHTMLWriter60 }

class function CoMXHTMLWriter60.Create: IMXWriter;
begin
  Result := CreateComObject(CLASS_MXHTMLWriter60) as IMXWriter;
end;

class function CoMXHTMLWriter60.CreateRemote(const AMachineName: string): IMXWriter;
begin
  Result := CreateRemoteComObject(AMachineName, CLASS_MXHTMLWriter60) as IMXWriter;
end;

{ TMXHTMLWriter60 }

function TMXHTMLWriter60.Get_output: OleVariant;
begin
  Result := DefaultInterface.output;
end;

procedure TMXHTMLWriter60.Set_output(varDestination: OleVariant);
begin
  DefaultInterface.output := varDestination;
end;

function TMXHTMLWriter60.Get_encoding: WideString;
begin
  Result := DefaultInterface.encoding;
end;

procedure TMXHTMLWriter60.Set_encoding(const strEncoding: WideString);
begin
  DefaultInterface.encoding := strEncoding;
end;

function TMXHTMLWriter60.Get_byteOrderMark: WordBool;
begin
  Result := DefaultInterface.byteOrderMark;
end;

procedure TMXHTMLWriter60.Set_byteOrderMark(fWriteByteOrderMark: WordBool);
begin
  DefaultInterface.byteOrderMark := fWriteByteOrderMark;
end;

function TMXHTMLWriter60.Get_indent: WordBool;
begin
  Result := DefaultInterface.indent;
end;

procedure TMXHTMLWriter60.Set_indent(fIndentMode: WordBool);
begin
  DefaultInterface.indent := fIndentMode;
end;

function TMXHTMLWriter60.Get_standalone: WordBool;
begin
  Result := DefaultInterface.standalone;
end;

procedure TMXHTMLWriter60.Set_standalone(fValue: WordBool);
begin
  DefaultInterface.standalone := fValue;
end;

function TMXHTMLWriter60.Get_omitXMLDeclaration: WordBool;
begin
  Result := DefaultInterface.omitXMLDeclaration;
end;

procedure TMXHTMLWriter60.Set_omitXMLDeclaration(fValue: WordBool);
begin
  DefaultInterface.omitXMLDeclaration := fValue;
end;

function TMXHTMLWriter60.Get_version: WideString;
begin
  Result := DefaultInterface.version;
end;

procedure TMXHTMLWriter60.Set_version(const strVersion: WideString);
begin
  DefaultInterface.version := strVersion;
end;

function TMXHTMLWriter60.Get_disableOutputEscaping: WordBool;
begin
  Result := DefaultInterface.disableOutputEscaping;
end;

procedure TMXHTMLWriter60.Set_disableOutputEscaping(fValue: WordBool);
begin
  DefaultInterface.disableOutputEscaping := fValue;
end;

{ CoSAXAttributes60 }

class function CoSAXAttributes60.Create: IMXAttributes;
begin
  Result := CreateComObject(CLASS_SAXAttributes60) as IMXAttributes;
end;

class function CoSAXAttributes60.CreateRemote(const AMachineName: string): IMXAttributes;
begin
  Result := CreateRemoteComObject(AMachineName, CLASS_SAXAttributes60) as IMXAttributes;
end;

{ TSAXAttributes60 }

{ CoMXNamespaceManager60 }

class function CoMXNamespaceManager60.Create: IVBMXNamespaceManager;
begin
  Result := CreateComObject(CLASS_MXNamespaceManager60) as IVBMXNamespaceManager;
end;

class function CoMXNamespaceManager60.CreateRemote(const AMachineName: string): IVBMXNamespaceManager;
begin
  Result := CreateRemoteComObject(AMachineName, CLASS_MXNamespaceManager60) as IVBMXNamespaceManager;
end;

{ TMXNamespaceManager60 }

function TMXNamespaceManager60.Get_allowOverride: WordBool;
begin
  Result := DefaultInterface.allowOverride;
end;

procedure TMXNamespaceManager60.Set_allowOverride(fOverride: WordBool);
begin
  DefaultInterface.allowOverride := fOverride;
end;

end.
