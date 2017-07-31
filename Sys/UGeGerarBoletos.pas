unit UGeGerarBoletos;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, StdCtrls, Buttons, ImgList, Grids,
  DBGrids, DB, IBCustomDataSet, IBQuery, Mask, DBCtrls, DBClient, Provider,
  ComObj, IBUpdateSQL, IBTable, IBSQL, ACBrBoleto,
  ACBrBoletoFCFR, ACBrBase, ACBrUtil, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TfrmGeGerarBoleto = class(TfrmGrPadrao)
    pnlGuias: TPanel;
    pgcGuias: TPageControl;
    tbsClientes: TTabSheet;
    tbsTitulos: TTabSheet;
    Bevel1: TBevel;
    ImgList: TImageList;
    Bevel2: TBevel;
    dbgDados: TDBGrid;
    DtsClientes: TDataSource;
    Bevel3: TBevel;
    pnlFiltros: TPanel;
    grpBxFiltro: TGroupBox;
    Label1: TLabel;
    btnFiltrar: TSpeedButton;
    edtFiltrar: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbNome: TDBEdit;
    Label3: TLabel;
    dbCPF: TDBEdit;
    dbEndereco: TDBEdit;
    Label4: TLabel;
    dbBairro: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    dbFone: TDBEdit;
    Label7: TLabel;
    dbEmail: TDBEdit;
    Label8: TLabel;
    dbCidade: TDBEdit;
    Label9: TLabel;
    dbUF: TDBEdit;
    Label10: TLabel;
    dbCEP: TDBEdit;
    Bevel4: TBevel;
    Shape1: TShape;
    Label11: TLabel;
    Bevel6: TBevel;
    dbgTitulos: TDBGrid;
    Bevel8: TBevel;
    IbQryTitulos: TIBQuery;
    DtsTitulos: TDataSource;
    pnlBoleto: TPanel;
    Bevel9: TBevel;
    DspTitulos: TDataSetProvider;
    CdsTitulos: TClientDataSet;
    CdsTitulosPARCELA: TSmallintField;
    CdsTitulosCODBANCO: TIntegerField;
    CdsTitulosDTEMISS: TDateField;
    CdsTitulosDTVENC: TDateField;
    CdsTitulosVALORREC: TBCDField;
    CdsTitulosPERCENTJUROS: TBCDField;
    CdsTitulosPERCENTMULTA: TBCDField;
    CdsTitulosPERCENTDESCONTO: TBCDField;
    CdsTitulosVALORRECTOT: TBCDField;
    CdsTitulosVALORSALDO: TBCDField;
    lbltDemonstrativo: TLabel;
    lbltMsgInstrucoes: TLabel;
    lblbBanco: TLabel;
    cmbBanco: TComboBox;
    CdsTitulosDATAPROCESSOBOLETO: TDateField;
    edtMsgInstrucoes: TEdit;
    edtDemonstrativo: TEdit;
    UpdateLanc: TIBSQL;
    IbUpdTitulos: TIBUpdateSQL;
    CdsTitulosANOLANC: TSmallintField;
    CdsTitulosNUMLANC: TIntegerField;
    CdsTitulosANOVENDA: TSmallintField;
    CdsTitulosNUMVENDA: TIntegerField;
    ACBrBoleto: TACBrBoleto;
    ACBrBoletoFCFR: TACBrBoletoFCFR;
    CdsTitulosPARCELA_MAXIMA: TSmallintField;
    tlbBotoes: TPanel;
    Bevel5: TBevel;
    btnFechar: TcxButton;
    Bevel7: TBevel;
    btnGerarBoleto: TcxButton;
    CdsTitulosNOSSONUMERO: TWideStringField;
    CdsTitulosCNPJ: TWideStringField;
    CdsTitulosTIPPAG: TWideStringField;
    CdsTitulosSERIE: TWideStringField;
    CdsTitulosNFE: TLargeintField;
    CdsTitulosGERAR: TWideStringField;
    fdQryClientes: TFDQuery;
    fdQryClientesCNPJ: TStringField;
    fdQryClientesCODIGO: TIntegerField;
    fdQryClientesINSCEST: TStringField;
    fdQryClientesNOME: TStringField;
    fdQryClientesFONE: TStringField;
    fdQryClientesENDER: TStringField;
    fdQryClientesENDER_DESC: TStringField;
    fdQryClientesENDER_NUM: TStringField;
    fdQryClientesBAIRRO: TStringField;
    fdQryClientesCIDADE: TStringField;
    fdQryClientesUF: TStringField;
    fdQryClientesCEP: TStringField;
    fdQryClientesEMAIL: TStringField;
    fdQryBancos: TFDQuery;
    fdUpdBancos: TFDUpdateSQL;
    procedure edtFiltrarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure DtsClientesDataChange(Sender: TObject; Field: TField);
    procedure pgcGuiasChange(Sender: TObject);
    procedure dbgTitulosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGerarBoletoClick(Sender: TObject);
    procedure cmbBancoChange(Sender: TObject);
    procedure DspTitulosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgTitulosDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    IBancoConta  : Array of Integer;
    {$IFNDEF ACBR}
    CobreBemX : Variant;
    {$ENDIF}
    FFecharAoGerar : Boolean;
    procedure CarregarBancos;
    {$IFDEF ACBR}
    procedure GravarBoletosGeradosACBr(const iProximoNossoNumero : Integer);
    {$ELSE}
    procedure GravarBoletosGerados;
    {$ENDIF}
    procedure UpdateTitulo( iAno : Smallint; iLancamento : Int64; iBanco : Integer; sNossoNumero : String; Data : TDateTime;
      const cJuros : Currency = 0.0; const cMulta : Currency = 0.0);

    function GetAgenciaNumero : String;
    function GetAgenciaDigito : String;
    function GetContaNumero : String;
    function GetContaDigito : String;

    function CarregarTitulos(iCodigoCliente: Integer; iBanco : Integer) : Boolean;
    {$IFDEF ACBR}
    function DefinirCedenteACBr(iBanco : Integer; sCarteira : String) : Boolean;
    function InserirBoletoACBr(var iProximoNossoNumero : Integer; const NovosBoletos : Boolean = TRUE) : Boolean;
    {$ELSE}
    function DefinirCedente( Banco, Carteira : Integer; var Objeto : Variant ) : Boolean;
    function InserirBoleto( var Objeto : Variant) : Boolean;
    {$ENDIF}
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBEMPRESA
  - TBBANCO_BOLETO
  - TBCLIENTE
  - TBCONTREC
  - TBVENDAS

  Views:
  - VW_EMPRESA

  Procedures:

*)

var
  frmGeGerarBoleto : TfrmGeGerarBoleto;

{$IFNDEF ACBR}
const
  feeSMTPBoletoHTML              = $00000000;
  feeSMTPMensagemBoletoHTMLAnexo = $00000001;
  feeSMTPMensagemBoletoPDFAnexo  = $00000002;
  feeSMTPMensagemLinhaDigitavelURLCobreBemECommerce = $00000003;
  feeSMTPMensagemURLCobreBemECommerce = $00000004;
  feeSMTPMensagemLinhaDigitavel       = $00000005;
  feeOutlookBoletoHTML                = $00000006;
  feeOutlookMensagemBoletoHTMLAnexo   = $00000007;
  feeOutlookMensagemBoletoPDFAnexo    = $00000008;
  feeOutlookMensagemLinhaDigitavelURLCobreBemECommerce = $00000009;
  feeOutlookMensagemURLCobreBemECommerce = $0000000A;
  feeOutlookMensagemLinhaDigitavel       = $0000000B;
  scpExecutar = $00000000;
  scpOK       = $00000001;
  scpInvalido = $00000002;
  scpErro     = $00000003;
{$ENDIF}

  procedure GerarBoleto(const AOwer : TComponent); overload;
  procedure GerarBoleto(const AOwer : TComponent; const NomeCliente : String; const iCodigoCliente : Integer; iAno, iVenda : Integer); overload;

  function ReImprimirBoleto(const AOwer : TComponent; sNomeCliente : String; iCodigoCliente, iAno, iVenda, iBanco : Integer;
    var sFileNamePDF : String; const SomenteGerarPDF : Boolean = FALSE) : Boolean;

implementation

uses UDMBusiness, StrUtils, TypInfo, DateUtils, UConstantesDGE, UFuncoes,
  UDMRecursos;

{$R *.dfm}

procedure GerarBoleto(const AOwer : TComponent);
var
  f : TfrmGeGerarBoleto;
begin
  try
    f := TfrmGeGerarBoleto.Create(AOwer);
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure GerarBoleto(const AOwer : TComponent; const NomeCliente : String; const iCodigoCliente : Integer; iAno, iVenda : Integer); overload;
var
  f : TfrmGeGerarBoleto;
begin
  try
    f := TfrmGeGerarBoleto.Create(AOwer);

    f.fdQryClientes.Close;
    f.fdQryClientes.ParamByName('nome').AsString := NomeCliente;
    f.fdQryClientes.Open;

    if ( f.fdQryClientes.Locate('codigo', iCodigoCliente, []) ) then
    begin
      f.dbgDadosDblClick( f.dbgDados );
      f.FFecharAoGerar := True;

      f.CarregarTitulos(iCodigoCliente, 0);

      f.CdsTitulos.Filter   := 'ANOVENDA = ' + IntToStr(iAno) + ' and NUMVENDA = ' + IntToStr(iVenda);
      f.CdsTitulos.Filtered := True;
      f.ShowModal;
    end
    else
      ShowWarning('T�tulos n�o identificados!');

  finally
    f.Free;
  end;
end;

function ReImprimirBoleto(const AOwer : TComponent; sNomeCliente : String; iCodigoCliente, iAno, iVenda, iBanco : Integer;
  var sFileNamePDF : String; const SomenteGerarPDF : Boolean = FALSE) : Boolean;
var
  f : TfrmGeGerarBoleto;
  INossoNum ,
  ICarteira : Integer;
  sBanco    ,
  sCarteira : String;
  bReturn   : Boolean;
begin
  bReturn      := False;
  sFileNamePDF := GetDirectoryTempApp + FormatFloat('0000"."', iAno) + FormatFloat('##000000".pdf"', iVenda);

  try
    f := TfrmGeGerarBoleto.Create(AOwer);

    f.fdQryClientes.Close;
    f.fdQryClientes.ParamByName('nome').AsString := sNomeCliente;
    f.fdQryClientes.Open;

    if ( f.fdQryClientes.Locate('codigo', iCodigoCliente, []) ) then
      with f do
      begin
        CarregarBancos;
        if ( fdQryBancos.Locate('BCO_COD', iBanco, []) ) then
        begin
          cmbBancoChange( cmbBanco );
          CarregarTitulos(iCodigoCliente, iBanco);

          CdsTitulos.Filter   := 'ANOVENDA = ' + IntToStr(iAno) + ' and NUMVENDA = ' + IntToStr(iVenda);
          CdsTitulos.Filtered := True;

          if CdsTitulos.IsEmpty then
          begin
            Application.MessageBox(PChar('N�o existem t�tulos com boletos gerados para o banco ' + fdQryBancos.FieldByName('BCO_NOME').AsString + '.'), 'Alerta', MB_ICONWARNING);
            Exit;
          end;

          ICarteira := StrToIntDef( fdQryBancos.FieldByName('BCO_CARTEIRA').AsString, 0 );
          INossoNum := 0;
          sBanco    := Copy(cmbBanco.Text, 1, 3);
          sCarteira := fdQryBancos.FieldByName('BCO_CARTEIRA').AsString;

          {$IFDEF ACBR}
          if DefinirCedenteACBr( IBanco, sCarteira ) then
          {$ELSE}
          if DefinirCedente( IBanco, ICarteira, CobreBemX ) then
          {$ENDIF}
          begin

            {$IFDEF ACBR}
            if ( InserirBoletoACBr(INossoNum, False) ) then
              if SomenteGerarPDF then
              begin
                ACBrBoleto.ACBrBoletoFC.NomeArquivo := sFileNamePDF;
                ACBrBoleto.ACBrBoletoFC.GerarPDF;
              end
              else
                ACBrBoleto.Imprimir;
            {$ELSE}
            if ( InserirBoleto( CobreBemX ) ) then
              CobreBemX.ImprimeBoletos;
            {$ENDIF}

          end;

          bReturn := True;
        end;
      end;
  finally
    f.Free;
    
    Result := bReturn;
  end;
end;

//function ReImprimirBoleto(Cnjp : String; Lancamento : Int64; Banco : Integer) : Boolean;
//var
//  f : TfrmGrGerarBoleto;
//begin
//  try
//
//    f := TfrmGrGerarBoleto.Create(Application);
//
//    with f do
//    begin
//      IbQryBancos.Open;
//      if ( IbQryBancos.Locate('BCO_COD', Banco, []) ) then
//      begin
//
//      end;
//    end;
//
//  finally
//    f.Free;
//  end;
//end;

procedure TfrmGeGerarBoleto.edtFiltrarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = 13 ) then
    btnFiltrar.Click;
end;

procedure TfrmGeGerarBoleto.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 TDbGrid(Sender).Canvas.font.Color := clBlack;

 if gdSelected in State then
 with (Sender as TDBGrid).Canvas do
 begin
   Brush.Color :=  clMoneyGreen;
   FillRect(Rect);
   Font.Style  := [fsbold]
 end;

 TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmGeGerarBoleto.btnFiltrarClick(Sender: TObject);
begin
  if ( Trim(edtFiltrar.Text) = EmptyStr ) then
    Application.MessageBox('Digite uma palavra-chave', 'Alerta!', MB_ICONWARNING)
  else
  with fdQryClientes do
  begin
    Close;
    ParamByName('nome').AsString := StringReplace( Trim(edtFiltrar.Text), ' ', '%', [rfReplaceAll] );
    Open;
    if ( not IsEmpty ) then
      dbgDados.SetFocus
    else
      edtFiltrar.SelectAll;
  end;
end;

procedure TfrmGeGerarBoleto.dbgDadosKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    pgcGuias.SelectNextPage(False);
  end
  else
  if ( Key in [' ', 'a'..'z', 'A'..'Z'] ) then
  begin
    edtFiltrar.Text := Trim(Key);
    edtFiltrar.SetFocus;
    edtFiltrar.SelStart := Length(edtFiltrar.Text);
  end;
end;

procedure TfrmGeGerarBoleto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_ESCAPE : if ( pgcGuias.ActivePageIndex <> 0 ) then
                begin
                  pgcGuias.ActivePageIndex := 0;
                  dbgDados.SetFocus;

                  pgcGuiasChange(Sender);
                end
                else
                if ( pgcGuias.ActivePageIndex = 0 ) then
                  btnFechar.Click;

  end;
  inherited;
end;

procedure TfrmGeGerarBoleto.FormCreate(Sender: TObject);
begin
  inherited;
  pgcGuias.ActivePageIndex := 0;
  {$IFNDEF ACBR}
  CobreBemX      := CreateOleObject('CobreBemX.ContaCorrente');
  {$ENDIF}
  FFecharAoGerar := False;
end;

procedure TfrmGeGerarBoleto.FormShow(Sender: TObject);
begin
  Self.Caption := Self.Caption + ' - (' + GetNomeFantasiaEmpresa(gUsuarioLogado.Empresa) + ')';

  {$IFDEF ACBR}
  lbltMsgInstrucoes.Enabled := False;
  edtMsgInstrucoes.Enabled  := False;
  lbltDemonstrativo.Enabled := False;
  edtDemonstrativo.Enabled  := False;
  {$ENDIF}

  CarregarBancos;
  if ( pgcGuias.ActivePageIndex = 0 ) then
    edtFiltrar.SetFocus
  else
  if ( pgcGuias.ActivePageIndex = 1 ) then
    dbgTitulos.SetFocus;

  cmbBancoChange(cmbBanco);
end;

procedure TfrmGeGerarBoleto.btnFecharClick(Sender: TObject);
begin
  Close;
end;

function TfrmGeGerarBoleto.CarregarTitulos(iCodigoCliente: Integer; iBanco : Integer) : Boolean;
begin
  with CdsTitulos, Params do
  begin
    Filtered := False;

    Close;
    ParamByName('cliente').AsInteger := iCodigoCliente;
    ParamByName('banco').AsInteger   := iBanco;
    Open;

    Result := not IsEmpty;
  end;
end;

procedure TfrmGeGerarBoleto.DtsClientesDataChange(Sender: TObject;
  Field: TField);
begin
  CarregarTitulos(fdQryClientesCODIGO.AsInteger, 0);
end;

procedure TfrmGeGerarBoleto.pgcGuiasChange(Sender: TObject);
begin
  try
    btnGerarBoleto.Enabled := ( pgcGuias.ActivePage = tbsTitulos ) and ( CdsTitulos.RecordCount > 0 );
  except
  end;
end;

procedure TfrmGeGerarBoleto.dbgTitulosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgTitulosDblClick(Sender);
end;

{$IFNDEF ACBR}
function TfrmGeGerarBoleto.DefinirCedente(Banco, Carteira : Integer; var Objeto: Variant): Boolean;
var
  sAppPath     ,
  sFileLisence : String;
begin
  try
    sAppPath     := ExtractFilePath(ParamStr(0));
    sFileLisence := sAppPath + BOLETO_LICENCAS + FormatFloat('000', Banco)  + '-' + FormatFloat('00', Carteira) + '.conf';

    if ( not FileExists(sFileLisence) ) then
      raise Exception.Create('Arquivo de licen�a ' + QuotedStr(sFileLisence) + ' n�o encontrado');

    // Par�metros obrigat�rios da conta corrente do Cedente

    Objeto.ArquivoLicenca         := sFileLisence;
    Objeto.CodigoAgencia          := IbQryBancosBCO_AGENCIA.AsString;
    Objeto.NumeroContaCorrente    := IbQryBancosBCO_CC.AsString;
    Objeto.CodigoCedente          := IbQryBancosBCO_CHAVE.AsString;
    Objeto.InicioNossoNumero      := IbQryBancosBCO_NOSSO_NUM_INICIO.AsString;
    Objeto.FimNossoNumero         := IbQryBancosBCO_NOSSO_NUM_FINAL.AsString;
    Objeto.OutroDadoConfiguracao1 := Trim(IbQryBancosBCO_CONFG_1.AsString);
    Objeto.OutroDadoConfiguracao2 := Trim(IbQryBancosBCO_CONFG_2.AsString);

    if ( Trim(IbQryBancosBCO_NOSSO_NUM_PROXIMO.AsString) = EmptyStr ) then
      Objeto.ProximoNossoNumero  := '1'
    else
      Objeto.ProximoNossoNumero  := IbQryBancosBCO_NOSSO_NUM_PROXIMO.AsString;


    Objeto.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo            := sAppPath + BOLETO_ARQUIVO_LOGOTIPO;
    Objeto.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras := sAppPath + BOLETO_IMAGENS;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar iniciar processo de gera��o de boletos.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;
{$ENDIF}

procedure TfrmGeGerarBoleto.btnGerarBoletoClick(Sender: TObject);
var
  IBanco      ,
  INossoNumero,
  ICarteira   : Integer;
  sBanco    ,
  sCarteira : String;
begin
  if ( cmbBanco.ItemIndex < 0 ) then
  begin
    Application.MessageBox(PChar('Favor selecionar a entidade financeira para gera��o dos boletos.'), 'Alerta', MB_ICONWARNING);
    Exit;
  end;

  cmbBancoChange(cmbBanco);

  if (fdQryBancos.FieldByName('BCO_GERAR_BOLETO').AsInteger = 0) then
  begin
    ShowInformation('Informe', 'Banco selecionado n�o est� configurado para gera��o de Boletos!' + #13 + 'Favor entrar em contato com suporte.');
    Exit;
  end;

//  if (not ShowConfirm('Confirma a gera��o de boletos?', 'Gerar Boleto', )) then
//    Exit;
  if ( Application.MessageBox('Confirma a gera��o de boletos?','Gerar Boleto', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> ID_YES ) then
    Exit;

  IBanco    := StrToIntDef( Copy(cmbBanco.Text, 1, 3), 0 );
  ICarteira := StrToIntDef( fdQryBancos.FieldByName('BCO_CARTEIRA').AsString, 0 );

  sBanco    := Copy(cmbBanco.Text, 1, 3);
  sCarteira := fdQryBancos.FieldByName('BCO_CARTEIRA').AsString;

  {$IFDEF ACBR}
  if DefinirCedenteACBr( IBanco, sCarteira ) then
  {$ELSE}
  if DefinirCedente( IBanco, ICarteira, CobreBemX ) then
  {$ENDIF}
  begin

    CdsTitulos.Filter   := 'GERAR = ' + QuotedStr('X');
    CdsTitulos.Filtered := True;

    if ( CdsTitulos.IsEmpty ) then
    begin
      CdsTitulos.Filtered := False;
      Application.MessageBox(PChar('N�o existem t�tulos selecionados para gera��o de boletos.'), 'Alerta', MB_ICONWARNING);
      dbgTitulos.SetFocus;
    end
    else
    begin

      {$IFDEF ACBR}
      INossoNumero := 1;
      if ( InserirBoletoACBr(INossoNumero) ) then
      begin
        ACBrBoleto.Imprimir;
        GravarBoletosGeradosACBr(INossoNumero);
      {$ELSE}
      if ( InserirBoleto( CobreBemX ) ) then
      begin
        CobreBemX.ImprimeBoletos;
        GravarBoletosGerados;
      {$ENDIF}
      end;

      if FFecharAoGerar then
        ModalResult := mrOk;
    end;

    CdsTitulos.Filtered := False;

    CdsTitulos.Close;
    CdsTitulos.Open;

  end;
end;

procedure TfrmGeGerarBoleto.CarregarBancos;
var
  I : Integer;
begin
  with fdQryBancos, cmbBanco do
  begin
    Close;
    ParamByName('empresa').AsString := gUsuarioLogado.Empresa;
    Open;

    if ( not IsEmpty ) then
    begin
      Clear;
      SetLength(IBancoConta, RecordCount + 1);
    end
    else
    begin
      SetLength(IBancoConta, cmbBanco.Items.Count);
      for I := 0 to cmbBanco.Items.Count - 1 do
        IBancoConta[I] := 0;
    end;

    I := 0;
    while not Eof do
    begin
      Items.Add( FieldByName('BCO_NOME_AGENCIA_CONTA').AsString );
      IBancoConta[I] := FieldByName('bco_codigo').AsInteger;

      Inc(I);
      Next;
    end;

    First;

    cmbBanco.Tag       := fdQryBancos.FieldByName('BCO_COD').AsInteger;
    cmbBanco.ItemIndex := 0;
  end;
end;

procedure TfrmGeGerarBoleto.cmbBancoChange(Sender: TObject);
begin
  if ( not fdQryBancos.Active ) then
    fdQryBancos.Open;

  if ( fdQryBancos.Locate('bco_codigo', IBancoConta[cmbBanco.ItemIndex], []) ) then
  begin
    cmbBanco.Tag := fdQryBancos.FieldByName('BCO_COD').AsInteger;
    edtMsgInstrucoes.Text := '<br>' + Trim(fdQryBancos.FieldByName('BCO_MSG_INSTRUCAO').AsString);
  end;
end;

{$IFNDEF ACBR}
function TfrmGeGerarBoleto.InserirBoleto(var Objeto: Variant): Boolean;
var
  sAppPath   ,
  sDocumento : String;
  Boleto   ,
  EmailSacado : Variant;
begin
  try
    sAppPath := ExtractFilePath(ParamStr(0));

    Objeto.DocumentosCobranca.Clear;

    CdsTitulos.First;

    while not CdsTitulos.Eof do
    begin
      Boleto     := Objeto.DocumentosCobranca.Add;
      sDocumento := Copy(CdsTitulosANOLANC.AsString, 3, 2) + FormatFloat('00000000', CdsTitulosNUMLANC.AsInteger) + FormatFloat('000', CdsTitulosPARCELA.AsInteger);

      Boleto.NumeroDocumento := sDocumento;
      Boleto.NomeSacado      := dbNome.Field.AsString;

      if Length(dbCPF.Field.AsString) > 11 then
        Boleto.CNPJSacado := dbCPF.Field.AsString
      else
        Boleto.CPFSacado  := dbCPF.Field.AsString;

      Boleto.EnderecoSacado := dbEndereco.Field.AsString;
      Boleto.BairroSacado   := dbBairro.Field.AsString;
      Boleto.CidadeSacado   := dbCidade.Field.AsString;
      Boleto.EstadoSacado   := dbUF.Field.AsString;
      Boleto.CepSacado      := dbCEP.Field.AsString;
      Boleto.DataDocumento  := FormatDateTime('dd/mm/yyyy', Date);

      if not CdsTitulosDTVENC.IsNull then
        Boleto.DataVencimento  := FormatDateTime('dd/mm/yyyy', CdsTitulosDTVENC.AsDateTime);

      Boleto.DataProcessamento := FormatDateTime('dd/mm/yyyy', Date);

      Boleto.ValorDocumento                := CdsTitulosVALORREC.AsFloat;
      Boleto.PercentualJurosDiaAtraso      := IbQryBancosBCO_PERCENTUAL_JUROS.AsFloat; // Juros - Multa di�ria
      Boleto.PercentualMultaAtraso         := IbQryBancosBCO_PERCENTUAL_MORA.AsFloat;  // Mora  - Multa de atraso
      Boleto.PercentualDesconto            := CdsTitulosPERCENTDESCONTO.AsFloat;
      Boleto.ValorOutrosAcrescimos         := 0;
      Boleto.PadroesBoleto.Demonstrativo   := Trim(edtDemonstrativo.Text) + '<br><br>Venda No. ' +
                                              FormatFloat('0000', CdsTitulosANOLANC.AsInteger) + '/' +
                                              FormatFloat('##00000000', CdsTitulosNUMVENDA.AsInteger);
      Boleto.PadroesBoleto.InstrucoesCaixa := Trim(edtMsgInstrucoes.Text);

      EmailSacado          := Boleto.EnderecosEmailSacado.Add;
      EmailSacado.Nome     := Boleto.NomeSacado;
      EmailSacado.Endereco := dbEmail.Field.AsString;

      Boleto.ControleProcessamentoDocumento.Imprime      := scpExecutar;
      Boleto.ControleProcessamentoDocumento.EnviaEmail   := scpExecutar;
      Boleto.ControleProcessamentoDocumento.GravaRemessa := scpExecutar;

      if (Trim(CdsTitulosNOSSONUMERO.AsString) <> EmptyStr) then
      begin
        Boleto.NossoNumero := CdsTitulosNOSSONUMERO.AsString;

        if Length(CdsTitulosNOSSONUMERO.AsString) < (Objeto.MascaraNossoNumero + 1) then
          Boleto.CalculaDacNossoNumero := True;
      end;

      if Length(CdsTitulosNOSSONUMERO.AsString) < (Objeto.MascaraNossoNumero + 1) then
        Boleto.CalculaDacNossoNumero := True;

      CdsTitulos.Next;
    end;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar gerar boletos.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;
{$ENDIF}

{$IFNDEF ACBR}
procedure TfrmGeGerarBoleto.GravarBoletosGerados;
var
  Ano  ,
  Lanc ,
  I    : Integer;
  N : String;
begin
  CdsTitulos.IndexFieldNames := 'ANOLANC;NUMLANC';

  for I := 0 to CobreBemX.DocumentosCobranca.Count - 1 do
  begin
    Ano  := 2000 + StrToInt( Copy(CobreBemX.DocumentosCobranca[I].NumeroDocumento, 1, 2));
    Lanc := StrToInt(Copy(CobreBemX.DocumentosCobranca[I].NumeroDocumento, 3, 8));

    if CdsTitulos.FindKey( [Ano, Lanc] ) then
      if ( CdsTitulosNOSSONUMERO.AsString <> CobreBemX.DocumentosCobranca[i].NossoNumero ) then
      begin
        CdsTitulos.Edit;
        CdsTitulosCODBANCO.Value    := IbQryBancosBCO_COD.Value;
        CdsTitulosNOSSONUMERO.Value := CobreBemX.DocumentosCobranca[i].NossoNumero;
        CdsTitulosDATAPROCESSOBOLETO.Value := GetDateTimeDB;
        CdsTitulosPERCENTJUROS.AsCurrency  := IbQryBancosBCO_PERCENTUAL_JUROS.AsCurrency;
        CdsTitulosPERCENTMULTA.AsCurrency  := IbQryBancosBCO_PERCENTUAL_MORA.AsCurrency;
        CdsTitulos.Post;

        CommitTransaction;

        UpdateTitulo(CdsTitulosANOLANC.Value, CdsTitulosNUMLANC.Value, CdsTitulosCODBANCO.Value, CdsTitulosNOSSONUMERO.Value, GetDateTimeDB);
      end;
  end;

  cmbBancoChange(cmbBanco);

  if ( IbQryBancosBCO_NOSSO_NUM_PROXIMO.AsString <> CobreBemX.ProximoNossoNumero ) then
  begin
    IbQryBancos.Edit;
    IbQryBancosBCO_NOSSO_NUM_PROXIMO.AsString := RightStr( '0000000' + CobreBemX.ProximoNossoNumero, 6 );
    IbQryBancos.Post;

    CommitTransaction;
  end;
end;
{$ENDIF}

procedure TfrmGeGerarBoleto.GravarBoletosGeradosACBr(const iProximoNossoNumero : Integer);
var
  pDOC ,
  pDIG : String;
  I    : Integer;
  N : String;
  Titulo : TACBrTitulo;
  cJuros ,
  cMulta : Currency;
begin
  for I := 0 to ACBrBoleto.ListadeBoletos.Count - 1 do
    with ACBrBoleto, ListadeBoletos do
    begin
      Titulo := ListadeBoletos.Objects[I];

      if Pos('-', Titulo.NumeroDocumento) > 0 then
      begin
        CdsTitulos.IndexFieldNames := 'NFE;PARCELA';

        pDOC := Copy(Titulo.NumeroDocumento, 1, Pos('-', Titulo.NumeroDocumento) - 1);
        pDIG := Copy(Titulo.NumeroDocumento, Pos('-', Titulo.NumeroDocumento) + 1, 2);
      end
      else
      begin
        CdsTitulos.IndexFieldNames := 'ANOLANC;NUMLANC';

        pDOC := IntToStr( 2000 + StrToInt( Copy(Titulo.NumeroDocumento, 1, 2)) );
        pDIG := Copy(Titulo.NumeroDocumento, 3, 8);
      end;

      if CdsTitulos.FindKey( [pDOC, pDIG] ) then
        if ( CdsTitulosNOSSONUMERO.AsString <> Titulo.NossoNumero ) then
        begin
          cJuros := fdQryBancos.FieldByName('BCO_PERCENTUAL_JUROS').AsCurrency;
          cMulta := fdQryBancos.FieldByName('BCO_PERCENTUAL_MORA').AsCurrency;

          CdsTitulos.Edit;
          CdsTitulosCODBANCO.Value    := fdQryBancos.FieldByName('BCO_COD').Value;
          CdsTitulosNOSSONUMERO.Value := Titulo.NossoNumero;
          CdsTitulosDATAPROCESSOBOLETO.Value := GetDateTimeDB;
          CdsTitulosPERCENTJUROS.AsCurrency  := cJuros;
          CdsTitulosPERCENTMULTA.AsCurrency  := cMulta;
          CdsTitulos.Post;

          CommitTransaction;

          UpdateTitulo(CdsTitulosANOLANC.Value, CdsTitulosNUMLANC.Value, CdsTitulosCODBANCO.Value, CdsTitulosNOSSONUMERO.Value,
            GetDateTimeDB, cJuros, cMulta);
        end;
    end;

  cmbBancoChange(cmbBanco);

  if ( StrToIntDef(Trim(fdQryBancos.FieldByName('BCO_NOSSO_NUM_PROXIMO').AsString), 0) < iProximoNossoNumero ) then
  begin
    fdQryBancos.Edit;
    fdQryBancos.FieldByName('BCO_NOSSO_NUM_PROXIMO').AsString := RightStr( FormatFloat('0000000', iProximoNossoNumero), 6 );
    fdQryBancos.Post;
    fdQryBancos.ApplyUpdates(0);

    CommitTransaction;
  end;
end;

procedure TfrmGeGerarBoleto.DspTitulosGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'TBCONTREC';
end;

procedure TfrmGeGerarBoleto.UpdateTitulo(iAno : Smallint; iLancamento: Int64; iBanco: Integer;
  sNossoNumero: String; Data: TDateTime; const cJuros : Currency = 0.0; const cMulta : Currency = 0.0);
var
  sSQL : TStringList;
begin
  try
    sSQL := TStringList.Create;

    sSQL.BeginUpdate;
    sSQL.Clear;
    sSQL.Add( ' Update TBCONTREC Set ' );
    sSQL.Add( '     nossonumero = ' + QuotedStr(sNossoNumero) );
    sSQL.Add( '   , codbanco    = ' + IntToStr(iBanco) );
    sSQL.Add( '   , dataprocessoboleto = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Data)) );
    sSQL.Add( '   , percentjuros       = ' + StringReplace(FormatFloat('########0.###', cJuros), ',', '.', [rfReplaceAll]) );
    sSQL.Add( '   , percentmulta       = ' + StringReplace(FormatFloat('########0.###', cMulta), ',', '.', [rfReplaceAll]) );
    sSQL.Add( ' where anolanc = '   + IntToStr(iAno) );
    sSQL.Add( '   and numlanc = '   + IntToStr(iLancamento) );
    sSQL.EndUpdate;

    with UpdateLanc, SQL  do
    begin
      Clear;
      AddStrings( sSQL );
      ExecQuery;

      CommitTransaction;
    end;
  finally
    sSQL.Free;
  end;
end;

procedure TfrmGeGerarBoleto.dbgDadosDblClick(Sender: TObject);
begin
  pgcGuias.SelectNextPage(False);
end;

procedure TfrmGeGerarBoleto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  CanClose := ( Application.MessageBox('Deseja abandonar processo de gera��o de boletos?','Fechar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES );
end;

procedure TfrmGeGerarBoleto.dbgTitulosDblClick(Sender: TObject);
begin
  if ( not CdsTitulos.IsEmpty ) then
  begin
    CdsTitulos.Edit;
    if ( CdsTitulosGERAR.AsString = '.' ) then
      CdsTitulosGERAR.Value := 'X'
    else
      CdsTitulosGERAR.Value := '.';
    CdsTitulos.Post;
  end;
end;

procedure TfrmGeGerarBoleto.FormDestroy(Sender: TObject);
begin
  {$IFNDEF ACBR}
  CobreBemX := Unassigned;
  {$ENDIF}
end;

function TfrmGeGerarBoleto.DefinirCedenteACBr(iBanco : Integer; sCarteira : String): Boolean;
var
  sAppLogo  ,
  sAppBoleto,
  sAppPath  : String;
begin
  // Esta fun��o dever� ser replicada em: TfrmGeRemessaBoleto.DefinirCedenteACBr()
  
  try
    sAppPath   := ExtractFilePath(ParamStr(0));
    sAppBoleto := sAppPath + LAYOUT_BOLETO_ENTREGA;
    sAppLogo   := sAppPath + BOLETO_IMAGENS + 'Colorido\' + FormatFloat('000".bmp"', iBanco);

    if not FileExists(sAppBoleto) then
      raise Exception.Create(Format('Arquivo de layout %s n�o encontrado!', [QuotedStr(sAppBoleto)]));

    if not FileExists(sAppLogo) then
      sAppLogo := sAppPath + BOLETO_IMAGENS + 'PretoBranco\' + FormatFloat('000".bmp"', iBanco);

    if not FileExists(sAppLogo) then
      sAppLogo := EmptyStr;

    // Par�metros obrigat�rios da conta corrente do Cedente

    with ACBrBoleto, Banco do
    begin
      Case iBanco of 
        CODIGO_BANCO_BRASIL:
          begin
            TipoCobranca          := cobBancoDoBrasil;
            TamanhoMaximoNossoNum := 17;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_BRADESCO:
          begin
            TipoCobranca          := cobBradesco;
            TamanhoMaximoNossoNum := 11;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_CAIXA:
          begin
            TipoCobranca          := cobCaixaEconomica;
            TamanhoMaximoNossoNum := 15;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_HSBC:
          begin
            TipoCobranca          := cobHSBC;
            TamanhoMaximoNossoNum := 16;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_ITAU:
          begin
            TipoCobranca          := cobItau;
            TamanhoMaximoNossoNum := 8;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_SANTANDER:
          begin
            TipoCobranca          := cobSantander;
            TamanhoMaximoNossoNum := 12;
            Cedente.Modalidade    := '101';
          end;

        else
          raise Exception.Create('Sistema n�o adapitado para gerar boletos para o banco ' + fdQryBancos.FieldByName('BCO_NOME').AsString);
      end;

      Case fdQryBancos.FieldByName('BCO_LAYOUT_REMESSA').AsInteger of
        240: LayoutRemessa := c240;
        400: LayoutRemessa := c400;
      end;

      ACBrBoletoFCFR.DirLogo        := ExtractFilePath(sAppLogo);
      ACBrBoletoFCFR.FastReportFile := sAppBoleto;
      ACBrBoletoFCFR.SoftwareHouse  := GetCompanyName;

      // Dados Conta
      Cedente.Agencia       := GetAgenciaNumero;
      Cedente.AgenciaDigito := GetAgenciaDigito;
      Cedente.Conta         := GetContaNumero;
      Cedente.ContaDigito   := GetContaDigito;
      Cedente.Convenio      := fdQryBancos.FieldByName('BCO_CHAVE').AsString;

      // Dados Cedente
      if StrIsCPF(fdQryBancos.FieldByName('EMPRESA').AsString) then
        Cedente.TipoInscricao := pFisica
      else
      if StrIsCNPJ(fdQryBancos.FieldByName('EMPRESA').AsString) then
        Cedente.TipoInscricao := pJuridica;

      Cedente.CNPJCPF     := fdQryBancos.FieldByName('EMPRESA').AsString;
      Cedente.Nome        := fdQryBancos.FieldByName('RZSOC').AsString;
      Cedente.Logradouro  := fdQryBancos.FieldByName('ENDER').AsString;
      Cedente.NumeroRes   := fdQryBancos.FieldByName('NUMERO_END').AsString;
      Cedente.Complemento := fdQryBancos.FieldByName('COMPLEMENTO').AsString;
      Cedente.Bairro := fdQryBancos.FieldByName('BAIRRO').AsString;
      Cedente.CEP    := fdQryBancos.FieldByName('CEP').AsString;
      Cedente.Cidade := fdQryBancos.FieldByName('CIDADE').AsString;
      Cedente.UF     := fdQryBancos.FieldByName('UF').AsString;

      // Dados Conv�nio
      Cedente.CodigoCedente     := Trim(fdQryBancos.FieldByName('BCO_CODIGO_CEDENTE').AsString);
      Cedente.Convenio          := fdQryBancos.FieldByName('BCO_CHAVE').AsString;
      Cedente.CodigoTransmissao := EmptyStr;
    end;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar iniciar processo de gera��o de boletos (ACBr).' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

function TfrmGeGerarBoleto.GetAgenciaNumero: String;
var
  S : String;
begin
  S := Trim(fdQryBancos.FieldByName('BCO_AGENCIA').AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, 1, Pos('-', S) - 1);

  Result := S;
end;

function TfrmGeGerarBoleto.GetAgenciaDigito: String;
var
  S : String;
begin
  S := Trim(fdQryBancos.FieldByName('BCO_AGENCIA').AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, Pos('-', S) + 1, Length(S))
  else
    S := EmptyStr;

  Result := S;
end;

function TfrmGeGerarBoleto.GetContaDigito: String;
var
  S : String;
begin
  S := Trim(fdQryBancos.FieldByName('BCO_CC').AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, Pos('-', S) + 1, Length(S))
  else
    S := EmptyStr;

  Result := S;
end;

function TfrmGeGerarBoleto.GetContaNumero: String;
var
  S : String;
begin
  S := Trim(fdQryBancos.FieldByName('BCO_CC').AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, 1, Pos('-', S) - 1);

  Result := S;
end;

function TfrmGeGerarBoleto.InserirBoletoACBr(var iProximoNossoNumero : Integer; const NovosBoletos : Boolean = TRUE) : Boolean;
var
  sDocumento ,
  sMensagem  : String;
  Boleto : TACBrTitulo;
const
  MSG_REF_NFE = 'Referente a NF-e %s, parcela %s/%s';
  MSG_REF_DOC = 'Referente ao t�tulo %s, parcela %s/%s';
begin
  // Esta fun��o dever� ser replicada em: TfrmGeRemessaBoleto.InserirBoletoACBr()

  try

    ACBrBoleto.ListadeBoletos.Clear;

    iProximoNossoNumero := StrToIntDef( Trim(fdQryBancos.FieldByName('BCO_NOSSO_NUM_PROXIMO').AsString), 1 );
    CdsTitulos.First;

    while not CdsTitulos.Eof do
    begin

      Boleto := ACBrBoleto.CriarTituloNaLista;

      if ( CdsTitulosNFE.AsLargeInt > 0 ) then
      begin
        sMensagem  := Format(MSG_REF_NFE, [FormatFloat('###0000000', CdsTitulosNFE.AsLargeInt), FormatFloat('00', CdsTitulosPARCELA.AsInteger), FormatFloat('00', CdsTitulosPARCELA_MAXIMA.AsInteger)]);
        sDocumento := FormatFloat('###0000000', CdsTitulosNFE.AsLargeInt) + '-' + FormatFloat('00', CdsTitulosPARCELA.AsInteger);
      end
      else
      begin
        sMensagem  := Format(MSG_REF_DOC, [Copy(CdsTitulosANOLANC.AsString, 3, 2) + FormatFloat('00000000', CdsTitulosNUMLANC.AsInteger), FormatFloat('00', CdsTitulosPARCELA.AsInteger), FormatFloat('00', CdsTitulosPARCELA_MAXIMA.AsInteger)]);
        sDocumento := Copy(CdsTitulosANOLANC.AsString, 3, 2) + FormatFloat('00000000', CdsTitulosNUMLANC.AsInteger) + FormatFloat('000', CdsTitulosPARCELA.AsInteger);
      end;

      with Boleto do
      begin
        // Dados do Sacado
        if StrIsCPF(dbCPF.Field.AsString) then
          Sacado.Pessoa   := pFisica
        else
        if StrIsCNPJ(dbCPF.Field.AsString) then
          Sacado.Pessoa   := pJuridica
        else
          Sacado.Pessoa   := pOutras;

        Sacado.CNPJCPF    := dbCPF.Field.AsString;
        Sacado.NomeSacado := dbNome.Field.AsString;
        Sacado.Logradouro := fdQryClientesENDER_DESC.AsString;
        Sacado.Numero     := fdQryClientesENDER_NUM.AsString;
        Sacado.Bairro     := dbBairro.Field.AsString;
        Sacado.Cidade     := dbCidade.Field.AsString;
        Sacado.UF         := dbUF.Field.AsString;
        Sacado.CEP        := StrOnlyNumbers(dbCEP.Field.AsString);
        Sacado.Email      := AnsiLowerCase(Trim(fdQryClientesEMAIL.AsString));
        Sacado.Fone       := StrOnlyNumbers(Trim(fdQryClientesFONE.AsString));

        // Dados do Documento
        LocalPagamento := 'Pagar prefer�ncialmente nas ag�ncias do(a) ' + ACBrBoleto.Banco.Nome;

        if not CdsTitulosDTVENC.IsNull then
          Vencimento   := CdsTitulosDTVENC.AsDateTime
        else
          Vencimento   := GetProximoDiaUtil(Date);

(*
        O campo Aceite indica se o Sacado (quem recebe o boleto) aceitou o boleto, ou seja, se ele assinou o documento
        de cobran�a que originou o boleto. O padr�o � usar "N�o" no aceite, pois nesse caso n�o � necess�rio a
        autoriza��o do Sacado para protestar o t�tulo.
        Se escolher "Sim", o Cedente (quem emite o boleto) precisar� de algum documento onde o Sacado reconhece a d�vida
        para poder protestar o t�tulo.
*)
        Aceite            := atNao;
        DataDocumento     := CdsTitulosDTEMISS.AsDateTime;
        NumeroDocumento   := sDocumento;
        Parcela           := CdsTitulosPARCELA.AsInteger;
        EspecieDoc        := 'DM'; // Duplicata Mercantil
        EspecieMod        := 'R$';

        if NovosBoletos then
          DataProcessamento := Now
        else
          DataProcessamento := CdsTitulosDATAPROCESSOBOLETO.AsDateTime;

        Carteira          := fdQryBancos.FieldByName('BCO_CARTEIRA').AsString;

        if NovosBoletos then
          NossoNumero     := IntToStr(iProximoNossoNumero)
        else
          NossoNumero     := IntToStr( StrToInt(CdsTitulosNOSSONUMERO.AsString) );

        // Dados de Cobran�a
        ValorDocumento    := CdsTitulosVALORREC.AsCurrency;
        ValorAbatimento   := 0.0;
        ValorMoraJuros    := (CdsTitulosVALORREC.AsCurrency * fdQryBancos.FieldByName('BCO_PERCENTUAL_MORA').AsCurrency / 100) / 30;
        ValorDesconto     := CdsTitulosVALORREC.AsCurrency * CdsTitulosPERCENTDESCONTO.AsCurrency / 100;
        DataMoraJuros     := GetProximoDiaUtil(Vencimento);
        DataAbatimento    := StrToCurrDef(EmptyStr, 0);

        if ( CdsTitulosPERCENTDESCONTO.AsCurrency = 0 ) then
          DataDesconto    := StrToCurrDef(EmptyStr, 0)
        else
          DataDesconto    := CdsTitulosDTVENC.AsDateTime;

        if ( fdQryBancos.FieldByName('BCO_DIA_PROTESTO').AsInteger = 0 ) then
          DataProtesto    := StrToCurrDef(EmptyStr, 0)
        else
          DataProtesto    := (Vencimento + fdQryBancos.FieldByName('BCO_DIA_PROTESTO').AsInteger);

        PercentualMulta   := fdQryBancos.FieldByName('BCO_PERCENTUAL_JUROS').AsCurrency;  // Percentual de multa por dia de atraso.

        OcorrenciaOriginal.Tipo := toRemessaRegistrar;

        Instrucao1        := '00';
        Instrucao2        := '00';

        Mensagem.Text := sMensagem + #13 + StringReplace(Trim(edtMsgInstrucoes.Text), '<br>', '', [rfReplaceAll]);
      end;

      Inc(iProximoNossoNumero);

      CdsTitulos.Next;
    end;


    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar gerar boletos (ACBr).' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

procedure TfrmGeGerarBoleto.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGeGerarBoleto', TfrmGeGerarBoleto);

end.
