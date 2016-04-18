unit TestoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmTesto = class(TForm)
    edtesto: TMemo;
    Panel1: TPanel;
    edOggetto: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesto : TfrmTesto;


implementation

{$R *.dfm}

end.
