unit UGeEntradaConfirmaDuplicatas;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBUpdateSQL,
  ExtCtrls, Grids, DBGrids, Mask, DBCtrls, DBClient, Provider, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TfrmGeEntradaConfirmaDuplicatas = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    Bevel1: TBevel;
    qryDuplicatas: TIBDataSet;
    dtsDuplicatas: TDataSource;
    dbgTitulos: TDBGrid;
    Bevel2: TBevel;
    lblCodigo: TLabel;
    dbCodigo: TDBEdit;
    lblDataVencimento: TLabel;
    dbDataVencimento: TDBEdit;
    dbParcela: TDBEdit;
    lblParcela: TLabel;
    lblValor: TLabel;
    dbValor: TDBEdit;
    lblEmissao: TLabel;
    dbEmissao: TDBEdit;
    dspDuplicatas: TDataSetProvider;
    cdsDuplicatas: TClientDataSet;
    cdsDuplicatasANOLANC: TSmallintField;
    cdsDuplicatasNUMLANC: TIntegerField;
    cdsDuplicatasPARCELA: TSmallintField;
    cdsDuplicatasCODFORN: TSmallintField;
    cdsDuplicatasDTEMISS: TDateField;
    cdsDuplicatasDTVENC: TDateField;
    cdsDuplicatasVALORPAG: TBCDField;
    cdsDuplicatasTotalParcelas: TAggregateField;
    cdsDuplicatasTotalEntrada: TCurrencyField;
    dbTotalEntrada: TDBEdit;
    dbTotalParcelas: TDBEdit;
    updParcela: TIBDataSet;
    pnlTotais: TPanel;
    Label1: TLabel;
    lblTotalEntrada: TLabel;
    Label2: TLabel;
    lblTotalParcelas: TLabel;
    Label3: TLabel;
    lblTotalDiferenca: TLabel;
    cdsDuplicatasDiaSemana: TSmallintField;
    btnConfirmar: TcxButton;
    btFechar: TcxButton;
    cdsDuplicatasNOTFISC: TWideStringField;
    cdsDuplicatasTIPPAG: TWideStringField;
    cdsDuplicatasLancamento: TStringField;
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ControlEditEnter(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure dbgTitulosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cdsDuplicatasCalcFields(DataSet: TDataSet);
    procedure dtsDuplicatasDataChange(Sender: TObject; Field: TField);
    procedure dtsDuplicatasUpdateData(Sender: TObject);
    procedure cdsDuplicatasDiaSemanaGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsDuplicatasBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    fAnoCompra ,
    fControleCompra : Integer;
    fDataEmissaoDOC : TDateTime;
    fTotalEntrada   : Currency;
    procedure UpdateParcelas;
    procedure DisplayTotais;
  public
    { Public declarations }
    property AnoCompra : Integer read fAnoCompra write fAnoCompra;
    property ControleCompra : Integer read fControleCompra write fControleCompra;
    property DataEmissaoDOC : TDateTime read fDataEmissaoDOC write fDataEmissaoDOC;
    property TotalEntrada   : Currency read fTotalEntrada write fTotalEntrada;

    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBCONTPAG

  Views:

  Procedures:

*)

var
  frmGeEntradaConfirmaDuplicatas: TfrmGeEntradaConfirmaDuplicatas;

  function DuplicatasConfirmadas(const AOwer : TComponent; Ano, Controle : Integer;
    DataEmissaoNF : TDateTime; ValorEntrada : Currency) : Boolean;

implementation

uses DateUtils, UDMBusiness;

{$R *.dfm}

function DuplicatasConfirmadas(const AOwer : TComponent; Ano, Controle : Integer;
  DataEmissaoNF : TDateTime; ValorEntrada : Currency) : Boolean;
var
  frm : TfrmGeEntradaConfirmaDuplicatas;
begin
  frm := TfrmGeEntradaConfirmaDuplicatas.Create(AOwer);
  try
    frm.AnoCompra      := Ano;
    frm.ControleCompra := Controle;
    frm.DataEmissaoDOC := DataEmissaoNF;
    frm.TotalEntrada   := ValorEntrada;

    Result := (frm.ShowModal = mrOk);
  finally
    frm.Free;
  end;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.FormCreate(Sender: TObject);
begin
  inherited;
  TotalEntrada   := 0;
  AnoCompra      := 0;
  DataEmissaoDOC := Date;
  ControleCompra := 0;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.FormShow(Sender: TObject);
begin
  inherited;
  with qryDuplicatas, SelectSQL do
  begin
    Add('where AnoCompra = ' + IntToStr(AnoCompra));
    Add('  and NumCompra = ' + IntToStr(ControleCompra));
    Add('order by numlanc, parcela');
  end;
  
  cdsDuplicatas.Open;
  if ( not cdsDuplicatas.IsEmpty ) then
      cdsDuplicatas.Edit;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.ControlEditEnter(
  Sender: TObject);
begin
  inherited;
  if ( (Sender = dbDataVencimento) or (Sender = dbValor) ) then
    if ( not cdsDuplicatas.IsEmpty ) then
      if ( cdsDuplicatas.State <> dsEdit ) then
        cdsDuplicatas.Edit;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.ControlEditExit(Sender: TObject);
begin
  inherited;
  if ( Sender = dbValor ) then
    if ( cdsDuplicatas.State = dsEdit ) then
    begin
      if (cdsDuplicatasDTVENC.AsDateTime < DataEmissaoDOC) then
      begin
        ShowWarning('A Data de Vencimento n�o pode ser menor que a Data de Emiss�o do Documento de Entrada');
        if dbDataVencimento.Visible and dbDataVencimento.Enabled then dbDataVencimento.SetFocus;
      end
      else
      begin
        cdsDuplicatas.Post;

        cdsDuplicatas.Next;

        if ( not cdsDuplicatas.Eof ) then
          dbCodigo.SetFocus
        else
          btnConfirmar.SetFocus;
      end;
    end;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.dbgTitulosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color := clBlack;

  if odd(cdsDuplicatas.RecNo) then
    TDBGrid(Sender).Canvas.Brush.Color:= clMenuBar
  else
    TDBGrid(Sender).Canvas.Brush.Color:= clCream;

  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color :=  clMoneyGreen;
      FillRect(Rect);
      Font.Style  := [fsbold]
    end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmGeEntradaConfirmaDuplicatas.btnConfirmarClick(
  Sender: TObject);
var
  cTotalNF ,
  cTotalDC : Currency;
begin
  if ( not ShowConfirm('Confirma os valores e vencimentos das parcelas?') ) then
    Exit;

  cTotalNF := StrToCurrDef( StringReplace(dbTotalEntrada.Text,  '.', '', [rfReplaceAll]), 0 );
  cTotalDC := StrToCurrDef( StringReplace(dbTotalParcelas.Text, '.', '', [rfReplaceAll]), 0 );

  if ( cTotalNF <> cTotalDC ) then
  begin
    ShowWarning('O Valor Total das parcelas n�o coincide com o Valor Total de Entrada.');
    cdsDuplicatas.First;

    dbCodigo.SetFocus;
  end
  else
  begin
    UpdateParcelas;
    ModalResult := mrOk;
  end;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.cdsDuplicatasBeforePost(
  DataSet: TDataSet);
begin
  if (cdsDuplicatasDTVENC.AsDateTime < DataEmissaoDOC) then
  begin
    if dbDataVencimento.Visible and dbDataVencimento.Enabled then dbDataVencimento.SetFocus;
    ShowWarning('A Data de Vencimento n�o pode ser menor que a Data de Emiss�o do Documento de Entrada');
    Abort;
  end
  else
    inherited;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.cdsDuplicatasCalcFields(
  DataSet: TDataSet);
begin
  cdsDuplicatasDiaSemana.AsInteger     := DayOfWeek(cdsDuplicatasDTVENC.AsDateTime);
  cdsDuplicatasLancamento.AsString     := FormatFloat('0000', cdsDuplicatasANOLANC.AsInteger) + FormatFloat('000000', cdsDuplicatasNUMLANC.AsInteger);
  cdsDuplicatasTotalEntrada.AsCurrency := TotalEntrada;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.UpdateParcelas;
begin
  cdsDuplicatas.First;
  while not cdsDuplicatas.Eof do
  begin
    updParcela.Close;
    updParcela.ParamByName('vencimento').AsDateTime := cdsDuplicatasDTVENC.AsDateTime;
    updParcela.ParamByName('valor').AsCurrency      := cdsDuplicatasVALORPAG.AsCurrency;
    updParcela.ParamByName('anocompra').AsInteger := AnoCompra;
    updParcela.ParamByName('numcompra').AsInteger := ControleCompra;
    updParcela.ParamByName('anolanc').AsInteger   := cdsDuplicatasANOLANC.AsInteger;
    updParcela.ParamByName('numlanc').AsInteger   := cdsDuplicatasNUMLANC.AsInteger;
    updParcela.ExecSQL;

    cdsDuplicatas.Next;
  end;
  CommitTransaction;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.DisplayTotais;
var
  cTotalNF ,
  cTotalDC : Currency;
begin
  cTotalNF := StrToCurrDef( StringReplace(dbTotalEntrada.Text,  '.', '', [rfReplaceAll]), 0 );
  cTotalDC := StrToCurrDef( StringReplace(dbTotalParcelas.Text, '.', '', [rfReplaceAll]), 0 );

  lblTotalEntrada.Caption   := FormatFloat(',0.00', cTotalNF);
  lblTotalParcelas.Caption  := FormatFloat(',0.00', cTotalDC);
  lblTotalDiferenca.Caption := FormatFloat(',0.00', cTotalNF - cTotalDC);
end;

procedure TfrmGeEntradaConfirmaDuplicatas.dtsDuplicatasDataChange(
  Sender: TObject; Field: TField);
begin
  DisplayTotais;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.dtsDuplicatasUpdateData(
  Sender: TObject);
begin
  DisplayTotais;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.cdsDuplicatasDiaSemanaGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Exit;

  Case Sender.AsInteger of
    1 : Text := 'DOM';
    2 : Text := 'SEG';
    3 : Text := 'TER';
    4 : Text := 'QUA';
    5 : Text := 'QUI';
    6 : Text := 'SEX';
    7 : Text := 'SAB';
  end;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.RegistrarRotinaSistema;
begin
  ;
end;

end.
