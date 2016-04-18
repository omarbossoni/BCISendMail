unit Service.Data;

interface

uses
  Model.Testo, Model.Login, Model.Config, System.Generics.Collections;

type
  TServiceData = class
  public
    class procedure SendEmail(aTesto: TTesto);
    class function Login(aLogin: TLogin): Boolean;
    class procedure GetConfigData(aConfig: TConfigDati);
    class procedure SetConfigdata(aConfig: TConfigDati);
    class procedure GetTemplate(aTesti: TObjectList<TTesto>);
  end;

implementation

uses
  Rest, TextFile, Fake;

{ TServiceData }

class procedure TServiceData.GetConfigData(aConfig: TConfigDati);
begin
  TTextFileData.GetConfigData(aConfig);
end;

class procedure TServiceData.GetTemplate(aTesti: TObjectList<TTesto>);
begin
  // TServiceRest.GetTemplate(aTesti);
  TFake.GetTemplate(aTesti)
end;

class function TServiceData.Login(aLogin: TLogin): Boolean;
begin
  // result := TServiceRest.Login(aLogin);
  result := true;
end;

class procedure TServiceData.SendEmail(aTesto: TTesto);
begin
  TServiceRest.SendEmail(aTesto);
end;

class procedure TServiceData.SetConfigdata(aConfig: TConfigDati);
begin
  TTextFileData.SetConfigdata(aConfig);
end;

end.
