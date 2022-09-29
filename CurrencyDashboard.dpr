program CurrencyDashboard;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitCurrencyDashboard in 'UnitCurrencyDashboard.pas' {FormCurrencyDashboard};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCurrencyDashboard, FormCurrencyDashboard);
  Application.Run;
end.
