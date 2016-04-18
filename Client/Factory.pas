unit Factory;

interface

uses
  Interfaces, System.Classes, View.TestoFrame, Vcl.Forms, Vcl.ExtCtrls, Vcl.Controls, View.LoginFrame, View.Base,  View.Config,
  View.LoadFrame;

type
  TGlobalFactory = class
  private
  class var
    FViewContainer: IViewContainer;
    class procedure CreateAndRegisterView(aView: TViewBase);
  public
    // login
    class function CreateViewLogin: TfmLogin;
    class function CreateViewModelLogin: IViewModelLogin;
    // testo
    class function CreateViewModelTesto: IViewModelTesto;
    class function CreateViewTesto: TfmTesto;
    // Load
    class function CreateViewModelLoad: IViewModelLoad;
    class function CreateViewLoad: TfmLoad;
    // config
    class function CreateViewModelConfig: IViewModelConfig;
    class function CreateViewConfig: TfmConfig;
    // container
    class procedure CreateViewContainer(aSalva, aAnnulla, aInviaMail, aOK, aLoad, aConfig: TControl; aParent: TWinControl);
    class procedure RemoveViewFromContainer;
  end;

implementation

uses
  Model.Testo, ViewModel.Testo, View.Container, System.SysUtils, ViewModel.Login, ViewModel.Config,
  ViewModel.Load;

{ TViewModel }

class procedure TGlobalFactory.CreateAndRegisterView(aView: TViewBase);
var
  lView: IContainedView;
begin
  if Supports(aView, IContainedView, lView) then begin
    FViewContainer.RegisterView(lView);
    aView.Visible := True;
  end
  else
    raise Exception.Create('Non supporta le interfacce');
end;

// Creazione del container
class procedure TGlobalFactory.CreateViewContainer(aSalva, aAnnulla, aInviaMail, aOK, aLoad, aConfig: TControl; aParent: TWinControl);
begin
  FViewContainer := TViewContainer.Create(aSalva, aAnnulla, aInviaMail, aOK, aLoad, aConfig, aParent);
end;

// Creazione delle view
class function TGlobalFactory.CreateViewLoad: TfmLoad;
begin
  Result := TfmLoad.Create(nil);
  CreateAndRegisterView(Result);
end;

class function TGlobalFactory.CreateViewLogin: TfmLogin;
begin
  Result := TfmLogin.Create(nil);
  CreateAndRegisterView(Result);
end;

class function TGlobalFactory.CreateViewTesto: TfmTesto;
begin
  Result := TfmTesto.Create(nil);
  CreateAndRegisterView(Result);
end;

class function TGlobalFactory.CreateViewConfig: TfmConfig;
begin
  Result := TfmConfig.Create(nil);
  CreateAndRegisterView(Result);
end;

// Creazione dei ViewModel
class function TGlobalFactory.CreateViewModelConfig: IViewModelConfig;
begin
 Result := TViewModelConfig.Create;
end;

class function TGlobalFactory.CreateViewModelLoad: IViewModelLoad;
begin
   Result := TViewModelLoad.Create;
end;

class function TGlobalFactory.CreateViewModelLogin: IViewModelLogin;
begin
  Result := TViewModelLogin.Create;
end;

class function TGlobalFactory.CreateViewModelTesto: IViewModelTesto;
begin
  Result := TViewModelTesto.Create;
end;

class procedure TGlobalFactory.RemoveViewFromContainer;
begin
  FViewContainer.RemoveView;
end;

end.
