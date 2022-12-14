unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ToolWin,
  Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus, XPStyleActnCtrls, Vcl.Menus,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnPopup, Vcl.TitleBarCtrls,
  Vcl.ComCtrls, Vcl.ExtDlgs, Vcl.Printers, ShellAPI;

type
  TfrmPrincipal = class(TForm)
    pnlSuperior: TPanel;
    pnlInferior: TPanel;
    mmoPrincipal: TMemo;
    lblArquivo: TLabel;
    lblEditar: TLabel;
    lblFormatar: TLabel;
    lblExibir: TLabel;
    lblAjudaa: TLabel;
    pmArquivo: TPopupMenu;
    pmiNovo: TMenuItem;
    pmiNovaJanela: TMenuItem;
    pmiAbrir: TMenuItem;
    pmiSalvar: TMenuItem;
    pmiSalvarComo: TMenuItem;
    N1: TMenuItem;
    pmiConfigurarPagina: TMenuItem;
    pmiImprimir: TMenuItem;
    N2: TMenuItem;
    pmiSair: TMenuItem;
    stfdPrincipal: TSaveTextFileDialog;
    pnlDadosInferiores: TPanel;
    lblQA: TLabel;
    pmQA: TPopupMenu;
    pmiGerarCPF: TMenuItem;
    pmiGerarCPFPontuacao: TMenuItem;
    pmiValidarCPF: TMenuItem;
    N3: TMenuItem;
    pmiGerarCNPJ: TMenuItem;
    pmiGerarCNPJPontuacao: TMenuItem;
    pmiValidarCNPJ: TMenuItem;
    pnlValidacao: TPanel;
    otfdPrincipal: TOpenTextFileDialog;
    pdImprimir: TPrintDialog;
    pmEditar: TPopupMenu;
    pmiDesfazer: TMenuItem;
    N4: TMenuItem;
    pmiRecortar: TMenuItem;
    pmiCopiar: TMenuItem;
    pmiColar: TMenuItem;
    pmiExcluir: TMenuItem;
    N5: TMenuItem;
    pmiBuscarComGoogle: TMenuItem;
    pmiLocalizar: TMenuItem;
    pmiLocalizarProxima: TMenuItem;
    pmiLocalizarAnterior: TMenuItem;
    pmiSubstituir: TMenuItem;
    N6: TMenuItem;
    pmiSelecionarTudo: TMenuItem;
    pmiHoraData: TMenuItem;
    pmFormatar: TPopupMenu;
    pmiQuebrarLinha: TMenuItem;
    pmiFonte: TMenuItem;
    pmExibir: TPopupMenu;
    pmiZoom: TMenuItem;
    pmiAmpliar: TMenuItem;
    pmiReduzir: TMenuItem;
    pmiRestaurarZoom: TMenuItem;
    pmiBarraStatus: TMenuItem;
    procedure OnMouseEnterChangeColor(Sender: TObject);
    procedure OnMouseLeaveChangeColor(Sender: TObject);
    procedure lblArquivoClick(Sender: TObject);
    procedure pmiSairClick(Sender: TObject);
    procedure mmoPrincipalClick(Sender: TObject);
    procedure mmoPrincipalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmoPrincipalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pmiGerarCPFClick(Sender: TObject);
    procedure lblQAClick(Sender: TObject);
    procedure pmiGerarCPFPontuacaoClick(Sender: TObject);
    procedure pmiGerarCNPJClick(Sender: TObject);
    procedure pmiGerarCNPJPontuacaoClick(Sender: TObject);
    procedure pmiValidarCPFClick(Sender: TObject);
    procedure pmiSalvarClick(Sender: TObject);
    procedure pmiSalvarComoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure pmiAbrirClick(Sender: TObject);
    procedure pmiNovaJanelaClick(Sender: TObject);
    procedure pmiNovoClick(Sender: TObject);
    procedure pmiImprimirClick(Sender: TObject);
    procedure lblEditarClick(Sender: TObject);
    procedure lblFormatarClick(Sender: TObject);
  private
    procedure CarregarDadosInferiores;
    procedure QAValidarCPF;
    procedure SalvarArquivo(cFileName: String = '');
    procedure ConfiguracoesIniciais;
    procedure ConfigurarTitulo;
    procedure AbrirArquivo;
    procedure LimparDados;
    procedure Imprimir(cConteudo:TStrings);
    procedure HabilitarDesabilitarComandos(cOperacao: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses LPUtil,LPUtilQA;


procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ConfiguracoesIniciais;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    Close()
  else
  if(Key = 83)and([ssCtrl] = Shift)then
    SalvarArquivo(stfdPrincipal.FileName)
  else
  if(Key = 83)and([ssCtrl,ssShift] = Shift)then
    SalvarArquivo()
  else
  if(Key = 78)and([ssCtrl] = Shift)then
    LimparDados
  else
  if(Key = 78)and([ssCtrl,ssShift] = Shift)then
    ShellExecute(Handle,'open','C:\Projetos\Portifolio\LaserPad\Win32\Debug\prjLaserPad.exe',nil,nil,SW_SHOWNORMAL)
  else
  if(Key = 79)and([ssCtrl] = Shift)then
    AbrirArquivo
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  CarregarDadosInferiores;
end;

procedure TfrmPrincipal.lblArquivoClick(Sender: TObject);
begin
  ShowPopupMenu(lblArquivo,pmArquivo,True);
end;

procedure TfrmPrincipal.lblEditarClick(Sender: TObject);
begin
  ShowPopupMenu(lblEditar,pmEditar,True);
end;

procedure TfrmPrincipal.lblFormatarClick(Sender: TObject);
begin
  ShowPopupMenu(lblFormatar,pmFormatar,True);
end;

procedure TfrmPrincipal.lblQAClick(Sender: TObject);
begin
  ShowPopupMenu(lblQA,pmQA,True);
end;

procedure TfrmPrincipal.mmoPrincipalChange(Sender: TObject);
begin
  CarregarDadosInferiores;
  pnlValidacao.ShowCaption := False;
  ConfigurarTitulo;
  pmiDesfazer.Enabled := True
end;

procedure TfrmPrincipal.mmoPrincipalClick(Sender: TObject);
begin
  CarregarDadosInferiores;
end;

procedure TfrmPrincipal.mmoPrincipalKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CarregarDadosInferiores;
end;

procedure TfrmPrincipal.CarregarDadosInferiores;
var
  cLn,cCol,cLen,cSelLen: String;
begin
  cLn  := IntToStr(GetMemoLine(mmoPrincipal)+1);
  cCol := IntToStr(GetMemoCol(mmoPrincipal)+1);
  cLen := IntToStr(GetMemoLen(mmoPrincipal));
  cSelLen := IntToStr(GetMemoSelLen(mmoPrincipal));
  pnlDadosInferiores.Caption := '|  Len: '+cLen+'  |  Sel: '+cSelLen+'  |  Ln: '+cLn+'  |  Col: '+cCol+'  |';
  pnlDadosInferiores.Hint := ('Quantidade de Caracteres: '+cLen+#13#10
                             +'Caracteres Selecionados: '+cSelLen+#13#10
                             +'Linha Atual: '+cLn+#13#10
                             +'Coluna Atual: '+cCol);
end;

procedure TfrmPrincipal.OnMouseEnterChangeColor(Sender: TObject);
begin
  TLabel(Sender).Color := clSkyBlue;
end;

procedure TfrmPrincipal.OnMouseLeaveChangeColor(Sender: TObject);
begin
  TLabel(Sender).ParentColor := True;
end;

procedure TfrmPrincipal.pmiAbrirClick(Sender: TObject);
begin
  AbrirArquivo;
end;

procedure TfrmPrincipal.pmiGerarCNPJClick(Sender: TObject);
var
  cCNPJ: String;
begin
  cCNPJ := GerarCNPJ(False);
  mmoPrincipal.Text := mmoPrincipal.Text + cCNPJ;
end;

procedure TfrmPrincipal.pmiGerarCNPJPontuacaoClick(Sender: TObject);
var
  cCNPJ: String;
begin
  cCNPJ := GerarCNPJ(True);
  mmoPrincipal.Text := mmoPrincipal.Text + cCNPJ;
end;

procedure TfrmPrincipal.pmiGerarCPFClick(Sender: TObject);
var
  cCPF: String;
begin
  cCPF := GerarCPF(False);
  mmoPrincipal.Text := mmoPrincipal.Text + cCPF;
end;

procedure TfrmPrincipal.pmiGerarCPFPontuacaoClick(Sender: TObject);
var
  cCPF: String;
begin
  cCPF := GerarCPF(True);
  mmoPrincipal.Text := mmoPrincipal.Text + cCPF;
end;

procedure TfrmPrincipal.pmiImprimirClick(Sender: TObject);
begin
  Imprimir(mmoPrincipal.Lines)
end;

procedure TfrmPrincipal.pmiNovaJanelaClick(Sender: TObject);
begin
  ShellExecute(Handle,'open','C:\Projetos\Portifolio\LaserPad\Win32\Debug\prjLaserPad.exe',nil,nil,SW_SHOWNORMAL)
end;

procedure TfrmPrincipal.pmiNovoClick(Sender: TObject);
begin
  LimparDados;
end;

procedure TfrmPrincipal.pmiSairClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmPrincipal.pmiSalvarClick(Sender: TObject);
begin
  SalvarArquivo(stfdPrincipal.FileName)
end;

procedure TfrmPrincipal.pmiSalvarComoClick(Sender: TObject);
begin
  SalvarArquivo;
end;

procedure TfrmPrincipal.pmiValidarCPFClick(Sender: TObject);
begin
  QAValidarCPF;
end;

procedure TfrmPrincipal.QAValidarCPF;
var
  cCPF: String;
begin
  cCPF := mmoPrincipal.SelText;
  if ValidarCPF(cCPF)then
  begin
    pnlValidacao.ShowCaption := True;
    pnlValidacao.Font.Color  := clGreen;
    pnlValidacao.Caption     := 'CPF '+cCPF+' V?lido!'
  end
  else
  begin
    pnlValidacao.ShowCaption := True;
    pnlValidacao.Font.Color  := clRed;
    pnlValidacao.Caption     := 'CPF '+cCPF+' Inv?lido!'
  end;
end;

procedure TfrmPrincipal.SalvarArquivo(cFileName: String = '');
begin
  if cFileName = '' then
  begin
    stfdPrincipal.FileName := '*.txt';
    if not stfdPrincipal.Execute then
    begin
      stfdPrincipal.FileName := '';
      abort
    end;
  end;

  mmoPrincipal.Lines.SaveToFile(stfdPrincipal.FileName);
  frmPrincipal.Caption := GetShortFileName(stfdPrincipal.FileName) + ' - LaserPad';
end;

procedure TfrmPrincipal.ConfiguracoesIniciais;
begin
  frmPrincipal.Caption := 'Sem t?tulo - LaserPad'
end;

procedure TfrmPrincipal.ConfigurarTitulo;
begin
  if(stfdPrincipal.FileName = '')and(mmoPrincipal.Text <> '')then
    frmPrincipal.Caption := '*Sem t?tulo - LaserPad'
  else
  if(stfdPrincipal.FileName = '')and(mmoPrincipal.Text = '')then
    frmPrincipal.Caption := 'Sem t?tulo - LaserPad'
  else
  if(stfdPrincipal.FileName <> '')then
    frmPrincipal.Caption := '*'+GetShortFileName(stfdPrincipal.FileName) + ' - LaserPad';
end;

procedure TfrmPrincipal.AbrirArquivo;
begin
  if otfdPrincipal.Execute then
  begin
    mmoPrincipal.Lines.LoadFromFile(otfdPrincipal.FileName);
    frmPrincipal.Caption := GetShortFileName(otfdPrincipal.FileName) + ' - LaserPad';
    stfdPrincipal.FileName := otfdPrincipal.FileName;
  end;
end;

procedure TfrmPrincipal.LimparDados;
begin
  mmoPrincipal.Clear;
  ConfiguracoesIniciais;
  otfdPrincipal.FileName := '';
  stfdPrincipal.FileName := ''
end;

procedure TfrmPrincipal.Imprimir(cConteudo:TStrings);
Var
   txtArquivo : TextFile;
   i : Integer;
Begin
   AssignPrn(txtArquivo);
   Rewrite(txtArquivo);
   for i := 0 to cConteudo.Count - 1 do
     Writeln(txtArquivo,cConteudo.Strings[i]);
   CloseFile(txtArquivo);
end;

procedure TfrmPrincipal.HabilitarDesabilitarComandos(cOperacao:String);
begin
  if cOperacao = 'inicial' then
  begin
    {Arquivo}
    pmiNovo.Enabled := True;
    pmiNovaJanela.Enabled := True;
    pmiAbrir.Enabled := True;
    pmiSalvar.Enabled := True;
    pmiSalvarComo.Enabled := True;
    pmiConfigurarPagina.Enabled := False; //Alterar quando finalizar cria??o
    pmiImprimir.Enabled := True;
    pmiSair.Enabled := True;
    {Editar}
    pmiDesfazer.Enabled := False;
    pmiRecortar.Enabled := False;
    pmiCopiar.Enabled := False;
    pmiColar.Enabled := False;
    pmiExcluir.Enabled := False;
    pmiBuscarComGoogle.Enabled := False;
    pmiLocalizar.Enabled := False;
    pmiLocalizarProxima.Enabled := False;
    pmiLocalizarAnterior.Enabled := False;
    pmiSubstituir.Enabled := True;
    pmiSelecionarTudo.Enabled := True;
    pmiHoraData.Enabled := True;
    {Formatar}

    {Exibir}

    {QA}

    {Ajuda}
  end;
end;

end.
