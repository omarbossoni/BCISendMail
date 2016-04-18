unit GlobalTesto;

interface

uses
  Model.Testo;

type
  TGlobalTesto = class
  private
    class var FTesto: TTesto;
  public
    class procedure CreateTesto;
    class function GetTesto: TTesto;
    class procedure SetTesto(aTesto: TTesto);
  end;

implementation

{ TGlobalTesto }

class procedure TGlobalTesto.CreateTesto;
begin
  FTesto := TTesto.Create;
end;


class function TGlobalTesto.GetTesto: TTesto;
begin
  Result := FTesto;
end;

class procedure TGlobalTesto.SetTesto(aTesto: TTesto);
begin
  FTesto := aTesto;
end;

end.
