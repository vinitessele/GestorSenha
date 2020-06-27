unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, Data.Db,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.TabControl, FMX.ListBox, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Ani, System.Actions, FMX.ActnList, UFrame, FMX.Edit,
  FMX.ScrollBox, FMX.Memo;

type
  TFPrincipal = class(TForm)
    rect_toolbar: TRectangle;
    img_busca: TImage;
    img_tab1: TImage;
    layout_slide: TLayout;
    rect_selecao: TRectangle;
    Line1: TLine;
    img_tab2: TImage;
    img_tab3: TImage;
    layout_aba1: TLayout;
    layout_aba2: TLayout;
    layout_aba3: TLayout;
    TabControl: TTabControl;
    StyleBook1: TStyleBook;
    lb_favorito: TListBox;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    lbl_titulo: TLabel;
    AnimationSelecao: TFloatAnimation;
    rect_abas: TRectangle;
    ActionList1: TActionList;
    ActTab1: TChangeTabAction;
    ActTab2: TChangeTabAction;
    ActTab3: TChangeTabAction;
    ActTab4: TChangeTabAction;
    img_tab1_sel: TImage;
    img_tab2_sel: TImage;
    img_tab3_sel: TImage;
    lb_password: TListBox;
    lb_card: TListBox;
    icone_password: TImage;
    icone_card: TImage;
    TabDetalhe: TTabItem;
    ActTabDetalhe: TChangeTabAction;
    img_cancelar: TImage;
    rect_busca: TRectangle;
    edt_busca: TEdit;
    img_cancel_busca: TImage;
    AnimationBusca: TFloatAnimation;
    RoundRect1: TRoundRect;
    layout_cad_senha: TLayout;
    EditDescricao: TEdit;
    Layout3: TLayout;
    Line3: TLine;
    Label3: TLabel;
    Layout4: TLayout;
    editSenha: TEdit;
    Line7: TLine;
    Label4: TLabel;
    Layout5: TLayout;
    img_exibir: TImage;
    img_esconder: TImage;
    Layout6: TLayout;
    EditLogin: TEdit;
    Line8: TLine;
    Label7: TLabel;
    img_salvar: TImage;
    Layout7: TLayout;
    lbl_gerar_senha: TLabel;
    layout_gerar_senha: TLayout;
    lbl_texto_tamanho: TLabel;
    track_tamanho: TTrackBar;
    sw_upper: TSwitch;
    Label13: TLabel;
    sw_special: TSwitch;
    Label14: TLabel;
    sw_digits: TSwitch;
    Label23: TLabel;
    img_refresh_senha: TImage;
    Layout8: TLayout;
    img_favorito: TImage;
    layout_cad_cartao: TLayout;
    Layout9: TLayout;
    EditNum: TEdit;
    Line13: TLine;
    Label12: TLabel;
    Layout13: TLayout;
    EditNome: TEdit;
    Line20: TLine;
    Label30: TLabel;
    Layout1: TLayout;
    Layout10: TLayout;
    EditVencimento: TEdit;
    Line16: TLine;
    Label24: TLabel;
    Layout11: TLayout;
    EditCVV: TEdit;
    Line21: TLine;
    Label29: TLabel;
    img_sem_senha: TImage;
    img_sem_cartao: TImage;
    img_sem_favorito: TImage;
    layout_aba5: TLayout;
    img_tab5_sel: TImage;
    img_tab5: TImage;
    ActTab5: TChangeTabAction;
    TabItem5: TTabItem;
    Rectangle3: TRectangle;
    Label16: TLabel;
    Rectangle1: TRectangle;
    Label1: TLabel;
    LabelFavoritos: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    img_addSenha: TImage;
    Img_favoritoSel: TImage;
    Img_addCartao: TImage;
    procedure layout_aba1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure img_cancelarClick(Sender: TObject);
    procedure img_buscaClick(Sender: TObject);
    procedure img_cancel_buscaClick(Sender: TObject);
    procedure AnimationBuscaFinish(Sender: TObject);
    procedure track_tamanhoChange(Sender: TObject);
    procedure lbl_gerar_senhaClick(Sender: TObject);
    procedure sw_upperClick(Sender: TObject);
    procedure img_refresh_senhaClick(Sender: TObject);
    procedure img_esconderClick(Sender: TObject);
    procedure img_exibirClick(Sender: TObject);
    procedure img_sem_favoritoClick(Sender: TObject);
    procedure img_sem_senhaClick(Sender: TObject);
    procedure img_sem_cartaoClick(Sender: TObject);
    procedure img_addSenhaClick(Sender: TObject);
    procedure img_salvarClick(Sender: TObject);
    procedure img_favoritoClick(Sender: TObject);
    procedure Img_favoritoSelClick(Sender: TObject);
    procedure Img_addCartaoClick(Sender: TObject);
  private
    procedure SelecionaAba(Sender: TObject);
    procedure ListarFavorito;
    procedure AddFrame(lb: TListBox; icone: TTipoItem;
      cod_item, titulo, descricao: string);
    procedure ListarPassword;
    procedure ListarCard;
    // procedure ListarNote;
    procedure DetalheItem(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure FecharBusca;
    function RandomPassword(Size: integer;
      Upper, Digits, SpecialChar: boolean): string;
    procedure GerarSenha;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.fmx}

uses UDM;

function TFPrincipal.RandomPassword(Size: integer;
  Upper, Digits, SpecialChar: boolean): string;

{ max length of generated password }
const
  intMAX_PW_LEN = 10;
var
  i: Byte;
  s: string;
begin
  if Upper then
    s := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  else
    s := '';

  // if Lower then
  s := s + 'abcdefghijklmnopqrstuvwxyz';

  if Digits then
    s := s + '0123456789';

  if SpecialChar then
    s := s + '()@#$%*+';

  if s = '' then
    exit;

  Result := '';

  for i := 0 to Size - 1 do
    Result := Result + s[Random(Length(s) - 1) + 1];
end;

procedure TFPrincipal.GerarSenha();
begin
  editSenha.text := RandomPassword(FormatFloat('00', track_tamanho.Value)
    .ToInteger, sw_upper.IsChecked, sw_digits.IsChecked, sw_special.IsChecked);
end;

procedure TFPrincipal.Img_addCartaoClick(Sender: TObject);
begin
  img_sem_cartao.Visible := false;
  // Aguarda aba que estava selecionada...
  ActTabDetalhe.Tag := TabControl.TabIndex + 1;
  // Soma +1 porque o index comeca em zero

  // Esconde a busca caso esteja aberta...
  FecharBusca;

  // Esconde painel de gerar senha aleatoria...
  layout_gerar_senha.Visible := false;
  lbl_gerar_senha.text := 'Gerar Nova';

  // img_logo.Visible := false;
  img_cancelar.Visible := true;
  img_salvar.Visible := true;
  img_favorito.Align := TAlignLayout.None;
  img_favorito.Align := TAlignLayout.Right;
  Img_favoritoSel.Align := TAlignLayout.None;
  Img_favoritoSel.Align := TAlignLayout.Right;
  img_favorito.Visible := true;
  Img_favoritoSel.Visible := false;
  img_busca.Visible := false;
  layout_cad_senha.Visible := false;
  layout_cad_cartao.Visible := false;

  lbl_titulo.text := 'Inserir Cartão';
  layout_cad_cartao.Visible := true;
  EditNome.text := EmptyStr;
  EditNum.text := EmptyStr;
  EditVencimento.text := EmptyStr;
  EditCVV.text := EmptyStr;
  dm.FDQCartao.Append;

{$IFDEF ANDROID}
  TAnimator.AnimateFloat(rect_abas, 'Margins.Top', -51, 0.2, TAnimationType.&In,
    TInterpolationType.Circular);
{$ELSE}
  TAnimator.AnimateFloat(rect_abas, 'Margins.Bottom', -60, 0.2,
    TAnimationType.&In, TInterpolationType.Circular);
{$ENDIF]}
  ActTabDetalhe.Execute;
end;

procedure TFPrincipal.FecharBusca;
begin
  if AnimationBusca.Inverse then
    AnimationBusca.Start;
end;

procedure TFPrincipal.DetalheItem(const Sender: TCustomListBox;
  const Item: TListBoxItem);
var
  tipo: TTipoItem;
begin
  // Aguarda aba que estava selecionada...
  ActTabDetalhe.Tag := TabControl.TabIndex + 1;
  // Soma +1 porque o index comeca em zero

  // Esconde a busca caso esteja aberta...
  FecharBusca;

  // Esconde painel de gerar senha aleatoria...
  layout_gerar_senha.Visible := false;
  lbl_gerar_senha.text := 'Gerar Nova';

  // img_logo.Visible := false;
  img_cancelar.Visible := true;
  img_salvar.Visible := true;
  img_favorito.Align := TAlignLayout.None;
  img_favorito.Align := TAlignLayout.Right;
  img_favorito.Visible := true;
  Img_favoritoSel.Align := TAlignLayout.None;
  Img_favoritoSel.Align := TAlignLayout.Right;
  Img_favoritoSel.Visible := false;
  img_busca.Visible := false;

  layout_cad_senha.Visible := false;
  layout_cad_cartao.Visible := false;

  if Item.Tag = 1 then
  begin
    lbl_titulo.text := 'Editar Senha';
    layout_cad_senha.Visible := true;
    EditDescricao.text := dm.FDQsenhadescricao.AsString;
    EditLogin.text := dm.FDQsenhalogin.AsString;
    editSenha.text := dm.FDQsenhasenha.AsString;
  end
  else if Item.Tag = 2 then
  begin
    lbl_titulo.text := 'Editar Cartão';
    layout_cad_cartao.Visible := true;
    EditNum.text := dm.FDQCartaonumero.AsString;
    EditNome.text := dm.FDQCartaonome.AsString;
    EditVencimento.text := dm.FDQCartaodatavalida.AsString;
    EditCVV.text := dm.FDQCartaocvv.AsString;
  end;

{$IFDEF ANDROID}
  TAnimator.AnimateFloat(rect_abas, 'Margins.Top', -51, 0.2, TAnimationType.&In,
    TInterpolationType.Circular);
{$ELSE}
  TAnimator.AnimateFloat(rect_abas, 'Margins.Bottom', -60, 0.2,
    TAnimationType.&In, TInterpolationType.Circular);
{$ENDIF]}
  ActTabDetalhe.Execute;
end;

procedure TFPrincipal.AnimationBuscaFinish(Sender: TObject);
begin
  AnimationBusca.Inverse := NOT AnimationBusca.Inverse;
  rect_busca.Visible := AnimationBusca.Inverse;
end;

procedure TFPrincipal.img_cancelarClick(Sender: TObject);
begin
  img_cancelar.Visible := false;
  img_favorito.Visible := false;
  Img_favoritoSel.Visible := false;
  img_salvar.Visible := false;
  img_busca.Visible := true;
  ListarPassword;
  ListarCard;
  ListarFavorito;
{$IFDEF ANDROID}
  TAnimator.AnimateFloat(rect_abas, 'Margins.Top', 0, 0.2, TAnimationType.&In,
    TInterpolationType.Circular);
{$ELSE}
  TAnimator.AnimateFloat(rect_abas, 'Margins.Bottom', 0, 0.2,
    TAnimationType.&In, TInterpolationType.Circular);
{$ENDIF}
  case ActTabDetalhe.Tag of
    1:
      SelecionaAba(layout_aba1);
    2:
      SelecionaAba(layout_aba2);
    3:
      SelecionaAba(layout_aba3);
  end;

end;

procedure TFPrincipal.AddFrame(lb: TListBox; icone: TTipoItem;
  cod_item, titulo, descricao: string);
var
  Item: TListBoxItem;
  f: TFrmFrame;
begin
  Item := TListBoxItem.Create(nil);
  Item.text := '';
  Item.Height := 77;
  Item.Align := TAlignLayout.Client;
  Item.TagString := cod_item;
  Item.Selectable := false;

  f := TFrmFrame.Create(Item);
  f.Parent := Item;
  f.Align := TAlignLayout.Client;

  f.lbl_titulo.text := titulo;
  f.lbl_subtitulo.text := descricao;

  // Monta icone...
  if icone = TTipoItem.Password then
  begin
    f.img_icone.Bitmap := icone_password.Bitmap;
    Item.Tag := 1; // Armazena o tipo do tem na TAG
  end
  else if icone = TTipoItem.Card then
  begin
    f.img_icone.Bitmap := icone_card.Bitmap;
    Item.Tag := 2; // Armazena o tipo do tem na TAG
  end;

  lb.AddObject(Item);
end;

procedure TFPrincipal.ListarFavorito();
begin
  img_sem_favorito.Visible := false;
  lb_favorito.Items.Clear;
  lb_favorito.OnItemClick := DetalheItem;
  dm.FDQFavoritos.Close;
  dm.FDQFavoritos.Open();

  while not dm.FDQFavoritos.Eof do
  begin
    if dm.FDQFavoritostipo.AsInteger = 1 then
    begin
      AddFrame(lb_favorito, TTipoItem.Password, dm.FDQFavoritosid.AsString,
        dm.FDQFavoritosdescricao.AsString, dm.FDQFavoritoslogin.AsString);
    end
    else if dm.FDQFavoritostipo.AsInteger = 2 then
    begin
      AddFrame(lb_favorito, TTipoItem.Card, dm.FDQFavoritosid.AsString,
        dm.FDQFavoritosdescricao.AsString, dm.FDQFavoritoslogin.AsString);
    end;

    dm.FDQFavoritos.Next;
  end;

end;

procedure TFPrincipal.ListarPassword();
begin
  img_sem_senha.Visible := false;
  lb_password.Items.Clear;
  lb_password.OnItemClick := DetalheItem;

  dm.FDQsenha.Close;
  dm.FDQsenha.Open();

  while not dm.FDQsenha.Eof do
  begin
    AddFrame(lb_password, TTipoItem.Password, dm.FDQsenhaid.AsString,
      dm.FDQsenhadescricao.AsString, dm.FDQsenhalogin.text);
    dm.FDQsenha.Next;
  end;

end;

procedure TFPrincipal.ListarCard();
begin
  img_sem_cartao.Visible := false;
  lb_card.Items.Clear;
  lb_card.OnItemClick := DetalheItem;

  dm.FDQCartao.Close;
  dm.FDQCartao.Open();

  while not dm.FDQCartao.Eof do
  begin
    AddFrame(lb_card, TTipoItem.Card, dm.FDQCartaoid.AsString,
      dm.FDQCartaonome.AsString, dm.FDQCartaonumero.text);
    dm.FDQCartao.Next;
  end;
end;

procedure TFPrincipal.SelecionaAba(Sender: TObject);
begin
  rect_selecao.Width := layout_aba1.Width;

  img_tab1_sel.Visible := false;
  img_tab2_sel.Visible := false;
  img_tab3_sel.Visible := false;
  img_tab5_sel.Visible := false;

  img_tab1.Visible := true;
  img_tab2.Visible := true;
  img_tab3.Visible := true;
  img_tab5.Visible := true;

  AnimationSelecao.StopValue := TLayout(Sender).Position.X;
  AnimationSelecao.Start;

  if TLayout(Sender).Tag = 1 then
  begin
    lbl_titulo.text := 'Favoritos';
    img_tab1_sel.Visible := true;
    img_tab1.Visible := false;
    ActTab1.Execute;
  end;

  if TLayout(Sender).Tag = 2 then
  begin
    lbl_titulo.text := 'Senhas';
    img_tab2_sel.Visible := true;
    img_tab2.Visible := false;
    ActTab2.Execute;
  end;

  if TLayout(Sender).Tag = 3 then
  begin
    lbl_titulo.text := 'Cartões';
    img_tab3_sel.Visible := true;
    img_tab3.Visible := false;
    ActTab3.Execute;
  end;

  if TLayout(Sender).Tag = 5 then
  begin
    lbl_titulo.text := 'Configurações';
    img_tab5_sel.Visible := true;
    img_tab5.Visible := false;
    ActTab5.Execute;
  end;

end;

procedure TFPrincipal.sw_upperClick(Sender: TObject);
begin
  GerarSenha;
end;

procedure TFPrincipal.track_tamanhoChange(Sender: TObject);
begin
  lbl_texto_tamanho.text := 'Número de caracteres: ' +
    FormatFloat('00', track_tamanho.Value);
  GerarSenha;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  dm.FDQFavoritos.Active := true;
  dm.FDQCartao.Active := true;
  dm.FDQsenha.Active := true;
  // Esconde icones...
  icone_password.Visible := false;
  icone_card.Visible := false;
  img_cancelar.Visible := false;
  img_favorito.Visible := false;
  Img_favoritoSel.Visible := false;
  img_salvar.Visible := false;
  rect_busca.Visible := false;

  // Acerta tab selecionada...
  TabControl.ActiveTab := TabItem1;

  // Ajusta largura do retangulo de selecao...
  rect_selecao.Width := layout_aba1.Width - 10;
  SelecionaAba(layout_aba1);

{$IFDEF ANDROID}
  rect_abas.Align := TAlignLayout.Top;
  layout_slide.Align := TAlignLayout.Bottom;
  //img_add.Position.Y := img_add.Position.Y + 50;
{$ELSE}
  rect_abas.Align := TAlignLayout.Bottom;
  layout_slide.Align := TAlignLayout.Top;
{$ENDIF}
end;

procedure TFPrincipal.img_addSenhaClick(Sender: TObject);
begin
  img_sem_senha.Visible := false;
  // Aguarda aba que estava selecionada...
  ActTabDetalhe.Tag := TabControl.TabIndex + 1;
  // Soma +1 porque o index comeca em zero

  // Esconde a busca caso esteja aberta...
  FecharBusca;

  // Esconde painel de gerar senha aleatoria...
  layout_gerar_senha.Visible := false;
  lbl_gerar_senha.text := 'Gerar Nova';

  // img_logo.Visible := false;
  img_cancelar.Visible := true;
  img_salvar.Visible := true;
  img_favorito.Align := TAlignLayout.None;
  img_favorito.Align := TAlignLayout.Right;
  Img_favoritoSel.Align := TAlignLayout.None;
  Img_favoritoSel.Align := TAlignLayout.Right;
  img_favorito.Visible := true;
  Img_favoritoSel.Visible := false;
  img_busca.Visible := false;
  layout_cad_senha.Visible := false;
  layout_cad_cartao.Visible := false;

  lbl_titulo.text := 'Inserir Senha';
  layout_cad_senha.Visible := true;
  EditDescricao.text := EmptyStr;
  EditLogin.text := EmptyStr;
  editSenha.text := EmptyStr;
  dm.FDQsenha.Append;

{$IFDEF ANDROID}
  TAnimator.AnimateFloat(rect_abas, 'Margins.Top', -51, 0.2, TAnimationType.&In,
    TInterpolationType.Circular);
{$ELSE}
  TAnimator.AnimateFloat(rect_abas, 'Margins.Bottom', -60, 0.2,
    TAnimationType.&In, TInterpolationType.Circular);
{$ENDIF]}
  ActTabDetalhe.Execute;
end;

procedure TFPrincipal.img_buscaClick(Sender: TObject);
begin
  rect_busca.Width := rect_toolbar.Width;
  rect_busca.Position.Y := 0;
  rect_busca.Position.X := rect_toolbar.Width;
  rect_busca.Visible := true;

  edt_busca.text := '';
  AnimationBusca.StartValue := rect_busca.Position.X;
  AnimationBusca.StopValue := 0;
  AnimationBusca.Start;
end;

procedure TFPrincipal.img_cancel_buscaClick(Sender: TObject);
begin
  FecharBusca;
end;

procedure TFPrincipal.img_esconderClick(Sender: TObject);
begin
  if img_esconder.Visible then
  begin
    img_esconder.Visible := false;
    img_exibir.Visible := true;
    editSenha.Password := false;
  end
  else
  begin
    img_esconder.Visible := true;
    img_exibir.Visible := false;
    editSenha.Password := true;
  end;
end;

procedure TFPrincipal.img_exibirClick(Sender: TObject);
begin
  if img_exibir.Visible then
  begin
    img_exibir.Visible := false;
    img_esconder.Visible := true;
    editSenha.Password := true;
  end
  else
  begin
    img_exibir.Visible := true;
    img_esconder.Visible := false;
    editSenha.Password := false;
  end;
end;

procedure TFPrincipal.img_favoritoClick(Sender: TObject);
begin
  if img_favorito.Visible then
  begin
    Img_favoritoSel.Visible := true;
    Img_favoritoSel.Align := TAlignLayout.None;
    Img_favoritoSel.Align := TAlignLayout.Right;
    img_favorito.Visible := false;

  end
  else
  begin
    img_favorito.Align := TAlignLayout.None;
    img_favorito.Align := TAlignLayout.Right;
    img_favorito.Visible := true;
    Img_favoritoSel.Visible := false;
  end;
end;

procedure TFPrincipal.Img_favoritoSelClick(Sender: TObject);
begin
  if Img_favoritoSel.Visible then
  begin
    img_favorito.Align := TAlignLayout.None;
    img_favorito.Align := TAlignLayout.Right;
    Img_favoritoSel.Align := TAlignLayout.None;
    Img_favoritoSel.Align := TAlignLayout.Right;
    img_favorito.Visible := true;
    Img_favoritoSel.Visible := false;
  end
  else
  begin
    img_favorito.Align := TAlignLayout.None;
    img_favorito.Align := TAlignLayout.Right;
    Img_favoritoSel.Align := TAlignLayout.None;
    Img_favoritoSel.Align := TAlignLayout.Right;
    img_favorito.Visible := false;
    Img_favoritoSel.Visible := true;
  end;
end;

procedure TFPrincipal.img_refresh_senhaClick(Sender: TObject);
begin
  GerarSenha;
end;

procedure TFPrincipal.img_salvarClick(Sender: TObject);
begin
  if dm.FDQsenha.State in [dsInsert, dsEdit] then
  begin
    if editSenha.text = EmptyStr then
    begin
      ShowMessage('Senha não informada');
      Abort;
    end;
    if EditLogin.text = EmptyStr then
    begin
      ShowMessage('login não informada');
      Abort;
    end;
    dm.FDQsenhadescricao.AsString := EditDescricao.text;
    dm.FDQsenhalogin.AsString := EditLogin.text;
    dm.FDQsenhasenha.AsString := editSenha.text;
    if Img_favoritoSel.Visible then
      dm.FDQsenhafavorito.AsString := 'S'
    else
      dm.FDQsenhafavorito.AsString := EmptyStr;

    dm.FDQsenha.Post;
    dm.FDConnection1.CommitRetaining;
    ShowMessage('Salvo com sucesso!');
  end;

  if dm.FDQCartao.State in [dsInsert, dsEdit] then
  begin
    if EditNome.text = EmptyStr then
    begin
      ShowMessage('Nome não informada');
      Abort;
    end;
    if EditNum.text = EmptyStr then
    begin
      ShowMessage('Número não informada');
      Abort;
    end;
    if EditVencimento.text = EmptyStr then
    begin
      ShowMessage('validade não informada');
      Abort;
    end;
    if EditCVV.text = EmptyStr then
    begin
      ShowMessage('CVV não informada');
      Abort;
    end;

    dm.FDQCartaonome.AsString := EditNome.text;
    dm.FDQCartaonumero.AsString := EditNum.text;
    dm.FDQCartaodatavalida.AsString := EditVencimento.text;
    dm.FDQCartaocvv.AsInteger := StrToInt(EditCVV.text);
    if Img_favoritoSel.Visible then
      dm.FDQcartaofavorito.AsString := 'S'
    else
      dm.FDQcartaofavorito.AsString := EmptyStr;

    dm.FDQCartao.Post;
    dm.FDConnection1.CommitRetaining;
    ShowMessage('Salvo com sucesso!');
  end;
  img_cancelar.Visible := false;
  img_favorito.Visible := false;
  Img_favoritoSel.Visible := false;
  img_salvar.Visible := false;
  img_busca.Visible := true;
  img_sem_senha.Visible := true;
  ListarPassword;
  ListarFavorito;
  ListarCard;
{$IFDEF ANDROID}
  TAnimator.AnimateFloat(rect_abas, 'Margins.Top', 0, 0.2, TAnimationType.&In,
    TInterpolationType.Circular);
{$ELSE}
  TAnimator.AnimateFloat(rect_abas, 'Margins.Bottom', 0, 0.2,
    TAnimationType.&In, TInterpolationType.Circular);
{$ENDIF}
  case ActTabDetalhe.Tag of
    1:
      SelecionaAba(layout_aba1);
    2:
      SelecionaAba(layout_aba2);
    3:
      SelecionaAba(layout_aba3);
  end;
end;

procedure TFPrincipal.img_sem_cartaoClick(Sender: TObject);
begin
  ListarCard;
end;

procedure TFPrincipal.img_sem_favoritoClick(Sender: TObject);
begin
  ListarFavorito;
end;

procedure TFPrincipal.img_sem_senhaClick(Sender: TObject);
begin
  ListarPassword;
end;

procedure TFPrincipal.layout_aba1Click(Sender: TObject);
begin
  SelecionaAba(Sender);
end;

procedure TFPrincipal.lbl_gerar_senhaClick(Sender: TObject);
begin
  if lbl_gerar_senha.text = 'Gerar Nova' then
  begin
    lbl_gerar_senha.text := 'Fechar';
    layout_gerar_senha.Visible := true;
  end
  else
  begin
    lbl_gerar_senha.text := 'Gerar Nova';
    layout_gerar_senha.Visible := false;
  end;

end;

end.
