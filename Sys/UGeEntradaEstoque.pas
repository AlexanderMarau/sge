unit UGeEntradaEstoque;

interface

uses
  UDMBusiness,
  Clipbrd,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  IBX.IBTable, ToolWin, IBStoredProc, Menus, IBQuery, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxButtons, JvDBControls, JvExMask, JvToolEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TfrmGeEntradaEstoque = class(TfrmGrPadraoCadastro)
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblFornecedor: TLabel;
    lblDataEmissao: TLabel;
    lblNotaFiscal: TLabel;
    dbNotaFiscal: TDBEdit;
    lblSerie: TLabel;
    dbSerie: TDBEdit;
    lblDataEntrada: TLabel;
    lblCFOPNF: TLabel;
    dbCFOPNFDescricao: TDBEdit;
    qryProduto: TIBDataSet;
    qryCFOP: TIBDataSet;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
    dtsCondicaoPagto: TDataSource;
    lblSituacao: TLabel;
    dbSituacao: TDBEdit;
    GrpBxDadosValores: TGroupBox;
    lblValorFrete: TLabel;
    dbValorFrete: TDBEdit;
    lblBaseICMS: TLabel;
    dbBaseICMS: TDBEdit;
    lblBaseICMSSubs: TLabel;
    dbBaseICMSSubs: TDBEdit;
    lblTotalProduto: TLabel;
    dbTotalProduto: TDBEdit;
    lblValorOutros: TLabel;
    dbValorOutros: TDBEdit;
    dbTotalNotaFiscal: TDBEdit;
    lblTotalNotaFiscal: TLabel;
    dbValorDesconto: TDBEdit;
    lblValorDesconto: TLabel;
    dbValorIPI: TDBEdit;
    lblValorIPI: TLabel;
    dbValorICMSSubs: TDBEdit;
    lblValorICMSSubs: TLabel;
    dbValorICMS: TDBEdit;
    lblValorICMS: TLabel;
    Bevel5: TBevel;
    pgcMaisDados: TPageControl;
    tbsPagamento: TTabSheet;
    lblObservacao: TLabel;
    lblFormaPagto: TLabel;
    lblCondicaoPagto: TLabel;
    lblPrazo01: TLabel;
    lblPrazo02: TLabel;
    lblPrazo03: TLabel;
    lblPrazo04: TLabel;
    lblPrazo05: TLabel;
    lblPrazo06: TLabel;
    lblPrazo07: TLabel;
    lblPrazo08: TLabel;
    lblPrazo09: TLabel;
    lblPrazo10: TLabel;
    lblPrazo11: TLabel;
    lblPrazo12: TLabel;
    dbObservacao: TDBMemo;
    dbFormaPagto: TDBLookupComboBox;
    dbCondicaoPagto: TDBLookupComboBox;
    dbPrazo01: TDBEdit;
    dbPrazo02: TDBEdit;
    dbPrazo03: TDBEdit;
    dbPrazo04: TDBEdit;
    dbPrazo05: TDBEdit;
    dbPrazo06: TDBEdit;
    dbPrazo07: TDBEdit;
    dbPrazo08: TDBEdit;
    dbPrazo09: TDBEdit;
    dbPrazo10: TDBEdit;
    dbPrazo11: TDBEdit;
    dbPrazo12: TDBEdit;
    tbsDuplicatas: TTabSheet;
    Bevel6: TBevel;
    Bevel7: TBevel;
    pnlBotoesTitulo: TPanel;
    btnRegerarDuplicata: TBitBtn;
    btnTituloEditar: TBitBtn;
    btnTituloExcluir: TBitBtn;
    dbgTitulos: TDBGrid;
    Bevel9: TBevel;
    cdsTabelaItens: TIBDataSet;
    IbUpdTabelaItens: TIBUpdateSQL;
    DtSrcTabelaItens: TDataSource;
    qryDuplicatas: TIBDataSet;
    qryDuplicatasLancamento: TStringField;
    dtsDuplicatas: TDataSource;
    IbStrPrcGerarDuplicatas: TIBStoredProc;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblValorUnit: TLabel;
    lblUnidade: TLabel;
    lblParticipacao: TLabel;
    lblTotalBruto: TLabel;
    lblValorIPIProduto: TLabel;
    Bevel10: TBevel;
    dbProdutoNome: TDBEdit;
    dbQuantidade: TDBEdit;
    dbValorUnit: TDBEdit;
    dbUnidade: TDBEdit;
    dbParticipacao: TDBEdit;
    dbTotalBruto: TDBEdit;
    dbValorIPIProduto: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel11: TBevel;
    dbgProdutos: TDBGrid;
    lblFrete: TLabel;
    dbFrete: TDBEdit;
    lblDesconto: TLabel;
    dbDesconto: TDBEdit;
    lblOutros: TLabel;
    dbOutros: TDBEdit;
    lblCustoMedio: TLabel;
    dbCustoMedio: TDBEdit;
    IbDtstTabelaANO: TSmallintField;
    IbDtstTabelaCODCONTROL: TIntegerField;
    IbDtstTabelaCODEMP: TIBStringField;
    IbDtstTabelaCODFORN: TIntegerField;
    IbDtstTabelaNF: TIntegerField;
    IbDtstTabelaDTLANCAMENTO: TDateTimeField;
    IbDtstTabelaDTEMISS: TDateField;
    IbDtstTabelaDTENT: TDateField;
    IbDtstTabelaNFCFOP: TIntegerField;
    IbDtstTabelaNATUREZA: TIBStringField;
    IbDtstTabelaSTATUS: TSmallintField;
    IbDtstTabelaIPI: TIBBCDField;
    IbDtstTabelaICMSBASE: TIBBCDField;
    IbDtstTabelaICMSVALOR: TIBBCDField;
    IbDtstTabelaICMSSUBSTBASE: TIBBCDField;
    IbDtstTabelaICMSSUBSTVALOR: TIBBCDField;
    IbDtstTabelaFRETE: TIBBCDField;
    IbDtstTabelaOUTROSCUSTOS: TIBBCDField;
    IbDtstTabelaDESCONTO: TIBBCDField;
    IbDtstTabelaTOTALNF: TIBBCDField;
    IbDtstTabelaTOTALPROD: TIBBCDField;
    IbDtstTabelaOBS: TMemoField;
    IbDtstTabelaUSUARIO: TIBStringField;
    IbDtstTabelaFORMAPAGTO_COD: TSmallintField;
    IbDtstTabelaCONDICAOPAGTO_COD: TSmallintField;
    IbDtstTabelaCOMPRA_PRAZO: TSmallintField;
    IbDtstTabelaPRAZO_01: TSmallintField;
    IbDtstTabelaPRAZO_02: TSmallintField;
    IbDtstTabelaPRAZO_03: TSmallintField;
    IbDtstTabelaPRAZO_04: TSmallintField;
    IbDtstTabelaPRAZO_05: TSmallintField;
    IbDtstTabelaPRAZO_06: TSmallintField;
    IbDtstTabelaPRAZO_07: TSmallintField;
    IbDtstTabelaPRAZO_08: TSmallintField;
    IbDtstTabelaPRAZO_09: TSmallintField;
    IbDtstTabelaPRAZO_10: TSmallintField;
    IbDtstTabelaPRAZO_11: TSmallintField;
    IbDtstTabelaPRAZO_12: TSmallintField;
    IbDtstTabelaNOMEFORN: TIBStringField;
    IbDtstTabelaCNPJ: TIBStringField;
    IbDtstTabelaCFOP_DESCRICAO: TIBStringField;
    Bevel12: TBevel;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCODCONTROL: TIntegerField;
    cdsTabelaItensCODEMP: TIBStringField;
    cdsTabelaItensSEQ: TSmallintField;
    cdsTabelaItensCODPROD: TIBStringField;
    cdsTabelaItensCODFORN: TIntegerField;
    cdsTabelaItensDTENT: TDateField;
    cdsTabelaItensPRECOUNIT: TIBBCDField;
    cdsTabelaItensCUSTOMEDIO: TIBBCDField;
    cdsTabelaItensNF: TIntegerField;
    cdsTabelaItensPERC_PARTICIPACAO: TIBBCDField;
    cdsTabelaItensVALOR_FRETE: TIBBCDField;
    cdsTabelaItensVALOR_DESCONTO: TIBBCDField;
    cdsTabelaItensVALOR_OUTROS: TIBBCDField;
    cdsTabelaItensUNID_COD: TSmallintField;
    cdsTabelaItensUNP_SIGLA: TIBStringField;
    cdsTabelaItensVALOR_IPI: TIBBCDField;
    IbDtstTabelaDTFINALIZACAO_COMPRA: TDateTimeField;
    qryDuplicatasANOLANC: TSmallintField;
    qryDuplicatasNUMLANC: TIntegerField;
    qryDuplicatasPARCELA: TSmallintField;
    qryDuplicatasCODFORN: TSmallintField;
    qryDuplicatasNOMEFORN: TIBStringField;
    qryDuplicatasCNPJ: TIBStringField;
    qryDuplicatasNOTFISC: TIBStringField;
    qryDuplicatasTIPPAG: TIBStringField;
    qryDuplicatasDTEMISS: TDateField;
    qryDuplicatasDTVENC: TDateField;
    qryDuplicatasVALORPAG: TIBBCDField;
    qryDuplicatasBANCO: TSmallintField;
    qryDuplicatasBCO_NOME: TIBStringField;
    qryDuplicatasNUMCHQ: TIBStringField;
    qryDuplicatasPAGO_: TIBStringField;
    qryDuplicatasDOCBAIX: TIBStringField;
    IbUpdDuplicatas: TIBUpdateSQL;
    lblNCM_SH: TLabel;
    dbNCM_SH: TDBEdit;
    lblCST: TLabel;
    dbCST: TDBEdit;
    lblCFOPItem: TLabel;
    dbCFOPItem: TDBEdit;
    cdsTabelaItensNCM_SH: TIBStringField;
    cdsTabelaItensCST: TIBStringField;
    cdsTabelaItensCFOP: TIntegerField;
    lblEntradaAberta: TLabel;
    lblEntradaCancelada: TLabel;
    Label1: TLabel;
    lblData: TLabel;
    lblAliquota: TLabel;
    dbAliquota: TDBEdit;
    lblPercRedBC: TLabel;
    dbPercRedBC: TDBEdit;
    cdsTabelaItensALIQUOTA: TIBBCDField;
    cdsTabelaItensALIQUOTA_CSOSN: TIBBCDField;
    cdsTabelaItensALIQUOTA_PIS: TIBBCDField;
    cdsTabelaItensALIQUOTA_COFINS: TIBBCDField;
    cdsTabelaItensPERCENTUAL_REDUCAO_BC: TIBBCDField;
    ppImprimir: TPopupMenu;
    nmImprimirVenda: TMenuItem;
    N1: TMenuItem;
    nmImprimirDANFE: TMenuItem;
    nmGerarDANFEXML: TMenuItem;
    IbDtstTabelaNFSERIE: TIBStringField;
    IbDtstTabelaLOTE_NFE_ANO: TSmallintField;
    IbDtstTabelaLOTE_NFE_NUMERO: TIntegerField;
    IbDtstTabelaLOTE_NFE_RECIBO: TIBStringField;
    cdsTabelaItensQTDE: TIBBCDField;
    cdsTabelaItensQTDEANTES: TIBBCDField;
    cdsTabelaItensQTDEFINAL: TIBBCDField;
    cdsTabelaItensESTOQUE: TIBBCDField;
    lblAutorizacao: TLabel;
    IbDtstTabelaAUTORIZACAO_ANO: TSmallintField;
    IbDtstTabelaAUTORIZACAO_CODIGO: TIntegerField;
    IbDtstTabelaAUTORIZACAO_EMPRESA: TIBStringField;
    qryTipoDespesa: TIBQuery;
    dtsTpDespesa: TDataSource;
    IbDtstTabelaTIPO_DESPESA: TSmallintField;
    Bevel13: TBevel;
    lblTipoDespesa: TLabel;
    dbTipoDespesa: TDBLookupComboBox;
    lblTipoDocumento: TLabel;
    dbTipoDocumento: TDBLookupComboBox;
    tblTipoDocumento: TIBTable;
    dtsTipoDocumento: TDataSource;
    IbDtstTabelaTIPO_ENTRADA: TSmallintField;
    IbDtstTabelaTIPO_DOCUMENTO: TSmallintField;
    tblTipoEntrada: TIBTable;
    dtsTipoEntrada: TDataSource;
    lblTipoEntrada: TLabel;
    dbTipoEntrada: TDBLookupComboBox;
    IbDtstTabelaTIPO_MOVIMENTO: TSmallintField;
    btbtnFinalizar: TcxButton;
    btbtnGerarNFe: TcxButton;
    btbtnCancelarENT: TcxButton;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    dbFornecedor: TJvDBComboEdit;
    dbCFOPNF: TJvDBComboEdit;
    dbAutorizacao: TJvDBComboEdit;
    dbProduto: TJvDBComboEdit;
    dbDataEmissao: TJvDBDateEdit;
    dbDataEntrada: TJvDBDateEdit;
    qryNFE: TIBDataSet;
    qryNFEEMPRESA: TIBStringField;
    qryNFEANOVENDA: TSmallintField;
    qryNFENUMVENDA: TIntegerField;
    qryNFEANOCOMPRA: TSmallintField;
    qryNFENUMCOMPRA: TIntegerField;
    qryNFEDATAEMISSAO: TDateField;
    qryNFEHORAEMISSAO: TTimeField;
    qryNFESERIE: TIBStringField;
    qryNFENUMERO: TIntegerField;
    qryNFEMODELO: TSmallintField;
    qryNFEVERSAO: TSmallintField;
    qryNFECHAVE: TIBStringField;
    qryNFEPROTOCOLO: TIBStringField;
    qryNFERECIBO: TIBStringField;
    qryNFEXML_FILENAME: TIBStringField;
    qryNFEXML_FILE: TMemoField;
    qryNFELOTE_ANO: TSmallintField;
    qryNFELOTE_NUM: TIntegerField;
    updNFE: TIBUpdateSQL;
    dtsNFE: TDataSource;
    TbsInformeNFe: TTabSheet;
    lblLogNFeLote: TLabel;
    dbLogNFeLote: TDBEdit;
    lblLogNFeLoteDataEmissao: TLabel;
    d1LogNFeLoteDataEmissao: TDBEdit;
    d2LogNFeLoteDataEmissao: TDBEdit;
    lblLogNFeLoteRecibo: TLabel;
    dbLogNFeLoteRecibo: TDBEdit;
    lblLogNFeLoteProtocolo: TLabel;
    dbLogNFeLoteProtocolo: TDBEdit;
    lblLogNFeUsuario: TLabel;
    dbLogNFeUsuario: TDBEdit;
    lblLogNFeLoteChave: TLabel;
    dbLogNFeLoteChave: TDBEdit;
    BtnLimparDadosNFe: TSpeedButton;
    lblLogNFeLoteArquivo: TLabel;
    dbLogNFeLoteArquivo: TDBEdit;
    lblLogNFeCancelUsuario: TLabel;
    dbLogNFeCancelUsuario: TDBEdit;
    lblLogNFeCancelMotivo: TLabel;
    dbLogNFeCancelMotivo: TDBMemo;
    lblLogNFeDenegada: TLabel;
    dbLogNFeDenegada: TDBEdit;
    lblLogNFeCancelData: TLabel;
    dbLogNFeCancelData: TDBEdit;
    ppCorrigirDadosNFe: TPopupMenu;
    nmPpCorrigirDadosNFeCFOP: TMenuItem;
    BtnCorrigirDadosNFe: TSpeedButton;
    popupAuditoria: TPopupMenu;
    nmPpLimparDadosNFe: TMenuItem;
    N2: TMenuItem;
    nmPpReciboNFe: TMenuItem;
    nmPpChaveNFe: TMenuItem;
    nmPpArquivoNFe: TMenuItem;
    IbDtstTabelaVERIFICADOR_NFE: TIBStringField;
    IbDtstTabelaXML_NFE_FILENAME: TIBStringField;
    IbDtstTabelaCANCEL_USUARIO: TIBStringField;
    IbDtstTabelaCANCEL_DATAHORA: TDateTimeField;
    IbDtstTabelaCANCEL_MOTIVO: TMemoField;
    cdsTabelaItensTOTAL_BRUTO: TIBBCDField;
    cdsTabelaItensTOTAL_LIQUIDO: TIBBCDField;
    cdsTabelaItensCSOSN: TIBStringField;
    lblCSOSN: TLabel;
    dbCSOSN: TDBEdit;
    IbDtstTabelaCALCULAR_TOTAIS: TSmallintField;
    dbCalcularTotais: TDBCheckBox;
    qryAutorizacaoProduto: TIBDataSet;
    qryDuplicatasSITUACAO: TSmallintField;
    qryDuplicatasSITUACAO_DESC: TIBStringField;
    cdsTabelaItensDESCRI: TIBStringField;
    fdQryEmpresa: TFDQuery;
    cdsTabelaItensESTOQUE_APROP_LOTE: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure IbDtstTabelaSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure dbCondicaoPagtoClick(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure IbDtstTabelaBeforeCancel(DataSet: TDataSet);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
    procedure btbtnFinalizarClick(Sender: TObject);
    procedure qryDuplicatasCalcFields(DataSet: TDataSet);
    procedure btnRegerarDuplicataClick(Sender: TObject);
    procedure dbCFOPNFButtonClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnCancelarENTClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btbtnGerarNFeClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure nmImprimirDANFEClick(Sender: TObject);
    procedure nmGerarDANFEXMLClick(Sender: TObject);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
    procedure dbAutorizacaoButtonClick(Sender: TObject);
    procedure IbDtstTabelaAUTORIZACAO_CODIGOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure IbDtstTabelaAfterCancel(DataSet: TDataSet);
    procedure nmPpCorrigirDadosNFeCFOPClick(Sender: TObject);
    procedure BtnCorrigirDadosNFeClick(Sender: TObject);
    procedure nmPpLimparDadosNFeClick(Sender: TObject);
    procedure nmPpReciboNFeClick(Sender: TObject);
    procedure nmPpChaveNFeClick(Sender: TObject);
    procedure nmPpArquivoNFeClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FEmpresa : String;
    FTipoMovimento : TTipoMovimentoEntrada;
    FApenasFinalizadas : Boolean;
    SQL_Itens   ,
    SQL_Duplicatas : TStringList;
    FValorTotalProduto : Currency;
    procedure AbrirTabelaItens(const AnoCompra : Smallint; const ControleCompra : Integer);
    procedure AbrirTabelaDuplicatas(const AnoCompra : Smallint; const ControleCompra : Integer);
    procedure AbrirNotaFiscal(const Empresa : String; const AnoCompra : Smallint; const ControleCompra : Integer);
    procedure GerarDuplicatas(const AnoCompra : Smallint; const ControleCompra : Integer);
    procedure CarregarDadosProduto( Codigo : Integer);
    procedure CarregarDadosCFOP( iCodigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure InserirItensAutorizacao;

    function GetRotinaFinalizarID : String;
    function GetRotinaGerarNFeID : String;
    function GetRotinaCancelarEntradaID : String;
    function LoteProdutoPendente  : Boolean;

    procedure RegistrarNovaRotinaSistema;
    procedure CarregarTipoDespesa(const ApenasAtivos : Boolean);
  public
    { Public declarations }
    procedure pgcGuiasOnChange; override;

    property TipoMovimento : TTipoMovimentoEntrada read FTipoMovimento write FTipoMovimento;
    property ApenasFinalizadas : Boolean read FApenasFinalizadas write FApenasFinalizadas;
    property RotinaFinalizarID       : String read GetRotinaFinalizarID;
    property RotinaGerarNFeID        : String read GetRotinaGerarNFeID;
    property RotinaCancelarEntradaID : String read GetRotinaCancelarEntradaID;
  end;

(*
  Tabelas:
  - TBCOMRAS
  - TBCOMPRASITENS
  - TBEMPRESA
  - TBFORNECEDOR
  - TBCFOP
  - TBAUTORIZA_COMPRA
  - TBAUTORIZA_COMPRAITEM
  - TBPRODUTO
  - TBUNIDADEPROD

  Views:
  - VW_EMPRESA

  Procedures:

*)

var
  frmGeEntradaEstoque: TfrmGeEntradaEstoque;

  procedure MostrarControleCompras(const AOwner : TComponent);
  procedure MostrarControleCompraServicos(const AOwner : TComponent);

  function SelecionarEntrada(const AOwner : TComponent; var Ano, Controle : Integer; var Empresa : String) : Boolean;
  function SelecionarNFParaDevolver(const AOwner : TComponent; var Ano, Controle : Integer;
    var Empresa : String; var Emissao : TDateTime; var Serie, Numero, UF, Cnpj, IE : String) : Boolean;

implementation

uses
  UConstantesDGE, DateUtils, UGeCondicaoPagto, UGeProduto, UGeTabelaCFOP, UGeFornecedor,
  UFuncoes, UDMNFe, UGeConsultarLoteNFe_v2,
  {$IFNDEF DGE}UGeAutorizacaoCompra,{$ENDIF}
  UGeEntradaEstoqueLote, UGeEntradaEstoqueCancelar, UGeEntradaConfirmaDuplicatas, UGeEntradaEstoqueGerarNFe,
  UGeEntradaEstoqueDevolucaoNF;

{$R *.dfm}

procedure MostrarControleCompras(const AOwner : TComponent);
var
  frm : TfrmGeEntradaEstoque;
  whr : String;
begin
  frm := TfrmGeEntradaEstoque.Create(AOwner);
  try
    frm.TipoMovimento := tmeProduto;
    frm.Caption       := 'Controle de Entradas de Produtos';
    frm.RotinaID      := ROTINA_ENT_PRODUTO_ID;

    whr :=
      '(c.tipo_movimento = ' + IntToStr(Ord(frm.TipoMovimento)) + ') and cast(c.dtent as date) between ' +
          QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
          QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) ) + ' and ' +
      ' (c.codemp in ( ' +
      '    Select      ' +
      '      vw.cnpj   ' +
      '    from VW_EMPRESA vw' +
      ' ))';

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
      SelectSQL.Add('order by ' + CampoOrdenacao);
      Open;
    end;

    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure MostrarControleCompraServicos(const AOwner : TComponent);
var
  frm : TfrmGeEntradaEstoque;
  whr : String;
begin
  frm := TfrmGeEntradaEstoque.Create(AOwner);
  try
    frm.TipoMovimento := tmeServico;
    frm.Caption       := 'Controle de Entradas de Servi�os';
    frm.RotinaID      := ROTINA_ENT_SERVICO_ID;

    whr :=
      '(c.tipo_movimento = ' + IntToStr(Ord(frm.TipoMovimento)) + ') and cast(c.dtent as date) between ' +
        QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
        QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) ) + ' and ' +
      ' (c.codemp in ( ' +
      '    Select      ' +
      '      vw.cnpj   ' +
      '    from VW_EMPRESA vw' +
      ' ))';

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
      SelectSQL.Add('order by ' + CampoOrdenacao);
      Open;
    end;

    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarEntrada(const AOwner : TComponent; var Ano, Controle : Integer; var Empresa : String) : Boolean;
var
  frm : TfrmGeEntradaEstoque;
  whr : String;
begin
  frm := TfrmGeEntradaEstoque.Create(AOwner);
  try
    frm.btbtnSelecionar.Visible := True;

    frm.TipoMovimento     := tmeProduto;
    frm.ApenasFinalizadas := True;
    frm.Caption           := 'Controle de Entradas de Produtos';
    frm.RotinaID          := ROTINA_ENT_PRODUTO_ID;

    frm.btbtnIncluir.Visible  := False;
    frm.btbtnAlterar.Visible  := False;
    frm.btbtnExcluir.Visible  := False;
    frm.btbtnFinalizar.Visible   := False;
    frm.btbtnCancelarENT.Visible := False;
    frm.btbtnGerarNFe.Visible    := False;

    if frm.ApenasFinalizadas then
      whr := '(c.status in (' + IntToStr(STATUS_CMP_FIN) + ', ' + IntToStr(STATUS_CMP_NFE) + ')) and '
    else
      whr := EmptyStr;

    whr := whr +
      '(c.tipo_movimento = ' + IntToStr(Ord(frm.TipoMovimento)) + ') and cast(c.dtent as date) between ' +
        QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
        QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) ) + ' and ' +
      ' (c.codemp in ( ' +
      '    Select      ' +
      '      vw.cnpj   ' +
      '    from VW_EMPRESA vw' +
      ' ))';

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
      SelectSQL.Add('order by ' + CampoOrdenacao);
      Open;
    end;

    Result := (frm.ShowModal = mrOk);

    if Result then
    begin
      Ano      := frm.IbDtstTabelaANO.AsInteger;
      Controle := frm.IbDtstTabelaCODCONTROL.AsInteger;
      Empresa  := frm.IbDtstTabelaCODEMP.AsString;
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarNFParaDevolver(const AOwner : TComponent; var Ano, Controle : Integer;
  var Empresa : String; var Emissao : TDateTime; var Serie, Numero, UF, Cnpj, IE : String) : Boolean;
var
  sWhr  : String;
  AForm : TfrmGeEntradaEstoque;
begin
  AForm := TfrmGeEntradaEstoque.Create(AOwner);
  try
    with AForm do
    begin
      btbtnSelecionar.Visible := True;

      TipoMovimento     := tmeProduto;
      ApenasFinalizadas := True;
      FEmpresa          := Trim(Empresa);
      Caption           := 'Controle de Entradas de Produtos';
      RotinaID          := ROTINA_ENT_PRODUTO_ID;

      btbtnIncluir.Visible  := False;
      btbtnAlterar.Visible  := False;
      btbtnExcluir.Visible  := False;
      btbtnFinalizar.Visible   := False;
      btbtnCancelarENT.Visible := False;
      btbtnGerarNFe.Visible    := False;

      sWhr :=
        '(c.status in (' + IntToStr(STATUS_CMP_FIN) + ', ' + IntToStr(STATUS_CMP_NFE) + ')) and ' +
        '(c.tipo_movimento = ' + IntToStr(Ord(TipoMovimento)) + ') and cast(c.dtent as date) between ' +
          QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
          QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ' and ' +
        ' (c.codemp = ' + QuotedStr(FEmpresa) + ')' + ' and ' +
        ' (c.codemp in ( ' +
        '    Select      ' +
        '      vw.cnpj   ' +
        '    from VW_EMPRESA vw' +
        ' ))';

      WhereAdditional := sWhr;

      Result := (ShowModal = mrOk);

      if Result then
      begin
        Ano      := IbDtstTabelaANO.AsInteger;
        Controle := IbDtstTabelaCODCONTROL.AsInteger;
        Empresa  := IbDtstTabelaCODEMP.AsString;
        Emissao  := IbDtstTabelaDTEMISS.AsDateTime;
        Serie    := IbDtstTabelaNFSERIE.AsString;
        Numero   := FormatFloat('###0000000', IbDtstTabelaNF.AsInteger);
        UF       := EmptyStr;
        Cnpj     := IbDtstTabelaCNPJ.AsString;
        IE       := EmptyStr;
      end;
    end;

  finally
    AForm.Free;
  end;
end;

procedure TfrmGeEntradaEstoque.FormCreate(Sender: TObject);

  procedure OcutarCampoAutorizacao;
  begin
    dbCFOPNFDescricao.Width := 273;
    lblSituacao.Left        := dbTipoEntrada.Left;
    dbSituacao.Left         := dbTipoEntrada.Left;
    dbSituacao.Width        := dbTipoEntrada.Width;
    lblAutorizacao.Visible  := False;
    dbAutorizacao.Visible   := False;
  end;

begin
  SetTipoDespesaPadrao;

  {$IFDEF DGE}
  OcutarCampoAutorizacao;
  {$ENDIF}

  {$IFNDEF DGE}
  if (gSistema.Codigo <> SISTEMA_GESTAO_OPME) then
    if not (GetSegmentoID(gUsuarioLogado.Empresa) in [SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_GERAL_ID]) then
      OcutarCampoAutorizacao;
  {$ENDIF}

  IbDtstTabela.GeneratorField.Generator := 'GEN_COMPRAS_CONTROLE_' + FormatFloat('0000', YearOf(Date));

  inherited;

  AbrirTabelaAuto := True;
  FEmpresa        := EmptyStr;

  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SelectSQL );

  SQL_Duplicatas := TStringList.Create;
  SQL_Duplicatas.Clear;
  SQL_Duplicatas.AddStrings( qryDuplicatas.SelectSQL );

  e1Data.Date      := GetDateDB - 30;
  e2Data.Date      := GetDateDB;
  ControlFirstEdit := dbEmpresa;

  CarregarLista(fdQryEmpresa);
  CarregarLista(tblFormaPagto);
  CarregarLista(tblCondicaoPagto);
  CarregarLista(tblTipoDocumento);
  CarregarLista(tblTipoEntrada);
  CarregarTipoDespesa(False);

  DisplayFormatCodigo := '###0000000';
  
  NomeTabela     := 'TBCOMPRAS';
  CampoCodigo    := 'Codcontrol';
  CampoDescricao := 'f.NomeForn';
  CampoOrdenacao := 'c.dtEnt, f.NomeForn';

  UpdateGenerator( 'where Ano = ' + FormatFloat('0000', YearOf(Date)) );

  dbCalcularTotais.Visible := GetEstacaoEmitiNFe(gUsuarioLogado.Empresa) and GetPermititEmissaoNFeEntrada(gUsuarioLogado.Empresa);
  btbtnGerarNFe.Visible    := GetEstacaoEmitiNFe(gUsuarioLogado.Empresa) and GetPermititEmissaoNFeEntrada(gUsuarioLogado.Empresa);

  TipoMovimento     := tmeProduto;
  ApenasFinalizadas := False;

  if not dbCalcularTotais.Visible then
    GrpBxDadosValores.Height := 76
  else
    GrpBxDadosValores.Height := 90;
end;

procedure TfrmGeEntradaEstoque.btnFiltrarClick(Sender: TObject);
var
  aValor : Currency;
begin
  if ApenasFinalizadas then
    WhereAdditional := '(c.status in (' + IntToStr(STATUS_CMP_FIN) + ', ' + IntToStr(STATUS_CMP_NFE) + ')) and '
  else
    WhereAdditional := EmptyStr;

  WhereAdditional := WhereAdditional +
    '(c.tipo_movimento = ' + IntToStr(Ord(TipoMovimento)) + ') and cast(c.dtent as date) between ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ' and ' +
    ' (c.codemp in ( ' +
    '    Select      ' +
    '      vw.cnpj   ' +
    '    from VW_EMPRESA vw' +
    ' ))';

  if ( Trim(FEmpresa) <> EmptyStr ) then
    WhereAdditional := WhereAdditional + ' and (c.codemp = ' + QuotedStr(FEmpresa) +')';

  // Buscar registro pelo Valor
  aValor := StrToCurrDef(StringReplace(Trim(edtFiltrar.Text), '.', '', [rfReplaceAll]), 0) * 100;
  if ((Pos(',', Trim(edtFiltrar.Text)) > 0) and (aValor > 0.0)) then
    WhereAdditional := WhereAdditional + ' and (c.index_valor = ' + CurrToStr(aValor) + ')';

  inherited;
end;

procedure TfrmGeEntradaEstoque.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  FValorTotalProduto := 0.0;

  IbDtstTabelaAno.Value     := YearOf(Now);
  IbDtstTabelaDTENT.Value   := Date;
  IbDtstTabelaDTLANCAMENTO.Value := Now;
  IbDtstTabelaCODEMP.Value       := gUsuarioLogado.Empresa;
  IbDtstTabelaFORMAPAGTO_COD.Value    := GetFormaPagtoIDDefault;
  IbDtstTabelaCONDICAOPAGTO_COD.Value := GetCondicaoPagtoIDDefault;

  if ( FTipoMovimento = tmeProduto ) then
  begin
    IbDtstTabelaNFCFOP.Value            := GetCfopEntradaIDDefault;
    IbDtstTabelaCFOP_DESCRICAO.Value    := GetCfopEntradaNomeDefault;
    IbDtstTabelaNATUREZA.Value          := IntToStr( GetCfopIDDefault );
  end
  else
  if ( FTipoMovimento = tmeServico ) then
  begin
    IbDtstTabelaNFCFOP.Clear;
    IbDtstTabelaCFOP_DESCRICAO.Clear;
    IbDtstTabelaNATUREZA.Clear;
  end;

  if GetEstacaoEmitiNFe(gUsuarioLogado.Empresa) and GetPermititEmissaoNFeEntrada(IbDtstTabelaCODEMP.AsString) then
    IbDtstTabelaCALCULAR_TOTAIS.Value := 1
  else
    IbDtstTabelaCALCULAR_TOTAIS.Value := 0;

  IbDtstTabelaTIPO_MOVIMENTO.Value  := Ord(FTipoMovimento);
  IbDtstTabelaSTATUS.Value          := STATUS_CMP_ABR;
  IbDtstTabelaCOMPRA_PRAZO.Value    := 0;
  IbDtstTabelaICMSBASE.Value        := 0;
  IbDtstTabelaICMSVALOR.Value       := 0;
  IbDtstTabelaICMSSUBSTBASE.Value   := 0;
  IbDtstTabelaICMSSUBSTVALOR.Value  := 0;
  IbDtstTabelaFRETE.Value           := 0;
  IbDtstTabelaOUTROSCUSTOS.Value    := 0;
  IbDtstTabelaIPI.Value             := 0;
  IbDtstTabelaDESCONTO.Value        := 0;
  IbDtstTabelaTOTALNF.Value         := 0;
  IbDtstTabelaTOTALPROD.Value       := 0;
  IbDtstTabelaUSUARIO.Value         := gUsuarioLogado.Login;
  IbDtstTabelaVERIFICADOR_NFE.Clear;
  IbDtstTabelaXML_NFE_FILENAME.Clear;
  IbDtstTabelaCODFORN.Clear;
  IbDtstTabelaTIPO_ENTRADA.Clear;
  IbDtstTabelaTIPO_DOCUMENTO.Clear;
  IbDtstTabelaTIPO_DESPESA.Clear;
  IbDtstTabelaAUTORIZACAO_ANO.Clear;
  IbDtstTabelaAUTORIZACAO_CODIGO.Clear;
  IbDtstTabelaAUTORIZACAO_EMPRESA.Clear;
end;

procedure TfrmGeEntradaEstoque.dbFornecedorButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ   ,
  sNome   : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarFornecedor(Self, iCodigo, sCNPJ, sNome) ) then
    begin
      IbDtstTabelaCODFORN.AsInteger := iCodigo;
      IbDtstTabelaCNPJ.AsString     := sCNPJ;
      IbDtstTabelaNOMEFORN.AsString := sNome;
    end;
end;

procedure TfrmGeEntradaEstoque.IbDtstTabelaSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case Sender.AsInteger of
    STATUS_CMP_ABR : Text := 'Aberta';
    STATUS_CMP_FIN : Text := 'Finalizada';
    STATUS_CMP_CAN : Text := 'Cancelada';
    STATUS_CMP_NFE : Text := 'NF-e Emitida';
    else
      Text := Sender.AsString;
  end;
end;

procedure TfrmGeEntradaEstoque.InserirItensAutorizacao;
var
  I : Integer;
  cPrecoUN : Currency;
begin
  with qryAutorizacaoProduto do
  begin
    Close;
    ParamByName('tipo').AsInteger := IfThen(TTipoMovimentoEntrada(IbDtstTabelaTIPO_MOVIMENTO.AsInteger) = tmeProduto, Ord(taICMS), Ord(taISS));
    ParamByName('ano').AsInteger  := IbDtstTabelaAUTORIZACAO_ANO.AsInteger;
    ParamByName('cod').AsInteger  := IbDtstTabelaAUTORIZACAO_CODIGO.AsInteger;
    ParamByName('emp').AsString   := IbDtstTabelaAUTORIZACAO_EMPRESA.AsString;
    Open;

    if not IsEmpty then
    begin
      AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger);
      cdsTabelaItens.First;
      while not cdsTabelaItens.Eof do
        cdsTabelaItens.Delete;
    end;

    I := 1;

    First;
    while not Eof do
    begin
      if ( FieldByName('quantidade').AsCurrency > 0.0 ) then
      begin
        cdsTabelaItens.Append;

        cdsTabelaItensSEQ.AsInteger := I;
        cdsTabelaItensCODPROD.Assign       ( FieldByName('produto') );
        cdsTabelaItensDESCRI.Assign        ( FieldByName('DESCRI') );
        cdsTabelaItensQTDE.Assign          ( FieldByName('quantidade') );
        cdsTabelaItensUNID_COD.Assign      ( FieldByName('unidade') );
        cdsTabelaItensUNP_SIGLA.Assign     ( FieldByName('unp_sigla') );
        cdsTabelaItensCFOP.Assign          ( FieldByName('codcfop') );
        cdsTabelaItensCST.Assign           ( FieldByName('cst') );
        cdsTabelaItensCSOSN.Assign         ( FieldByName('csosn') );
        cdsTabelaItensALIQUOTA.Assign      ( FieldByName('aliquota') );
        cdsTabelaItensPERCENTUAL_REDUCAO_BC.Assign      ( FieldByName('percentual_reducao_bc') );
        cdsTabelaItensALIQUOTA_CSOSN.Assign ( FieldByName('aliquota_csosn') );
        cdsTabelaItensALIQUOTA_PIS.Assign   ( FieldByName('aliquota_pis') );
        cdsTabelaItensALIQUOTA_COFINS.Assign( FieldByName('aliquota_cofins') );
        cdsTabelaItensQTDE.Assign           ( FieldByName('quantidade') );
        cdsTabelaItensQTDEANTES.Assign      ( FieldByName('estoque') );
        cdsTabelaItensQTDEFINAL.Assign      ( FieldByName('novo_estoque') );
        cdsTabelaItensPRECOUNIT.Assign      ( FieldByName('valor_unitario') );
        cdsTabelaItensVALOR_IPI.Assign      ( FieldByName('valor_ipi') );

        cPrecoUN := cdsTabelaItensPRECOUNIT.AsCurrency;

        cdsTabelaItensCUSTOMEDIO.AsCurrency  := cPrecoUN + cdsTabelaItensVALOR_IPI.AsCurrency;
        cdsTabelaItensTOTAL_BRUTO.AsCurrency := cPrecoUN * cdsTabelaItensQTDE.AsCurrency;
        cdsTabelaItensPERC_PARTICIPACAO.AsCurrency := cdsTabelaItensTOTAL_BRUTO.AsCurrency / IbDtstTabelaTOTALPROD.AsCurrency * 100;
        cdsTabelaItensVALOR_FRETE.Value            := cdsTabelaItensPERC_PARTICIPACAO.Value * IbDtstTabelaFRETE.Value / 100;
        cdsTabelaItensVALOR_DESCONTO.Value         := cdsTabelaItensPERC_PARTICIPACAO.Value * IbDtstTabelaDESCONTO.Value / 100;
        cdsTabelaItensVALOR_OUTROS.Value           := cdsTabelaItensPERC_PARTICIPACAO.Value * IbDtstTabelaOUTROSCUSTOS.Value / 100;
        cdsTabelaItensTOTAL_LIQUIDO.AsCurrency     := cdsTabelaItensTOTAL_BRUTO.AsCurrency - cdsTabelaItensVALOR_DESCONTO.AsCurrency; //cdsTabelaItensCUSTOMEDIO.AsCurrency * cdsTabelaItensQTDE.AsCurrency;

        cdsTabelaItens.Post;

        Inc(I);
      end;

      Next;
    end;
  end;
end;

function TfrmGeEntradaEstoque.LoteProdutoPendente: Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    aRetorno := (TTipoMovimentoEntrada(IbDtstTabelaTIPO_MOVIMENTO.AsInteger) = tmeProduto);

    // Verificar a pend�ncia na informa��o de lotes caso a entrada seja de produtos
    if aRetorno then
      with DMBusiness, fdQryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select');
        SQL.Add('  count(ci.seq) as pendentes');
        SQL.Add('from TBCOMPRASITENS ci');
        SQL.Add('  inner join TBPRODUTO pr on (pr.cod = ci.codprod and pr.estoque_aprop_lote = 1)');
        SQL.Add('where ci.ano        = ' + IbDtstTabelaANO.AsString);
        SQL.Add('  and ci.codcontrol = ' + IbDtstTabelaCODCONTROL.AsString);
        Open;

        aRetorno := (FieldByName('pendentes').AsInteger > 0);

        Close;
      end;
  finally
    Result := aRetorno;
  end;
end;

procedure TfrmGeEntradaEstoque.dbCondicaoPagtoClick(Sender: TObject);
var
  I : Integer;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( tblCondicaoPagto.Locate('cond_cod', dbCondicaoPagto.Field.AsInteger, []) ) then
    begin
      IbDtstTabelaCOMPRA_PRAZO.AsInteger := tblCondicaoPagto.FieldByName('Cond_prazo').AsInteger;
      for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
      begin
        IbDtstTabela.FieldByName('PRAZO_' + FormatFloat('00', I)).Clear;
        if ( not tblCondicaoPagto.FieldByName('Cond_prazo_' + FormatFloat('00', I)).IsNull ) then
          IbDtstTabela.FieldByName('PRAZO_' + FormatFloat('00', I)).AsInteger := tblCondicaoPagto.FieldByName('Cond_prazo_' + FormatFloat('00', I)).AsInteger;
      end;
    end;
end;

procedure TfrmGeEntradaEstoque.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (Field = IbDtstTabelaTOTALPROD) then
    FValorTotalProduto := IbDtstTabelaTOTALPROD.AsCurrency;
end;

procedure TfrmGeEntradaEstoque.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( cdsTabelaItens.State in [dsEdit, dsInsert] );

  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TfrmGeEntradaEstoque.AbrirTabelaItens(const AnoCompra: Smallint;
  const ControleCompra: Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.Ano        = ' + IntToStr(AnoCompra));
    Add('  and i.Codcontrol = ' + IntToStr(ControleCompra));
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeEntradaEstoque.AbrirTabelaDuplicatas(
  const AnoCompra: Smallint; const ControleCompra: Integer);
begin
  qryDuplicatas.Close;

  with qryDuplicatas, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Duplicatas );
    Add('where p.AnoCompra = ' + IntToStr(AnoCompra));
    Add('  and p.NumCompra = ' + IntToStr(ControleCompra));
    Add('order by p.numlanc, p.parcela');
  end;

  qryDuplicatas.Open;
end;

procedure TfrmGeEntradaEstoque.CarregarDadosProduto(Codigo : Integer);
begin
  if ( not cdsTabelaItens.Active ) then
    Exit
  else
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    with qryProduto do
    begin
      Close;
      ParamByName('Codigo').AsInteger := Codigo;
      Open;
      if not IsEmpty then
      begin
        if not qryCFOP.Active then
          CarregarDadosCFOP( IbDtstTabelaNFCFOP.AsInteger );

        cdsTabelaItensCODPROD.AsString     := FieldByName('Cod').AsString;
        cdsTabelaItensDESCRI.AsString      := FieldByName('Descri').AsString;
        cdsTabelaItensUNP_SIGLA.AsString   := FieldByName('Unp_sigla').AsString;
        cdsTabelaItensQTDEANTES.AsCurrency := FieldByName('Qtde').AsCurrency;

        cdsTabelaItensNCM_SH.AsString                  := FieldByName('Ncm_sh').AsString;
        cdsTabelaItensALIQUOTA.AsCurrency              := FieldByName('Aliquota').AsCurrency;
        cdsTabelaItensALIQUOTA_CSOSN.AsCurrency        := FieldByName('Aliquota_csosn').AsCurrency;
        cdsTabelaItensALIQUOTA_PIS.AsCurrency          := FieldByName('Aliquota_pis').AsCurrency;
        cdsTabelaItensALIQUOTA_COFINS.AsCurrency       := FieldByName('Aliquota_cofins').AsCurrency;
        cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency := FieldByName('Percentual_reducao_BC').AsCurrency;

        if ( Trim(FieldByName('Cst').AsString) <> EmptyStr ) then
          cdsTabelaItensCST.AsString       := FieldByName('Cst').AsString;

        if ( Trim(FieldByName('Csosn').AsString) <> EmptyStr ) then
          cdsTabelaItensCSOSN.AsString     := FieldByName('Csosn').AsString;

        if ( (qryCFOP.FieldByName('Cfop_cst_padrao_entrada').AsString) <> EmptyStr ) then
          cdsTabelaItensCST.AsString := Trim(qryCFOP.FieldByName('Cfop_cst_padrao_entrada').AsString);

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          cdsTabelaItensUNID_COD.AsInteger   := FieldByName('Codunidade').AsInteger;
      end
      else
      begin
        ShowWarning('C�digo de ' + IfThen(FTipoMovimento = tmeProduto, 'produto', 'servi�o') + ' n�o cadastrado');
        cdsTabelaItensCODPROD.Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeEntradaEstoque.CarregarTipoDespesa(const ApenasAtivos: Boolean);
begin
  with qryTipoDespesa, Params do
  begin
    Close;
    ParamByName('ativo').AsInteger := IfThen(ApenasAtivos, 1, 0);
    ParamByName('todos').AsInteger := IfThen(ApenasAtivos, 0, 1);
    Open;

    Prior;
    Last;
  end;
end;

procedure TfrmGeEntradaEstoque.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btbtnFinalizar.Enabled   := ( IbDtstTabelaSTATUS.AsInteger < STATUS_CMP_FIN) and (not cdsTabelaItens.IsEmpty);
    btbtnCancelarENT.Enabled := ((IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_FIN) or (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_NFE)) and (not cdsTabelaItens.IsEmpty);
    btbtnGerarNFe.Enabled    := ( IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_FIN) and (not cdsTabelaItens.IsEmpty);

    nmImprimirDANFE.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_NFE);
    nmGerarDANFEXML.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_NFE);

    TbsInformeNFe.TabVisible    := (Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString) <> EmptyStr);
    nmPpLimparDadosNFe.Enabled  := (Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString) <> EmptyStr) and (Trim(dbLogNFeLoteProtocolo.Field.AsString) = EmptyStr);
    BtnLimparDadosNFe.Enabled   := (Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString) <> EmptyStr) and (Trim(dbLogNFeLoteProtocolo.Field.AsString) = EmptyStr);
    BtnCorrigirDadosNFe.Enabled      := (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_FIN) and (Trim(dbLogNFeLoteProtocolo.Field.AsString) = EmptyStr);
    nmPpCorrigirDadosNFeCFOP.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_FIN) and (Trim(dbLogNFeLoteProtocolo.Field.AsString) = EmptyStr);
  end
  else
  begin
    btbtnFinalizar.Enabled   := False;
    btbtnCancelarENT.Enabled := False;
    btbtnGerarNFe.Enabled    := False;

    nmImprimirDANFE.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_NFE);
    nmGerarDANFEXML.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_NFE);

    TbsInformeNFe.TabVisible    := (Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString) <> EmptyStr);
    nmPpLimparDadosNFe.Enabled  := (Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString) <> EmptyStr) and (Trim(dbLogNFeLoteProtocolo.Field.AsString) = EmptyStr);
    BtnLimparDadosNFe.Enabled   := (Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString) <> EmptyStr) and (Trim(dbLogNFeLoteProtocolo.Field.AsString) = EmptyStr);
    BtnCorrigirDadosNFe.Enabled      := False;
    nmPpCorrigirDadosNFeCFOP.Enabled := False;
  end;
end;

procedure TfrmGeEntradaEstoque.IbDtstTabelaBeforeCancel(DataSet: TDataSet);
begin
  inherited;
//  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
//  AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
end;

procedure TfrmGeEntradaEstoque.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;
  
  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_CMP_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_CMP_FIN : sMsg := 'Esta entrada n�o pode ser exclu�da porque est� finalizada.';
      STATUS_CMP_CAN : sMsg := 'Esta entrada n�o pode ser exclu�da porque est� cancelada';
      STATUS_CMP_NFE : sMsg := 'Esta entrada n�o pode ser exclu�da porque exite Nota Fiscal gerar para este movimento.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirNotaFiscal( IbDtstTabelaCODEMP.AsString, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    end;
  end;
end;

procedure TfrmGeEntradaEstoque.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := cdsTabelaItens.RecordCount + 1;
    while ( cdsTabelaItens.Locate('SEQ', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( IbDtstTabelaCODFORN.AsInteger = 0 ) then
  begin
    ShowInformation('Favor selecionar o Fornecedor primeiramente!');
    dbFornecedor.SetFocus;
  end
  else
  if ( IbDtstTabelaTOTALPROD.AsCurrency = 0 ) then
  begin
    ShowWarning('Favor informar valor Total de ' + IfThen(FTipoMovimento = tmeProduto, 'Produto(s)', 'Servi�o(s)') + '.');
    dbTotalProduto.SetFocus;
  end
  else
  if ( IbDtstTabelaTOTALNF.AsCurrency = 0 ) then
  begin
    ShowWarning('Favor informar valor Total da Nota Fiscal');
    dbTotalNotaFiscal.SetFocus;
  end
  else
  if ( cdsTabelaItens.Active ) then
  begin
    if ( gSistema.Codigo in [SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME] ) then
      if ( IbDtstTabelaAUTORIZACAO_CODIGO.Value > 0 ) then
        if ShowConfirmation('Deseja carregar automaticamente os itens da autoriza��o selecionada?') then
        begin
          InserirItensAutorizacao;
          Exit;
        end;

    GerarSequencial(Sequencial);

    cdsTabelaItens.Append;
    cdsTabelaItensSEQ.Value := Sequencial;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeEntradaEstoque.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbQuantidade.SetFocus;
  end;
end;

procedure TfrmGeEntradaEstoque.btnProdutoExcluirClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o �tem selecionado?') ) then
      cdsTabelaItens.Delete;
end;

procedure TfrmGeEntradaEstoque.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Bruto, Total_Desconto, Total_Liquido, vBC_ICMS, vICMS: Currency);
  var
    Item : Integer;
  begin
    Item         := cdsTabelaItensSEQ.AsInteger;
    Total_Bruto    := 0.0;
    Total_desconto := 0.0;
    Total_Liquido  := 0.0;
    vBC_ICMS       := 0.0;
    vICMS          := 0.0;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Total_Bruto    := Total_Bruto + cdsTabelaItensTOTAL_BRUTO.AsCurrency;

      if ( cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency > 0 ) then
      begin
        vBC_ICMS := vBC_ICMS + (cdsTabelaItensTOTAL_BRUTO.AsCurrency * cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency / 100);
        vICMS    := vICMS    + (((cdsTabelaItensTOTAL_BRUTO.AsCurrency * cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency / 100)) * cdsTabelaItensALIQUOTA.AsCurrency / 100);
      end
      else
      begin
        vBC_ICMS := vBC_ICMS + cdsTabelaItensTOTAL_BRUTO.AsCurrency;
        vICMS    := vICMS    + (cdsTabelaItensTOTAL_BRUTO.AsCurrency * cdsTabelaItensALIQUOTA.AsCurrency / 100);
      end;


      cdsTabelaItens.Next;
    end;

    Total_desconto := IbDtstTabelaDESCONTO.AsCurrency;
    Total_Liquido  := Total_Bruto - Total_desconto;

    cdsTabelaItens.Locate('SEQ', Item, []);
  end;

var
  cDescontos    ,
  cTotalBruto   ,
  cTotalDesconto,
  cTotalLiquido ,
  cValorBaseIcms,
  cValorIcms    : Currency;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(cdsTabelaItensCODPROD.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor selecionar o ' + lblProduto.Caption);
      dbProduto.SetFocus;
    end
    else
    if ( cdsTabelaItensQTDE.AsCurrency <= 0 ) then
    begin
      ShowWarning('Quantidade inv�lida.');
      dbQuantidade.SetFocus;
    end
    else
    if ( cdsTabelaItensPRECOUNIT.AsCurrency <= 0 ) then
    begin
      ShowWarning('Valor unit�rio inv�lida.');
      dbValorUnit.SetFocus;
    end
    else
    if ( cdsTabelaItensVALOR_IPI.AsCurrency < 0 ) then
    begin
      ShowWarning('Valor IPI inv�lida.');
      dbValorIPIProduto.SetFocus;
    end
    else
    begin

      cdsTabelaItens.Post;

      if ( dbCalcularTotais.Checked ) then
      begin
        GetToTais(cTotalBruto, cTotalDesconto, cTotalLiquido, cValorBaseIcms, cValorIcms);

        IbDtstTabelaICMSBASE.AsCurrency  := cValorBaseIcms;
        IbDtstTabelaICMSVALOR.AsCurrency := cValorIcms;
        IbDtstTabelaTOTALPROD.AsCurrency := cTotalBruto;
        IbDtstTabelaDESCONTO.AsCurrency  := cTotalDesconto;
        IbDtstTabelaTOTALNF.AsCurrency   := cTotalLiquido + IbDtstTabelaIPI.AsCurrency;
      end;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TfrmGeEntradaEstoque.btbtnSalvarClick(Sender: TObject);
begin
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) ' + IfThen(FTipoMovimento = tmeProduto, 'produto(s)', 'servi�o(s)') + ' da entrada.')
  else
  begin
    if (IbDtstTabelaTIPO_DOCUMENTO.AsInteger in [TIPO_DOCUMENTO_ENTRADA_AVULSA, TIPO_DOCUMENTO_ENTRADA_CONTRATO]) then
    begin
      IbDtstTabelaNF.Value      := IbDtstTabelaCODCONTROL.AsInteger;
      IbDtstTabelaNFSERIE.Value := TIPO_DOCUMENTO_SERIE_AVULSO;
    end;

    IbDtstTabelaNF.Required      := (IbDtstTabelaTIPO_DOCUMENTO.AsInteger in [TIPO_DOCUMENTO_ENTRADA_NOTA_FISCAL, TIPO_DOCUMENTO_ENTRADA_CUPOM, TIPO_DOCUMENTO_ENTRADA_NFE, TIPO_DOCUMENTO_ENTRADA_NFCE, TIPO_DOCUMENTO_ENTRADA_NFSE, TIPO_DOCUMENTO_ENTRADA_CTE]);
    IbDtstTabelaNFSERIE.Required := (IbDtstTabelaTIPO_DOCUMENTO.AsInteger in [TIPO_DOCUMENTO_ENTRADA_NOTA_FISCAL, TIPO_DOCUMENTO_ENTRADA_NFE, TIPO_DOCUMENTO_ENTRADA_NFCE]) and (TTipoMovimentoEntrada(IbDtstTabelaTIPO_MOVIMENTO.AsInteger) = tmeProduto);

    inherited;

    if ( not OcorreuErro ) then
    begin
      if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
        cdsTabelaItens.Post;

      cdsTabelaItens.ApplyUpdates;
      CommitTransaction;
    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeEntradaEstoque.ControlEditExit(Sender: TObject);
var
  cPrecoUN : Currency;
begin
  inherited;

  if ( Sender = dbCFOPNF ) then
    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      CarregarDadosCFOP( IbDtstTabelaNFCFOP.AsInteger );

  if ( Sender = dbProduto ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( cdsTabelaItensCODPROD.AsInteger );

  if ( Sender = dbQuantidade ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      cdsTabelaItensQTDEFINAL.Value := cdsTabelaItensQTDEANTES.Value + cdsTabelaItensQTDE.Value;

  if ( (Sender = dbValorUnit) or (Sender = dbValorIPIProduto) ) then
  begin
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    begin
      cPrecoUN := cdsTabelaItensPRECOUNIT.AsCurrency;

      cdsTabelaItensCUSTOMEDIO.AsCurrency  := cPrecoUN + cdsTabelaItensVALOR_IPI.AsCurrency;
      cdsTabelaItensTOTAL_BRUTO.AsCurrency := cPrecoUN * cdsTabelaItensQTDE.AsCurrency;

      if (FValorTotalProduto = 0.0) then
        FValorTotalProduto := IbDtstTabelaTOTALPROD.AsCurrency;

      if ( FValorTotalProduto > 0.0 ) then
      begin
        cdsTabelaItensPERC_PARTICIPACAO.AsCurrency := cdsTabelaItensTOTAL_BRUTO.AsCurrency / FValorTotalProduto * 100;
        cdsTabelaItensVALOR_FRETE.Value        := cdsTabelaItensPERC_PARTICIPACAO.Value * IbDtstTabelaFRETE.Value / 100;
        cdsTabelaItensVALOR_DESCONTO.Value     := cdsTabelaItensPERC_PARTICIPACAO.Value * IbDtstTabelaDESCONTO.Value / 100;
        cdsTabelaItensVALOR_OUTROS.Value       := cdsTabelaItensPERC_PARTICIPACAO.Value * IbDtstTabelaOUTROSCUSTOS.Value / 100;

        cdsTabelaItensTOTAL_LIQUIDO.AsCurrency := cdsTabelaItensTOTAL_BRUTO.AsCurrency - cdsTabelaItensVALOR_DESCONTO.AsCurrency; //cdsTabelaItensCUSTOMEDIO.AsCurrency * cdsTabelaItensQTDE.AsCurrency;
      end;
    end;
  end;

  if ( Sender = dbTotalBruto ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;

end;

procedure TfrmGeEntradaEstoque.pgcGuiasChange(Sender: TObject);
begin
  AbrirNotaFiscal( IbDtstTabelaCODEMP.AsString, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
end;

procedure TfrmGeEntradaEstoque.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    AbrirNotaFiscal( IbDtstTabelaCODEMP.AsString, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  end;
end;

procedure TfrmGeEntradaEstoque.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;
  
  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_CMP_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_CMP_FIN : sMsg := 'Esta entrada n�o pode ser alterada porque est� finalizada.';
      STATUS_CMP_CAN : sMsg := 'Esta entrada n�o pode ser alterada porque est� cancelada';
      STATUS_CMP_NFE : sMsg := 'Esta entrada n�o pode ser alterada porque exite Nota Fiscal gerada para este movimento.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirNotaFiscal( IbDtstTabelaCODEMP.AsString, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    end;
  end;
end;

procedure TfrmGeEntradaEstoque.dbProdutoButtonClick(Sender: TObject);
var
  bSelecionado : Boolean;
  iCodigo   ,
  iCFOP_CNAE,
  iUnidade  : Integer;
  iEstoque ,
  iReserva : Currency;
  sCodigoAlfa,
  sDescricao ,
  sUnidade   ,
  sNCM_SH    ,
  sCST       : String;
  cAliquota      ,
  cAliquotaPIS   ,
  cAliquotaCOFINS,
  cValorVenda,
  cValorPromocao,
  cValorIPI     ,
  cPercRedBC    ,
  cValorCusto   : Currency;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin

    cAliquota       := 0.0;
    cAliquotaPIS    := 0.0;
    cAliquotaCOFINS := 0.0;
    cValorVenda     := 0.0;
    cValorPromocao  := 0.0;
    cValorIPI       := 0.0;
    cPercRedBC      := 0.0;

    Case TTipoMovimentoEntrada(IbDtstTabelaTIPO_MOVIMENTO.AsInteger) of
      tmeProduto:
        bSelecionado := SelecionarProdutoParaEntrada(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, cValorCusto,
                          iEstoque, iReserva);

      tmeServico:
        bSelecionado := SelecionarServicoParaEntrada(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao);

      else
        bSelecionado := False;
    end;

    if bSelecionado then
    begin
      cdsTabelaItensCODPROD.AsString     := sCodigoAlfa;
      cdsTabelaItensDESCRI.AsString      := sDescricao;
      cdsTabelaItensUNP_SIGLA.AsString   := sUnidade;

      cdsTabelaItensNCM_SH.AsString                  := sNCM_SH;
      cdsTabelaItensCST.AsString                     := sCST;
      cdsTabelaItensALIQUOTA.AsCurrency              := cAliquota;
      cdsTabelaItensALIQUOTA_PIS.AsCurrency          := cAliquotaPIS;
      cdsTabelaItensALIQUOTA_COFINS.AsCurrency       := cAliquotaCOFINS;
      cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency := cPercRedBC;

      if (TTipoMovimentoEntrada(IbDtstTabelaTIPO_MOVIMENTO.AsInteger) = tmeProduto) then
      begin
        if not qryCFOP.Active then
          CarregarDadosCFOP( IbDtstTabelaNFCFOP.AsInteger );

        if ( (qryCFOP.FieldByName('Cfop_cst_padrao_entrada').AsString) <> EmptyStr ) then
          cdsTabelaItensCST.AsString := Trim(qryCFOP.FieldByName('Cfop_cst_padrao_entrada').AsString);
      end;

      if ( iUnidade > 0 ) then
        cdsTabelaItensUNID_COD.AsInteger := iUnidade;
    end;

  end;
end;

procedure TfrmGeEntradaEstoque.cdsTabelaItensNewRecord(DataSet: TDataSet);
begin
  cdsTabelaItensANO.Value        := IbDtstTabelaANO.Value;
  cdsTabelaItensCODCONTROL.Value := IbDtstTabelaCODCONTROL.Value;
  cdsTabelaItensDTENT.Value      := IbDtstTabelaDTENT.Value;
  cdsTabelaItensCODEMP.Value     := IbDtstTabelaCODEMP.Value;
  cdsTabelaItensCODFORN.Value    := IbDtstTabelaCODFORN.Value;
  cdsTabelaItensNF.Value         := IbDtstTabelaNF.Value;

  if ( FTipoMovimento = tmeProduto ) then
  begin
    if ( IbDtstTabelaNFCFOP.IsNull ) then
      cdsTabelaItensCFOP.Value := GetCfopIDDefault
    else
      cdsTabelaItensCFOP.Assign( IbDtstTabelaNFCFOP );
  end
  else
  if ( FTipoMovimento = tmeServico ) then
    cdsTabelaItensCFOP.Clear;

  cdsTabelaItensQTDE.Value      := 0;
  cdsTabelaItensQTDEANTES.Value := 0;
  cdsTabelaItensQTDEFINAL.Value := 0;

  cdsTabelaItensALIQUOTA.Value              := 0.0;
  cdsTabelaItensALIQUOTA_CSOSN.Value        := 0.0;
  cdsTabelaItensALIQUOTA_PIS.Value          := 0.0;
  cdsTabelaItensALIQUOTA_COFINS.Value       := 0.0;
  cdsTabelaItensPERCENTUAL_REDUCAO_BC.Value := 0.0;
end;

procedure TfrmGeEntradaEstoque.btbtnFinalizarClick(Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  pgcGuias.ActivePage := tbsCadastro;

  if (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_FIN) then
  begin
    ShowWarning('Movimento de Entrada j� est� finalizado!');
    Abort;
  end;

  if (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_OPME]) then
    if LoteProdutoPendente then
      if not LotesProdutosConfirmados(Self, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger) then
        Abort;

  IbDtstTabela.Edit;

  if ( IbDtstTabelaCODFORN.AsInteger = 0 ) then
  begin
    ShowWarning('Favor informar o fornecedor');
    dbFornecedor.SetFocus;
  end
  else
  if ( IbDtstTabelaTOTALPROD.AsCurrency = 0 ) then
  begin
    ShowWarning('Favor informar valor Total de ' + IfThen(FTipoMovimento = tmeProduto, 'Produtos', 'Servi�os'));
    dbTotalProduto.SetFocus;
  end
  else
  if ( IbDtstTabelaTOTALNF.AsCurrency = 0 ) then
  begin
    ShowWarning('Favor informar valor Total da Nota Fiscal');
    dbTotalNotaFiscal.SetFocus;
  end
  else
  if ( IbDtstTabelaFORMAPAGTO_COD.AsInteger = 0 ) then
  begin
    ShowWarning('Favor informar a forma de pagamento');
    dbFormaPagto.SetFocus;
  end
  else
  if ( IbDtstTabelaCONDICAOPAGTO_COD.AsInteger = 0 ) then
  begin
    ShowWarning('Favor informar a condi��o de pagamento');
    dbCondicaoPagto.SetFocus;
  end
  else
  if ( ShowConfirm('Confirma a finaliza��o da entrada selecionada?') ) then
  begin
    IbDtstTabelaSTATUS.Value               := STATUS_CMP_FIN;
    IbDtstTabelaDTFINALIZACAO_COMPRA.Value := Now;
    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;
    CommitTransaction;

    if GetCfopGerarDuplicata(IbDtstTabelaNFCFOP.AsInteger) then
      GerarDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

    AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

    ShowInformation('Entrada finalizada com sucesso !');

    if GetCfopGerarDuplicata(IbDtstTabelaNFCFOP.AsInteger) then
      if ( DuplicatasConfirmadas(Self, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger, IbDtstTabelaDTEMISS.AsDateTime, IbDtstTabelaTOTALNF.AsCurrency) ) then
        AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeEntradaEstoque.GerarDuplicatas(const AnoCompra: Smallint;
  const ControleCompra: Integer);
begin
  try

    try

      UpdateSequence('GEN_CONTAPAG_NUM_' + IntToStr(AnoCompra), 'TBCONTPAG', 'NUMLANC', 'where ANOLANC = ' + IntToStr(AnoCompra));

      with IbStrPrcGerarDuplicatas do
      begin
        ParamByName('anocompra').AsInteger := AnoCompra;
        ParamByName('numcompra').AsInteger := ControleCompra;
        ExecProc;
        CommitTransaction;
      end;

    except
      On E : Exception do
      begin
        DMBusiness.ibtrnsctnBusiness.Rollback;
        ShowError('Erro ao tentar gerar duplicatas.' + #13#13 + E.Message);
      end;
    end;

  finally
  end;
end;

procedure TfrmGeEntradaEstoque.qryDuplicatasCalcFields(DataSet: TDataSet);
begin
  qryDuplicatasLancamento.AsString := FormatFloat('0000', qryDuplicatasANOLANC.AsInteger) + FormatFloat('000000', qryDuplicatasNUMLANC.AsInteger);
end;

procedure TfrmGeEntradaEstoque.btnRegerarDuplicataClick(Sender: TObject);
begin
  if ( IbDtstTabelaSTATUS.AsInteger <> STATUS_CMP_FIN ) then
    ShowWarning('� permitida a gera��o de duplicatas apenas para entradas finalizadas')
  else
  if ( not qryDuplicatas.IsEmpty ) then
    ShowWarning('J� existe(m) duplicata(s) gerado(s) para esta entrada')
  else
  if ( ShowConfirm('Confirma gera��o do(s) duplicata(s) a receber da entrada?') ) then
  begin
    GerarDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  end;
end;

procedure TfrmGeEntradaEstoque.dbCFOPNFButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCFOP(Self, iCodigo, sDescricao) ) then
    begin
      IbDtstTabelaNFCFOP.AsInteger        := iCodigo;
      IbDtstTabelaCFOP_DESCRICAO.AsString := sDescricao;
    end;
end;

procedure TfrmGeEntradaEstoque.CarregarDadosCFOP(iCodigo: Integer);
begin
  if ( not IbDtstTabela.Active ) then
    Exit
  else
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
  begin
    with qryCFOP do
    begin
      Close;
      ParamByName('Cfop_cod').AsInteger := iCodigo;
      Open;
      
      if not IsEmpty then
        IbDtstTabelaCFOP_DESCRICAO.AsString := FieldByName('cfop_descricao').AsString
      else
      begin
        if ( TTipoMovimentoEntrada(IbDtstTabelaTIPO_MOVIMENTO.AsInteger) = tmeProduto ) then
          ShowWarning('C�digo CFOP n�o cadastrado');

        IbDtstTabelaNFCFOP.Clear;
        if ( dbCFOPNF.Visible and dbCFOPNF.Enabled ) then
          dbCFOPNF.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeEntradaEstoque.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex := 0;

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (IbDtstTabelaSTATUS.AsInteger < STATUS_CMP_FIN );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );

  CarregarTipoDespesa( (IbDtstTabela.State in [dsEdit, dsInsert]) );
end;

procedure TfrmGeEntradaEstoque.btbtnCancelarENTClick(Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

(*
  if ( PossuiTitulosPagos(IbDtstTabelaANO.Value, IbDtstTabelaCODCONTROL.Value) ) then
  begin
    ShowWarning('A compra possui despesa(s) j� baixada(s).' + #13 + 'Favor providenciar a exclus�o da(s) baixa(s) para que a compra possa ser cancelada!');
    Exit;
  end;
*)
  RecarregarRegistro;

  pgcGuias.ActivePage := tbsCadastro;

  if (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_CAN) then
  begin
    ShowWarning('Movimento de Entrada j� est� cancelado!');
    Abort;
  end;

  if ( CancelarENT(Self, IbDtstTabelaANO.Value, IbDtstTabelaCODCONTROL.Value) ) then
    with IbDtstTabela do
    begin
      RecarregarRegistro;

      ShowInformation('Entrada cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODCONTROL.AsInteger));

      HabilitarDesabilitar_Btns;
    end;
end;

procedure TfrmGeEntradaEstoque.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    if (not IbDtstTabelaSTATUS.IsNull) then
      // Destacar Movimento de Entrada Aberto
      if ( IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_ABR ) then
        dbgDados.Canvas.Font.Color := lblEntradaAberta.Font.Color
      else
      // Destacar Movimento de Entrada Cancelado
      if ( IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_CAN ) then
        dbgDados.Canvas.Font.Color := lblEntradaCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeEntradaEstoque.btbtnGerarNFeClick(Sender: TObject);
var
  iNumero    ,
  iSerieNFe  ,
  iNumeroNFe : Integer;
  sFileNameXML  ,
  sChaveNFE     ,
  sProtocoloNFE ,
  sReciboNFE    : String;
  iNumeroLote   : Int64;
  bNFeGerada    : Boolean;
  TipoMovimento : TTipoMovimento;
begin
{
  IMR - 02/08/2017 :
    Inser��o da fun��o "EmissaoNFE_Pendente()" para impedir que uma nota fiscal
    seja emitida se houver um outro pedido de emiss�o pendente.

  IMR - 08/12/2015 :
    Inser��o da valida��o do c�digo CFOP antes da gera��o da Nota Fiscal.

  IMR - 04/05/2015 :
    Inclus�o do bloco de c�digo para buscar o retorno NF-e quando esta j� fora
    solicitada, mas seu retorno ainda n�o fora processado pela aplica��o.

  IMR - 23/05/2015 :
    Inclus�o do bloco de c�digo para verificar se o CFOP da entrada corresponde
    a uma opera��o de devolu��o. Caso esta situa��o seja confirmada, a NF-e de
    origem ser� solicitada.
}
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  pgcGuias.ActivePage := tbsCadastro;

  bNFeGerada := (IbDtstTabelaNF.AsCurrency > 0) and (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_NFE);

  if (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_NFE) then
  begin
    ShowWarning('Movimento de Entrada j� est� com NF-e gerada!');
    Abort;
  end;

  if DMNFe.ConfigurarParamentoNFE(IbDtstTabelaCODEMP.AsString) then
  begin
    ShowInformation('A emiss�o da NF-e exige a configura��o dos par�metros da empresa.' + #13 + 'Favor entrar em contrato com suporte.');
    Exit;
  end;

  if not GetPermititEmissaoNFeEntrada( IbDtstTabelaCODEMP.AsString ) then
  begin
    ShowInformation('Empresa selecionada n�o habilitada para emiss�o de NF-e p/ Entradas.' + #13 + 'Favor entrar em contato com suporte.');
    Exit;
  end;

  if not DMNFe.ValidarCFOP(IbDtstTabelaCODEMP.AsString, 0, IbDtstTabelaCODFORN.AsInteger, IbDtstTabelaNFCFOP.AsInteger) then
    Exit;

  if ( not DelphiIsRunning ) then
    if not DMNFe.GetValidadeCertificado(IbDtstTabelaCODEMP.AsString) then
      Exit;

  if ( Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString) = EmptyStr ) then
    if GetCfopDevolucao( IbDtstTabelaNFCFOP.AsInteger ) then
      if not InformarDocumentoReferenciado(Self, IbDtstTabelaANO.Value, IbDtstTabelaCODCONTROL.Value) then
        Exit;

//  if ( IbDtstTabelaLOTE_NFE_NUMERO.AsInteger > 0 ) then
//  begin
//    ShowWarning('O processo de gera��o de NF-e para este movimento de entrada j� foi solicitado, mas n�o fora conclu�do.' + #13 +
//      'Favor consultar junto a SEFA e processar o Recibo/Lote de n�mero ' +
//        IbDtstTabelaLOTE_NFE_RECIBO.AsString + '/' +
//        FormatFloat('#########0', IbDtstTabelaLOTE_NFE_NUMERO.AsInteger));
//    Exit;
//  end;
//
  // Buscar retorno do envio pendente, caso ele tenha ocorrido
  if not bNFeGerada then
    if ( Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString) <> EmptyStr ) then
    begin
      bNFeGerada := BuscarRetornoReciboNFe(Self
        , IbDtstTabelaCODEMP.AsString
        , Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString)
        , iSerieNFe
        , iNumeroNFe
        , sFileNameXML
        , sChaveNFE
        , sProtocoloNFE
        , TipoMovimento);

      if not bNFeGerada then
        Exit;

      if ( TipoMovimento <> tmNFeEntrada ) then
      begin
        ShowWarning('Tipo do movimento do recibo incompat�vel!');
        Exit;
      end;

      sReciboNFE  := Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString);
      iNumeroLote := iNumeroNFe;
    end;

  if not bNFeGerada then
  begin
    if DMNFe.EmissaoNFE_Pendente(IbDtstTabelaCODEMP.AsString, True) then
      Abort;

    bNFeGerada := GerarNFeEntrada(Self
      , IbDtstTabelaANO.Value
      , IbDtstTabelaCODCONTROL.Value
      , iSerieNFe
      , iNumeroNFe
      , sFileNameXML
      , sChaveNFE
      , sProtocoloNFE
      , sReciboNFE
      , iNumeroLote);
  end;

  if bNFeGerada then
    with IbDtstTabela do
    begin
      iNumero := IbDtstTabelaCODCONTROL.AsInteger;

      with qryNFE do
      begin
        AbrirNotaFiscal( IbDtstTabelaCODEMP.AsString, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

        Append;

        qryNFEEMPRESA.Value     := IbDtstTabelaCODEMP.AsString;
        qryNFEANOCOMPRA.Value   := IbDtstTabelaANO.Value;
        qryNFENUMCOMPRA.Value   := IbDtstTabelaCODCONTROL.Value;
        qryNFESERIE.Value       := FormatFloat('#00', iSerieNFe);
        qryNFENUMERO.Value      := iNumeroNFe;
        qryNFEMODELO.Value      := DMNFe.GetModeloDF;
        qryNFEVERSAO.Value      := DMNFe.GetVersaoDF;
        qryNFEDATAEMISSAO.Value := GetDateDB;
        qryNFEHORAEMISSAO.Value := GetTimeDB;
        qryNFECHAVE.Value     := sChaveNFE;
        qryNFEPROTOCOLO.Value := sProtocoloNFE;
        qryNFERECIBO.Value    := sReciboNFE;
        qryNFELOTE_ANO.Value  := IbDtstTabelaANO.Value;
        qryNFELOTE_NUM.Value  := iNumeroLote;

        if ( FileExists(sFileNameXML) ) then
        begin
          CorrigirXML_NFe(EmptyWideStr, sFileNameXML);

          qryNFEXML_FILENAME.Value := ExtractFileName( sFileNameXML );
          qryNFEXML_FILE.LoadFromFile( sFileNameXML );
        end;

        qryNFEANOVENDA.Clear;
        qryNFENUMVENDA.Clear;

        Post;
        ApplyUpdates;

        CommitTransaction;
      end;

      IbDtstTabela.Close;
      IbDtstTabela.Open;

      IbDtstTabela.Locate(CampoCodigo, iNumero, []);

      ShowInformation('Nota Fiscal de Entrada gerada com sucesso.' + #13#13 + 'S�rie/N�mero: ' + IbDtstTabelaNFSERIE.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaNF.Value));

      HabilitarDesabilitar_Btns;

      nmImprimirDANFE.Click;
    end;
end;

procedure TfrmGeEntradaEstoque.btbtnListaClick(Sender: TObject);
begin
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeEntradaEstoque.nmImprimirDANFEClick(Sender: TObject);
var
  isPDF : Boolean;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  isPDF := ( Sender = nmGerarDANFEXML );

  DMNFe.ImprimirDANFEEntradaACBr( IbDtstTabelaCODEMP.AsString, IbDtstTabelaCODFORN.AsInteger, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger, isPDF);
end;

procedure TfrmGeEntradaEstoque.nmGerarDANFEXMLClick(Sender: TObject);
var
  isPDF : Boolean;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  isPDF := ( Sender = nmGerarDANFEXML );

  DMNFe.ImprimirDANFEEntradaACBr( IbDtstTabelaCODEMP.AsString, IbDtstTabelaCODFORN.AsInteger, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger, isPDF);
end;

procedure TfrmGeEntradaEstoque.IbDtstTabelaAfterScroll(DataSet: TDataSet);
begin
  if ( not (IbDtstTabela.State in [dsEdit, dsInsert]) ) then
  begin
    qryCFOP.Close;
    qryCFOP.ParamByName('Cfop_cod').AsInteger := IbDtstTabelaNFCFOP.AsInteger;
    qryCFOP.Open;
  end;
end;

procedure TfrmGeEntradaEstoque.dbAutorizacaoButtonClick(Sender: TObject);
{$IFNDEF DGE}
var
  iAno    ,
  iCodigo : Integer;
  sEmpresa,
  sMotivo ,
  sObservacao  : String;
  dDataInicial : TDateTime;
{$ENDIF}
begin
{$IFNDEF DGE}
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
  begin
    if ( IbDtstTabelaCODFORN.AsInteger = 0 ) then
    begin
      ShowInformation('Favor selecionar o Fornecedor primeiramente!');
      dbFornecedor.SetFocus;
    end
    else
    begin
      { DONE -oIsaque -cEntrada : 22/05/2014 - Gerar Data Inicial padr�o para busca de Autoriza��es de Compras }

      dDataInicial := StrToDateTime('01/' + FormatDateTime('mm/yyyy', GetDateDB));
      if ( (GetDateDB - dDataInicial) < 7 ) then
        dDataInicial := GetDateDB - 7;

      if ( SelecionarAutorizacao(Self, IbDtstTabelaCODFORN.AsInteger, dDataInicial, iAno, iCodigo, sEmpresa, sMotivo, sObservacao) ) then
      begin
        IbDtstTabelaAUTORIZACAO_ANO.AsInteger    := iAno;
        IbDtstTabelaAUTORIZACAO_CODIGO.AsInteger := iCodigo;
        IbDtstTabelaAUTORIZACAO_EMPRESA.AsString := sEmpresa;

        if (sMotivo <> EmptyStr) then
          dbObservacao.Lines.Add(sMotivo);

        if (sObservacao <> EmptyStr) then
          dbObservacao.Lines.Add(sObservacao);
      end;
    end
  end;
{$ENDIF}
end;

procedure TfrmGeEntradaEstoque.IbDtstTabelaAUTORIZACAO_CODIGOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
{$IFNDEF DGE}
  if not Sender.IsNull then
    Text := FormatFloat('###0000000"/"', Sender.AsInteger) + Copy(IbDtstTabelaAUTORIZACAO_ANO.AsString, 3, 2);
{$ENDIF}
end;

procedure TfrmGeEntradaEstoque.RecarregarRegistro;
var
  iAno ,
  iCod : Integer;
  sID : String;
begin
  { DONE -oIsaque -cEntrada : 22/05/2014 - Rotina de busca dos dados atualizados dos registros antes de qualquer manipula��o }

  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    Exit;

  if IbDtstTabela.IsEmpty then
    sID := EmptyStr
  else
    sID := IbDtstTabelaCODCONTROL.AsString;

  if ( sID <> EmptyStr ) then
  begin
    iAno := IbDtstTabelaANO.AsInteger;
    iCod := IbDtstTabelaCODCONTROL.AsInteger;

    if ( not IbDtstTabelaDTEMISS.IsNull ) then
    begin
      if ( IbDtstTabelaDTEMISS.AsDateTime < e1Data.Date ) then
        e1Data.Date := IbDtstTabelaDTEMISS.AsDateTime;

      if ( IbDtstTabelaDTEMISS.AsDateTime > e2Data.Date ) then
        e2Data.Date := IbDtstTabelaDTEMISS.AsDateTime;
    end;

    IbDtstTabela.Close;
    IbDtstTabela.Open;

    if not IbDtstTabela.Locate('CODCONTROL', sID, []) then
    begin
      IbDtstTabela.Close;

      ShowInformation('Favor pesquisar novamente o registro de entrada de ' + IfThen(FTipoMovimento = tmeProduto, 'produtos', 'servi�os') +'!');
      pgcGuias.ActivePage := tbsTabela;
      edtFiltrar.SetFocus;
    end;
  end;
end;

procedure TfrmGeEntradaEstoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin

    if (IbDtstTabela.State in [dsEdit, dsInsert])  then
    begin

      { DONE -oIsaque -cEntrada : 28/05/2014 - Verificar Data de Emiss�o da NF }

      if dbDataEmissao.Focused then
        if ( dbDataEmissao.Date > GetDateTimeDB ) then
            ShowWarning('A Data de Emiss�o da NF est� maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

      if dbDataEntrada.Focused then
        if ( dbDataEntrada.Date > GetDateTimeDB ) then
            ShowWarning('A Data de Entrada da NF est� maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

    end;

  end;

  // Desistir na inser��o de um novo produto/servi�o
//  if ( (Key = VK_ESCAPE) and (pgcGuias.ActivePage = tbsCadastro) and (cdsTabelaItens.State in [dsEdit, dsInsert]) and (Trim(dbProduto.Text) = EmptyStr) ) then
  if ( (Key = VK_ESCAPE) and (pgcGuias.ActivePage = tbsCadastro) and (cdsTabelaItens.State in [dsEdit, dsInsert]) ) then
    cdsTabelaItens.Cancel
  else
    inherited;
end;

procedure TfrmGeEntradaEstoque.FormShow(Sender: TObject);
begin
  inherited;
  btbtnGerarNFe.Visible := btbtnGerarNFe.Visible and (FTipoMovimento = tmeProduto);

  if ( FTipoMovimento = tmeServico ) then
  begin
    lblCFOPNF.Caption       := 'CNAE:';
    lblBaseICMS.Caption     := 'Base ISS:';
    lblValorICMS.Caption    := 'Valor ISS:';
    lblTotalProduto.Caption := 'Total Servi�o:';

    lblCFOPNF.Enabled := False;
    dbCFOPNF.Enabled  := False;
    lblBaseICMSSubs.Enabled  := False;
    dbBaseICMSSubs.Enabled   := False;
    lblValorICMSSubs.Enabled := False;
    dbValorICMSSubs.Enabled  := False;
    lblValorFrete.Enabled    := False;
    dbValorFrete.Enabled     := False;
    lblValorIPI.Enabled      := False;
    dbValorIPI.Enabled       := False;
    lblValorIPIProduto.Enabled := False;
    dbValorIPIProduto.Enabled  := False;

    GrpBxDadosProduto.Caption := 'Dados do servi�o';
    lblProduto.Caption := 'Servi�o';
    dbgProdutos.Columns[1].Title.Caption := 'Servi�o';
    dbgProdutos.Columns[2].Title.Caption := 'Descri��o do Servi�o';

    dbgDados.Columns[7].Title.Caption    := 'Total Servi�o';
  end;

  RegistrarNovaRotinaSistema;
end;

function TfrmGeEntradaEstoque.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btbtnFinalizar);
end;

function TfrmGeEntradaEstoque.GetRotinaGerarNFeID: String;
begin
  Result := GetRotinaInternaID(btbtnGerarNFe);
end;

function TfrmGeEntradaEstoque.GetRotinaCancelarEntradaID: String;
begin
  Result := GetRotinaInternaID(btbtnCancelarENT);
end;

procedure TfrmGeEntradaEstoque.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btbtnFinalizar.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, btbtnFinalizar.Caption, RotinaID);

    if btbtnGerarNFe.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaGerarNFeID, btbtnGerarNFe.Caption, RotinaID);

    if btbtnCancelarENT.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarEntradaID, btbtnCancelarENT.Caption, RotinaID);
  end;
end;

procedure TfrmGeEntradaEstoque.IbDtstTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  AbrirNotaFiscal( IbDtstTabelaCODEMP.AsString, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
end;

procedure TfrmGeEntradaEstoque.pgcGuiasOnChange;
begin
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeEntradaEstoque.AbrirNotaFiscal(const Empresa: String;
  const AnoCompra: Smallint; const ControleCompra: Integer);
begin
  with qryNFE do
  begin
    Close;
    ParamByName('empresa').AsString    := Empresa;
    ParamByName('anocompra').AsInteger := AnoCompra;
    ParamByName('numcompra').AsInteger := ControleCompra;
    Open;
  end;
end;

procedure TfrmGeEntradaEstoque.nmPpCorrigirDadosNFeCFOPClick(
  Sender: TObject);
var
  iCodigo    : Integer;
  sCFOP      ,
  sDescricao : String;
begin
  if not BtnCorrigirDadosNFe.Enabled then
    Exit;

  if ( SelecionarCFOP(Self, iCodigo, sDescricao) ) then
  begin
    sCFOP := IntToStr(iCodigo);

    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update TBCOMPRAS Set ');
      SQL.Add('    NFCFOP   = ' + sCFOP);
      SQL.Add('  , NATUREZA = ' + QuotedStr(sCFOP));
      SQL.Add('where ANO        = ' + IbDtstTabelaANO.AsString);
      SQL.Add('  and CODCONTROL = ' + IbDtstTabelaCODCONTROL.AsString);
      SQL.Add('  and CODEMP     = ' + QuotedStr(IbDtstTabelaCODEMP.AsString));
      ExecSQL;

      CommitTransaction;

      SQL.Clear;
      SQL.Add('Update TBCOMPRASITENS Set ');
      SQL.Add('  CFOP = ' + sCFOP);
      SQL.Add('where ANO        = ' + IbDtstTabelaANO.AsString);
      SQL.Add('  and CODCONTROL = ' + IbDtstTabelaCODCONTROL.AsString);
      SQL.Add('  and CODEMP     = ' + QuotedStr(IbDtstTabelaCODEMP.AsString));
      ExecSQL;

      CommitTransaction;
    end;

    RecarregarRegistro;

    AbrirNotaFiscal( IbDtstTabelaCODEMP.AsString, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

    ShowInformation('Corre��o', 'CFOP corrigido com sucesso!' + #13 + 'Favor pesquisar entrada novamente.');
  end;
end;

procedure TfrmGeEntradaEstoque.BtnCorrigirDadosNFeClick(Sender: TObject);
begin
  if not BtnLimparDadosNFe.Enabled then
    ppCorrigirDadosNFe.Popup(BtnCorrigirDadosNFe.ClientOrigin.X, BtnCorrigirDadosNFe.ClientOrigin.Y + BtnCorrigirDadosNFe.Height);
end;

procedure TfrmGeEntradaEstoque.nmPpLimparDadosNFeClick(Sender: TObject);
var
  sArquivoENV ,
  sArquivoREC ,
  sArquivoNFe1,
  sArquivoNFe2,
  sDirXMLNFe  : String;
begin
  if not IbDtstTabela.IsEmpty then
  begin
    if ( Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString) = EmptyStr ) then
      Exit;

    if ( IbDtstTabelaNF.AsCurrency > 0 ) then
      Exit;

    if not ShowConfirmation('Limpar LOG', 'Confirma a limpeza do LOG de envio de NF-e para que esta seja enviada novamente?') then
      Exit;

    // Realocar arquivos XML de envio
    sDirXMLNFe := DMNFe.GetPathNFeXML(IbDtstTabelaCODEMP.AsString);
    if DirectoryExists(sDirXMLNFe) then
    begin
      sArquivoENV  := StringReplace(sDirXMLNFe + '\' + IbDtstTabelaLOTE_NFE_NUMERO.AsString + '-env-lot.xml', '\\', '\', [rfReplaceAll]);
      sArquivoREC  := StringReplace(sDirXMLNFe + '\' + IbDtstTabelaLOTE_NFE_NUMERO.AsString + '-rec.xml',     '\\', '\', [rfReplaceAll]);
      sArquivoNFe1 := StringReplace(sDirXMLNFe + '\' +
        DMNFe.GetGerarChaveNFeXML(
          IbDtstTabelaCODEMP.AsString,
          IbDtstTabelaANO.AsInteger,
          IbDtstTabelaCODCONTROL.AsInteger,
          tnfEntrada) + '-nfe.xml', '\\', '\', [rfReplaceAll]);

      sArquivoNFe2 := StringReplace(sDirXMLNFe + '\' +
        DMNFe.GetGerarChaveNFeXML(
          IbDtstTabelaCODEMP.AsString,
          IbDtstTabelaANO.AsInteger,
          IbDtstTabelaCODCONTROL.AsInteger,
          tnfEntrada) + '-nfe_view.xml', '\\', '\', [rfReplaceAll]);

      ForceDirectories(ExtractFilePath(sArquivoENV) + 'log\');

      DeleteFile(ExtractFilePath(sArquivoENV)  + 'log\' + ExtractFileName(sArquivoENV));
      DeleteFile(ExtractFilePath(sArquivoREC)  + 'log\' + ExtractFileName(sArquivoREC));
      DeleteFile(ExtractFilePath(sArquivoNFe1) + 'log\' + ExtractFileName(sArquivoNFe1));
      DeleteFile(ExtractFilePath(sArquivoNFe2) + 'log\' + ExtractFileName(sArquivoNFe2));

      MoveFile(PChar(sArquivoENV),  PChar(ExtractFilePath(sArquivoENV)  + 'log\' + ExtractFileName(sArquivoENV)));
      MoveFile(PChar(sArquivoREC),  PChar(ExtractFilePath(sArquivoREC)  + 'log\' + ExtractFileName(sArquivoREC)));
      MoveFile(PChar(sArquivoNFe1), PChar(ExtractFilePath(sArquivoNFe1) + 'log\' + ExtractFileName(sArquivoNFe1)));
      MoveFile(PChar(sArquivoNFe2), PChar(ExtractFilePath(sArquivoNFe2) + 'log\' + ExtractFileName(sArquivoNFe2)));
    end;

    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update TBCOMPRAS Set ');
      SQL.Add('    LOTE_NFE_ANO    = null');
      SQL.Add('  , LOTE_NFE_NUMERO = null');
      SQL.Add('  , LOTE_NFE_RECIBO = null');
      SQL.Add('where ANO        = ' + IbDtstTabelaANO.AsString);
      SQL.Add('  and CODCONTROL = ' + IbDtstTabelaCODCONTROL.AsString);
      SQL.Add('  and CODEMP     = ' + QuotedStr(IbDtstTabelaCODEMP.AsString));
      ExecSQL;

      CommitTransaction;
    end;

    RecarregarRegistro;
    AbrirNotaFiscal( IbDtstTabelaCODEMP.AsString, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

    ShowInformation('Dados NF-e', 'LOG de envio de recibo NF-e limpo com sucesso!');
  end;
end;

procedure TfrmGeEntradaEstoque.nmPpReciboNFeClick(Sender: TObject);
begin
  if not IbDtstTabela.IsEmpty then
  begin
    if ( Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString) = EmptyStr ) then
      Exit;

    Clipboard.AsText := Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString);
    ShowInformation('Dados NF-e', 'N�mero de Recibo de Envio da NF-e:' + #13 + Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString));
  end;
end;

procedure TfrmGeEntradaEstoque.nmPpChaveNFeClick(Sender: TObject);
begin
  if not IbDtstTabela.IsEmpty then
  begin
    if ( Trim(IbDtstTabelaVERIFICADOR_NFE.AsString) = EmptyStr ) then
      Exit;

    Clipboard.AsText := Trim(IbDtstTabelaVERIFICADOR_NFE.AsString);
    ShowInformation('Dados NF-e', 'Chave da NF-e:' + #13 + Trim(IbDtstTabelaVERIFICADOR_NFE.AsString));
  end;
end;

procedure TfrmGeEntradaEstoque.nmPpArquivoNFeClick(Sender: TObject);
begin
  if not IbDtstTabela.IsEmpty then
  begin
    if ( Trim(IbDtstTabelaXML_NFE_FILENAME.AsString) = EmptyStr ) then
      Exit;

    Clipboard.AsText := Trim(IbDtstTabelaXML_NFE_FILENAME.AsString);
    ShowInformation('Dados NF-e', 'Nome do Arquivo XML NF-e:' + #13 + Trim(IbDtstTabelaXML_NFE_FILENAME.AsString));
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeEntradaEstoque', TfrmGeEntradaEstoque);

end.
