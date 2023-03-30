unit ufrmCadastroCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, tpEdit;

type
  Tfrmcadastrocaixa = class(TfrmCadastroBasico)
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edtnumerodoc: TEdit;
    edtdescricao: TEdit;
    RadioGroup: TRadioGroup;
    edtvalor: TtpEdit;
    procedure acsalvarExecute(Sender: TObject);
    procedure acpesquisarExecute(Sender: TObject);
    procedure aceditarExecute(Sender: TObject);
    procedure btnfiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadastrocaixa: Tfrmcadastrocaixa;

implementation

{$R *.dfm}

uses ModConexao, UFuncoes;

procedure Tfrmcadastrocaixa.aceditarExecute(Sender: TObject);
begin
  inherited;
  edtnumerodoc.Text := DmDados.cdscaixanumero_doc.AsString;
  edtdescricao.Text := DmDados.cdscaixadescricao.AsString;
  edtvalor.Text := FormatFloat(',#0.00',dmdados.cdscaixavalor.AsCurrency);
  radiogroup.ItemIndex := ifthen(DMdados.cdscaixatipo.AsString = 'C',0,1);
end;

procedure Tfrmcadastrocaixa.acpesquisarExecute(Sender: TObject);
begin
  inherited;
  dmDados.cdscaixa.Close;
  dmDados.cdscaixa.CommandText := 'SELECT * FROM CAIXA';
  dmDados.cdscaixa.Open;

end;

procedure Tfrmcadastrocaixa.acsalvarExecute(Sender: TObject);
begin
  if Trim(edtnumerodoc.Text) = '' then
  begin
    Application.MessageBox('Preencha o Campo N�mero do Documento!', 'Aten��o', MB_OK+MB_ICONWARNING);
    edtnumerodoc.SetFocus;
    Abort;
  end;
  if Trim(edtdescricao.Text) = '' then
  begin
    Application.MessageBox('Preencha o Campo Descri��o!', 'Aten��o', MB_OK+MB_ICONWARNING);
    edtdescricao.SetFocus;
    Abort;
  end;

  if StringParaFloat(edtvalor.Text) <= 0 then
    begin
    Application.MessageBox('Insira um Valor Maior que Zero!', 'Aten��o', MB_OK+MB_ICONWARNING);
    edtvalor.SetFocus;
    Abort;
    end;

    if dsTabela.State in [dsInsert] then

    dmDados.cdscaixaid.AsInteger := GetId('ID', 'CAIXA');
    dmDados.cdscaixanumero_doc.AsString := trim(edtnumerodoc.Text);
    dmDados.cdscaixadescricao.AsString := trim(edtdescricao.Text);
    dmDados.cdscaixavalor.AsCurrency := StringParaFloat(edtvalor.Text);
    dmDados.cdscaixadt_cadastro.AsDateTime := now;

        case RadioGroup.ItemIndex of

        0 : DmDados.cdscaixatipo.AsString := 'C';
        1 : DmDados.cdscaixatipo.AsString := 'D';

        end;

  inherited;

end;

procedure Tfrmcadastrocaixa.btnfiltrarClick(Sender: TObject);
begin
  begin
  if edtpesquisar.Text = '' then
  begin
  Application.MessageBox('Informe um valor a ser pesquisado', 'Aten��o', MB_OK+MB_ICONWARNING);
  edtpesquisar.SetFocus;
  Abort;

  inherited;
  DmDados.cdscaixa.Close;
  case cbxfiltros.ItemIndex of
   0 : DmDados.cdscaixa.CommandText := 'SELECT + FROM CAIXA WHERE DOCUMENTO LIKE '+QuotedStr('%'+edtpesquisar.Text+'%');
   1 : DmDados.cdscaixa.CommandText := 'SELECT + FROM CAIXA WHERE DESCRICAO LIKE '+QuotedStr('%'+edtpesquisar.Text+'%');
  end;
  DmDados.cdsusuarios.Open;
  end;

  end;
end;

end.
