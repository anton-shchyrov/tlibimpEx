unit MSXML2my_TLB;

interface

const
  MSXML2myMajorVersion = 0;
  MSXML2myMinorVersion = 0;

  LIBID_MSXML2my: TGUID = '{46B9C6A7-2AA3-4040-AB01-B0E1D80F783B}';

  // IID constants
  IID_IXMLDOMNode: TGUID = '{18DA510D-F120-45ED-B31F-C7E0540E4BC3}';

type
  // Interfaces forward declarations
  IXMLDOMNode = interface;

type
  // Interfaces
  IXMLDOMNode = interface(IDispatch)
    ['{18DA510D-F120-45ED-B31F-C7E0540E4BC3}']
    function parentNode(out parent: !!!UNKNOWN HRefType!!!): HRESULT; stdcall;
  end;


