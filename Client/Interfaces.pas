unit Interfaces;

interface

uses
  Model.Testo, Data.Bind.ObjectScope, Vcl.ActnList, Vcl.Controls, Model.Login, Model.Config;

type
  // **********************************************************
  // ViewModel
  // **********************************************************
  // Testo
  IViewModelTesto = Interface
    ['{7A4FD2AA-1658-4074-B1FD-5AD7AEE60D25}']
    // testo
    function GetTesto: TTesto;
    procedure SetTesto(const Value: TTesto);
    property Testo: TTesto read GetTesto write SetTesto;
    // adapter
    function GetTestoAdapter: TBindSourceAdapter;
    procedure SetTestoAdapter(const Value: TBindSourceAdapter);
    property TestoAdapter: TBindSourceAdapter read GetTestoAdapter write SetTestoAdapter;
    // Cansave
    function GetCanSave: Boolean;
    property CanSave: Boolean read GetCanSave;
    // CanSend
    function GetCanSend: Boolean;
    property CanSend: Boolean read GetCanSend;
    // metodi
    procedure Salva;
    procedure InviaMail;
    procedure Load;
  End;

  // Load
  IViewModelLoad = interface
    ['{3E7A8D12-ADDF-4C67-8D9E-F270944CA989}']
    // testo
//    function GetTesto: TTesto;
//    procedure SetTesto(const Value: TTesto);
//    property Testo: TTesto read GetTesto write SetTesto;
    // adapter
    function GetLoadAdapter: TBindSourceAdapter;
    procedure SetLoadAdapter(const Value: TBindSourceAdapter);
    property LoadAdapter: TBindSourceAdapter read GetLoadAdapter write SetLoadAdapter;
    // metodi
    procedure Annulla;
    procedure OK;
  end;

  // Login
  IViewModelLogin = Interface
    ['{45845715-6CE5-40DA-9057-D7C372103FE8}']
    // Login
    function GetLogin: Tlogin;
    procedure SetTLogin(const Value: Tlogin);
    property Login: Tlogin read GetLogin write SetTLogin;
    // Canok
    function GetCanOK: Boolean;
    property CanOK: Boolean read GetCanOK;
    // metodi
    procedure OK;
    procedure Annulla;
  End;

  // Config
  IViewModelConfig = Interface
    ['{4C518EB2-F7E4-4D03-A538-71B56BDC721A}']
    // Config
    function GetConfigDati: TConfigDati;
    procedure SetConfigDati(const Value: TConfigDati);
    property ConfigDati: TConfigDati read GetConfigDati write SetConfigDati;
    // CanOK
    function GetCanOK: Boolean;
    property CanOK: Boolean read GetCanOK;
    // Metodi
    procedure OK;
    procedure Annulla;
  End;

  // **********************************************************
  // ************  Contenitore e contenuto *********************
  // **********************************************************

  IContainedView = interface
    ['{916E220A-AF3C-47BA-99CA-8360F69FF6AD}']
    function GetcmdSalva: TAction;
    function GetcmdAnnulla: TAction;
    function GetcmdInviaMail: TAction;
    function GetcmdOK: TAction;
    function GetcmdLoad: TAction;
    function GetcmdConfig: TAction;
    procedure SetParent(Value: TWinControl);
    procedure free;
    property cmdSalva: TAction read GetcmdSalva;
    property cmdAnnulla: TAction read GetcmdAnnulla;
    property cmdInviaMail: TAction read GetcmdInviaMail;
    property cmdOK: TAction read GetcmdOK;
    property cmdLoad: TAction read GetcmdLoad;
    property cmdConfig: TAction read GetcmdConfig;
  end;

  IViewContainer = interface
    ['{5E75CACF-335B-47D3-8A9D-C27EE4AA3B3E}']
    procedure RegisterView(aView: IContainedView);
    procedure RemoveView;
  end;

  ITestoContainer = interface
    ['{FF274D76-32A7-4F71-B98C-962DB4FFDA67}']
    function GetTesto: TTesto;
    procedure SetTesto(const Value: TTesto);
    property Testo: TTesto read GetTesto write SetTesto;
  end;

implementation

end.
