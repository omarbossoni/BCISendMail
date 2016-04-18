unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ToolWin, PngImageList, Vcl.StdCtrls, Vcl.Menus, System.Generics.Collections,
  Interfaces;

type

  TfrmMain = class(TForm)
    Toolbar: TToolBar;
    plMain: TPanel;
    StatusBar1: TStatusBar;
    PngImageList1: TPngImageList;
    btnExit: TToolButton;
    ToolButton2: TToolButton;
    btnSend: TToolButton;
    ToolButton4: TToolButton;
    btnConfig: TToolButton;
    btnSave: TToolButton;
    btnLoad: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    btnOK: TToolButton;
    btnAnnulla: TToolButton;
    procedure acExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmMain: TfrmMain;

implementation

uses
  Vcl.Themes, Factory, GlobalTesto;

{$R *.dfm}

procedure TfrmMain.acExitExecute(Sender: TObject);
begin
  close;
end;


procedure TfrmMain.FormCreate(Sender: TObject);
begin
  TGlobalFactory.CreateViewContainer(btnSave, btnAnnulla, btnSend, btnOK, btnLoad, btnConfig, plMain);
  TGlobalTesto.CreateTesto;
  TGlobalFactory.CreateViewLogin;
end;

end.
