program GestaoDeSenha;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UFrame in 'UFrame.pas' {FrmFrame: TFrame},
  UInicial in 'UInicial.pas' {FInicial},
  UDM in 'UDM.pas' {DM: TDataModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFInicial, FInicial);
  Application.Run;
end.
