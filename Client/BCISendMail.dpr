program BCISendMail;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles,
  BusinessObjects in 'BusinessObjects.pas',
  ViewModel.testo in 'ViewModels\ViewModel.testo.pas',
  Model.Testo in 'Models\Model.Testo.pas',
  Model.Exceptions in 'Models\Model.Exceptions.pas',
  Interfaces in 'Interfaces.pas',
  Factory in 'Factory.pas',
  Service.Data in 'Service.Data.pas',
  Rest in 'Rest.pas',
  Model.Login in 'Models\Model.Login.pas',
  ViewModel.Login in 'ViewModels\ViewModel.Login.pas',
  View.Base in 'View\View.Base.pas' {ViewBase: TFrame},
  View.Container in 'View\View.Container.pas',
  View.LoginFrame in 'View\View.LoginFrame.pas' {fmLogin: TFrame},
  View.TestoFrame in 'View\View.TestoFrame.pas' {fmTesto: TFrame},
  View.Config in 'View\View.Config.pas' {fmConfig: TFrame},
  ViewModel.Config in 'ViewModels\ViewModel.Config.pas',
  Model.Config in 'Models\Model.Config.pas',
  TextFile in 'TextFile.pas',
  View.LoadFrame in 'View\View.LoadFrame.pas' {fmLoad: TFrame},
  ViewModel.Load in 'ViewModels\ViewModel.Load.pas',
  GlobalTesto in 'GlobalTesto.pas',
  Fake in 'Fake.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Onyx Blue');
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;

end.
