unit UInicial;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  System.Actions, FMX.ActnList, FMX.Edit;

type
  TFInicial = class(TForm)
    layout_rodape: TLayout;
    TabControl1: TTabControl;
    StyleBook1: TStyleBook;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Image2: TImage;
    line: TLine;
    Label3: TLabel;
    Image3: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Image4: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Image5: TImage;
    Layout2: TLayout;
    Label8: TLabel;
    Rectangle1: TRectangle;
    Label10: TLabel;
    ActionList1: TActionList;
    ActTab2: TChangeTabAction;
    ActTab3: TChangeTabAction;
    ActTab4: TChangeTabAction;
    TabItem5: TTabItem;
    ActTab5: TChangeTabAction;
    Layout1: TLayout;
    Label11: TLabel;
    Label12: TLabel;
    Rectangle2: TRectangle;
    Label13: TLabel;
    TabItem6: TTabItem;
    ActTab6: TChangeTabAction;
    Layout3: TLayout;
    Label14: TLabel;
    Label15: TLabel;
    Rectangle3: TRectangle;
    Label16: TLabel;
    Layout5: TLayout;
    EditConfirmaSenha: TEdit;
    Line1: TLine;
    Layout4: TLayout;
    EditSenha: TEdit;
    Line2: TLine;
    TabItem7: TTabItem;
    Layout6: TLayout;
    Label9: TLabel;
    Label17: TLabel;
    Rectangle4: TRectangle;
    Label18: TLabel;
    Layout7: TLayout;
    EditSenhaEntra: TEdit;
    Line3: TLine;
    ActTab7: TChangeTabAction;
    Image6: TImage;
    procedure Image2Click(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Rectangle2Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure Rectangle4Click(Sender: TObject);
  private
    procedure AbreFPrincipal;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInicial: TFInicial;

implementation

{$R *.fmx}

uses UPrincipal, UDM;

procedure TFInicial.FormCreate(Sender: TObject);
begin
  TabControl1.ActiveTab := TabItem1;
  dm.FDQlogin.Active := True;
  dm.FDQlogin.Close;
  dm.FDQlogin.Open();
  if dm.FDQlogin.RecordCount > 0 then
  begin
    line.Visible := false;
    layout_rodape.Visible := false;
    ActTab7.Execute;
  end;
end;

procedure TFInicial.Image2Click(Sender: TObject);
begin

  case TabControl1.TabIndex of
    0:
      ActTab2.Execute;
    1:
      ActTab3.Execute;
    2:
      begin
        line.Visible := false;
        layout_rodape.Visible := false;
        ActTab4.Execute;
      end;
  end;
end;

procedure TFInicial.Label3Click(Sender: TObject);
begin
  ActTab5.Execute;
end;

procedure TFInicial.Rectangle1Click(Sender: TObject);
begin
  ActTab5.Execute;
end;

procedure TFInicial.Rectangle2Click(Sender: TObject);
begin
  ActTab6.Execute;
end;

procedure TFInicial.Rectangle3Click(Sender: TObject);
begin
  if EditSenha.Text = EditConfirmaSenha.Text then
  begin
    dm.FDQlogin.Close;
    dm.FDQlogin.Open();
    if dm.FDQlogin.RecordCount = 0 then
    begin
      dm.FDQlogin.Append;
      dm.FDQloginsenha.AsString := EditConfirmaSenha.Text;
      dm.FDQlogin.Post;
      dm.FDConnection1.CommitRetaining;
    end;
    AbreFPrincipal;
  end
  else
  begin
    ShowMessage('A senha não confere!');
  end;
end;

procedure TFInicial.Rectangle4Click(Sender: TObject);
begin
  if dm.FDQloginsenha.AsString = EditSenhaEntra.Text then
  begin
    AbreFPrincipal;
  end
  else
  begin
    ShowMessage('Senha incorreta!');
  end;

end;

procedure TFInicial.AbreFPrincipal;
begin

  if not Assigned(FPrincipal) then
    FPrincipal := TFPrincipal.Create(nil);
  FPrincipal.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      sleep(500);
      FPrincipal := nil;
      FPrincipal.disposeof;
    end);

end;

end.
