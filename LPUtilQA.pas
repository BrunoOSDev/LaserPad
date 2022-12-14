unit LPUtilQA;

interface

uses
  Windows, Messages, DB, Math, Controls, Forms, Graphics, Menus, Types, Classes, RegularExpressions, Vcl.StdCtrls,
  VCl.Buttons, Clipbrd, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.SysUtils;

  {CPF e CNPJ utils}
  function GerarCPF(const Ponto: Boolean): string;
  function GerarCNPJ(const Ponto: Boolean): String;
  function ValidarCPF(cCPF: string): boolean;

implementation

{CPF e CNPJ utils}
function GerarCPF(const Ponto: Boolean): string;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9, d1, d2: LongInt;
begin
  n1 := Trunc(Random(10));
  n2 := Trunc(Random(10));
  n3 := Trunc(Random(10));
  n4 := Trunc(Random(10));
  n5 := Trunc(Random(10));
  n6 := Trunc(Random(10));
  n7 := Trunc(Random(10));
  n8 := Trunc(Random(10));
  n9 := Trunc(Random(10));

  d1 := (n9*2)+(n8*3)+(n7*4)+(n6*5)+(n5*6)
       +(n4*7)+(n3*8)+(n2*9)+(n1*10);

  d1 := 11-(d1 mod 11);

  if (d1 >= 10) then d1 := 0;

  d2 := (d1*2)+(n9*3)+(n8*4)+(n7*5)+(n6*6)
       +(n5*7)+(n4*8)+(n3*9)+(n2*10)+(n1*11);

  d2 := 11-(d2 mod 11);

  if (d2>=10) then d2 := 0;

  Result := IntToStr(n1)+IntToStr(n2)+IntToStr(n3)+IntToStr(n4)+IntToStr(n5)+IntToStr(n6)
           +IntToStr(n7)+IntToStr(n8)+IntToStr(n9)+IntToStr(d1)+IntToStr(d2);

  if Ponto then
    Result := Copy(Result, 1, 3)+'.'+Copy(Result, 4, 3)+'.'+Copy(Result, 7, 3)+'-'+Copy(Result, 10, 2);
end;

function GerarCNPJ(const Ponto: Boolean): String;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, d1, d2: LongInt;
begin
  n1  := Trunc(Random(10));
  n2  := Trunc(Random(10));
  n3  := Trunc(Random(10));
  n4  := Trunc(Random(10));
  n5  := Trunc(Random(10));
  n6  := Trunc(Random(10));
  n7  := Trunc(Random(10));
  n8  := Trunc(Random(10));
  n9  := 0;
  n10 := 0;
  n11 := 0;
  n12 := 1;

  d1  := (n12*2)+(n11*3)+(n10*4)+(n9*5)+(n8*6)+(n7*7)
        +(n6*8)+(n5*9)+(n4*2)+(n3*3)+(n2*4)+(n1*5);

  d1 := 11-(d1 mod 11);

  if (d1 >= 10) then d1 := 0;

  d2 := (d1 * 2) + (n12 * 3) + (n11 * 4) + (n10 * 5) + (n9 * 6) + (n8 * 7)
 +(n7 * 8) + (n6  * 9) + (n5  * 2) + (n4  * 3) + (n3 * 4) + (n2 * 5) + (n1 * 6);

  d2 := 11-(d2 mod 11);

  if (d2 >= 10) then d2 := 0;

  Result := IntToStr(n1)+IntToStr(n2)+IntToStr(n3)+IntToStr(n4)+IntToStr(n5)+IntToStr(n6)
           +IntToStr(n7)+IntToStr(n8)+IntToStr(n9)+IntToStr(n10)+IntToStr(n11)+IntToStr(n12)
           +IntToStr(d1)+IntToStr(d2);

  if Ponto then
    Result := Copy(Result,1,2)+'.'+Copy(Result,3,3)+'.'+Copy(Result,6,3)+'/'
             +Copy(Result, 9, 4) + '-' + Copy(Result, 13, 2);
end;

function ValidarCPF(cCPF: string): boolean;
var
  dig10, dig11: String;
  s, i, r, peso: Integer;
  lCPFValido: Boolean;
begin
  cCPF := StringReplace(cCPF,'.','', [rfReplaceAll]);
  cCPF := StringReplace(cCPF,'-','', [rfReplaceAll]);
  {Verificando se o CPF atinge os 11 d?gitos necess?rios}
  if ((cCPF = '00000000000') or (cCPF = '11111111111') or
      (cCPF = '22222222222') or (cCPF = '33333333333') or
      (cCPF = '44444444444') or (cCPF = '55555555555') or
      (cCPF = '66666666666') or (cCPF = '77777777777') or
      (cCPF = '88888888888') or (cCPF = '99999999999') or
      (length(cCPF) <> 11))then
  begin
    lCPFValido := False;
    Result := False;
    exit;
  end;

  try
    {C?lculo do primeiro D?gito Verificador}
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
      s := s + (StrToInt(cCPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))then
	    dig10 := '0'
    else
	    str(r:1, dig10); // converte um n?mero no respectivo caractere num?rico

    {C?lculo do segundo D?gito Verificador}
    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (StrToInt(cCPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))then
	    dig11 := '0'
    else
	    str(r:1, dig11);

    {Verifica se os digitos calculados conferem com os digitos informados}
    if ((dig10 = cCPF[10])and(dig11 = cCPF[11]))then
    begin
	    lCPFValido := True;
      Result := True;
    end
    else
    begin
	    lCPFValido := False;
      Result := False;
    end;
  except
    lCPFValido := False;
    Result := False
  end;
end;

end.
