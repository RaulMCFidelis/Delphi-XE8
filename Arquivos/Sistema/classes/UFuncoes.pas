unit UFuncoes;



interface

uses
  Vcl.Forms, System.SysUtils, System.Classes, Data.DB,Data.SqlExpr,
  Vcl.DBGrids, Vcl.Grids, System.Types, system.Generics.Collections;

function GetId(Campo, Tabela : String) : Integer;
function GetLoginCadastrado(Login : String) : Boolean;

implementation

uses ModConexao, ufrmCadastroUsuarios;

function GetId(Campo, Tabela : String) : Integer;
   begin
     with
     TSQLQuery.Create(nil) do
     try
       SQLConnection := dmDados.SQLConnection;
       sql.Add('SELECT '+Campo+' FROM '+Tabela+' ORDER BY '+Campo+' DESC LIMIT 1');
       open;
       Result := Fields[0].AsInteger + 1;
     finally
        close;
        free;
     end;
   end;

   function GetLoginCadastrado(Login : String) : Boolean;
   begin
   result := false;
    with
    TSQLQuery.Create(nil) do

      try
      SQLConnection := DmDados.SQLConnection;
      Sql.Add('SELECT ID FROM USUARIOS WHERW LOGIN = :LOGIN');
      Params[0].AsString := Login;
      Open;

      if not IsEmpty then
        result := true;

      finally
      Close;
      Free;

      end;

   end;

end.
