unit Rest;

interface

uses
  Model.Testo, System.JSON, MVCFramework.RESTClient, Model.Login,
  System.Generics.Collections;

type
  TChiamata = (doGET, doPOST, doPUT, doDELETE);

  TServiceRest = class
  private
  class var
    FServer: string;
    FPort: integer;
    RESTClient: TRESTClient;
    class procedure ConfigClientConnection;
    class procedure Eccezione(response: IRESTResponse);
    class function MVCCall(ACall: TChiamata; AResource: String; AResourceParams: array of string; AJSONValue: TJSONValue = nil): IRESTResponse;
    class procedure CreateRestClient;
    class procedure FreeRestClient;
  public
    class procedure SendEmail(aTesto: TTesto);
    class function Login(aLogin: TLogin): Boolean;
    class procedure GetTemplate(aTesti : TObjectList<TTesto>);
  end;

implementation

uses
  System.SysUtils, ObjectsMappers, TextFile;

{ TServiceRest }

class procedure TServiceRest.ConfigClientConnection;
begin
   FServer := TTextFileData.GetRestConfig('RESTCONFIG', 'server');
    if not TryStrToInt(TTextFileData.GetRestConfig('RESTCONFIG', 'port'), FPort) then
      raise Exception.Create('File di configurazione: valore errato per porta.');
end;

class procedure TServiceRest.CreateRestClient;
begin
  ConfigClientConnection;
  RESTClient := TRESTClient.Create('http://' + FServer, FPort, nil);
end;

class procedure TServiceRest.Eccezione(response: IRESTResponse);
begin
  raise Exception.Create((response.BodyAsJsonValue as TJSONObject).GetValue('message').Value + '  - HTTP Error n. ' +
    (response.BodyAsJsonValue as TJSONObject).GetValue('http_error').Value);
end;

class procedure TServiceRest.FreeRestClient;
begin
  RESTClient.Free;
end;

class procedure TServiceRest.GetTemplate(aTesti: TObjectList<TTesto>);
begin
  aTesti :=  Mapper.JSONArrayToObjectList<TTesto>(MVCCall(doGET,'/email/testi',[], nil).BodyAsJSONArray);
end;

class function TServiceRest.Login(aLogin: TLogin): Boolean;
begin
//  RESTClient.Authentication(aLogin.User, aLogin.Password, true);
//  result := lowercase(MVCCall(doGET, '/email/login', []).BodyAsString) = 'true';
result := true;
end;

class function TServiceRest.MVCCall(ACall: TChiamata; AResource: String; AResourceParams: array of string; AJSONValue: TJSONValue): IRESTResponse;
begin
  result := nil;
  case ACall of
    doGET:
      result := RESTClient.doGET(AResource, AResourceParams);
    doPOST:
      if Assigned(AJSONValue) then
        result := RESTClient.doPOST(AResource, AResourceParams, AJSONValue)
      else
        result := RESTClient.doPOST(AResource, AResourceParams);
    doPUT:
      if Assigned(AJSONValue) then
        result := RESTClient.doPUT(AResource, AResourceParams, AJSONValue)
      else
        result := RESTClient.doPUT(AResource, AResourceParams);
    doDELETE:
      result := RESTClient.doDELETE(AResource, AResourceParams);
  end;

  if not(result.ResponseCode in [200, 201, 204]) then
  begin
    Eccezione(result);
  end;

end;

class procedure TServiceRest.SendEmail(aTesto: TTesto);
var
  lJSON: TJSONObject;
begin
  lJSON := mapper.ObjectToJSONObject(aTesto);
  MVCCall(doPOST, '/email/send', [], lJSON);
end;

initialization

// TServiceRest.CreateRestClient;

finalization

TServiceRest.FreeRestClient;

end.
