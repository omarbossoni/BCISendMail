unit Fake;

interface

uses
  System.Generics.Collections, Model.Testo;

type
  TFake = class
  public
    class procedure GetTemplate(aTesti: TObjectList<TTesto>);
  end;

implementation

{ TFake }

class procedure TFake.GetTemplate(aTesti: TObjectList<TTesto>);
var
  lTesto: TTesto;
begin
  lTesto := TTesto.Create;
  lTesto.Titolo := 'Prima mail';
  lTesto.Oggetto := 'Oggetto prima mail';
  lTesto.Testo := ' Questo è il testo della prima mail';
  aTesti.Add(lTesto);

  lTesto := TTesto.Create;
  lTesto.Titolo := 'Seconda mail';
  lTesto.Oggetto := 'Oggetto Seconda mail';
  lTesto.Testo := ' Questo è il testo della seconda mail';
  aTesti.Add(lTesto);

  lTesto := TTesto.Create;
  lTesto.Titolo := 'terza mail';
  lTesto.Oggetto := 'Oggetto terza mail';
  lTesto.Testo := ' Questo è il testo della terza mail';
  aTesti.Add(lTesto);

end;

end.
