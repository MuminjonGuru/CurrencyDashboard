unit UnitCurrencyDashboard;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Types,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.Rtti,
  FMX.Grid.Style, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Grid, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Grid, Data.Bind.DBScope,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  FMX.Memo.Types, FMX.Memo;

type
  TFormCurrencyDashboard = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    Grid1: TGrid;
    ButtonGetLiveRates: TButton;
    EditFrom: TEdit;
    Label1: TLabel;
    EditTo: TEdit;
    Button2: TButton;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    NetHTTPClient1: TNetHTTPClient;
    NetHTTPRequest1: TNetHTTPRequest;
    Memo1: TMemo;
    EditAmount: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCurrencyDashboard: TFormCurrencyDashboard;

implementation

{$R *.fmx}

procedure TFormCurrencyDashboard.Button1Click(Sender: TObject);
begin
  RESTRequest1.Execute;
end;

procedure TFormCurrencyDashboard.Button2Click(Sender: TObject);
begin
  var Amount := EditAmount.Text;
  var From   := EditFrom.Text;
  var MyTo   := EditTo.Text;

  Memo1.Lines.Add(NetHTTPRequest1.Get(
    'https://api.apilayer.com/currency_data/convert?apikey=LuMIKKv3t3i6cEZfQYK8WJRJjhfEIArR&to=' + MyTo + '&from=' + From + '&amount=' + Amount).ContentAsString(TEncoding.Default));
end;

end.
