unit LPUtil;

interface

uses
  Windows, Messages, DB, Math, Controls, Forms, Graphics, Menus, Types, Classes, RegularExpressions, Vcl.StdCtrls,
  VCl.Buttons, Clipbrd, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet,FireDAC.Comp.Client,System.SysUtils;

{PopupMenu Utils}
procedure ShowPopupMenu(oControle: TControl; ppm: TPopupMenu; lBaixo: Boolean = False; iEspacamentoItem: Integer= 20);

{Memo Utils}
function GetMemoLine(Memo: TMemo):Integer;
function GetMemoCol(Memo: TMemo):Integer;
function GetMemoLen(Memo: TMemo):Integer;
function GetMemoSelLen(Memo: TMemo):Integer;

{Files Utils}
function GetShortFileName(cFileName: String):String;

implementation

{PopupMenu Utils}
procedure ShowPopupMenu(oControle: TControl; ppm: TPopupMenu; lBaixo: Boolean= False; iEspacamentoItem: Integer= 20);
var
  oPoint: TPoint;
  i, iQtdItens: Integer;
begin
  oPoint    := oControle.ClientToScreen(Point(0, oControle.ClientHeight));
  iQtdItens := 0;

  for i := 0 to ppm.Items.Count -1 do
  begin
    if(ppm.Items.Items[i].Visible)then
      iQtdItens := iQtdItens + 1;
  end;

  if(lBaixo)then
    ppm.Popup(oPoint.X, oPoint.Y)
  else
    ppm.Popup(oPoint.X, (oPoint.Y - oControle.Height - 3 - (iQtdItens * iEspacamentoItem)));
end;

{Memo Utils}
function GetMemoLine(Memo: TMemo):Integer;
var
  iLn: Integer;
begin
  iLn  := Memo.CaretPos.y;
  Result := iLn;
end;

function GetMemoCol(Memo: TMemo):Integer;
var
  iCol: Integer;
begin
  iCol  := Memo.CaretPos.x;
  Result := iCol;
end;

function GetMemoLen(Memo: TMemo):Integer;
var
  iLen: Integer;
begin
  iLen  := Memo.GetTextLen;
  Result := iLen;
end;

function GetMemoSelLen(Memo: TMemo):Integer;
var
  iSelLen: Integer;
begin
  iSelLen  := Memo.SelLength;
  Result := iSelLen;
end;

{Files Utils}
function GetShortFileName(cFileName: String):String;
var
  cShortFileName,cExtension: String;
begin
  cExtension := ExtractFileExt(cFileName);
  cShortFileName := StringReplace(ExtractFileName(cFileName),cExtension,'', [rfReplaceAll]);
  Result := cShortFileName
end;

end.
