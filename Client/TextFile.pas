unit TextFile;

interface

uses
  Model.Config, System.IniFiles;

type
  TTextFileData = class
  private
    class function GetIniFileName: String;
    class function GetIniData(const aSection, aKey: String): String;
    class procedure SetIniData(const aSection, aKey, aValue: String);
  public
    class procedure GetConfigData(aConfig: TConfigDati);
    class procedure SetConfigdata(aConfig: TConfigDati);
    class function GetRestConfig(const aGroup, aKey: String): String;
  end;

implementation

uses
  System.IOUtils, System.SysUtils;

{ TTextFileData }

class procedure TTextFileData.GetConfigData(aConfig: TConfigDati);
var
  I: Integer;
begin
  aConfig.Server := GetIniData('RESTCONFIG', 'server');
  aConfig.port := GetIniData('RESTCONFIG', 'port');
  if not TryStrToInt(aConfig.port, I) then
    raise Exception.Create('File di configurazione: valore errato per porta.');
end;

class function TTextFileData.GetIniData(const aSection, aKey: String): String;
var
  iniF: TIniFile;
  lIniFileName: String;
begin
  lIniFileName := GetIniFileName;
  iniF := TIniFile.Create(lIniFileName);
  try
    result := iniF.ReadString(aSection, aKey, '');
  finally
    iniF.Free;
  end;
end;

class function TTextFileData.GetIniFileName: String;
const
  FILE_NAME = 'config.ini';
begin
{$IF defined(MSWINDOWS)}
  result := '.\' + FILE_NAME;
{$ELSE}
  result := TPath.Combine(TPath.GetDocumentsPath, FILE_NAME);
{$ENDIF}
  if not TFile.Exists(result) then
    raise Exception.Create('File di configurazione "' + result + '" mancante!');
end;

class function TTextFileData.GetRestConfig(const aGroup, aKey: String): String;
begin
  result := GetIniData(aGroup, aKey);
end;

class procedure TTextFileData.SetConfigdata(aConfig: TConfigDati);
begin
  SetIniData('RESTCONFIG', 'server', aConfig.Server);
  SetIniData('RESTCONFIG', 'port', aConfig.port);
end;

class procedure TTextFileData.SetIniData(const aSection, aKey, aValue: String);
var
  iniF: TIniFile;
  lIniFileName: String;
begin
  lIniFileName := GetIniFileName;
  iniF := TIniFile.Create(lIniFileName);
  try
    iniF.WriteString(aSection, aKey, aValue);
  finally
    iniF.Free;
  end;

end;

end.
