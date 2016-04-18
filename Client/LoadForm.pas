unit LoadForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, BusinessObjects;

type
  TfrmLoad = class(TForm)
    lbTitolo: TListBox;
    Splitter1: TSplitter;
    Memo1: TMemo;
  private
    FLettera: TLettera;
    { Private declarations }
  public
    property Lettera: TLettera read FLettera;
  end;

implementation

{$R *.dfm}

end.
