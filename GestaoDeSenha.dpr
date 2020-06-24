program GestaoDeSenha;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UFrame in 'UFrame.pas' {FrmFrame: TFrame},
  UInicial in 'UInicial.pas' {FrmInicial};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TFrmInicial, FrmInicial);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
