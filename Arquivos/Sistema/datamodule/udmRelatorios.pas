unit udmRelatorios;

interface

uses
  System.SysUtils, System.Classes, frxClass, frxDBSet, frxExportText,
  frxExportPDF, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  Tdmrelatorios = class(TDataModule)
    frxReport: TfrxReport;
    frxDBDsusuarios: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    sqlRecibos: TSQLQuery;
    sqlRecibosid: TIntegerField;
    sqlRecibostipo_recibo: TIntegerField;
    sqlRecibosdt_emissao: TStringField;
    sqlRecibosnome: TStringField;
    sqlRecibosvlr_recibo: TFMTBCDField;
    sqlRecibosreferente: TStringField;
    sqlRecibosobservacao: TStringField;
    sqlRecibosemitente: TStringField;
    sqlRecibosendereco: TStringField;
    sqlReciboscpf_cnpj: TStringField;
    sqlReciboscidade: TStringField;
    sqlRecibosdt_cadastro: TDateField;
    sqlReciboshr_cadastro: TTimeField;
    sqlRecibosuser_cadastro: TStringField;
  private
    { Private declarations }
  public
    procedure ImprimirRecibo(Codigo, Tipo : Integer);
    { Public declarations }
  end;

var
  dmrelatorios: Tdmrelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ModConexao, ufrmCadastroUsuarios, UFuncoes, Vcl.Forms, System.StrUtils;

{$R *.dfm}

{ Tdmrelatorios }

procedure Tdmrelatorios.ImprimirRecibo(Codigo, Tipo: Integer);
begin
  sqlRecibos.Close;
  sqlRecibos.Params[0].AsInteger := Codigo;
  sqlRecibos.Open;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'relatorios\recibo.fr3');
  frxReport.Variables['tipo'] := QuotedStr(ifthen(Tipo = 0, 'RECEBIMENTO','PAGAMENTO'));
  case Tipo of
    0: frxReport.Variables['beneficiario'] := QuotedStr('Recebi (emos) de:');
    1: frxReport.Variables['beneficiario'] := QuotedStr('Pagei (emos) a:');
  end;
  frxReport.ShowReport();
  sqlRecibos.Close;
end;

end.
