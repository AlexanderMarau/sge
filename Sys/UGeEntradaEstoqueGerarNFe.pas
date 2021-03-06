unit UGeEntradaEstoqueGerarNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, DB, IBCustomDataSet, IBUpdateSQL, StdCtrls, Mask,
  DBCtrls, ExtCtrls, Buttons, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmGeEntradaEstoqueGerarNFe = class(TfrmGrPadrao)
    cdsCompra: TIBDataSet;
    updCompra: TIBUpdateSQL;
    dtsCompra: TDataSource;
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblDataHora: TLabel;
    lblSerie: TLabel;
    lblNFe: TLabel;
    lblDataEmissao: TLabel;
    dbCodigo: TDBEdit;
    dbDataHora: TDBEdit;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
    dbDataEmissao: TDBEdit;
    lblHoraEmissao: TLabel;
    dbHoraEmissao: TDBEdit;
    Bevel1: TBevel;
    GrpBxImposto: TGroupBox;
    Bevel2: TBevel;
    lblBaseICMS: TLabel;
    dbBaseICMS: TDBEdit;
    lblValorICMS: TLabel;
    dbValorICMS: TDBEdit;
    lblBaseICMSSubs: TLabel;
    dbBaseICMSSubs: TDBEdit;
    lblValorICMSSubs: TLabel;
    dbValorICMSSubs: TDBEdit;
    lblValorPIS: TLabel;
    dbValorPIS: TDBEdit;
    lblTotalProduto: TLabel;
    dbTotalProduto: TDBEdit;
    lblFrete: TLabel;
    dbFrete: TDBEdit;
    lblSeguro: TLabel;
    dbSeguro: TDBEdit;
    lblDesconto: TLabel;
    dbDesconto: TDBEdit;
    lblOutrasDespesas: TLabel;
    dbOutrasDespesas: TDBEdit;
    lblValorIPI: TLabel;
    dbValorIPI: TDBEdit;
    lblValorCOFINS: TLabel;
    dbValorCOFINS: TDBEdit;
    lblTotalNota: TLabel;
    dbTotalNota: TDBEdit;
    lblInforme: TLabel;
    TmrAlerta: TTimer;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    btnCalcular: TcxButton;
    cdsCompraANO: TSmallintField;
    cdsCompraCODCONTROL: TIntegerField;
    cdsCompraCODEMP: TIBStringField;
    cdsCompraCODFORN: TIntegerField;
    cdsCompraDTENT: TDateField;
    cdsCompraDTFINALIZACAO_COMPRA: TDateTimeField;
    cdsCompraDTEMISS: TDateField;
    cdsCompraHREMISS: TTimeField;
    cdsCompraNFSERIE: TIBStringField;
    cdsCompraNF: TIntegerField;
    cdsCompraNFCFOP: TIntegerField;
    cdsCompraSTATUS: TSmallintField;
    cdsCompraICMSBASE: TIBBCDField;
    cdsCompraICMSVALOR: TIBBCDField;
    cdsCompraICMSSUBSTBASE: TIBBCDField;
    cdsCompraICMSSUBSTVALOR: TIBBCDField;
    cdsCompraTOTALPROD: TIBBCDField;
    cdsCompraFRETE: TIBBCDField;
    cdsCompraIPI: TIBBCDField;
    cdsCompraVALORSEGURO: TIBBCDField;
    cdsCompraDESCONTO: TIBBCDField;
    cdsCompraVALORTOTAL_II: TIBBCDField;
    cdsCompraVALORTOTAL_IPI: TIBBCDField;
    cdsCompraVALORPIS: TIBBCDField;
    cdsCompraVALORCOFINS: TIBBCDField;
    cdsCompraOUTROSCUSTOS: TIBBCDField;
    cdsCompraTOTALNF: TIBBCDField;
    cdsCompraVALOR_TOTAL_IPI: TIBBCDField;
    cdsCompraVALOR_TOTAL_BRUTO: TFMTBCDField;
    cdsCompraVALOR_TOTAL_DESCONTO: TIBBCDField;
    cdsCompraVALOR_TOTAL_LIQUIDO: TFMTBCDField;
    cdsCompraVALOR_BASE_ICMS_NORMAL_ENTRADA: TFMTBCDField;
    cdsCompraVALOR_TOTAL_ICMS_NORMAL_ENTRADA: TFMTBCDField;
    cdsCompraVALOR_BASE_ICMS_NORMAL_SAIDA: TFMTBCDField;
    cdsCompraVALOR_TOTAL_ICMS_NORMAL_SAIDA: TFMTBCDField;
    cdsCompraVALOR_TOTAL_ICMS_NORMAL_DEVIDO: TFMTBCDField;
    cdsCompraVALOR_TOTAL_PIS: TFMTBCDField;
    cdsCompraVALOR_TOTAL_COFINS: TFMTBCDField;
    chkNaoInformarVencimento: TCheckBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TmrAlertaTimer(Sender: TObject);
  private
    { Private declarations }
    iSerieNFe,
    iNumeroNFe  : Integer;
    sFileNameXML ,
    sChaveNFE    ,
    sProtocoloNFE,
    sReciboNFE   : String;
    iNumeroLote  : Int64;
    procedure RecalcularTotalNota;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBCOMPRAS
  - TBCOMPRASITENS
  - TBPRODUTO

  Views:

  Procedures:

*)

var
  frmGeEntradaEstoqueGerarNFe: TfrmGeEntradaEstoqueGerarNFe;

  function GerarNFeEntrada(const AOwer : TComponent; Ano : Smallint; Numero : Integer;
    var SerieNFe, NumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE   : String; var NumeroLote  : Int64) : Boolean;

implementation

uses UDMBusiness, UDMNFe, UFuncoes, UGeConsultarLoteNFe_v2;

{$R *.dfm}

function GerarNFeEntrada(const AOwer : TComponent; Ano : Smallint; Numero : Integer;
  var SerieNFe, NumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE   : String; var NumeroLote  : Int64) : Boolean;
var
  frm : TfrmGeEntradaEstoqueGerarNFe;
begin
  frm := TfrmGeEntradaEstoqueGerarNFe.Create(AOwer);
  try
    with frm do
    begin
      cdsCompra.Close;
      cdsCompra.ParamByName('anoCompra').AsShort   := Ano;
      cdsCompra.ParamByName('numCompra').AsInteger := Numero;
      cdsCompra.Open;

      if ( not cdsCompra.IsEmpty ) then
      begin
        cdsCompra.Edit;

        if GetCfopDevolucao( cdsCompraNFCFOP.AsInteger ) then
        begin
          cdsCompraICMSBASE.Value   := cdsCompraVALOR_BASE_ICMS_NORMAL_SAIDA.AsCurrency;
          cdsCompraICMSVALOR.Value  := cdsCompraVALOR_TOTAL_ICMS_NORMAL_SAIDA.AsCurrency;
        end
        else
        begin
          cdsCompraICMSBASE.Value   := cdsCompraVALOR_BASE_ICMS_NORMAL_ENTRADA.AsCurrency;
          cdsCompraICMSVALOR.Value  := cdsCompraVALOR_TOTAL_ICMS_NORMAL_ENTRADA.AsCurrency;
        end;

        cdsCompraICMSSUBSTBASE.Value  := 0;
        cdsCompraICMSSUBSTVALOR.Value := 0;

//        cdsCompraNFE_VALOR_TOTAL_PRODUTO.Value   := cdsCompraVALOR_TOTAL_BRUTO.AsCurrency;
//        cdsCompraNFE_VALOR_FRETE.Value      := 0;
        cdsCompraVALORSEGURO.Value     := 0;
//        cdsCompraNFE_VALOR_DESCONTO.Value   := cdsCompraVALOR_TOTAL_DESCONTO.AsCurrency;
//        cdsCompraNFE_VALOR_OUTROS.Value     := 0;
        cdsCompraVALORTOTAL_IPI.Value  := cdsCompraIPI.AsCurrency;
        cdsCompraVALORPIS.Value        := cdsCompraVALOR_TOTAL_PIS.AsCurrency;
        cdsCompraVALORCOFINS.Value     := cdsCompraVALOR_TOTAL_COFINS.AsCurrency;
        cdsCompraVALORTOTAL_II.Value   := 0;

        RecalcularTotalNota;
      end;

      Result := (ShowModal = mrOk);

      if ( Result ) then
      begin
        SerieNFe     := iSerieNFe;
        NumeroNFe    := iNumeroNFe;
        FileNameXML  := sFileNameXML;
        ChaveNFE     := sChaveNFE;
        ProtocoloNFE := sProtocoloNFE;
        ReciboNFE    := sReciboNFE;
        NumeroLote   := iNumeroLote;
      end;
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeEntradaEstoqueGerarNFe.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeEntradaEstoqueGerarNFe.RecalcularTotalNota;
begin
  if ( not cdsCompra.IsEmpty ) then
  begin
    if ( cdsCompra.State <> dsEdit ) then
      cdsCompra.Edit;

      cdsCompraDTEMISS.Value := Date;
      cdsCompraHREMISS.Value := Time;

//    cdsCompraTOTALNF.AsCurrency := cdsCompraTOTALVENDA.AsCurrency + cdsCompraNFE_VALOR_ICMS_SUBST.AsCurrency + cdsCompraNFE_VALOR_FRETE.AsCurrency +
//                                   cdsCompraNFE_VALOR_SEGURO.AsCurrency + cdsCompraNFE_VALOR_OUTROS.AsCurrency;
  end;
end;

procedure TfrmGeEntradaEstoqueGerarNFe.btnCalcularClick(Sender: TObject);
begin
  RecalcularTotalNota;
  if ( (dbTotalNota.Visible) and (dbTotalNota.Enabled) ) then
    dbTotalNota.SetFocus;
end;

procedure TfrmGeEntradaEstoqueGerarNFe.btnConfirmarClick(Sender: TObject);
var
  bRT ,
  bOK : Boolean;
  sVN       ,
  sRecibo   ,
  sCompraID : String;
  aTipoMovimento : TTipoMovimento;
  aFileXML       : TStringList;
begin
(*
  IMR - 29/10/2018 :
    Implementa��o da rotina de tratamento das rejei��es sobre a duplicidade de notas
    fiscais.
*)

  if not GetConectedInternet then
  begin
    ShowWarning('Esta��o de trabalho sem acesso a Internet!');
    Exit;
  end;

  if chkNaoInformarVencimento.Checked then
    sVN := 'Alerta : Os vencimentos n�o ser�o informados na NF-e.' + #13#13
  else
    sVN := EmptyStr;

  DMNFe.LerConfiguracao(cdsCompraCODEMP.AsString, tipoDANFEFast);
  DMNFe.ValidarCnpjDocumento(cdsCompraCODEMP.AsString);
  if (Copy(DMNFe.GetCnpjCertificado, 1, 8) <> Copy(gUsuarioLogado.Empresa, 1, 8)) then
//  if (DMNFe.GetCnpjCertificado <> gUsuarioLogado.Empresa) then
  begin
    ShowWarning('A Empresa selecionada no login do sistema n�o est� de acordo com o Certificado informado!');
    Exit;
  end;

  if ( ShowConfirm(sVN + 'Confirma a gera��o da NF-e de Entrada?') ) then
  begin
    if ( cdsCompra.State = dsEdit ) then
    begin
      cdsCompra.Post;
      cdsCompra.ApplyUpdates;
      CommitTransaction;
    end;

    lblInforme.Visible := True;
    lblInforme.Caption := 'Gerando NF-e junto a SEFA. Aguarde . . . ';
    TmrAlerta.Enabled  := True;

    Application.ProcessMessages;

    if ( DMNFe.GerarNFeOnLine(cdsCompraCODEMP.AsString) ) then
      bOK := DMNFe.GerarNFeEntradaOnLineACBr ( cdsCompraCODEMP.AsString, cdsCompraCODFORN.AsInteger, cdsCompraANO.AsInteger, cdsCompraCODCONTROL.AsInteger,
               iSerieNFe, iNumeroNFe, sFileNameXML, sChaveNFE, sProtocoloNFE, sReciboNFE, iNumeroLote,
               chkNaoInformarVencimento.Checked, False)
    else
      bOK := DMNFe.GerarNFeEntradaOffLineACBr( cdsCompraCODEMP.AsString, cdsCompraCODFORN.AsInteger, cdsCompraANO.AsInteger, cdsCompraCODCONTROL.AsInteger,
               iSerieNFe, iNumeroNFe, sFileNameXML, sChaveNFE,
               chkNaoInformarVencimento.Checked, False);

//    if bDenegada then
//    begin
//      cdsVenda.Edit;
//
//      cdsVendaNFE_DENEGADA.AsInteger       := 1;
//      cdsVendaNFE_DENEGADA_MOTIVO.AsString := AnsiUpperCase(Trim(sDenegadaMotivo));
//
//      cdsVenda.Post;
//      cdsVenda.ApplyUpdates;
//      CommitTransaction;
//    end;
//
    if not bOk then
    begin
      // Refei��o: Duplicidade de NF-e [nRec:999999999999999]
      // 1. Verificar se a mensagem de rejei��o � sobre a duplica��o da NF-e.
      // 2. Pegar o n�mero de recibo retornado e buscar na SEFA a NF-e correspondente
      // 3. Identificar a venda nesta NF-e encontrada
      // 4. Comparar a venda encontrada com a venda corrente
      // 5. Se as vendas forem iguais, colocar [nRec:999999999999999] na venda corrente

      if ((DMNFe.MensagemErro) <> EmptyStr) then
      begin
        aFileXML := TStringList.Create;
        try
          if (Pos('Duplicidade de NF-e', DMNFe.MensagemErro) > 0) then   // Passo 1
          begin
            sRecibo := StrOnlyNumbers( Copy(DMNFe.MensagemErro,          // Passo 2.1
              Pos('[nRec:', DMNFe.MensagemErro),
              Pos(']', DMNFe.MensagemErro)) );
            if ((Trim(sRecibo) <> EmptyStr) and (Trim(sRecibo) <> '000000000000000')) then // Passo 2.2
            begin
              bRT := BuscarRetornoReciboNFe(Self
                , cdsCompraCODEMP.AsString
                , Trim(sRecibo)
                , iSerieNFe
                , iNumeroNFe
                , sFileNameXML
                , sChaveNFE
                , sProtocoloNFE
                , aTipoMovimento);

              if bRT and (aTipoMovimento = tmNFeEntrada) then
              begin
                sReciboNFE  := Trim(sRecibo);
                iNumeroLote := iNumeroNFe;

                // Analisar o nome do arquivo XML retornado
                if (Trim(sFileNameXML) = EmptyStr) or (not FileExists(sFileNameXML)) then
                  sFileNameXML := DMNFe.GetDiretorioXmlNFe + sChaveNFE + '-nfe.xml';

                if FileExists(sFileNameXML) then                         // Passo 3
                begin
                  aFileXML.LoadFromFile(sFileNameXML);
                  sCompraID := 'Venda: ' + cdsCompra.FieldByName('ANO').AsString + '/' + FormatFloat('###0000000', cdsCompra.FieldByName('CODCONTROL').AsInteger);
                  if (Pos(sCompraID, aFileXML.Text) > 0) then            // Passo 3, 4
                  begin
                    sReciboNFE  := Trim(sRecibo);
                    iNumeroLote := iNumeroNFe;
                    DMNFe.GuardarLoteNFeEntrada(
                        cdsCompraCODEMP.AsString
                      , cdsCompra.FieldByName('ANO').AsInteger
                      , cdsCompra.FieldByName('CODCONTROL').AsInteger
                      , iNumeroLote
                      , sReciboNFE);                                     // Passo 5
                  end;
                end;
              end;
            end;
          end;
        finally
          aFileXML.Free;
        end;
      end;

    end;

    TmrAlerta.Enabled  := False;
    lblInforme.Visible := False;

    if ( bOK ) then
      ModalResult := mrOk
    else
      ModalResult := mrCancel;
  end;
end;

procedure TfrmGeEntradaEstoqueGerarNFe.FormCreate(Sender: TObject);
begin
  inherited;
  iSerieNFe     := 0;
  iNumeroNFe    := 0;
  sFileNameXML  := EmptyStr;
  sChaveNFE     := EmptyStr;
  sProtocoloNFE := EmptyStr;
  sReciboNFE    := EmptyStr;
  iNumeroLote   := 0;
  lblInforme.Caption := EmptyStr;
end;

procedure TfrmGeEntradaEstoqueGerarNFe.TmrAlertaTimer(Sender: TObject);
begin
  lblInforme.Visible := not lblInforme.Visible;
end;

procedure TfrmGeEntradaEstoqueGerarNFe.RegistrarRotinaSistema;
begin
  ;
end;

end.
