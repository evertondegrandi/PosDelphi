unit uFormulario;

{
  Exemplo de Bridge com Delphi
  Criado por Andr� Luis Celestino: www.andrecelestino.com
}



// Teste de altera��o, atualizando o reposit�rio local e remoto e do professor
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons;

type
  TfFormulario = class(TForm)
    ClientDataSetClientes: TClientDataSet;
    ClientDataSetProdutos: TClientDataSet;
    DBGridClientes: TDBGrid;
    DBGridProdutos: TDBGrid;
    BitBtnExportarClientesXLS: TBitBtn;
    BitBtnExportarClientesHTML: TBitBtn;
    BitBtnExportarProdutosXLS: TBitBtn;
    BitBtnExportarProdutosHTML: TBitBtn;
    DataSourceClientes: TDataSource;
    DataSourceProdutos: TDataSource;
    ClientDataSetClientesCodigo: TIntegerField;
    ClientDataSetClientesNome: TStringField;
    ClientDataSetClientesCidade: TStringField;
    ClientDataSetProdutosCodigo: TIntegerField;
    ClientDataSetProdutosDescricao: TStringField;
    ClientDataSetProdutosEstoque: TIntegerField;
    Bevel: TBevel;
    LabelClientes: TLabel;
    LabelProdutos: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnExportarClientesXLSClick(Sender: TObject);
    procedure BitBtnExportarClientesHTMLClick(Sender: TObject);
    procedure BitBtnExportarProdutosXLSClick(Sender: TObject);
    procedure BitBtnExportarProdutosHTMLClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  uInterfaceExportador, uExportadorClientes, uExportadorProdutos, uFormatoXLS, uFormatoHTML, uFormatoTXT;

{$R *.dfm}

procedure TfFormulario.BitBtnExportarClientesXLSClick(Sender: TObject);
var
  Exportador: IExportador;
begin
  Exportador := TExportadorClientes.Create(TFormatoXLS.Create);
  try
    Exportador.ExportarDados(ClientDataSetClientes.Data);
  finally
    Exportador := nil;
  end;
end;

procedure TfFormulario.BitBtnExportarClientesHTMLClick(Sender: TObject);
var
  Exportador: IExportador;
begin
  Exportador := TExportadorClientes.Create(TFormatoHTML.Create);
  try
    Exportador.ExportarDados(ClientDataSetClientes.Data);
  finally
    Exportador := nil;
  end;
end;

procedure TfFormulario.FormCreate(Sender: TObject);
var
  CaminhoAplicacao: string;
begin
  CaminhoAplicacao := ExtractFilePath(Application.ExeName);
  ClientDataSetClientes.LoadFromFile(CaminhoAplicacao + 'Clientes.xml');
  ClientDataSetProdutos.LoadFromFile(CaminhoAplicacao + 'Produtos.xml');
end;

procedure TfFormulario.BitBtnExportarProdutosXLSClick(Sender: TObject);
var
  Exportador: IExportador;
begin
  Exportador := TExportadorProdutos.Create(TFormatoXLS.Create);
  try
    Exportador.ExportarDados(ClientDataSetProdutos.Data);
  finally
    Exportador := nil;
  end;
end;

procedure TfFormulario.Button1Click(Sender: TObject);
var
  Exportador: IExportador;
begin
  Exportador := TExportadorProdutos.Create(TFormatoTXT.Create);
  try
    Exportador.ExportarDados(ClientDataSetProdutos.Data);
  finally
    Exportador := nil;
  end;

end;

procedure TfFormulario.BitBtnExportarProdutosHTMLClick(Sender: TObject);
var
  Exportador: IExportador;
begin
  Exportador := TExportadorProdutos.Create(TFormatoHTML.Create);
  try
    Exportador.ExportarDados(ClientDataSetProdutos.Data);
  finally
    Exportador := nil;
  end;
end;

end.
