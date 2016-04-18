unit BusinessObjects;

interface

uses
  System.Generics.Collections, System.Classes;

type

  TBaseBO = class(TPersistent)
  private
    FId: Integer;
    procedure SetId(const Value: Integer);
  public
    property Id: Integer read FId write SetId;
  end;

  TLettera = class(TBaseBO)
  private
    FTesto: String;
    FTitolo: String;
    FOggetto: String;
    procedure SetTesto(const Value: String);
    procedure SetTitolo(const Value: String);
    procedure SetOggetto(const Value: String);
  public
    property Titolo: String read FTitolo write SetTitolo;
    property Testo: String read FTesto write SetTesto;
    property Oggetto: String read FOggetto write SetOggetto;
  end;

  TLettere = TObjectList<TLettera>;

  TDatiLogin = Class(TBaseBO)
  private
    FPassword: String;
    FUser: String;
    procedure SetPassword(const Value: String);
    procedure SetUser(const Value: String);
  public
    property User: String read FUser write SetUser;
    property Password: String read FPassword write SetPassword;
  End;

  TDatiConfig = class(TBaseBO)
  private
    FPort: String;
    FServer: String;
    procedure SetPort(const Value: String);
    procedure SetServer(const Value: String);
  public
    property Server : String read FServer write SetServer;
    property Port : String read FPort write SetPort;
  end;


implementation

{ TBaseBO }

procedure TBaseBO.SetId(const Value: Integer);
begin
  FId := Value;
end;

{ TLettera }

procedure TLettera.SetOggetto(const Value: String);
begin
  FOggetto := Value;
end;

procedure TLettera.SetTesto(const Value: String);
begin
  FTesto := Value;
end;

procedure TLettera.SetTitolo(const Value: String);
begin
  FTitolo := Value;
end;

{ TLogin }

procedure TDatiLogin.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TDatiLogin.SetUser(const Value: String);
begin
  FUser := Value;
end;

{ TDatiConfig }

procedure TDatiConfig.SetPort(const Value: String);
begin
  FPort := Value;
end;

procedure TDatiConfig.SetServer(const Value: String);
begin
  FServer := Value;
end;

end.
