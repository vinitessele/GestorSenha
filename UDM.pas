unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, IOUtils;

type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQlogin: TFDQuery;
    FDQsenha: TFDQuery;
    FDQCartao: TFDQuery;
    FDQloginsenha: TStringField;
    FDQsenhaid: TFDAutoIncField;
    FDQsenhadescricao: TStringField;
    FDQsenhasenha: TStringField;
    FDQCartaoid: TFDAutoIncField;
    FDQCartaonome: TStringField;
    FDQCartaonumero: TStringField;
    FDQCartaocvv: TIntegerField;
    FDQsenhafavorito: TStringField;
    FDQsenhalogin: TStringField;
    FDQCartaofavorito: TStringField;
    FDQFavoritos: TFDQuery;
    FDQFavoritosid: TFDAutoIncField;
    FDQFavoritosdescricao: TStringField;
    FDQFavoritoslogin: TStringField;
    FDQCartaodatavalida: TStringField;
    FDQFavoritosfavorito: TStringField;
    FDQFavoritostipo: TWideStringField;
    FDQConfig: TFDQuery;
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

procedure TDM.FDConnection1AfterConnect(Sender: TObject);
var
  strSQL: string;
  versao: string;
begin
  strSQL := //
    ' create table IF NOT EXISTS config( ' + //
    ' campo varchar(30),' + //
    ' valor varchar(30))';
  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  strSQL := //
    ' create table IF NOT EXISTS login( ' + //
    ' senha varchar(15)) ';
  FDConnection1.ExecSQL(strSQL);
  strSQL := EmptyStr;

  strSQL := //
    ' create table IF NOT EXISTS cartao( ' + //
    ' id integer not null primary key autoincrement, ' + //
    ' nome varchar(30) not null, ' + //
    ' numero varchar(16) not null,   ' + //
    ' datavalida char(7) not null, ' + //
    ' cvv integer not null,' + //
    ' favorito char(1)) ';
  FDConnection1.ExecSQL(strSQL);
  strSQL := EmptyStr;

  strSQL := //
    ' create table IF NOT EXISTS senha(   ' + //
    ' id integer not null primary key autoincrement,' + //
    ' descricao varchar(30)not null, ' + //
    ' login varchar(50), ' + //
    ' senha varchar(15)not null,' + //
    ' favorito char(1)) ';
  FDConnection1.ExecSQL(strSQL);

  DM.FDQConfig.Active := false;
  DM.FDQConfig.SQL.Add('select *from config where campo=''versao''');
  DM.FDQConfig.Active := true;
  versao := DM.FDQConfig.FieldByName('valor').AsString;
  // atualiza versao
  if versao ='1.0' then
  begin
    versao := '1.1';
    // adiciona os campos
    // DM.FDConnection1.ExecSQL('alter table config add a integer');

    DM.FDQConfig.Active := false;
    DM.FDQConfig.SQL.Clear;
    DM.FDQConfig.SQL.Add
      ('update config set valor =:valor where campo = ''versao''');
    DM.FDQConfig.ParamByName('valor').Value := versao;
    DM.FDQConfig.ExecSQL;
  end;
end;

procedure TDM.FDConnection1BeforeConnect(Sender: TObject);
var
  strPath: string;
begin
{$IFDEF MSWINDOWS}
  strPath := System.IOUtils.TPath.Combine
    ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AppGestorSenhas\Bd\',
    'Bd.db');
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
  strPath := System.IOUtils.TPath.Combine
    (System.IOUtils.TPath.GetDocumentsPath, 'Bd.db');
{$ENDIF}
  FDConnection1.Params.Values['UseUnicode'] := 'False';
  FDConnection1.Params.Values['DATABASE'] := strPath;
end;

end.
