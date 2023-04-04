unit Uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    imgusuarios: TImage;
    imgreceber: TImage;
    imgpagar: TImage;
    imgcaixa: TImage;
    imgconreceber: TImage;
    imgconpagar: TImage;
    Label3: TLabel;
    Label4: TLabel;
    imgrelpagar: TImage;
    imgconfig: TImage;
    imgnavegador: TImage;
    imgrelreceber: TImage;
    imgrelcaixa: TImage;
    BalloonHint1: TBalloonHint;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure imgusuariosClick(Sender: TObject);
    procedure imgcaixaClick(Sender: TObject);
    procedure imgpagarClick(Sender: TObject);
    procedure imgreceberClick(Sender: TObject);
    procedure imgconreceberClick(Sender: TObject);
    procedure imgconpagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses ufrmCadastroBasico, ufrmCadastroUsuarios, ufrmCadastroCaixa,
  ufrmCadastroPagar, ufrmCadastroReceber, ufrmConsPagar, UFuncoes,
  ufrmConsReceber, ModConexao;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  frmCadastroBasico := TfrmCadastroBasico.Create(nil);
  try
    frmCadastroBasico.ShowModal;
  finally
   FreeAndNil (frmCadastroBasico);
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if Application.MessageBox('Deseja Realmente Sair', 'Informação', MB_YESNO+MB_ICONQUESTION) = mrYes then

Application.Terminate

else
Abort;
end;

procedure TfrmPrincipal.imgcaixaClick(Sender: TObject);
begin
 frmcadastrocaixa := Tfrmcadastrocaixa.Create(nil);
 try
    frmcadastrocaixa.ShowModal;

  finally
   FreeAndNil(frmcadastrocaixa);
  end;
end;

procedure TfrmPrincipal.imgconpagarClick(Sender: TObject);
begin
frm_cons_pagar := Tfrm_cons_pagar.Create(nil);
  try
   frm_cons_pagar.ShowModal;

  finally
   FreeAndNil(frm_cons_pagar);
  end;
end;

procedure TfrmPrincipal.imgconreceberClick(Sender: TObject);
begin
frm_cons_receber := Tfrm_cons_receber.Create(nil);
  try
   frm_cons_receber.ShowModal;

  finally
   FreeAndNil(frm_cons_receber);
  end;
end;

procedure TfrmPrincipal.imgpagarClick(Sender: TObject);
begin
  frmcadastropagar := Tfrmcadastropagar.Create(nil);
 try
    frmcadastropagar.ShowModal;

  finally
   FreeAndNil(frmcadastropagar);
  end;
end;

procedure TfrmPrincipal.imgreceberClick(Sender: TObject);
begin
frmcadastroreceber := Tfrmcadastroreceber.Create(nil);
 try
    frmcadastroreceber.ShowModal;

  finally
   FreeAndNil(frmcadastroreceber);
  end;
end;

procedure TfrmPrincipal.imgusuariosClick(Sender: TObject);
begin
frmcadastrousuarios := Tfrmcadastrousuarios.Create(nil);
 try
    frmcadastrousuarios.ShowModal;

  finally
   FreeAndNil(frmcadastrousuarios);
  end;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
    StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

end.
