//Dartcounter has been developed for educational use only. By viewing this code
//and using this software you agree to the conditions that you will not sell it
//or use it commercially in any other way. Have fun! - David
unit Unit1;


{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, LazHelpHTML, ExtCtrls, Spin, Menus, LCLIntf;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure beurtbepaler;
    procedure beurtbepalergewonnen;
    procedure Button4Click(Sender: TObject);
    procedure checkvaluegewonnen;
    procedure Button3Click(Sender: TObject);
    procedure checkvalue;
    procedure Label25Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure reset;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  aandebeurt,c,typespel,doorgaantot,aantalgespeeld : INTEGER;
  input : array [1..6] of INTEGER;
  score : array [1..2] of INTEGER;
  beurtcount : array [1..2] of INTEGER;
  aantalgewonnen : array [1..2] of INTEGER;
  allowedvalue,gewonnenvalue : BOOLEAN;
implementation

{$R *.lfm}

{ TForm1 }

PROCEDURE TForm1.beurtbepaler;
BEGIN
  IF aandebeurt = 1 THEN FOR c := 1 TO 3 DO checkvalue
  ELSE FOR c := 4 TO 6 DO checkvalue;
end;

PROCEDURE TForm1.beurtbepalergewonnen;
BEGIN
  IF aandebeurt = 1 THEN FOR c := 3 TO 3 DO checkvaluegewonnen
  ELSE FOR c := 6 TO 6 DO checkvaluegewonnen;
end;

PROCEDURE TForm1.reset;
BEGIN
  ComboBox1.Enabled := TRUE;
  ComboBox1.ItemIndex := 1;
  ComboBox2.Enabled := TRUE;
  ComboBox2.ItemIndex := 4;
  Button1.Enabled := FALSE;
  Button1.Caption := 'Klik startknop';
  Button2.Enabled := FALSE;
  Button2.Caption := 'Klik startknop';
  Button3.Enabled := TRUE;
  Button3.Caption := 'Start';
  Shape1.Brush.Color := clBlack;
  Shape2.Brush.Color := clBlack;
  Label16.Caption := '0';
  Label17.Caption := '0';
  Label21.Caption := '0';
  Label22.Caption := '0';
  Label12.Caption := '0';
  Label13.Caption := '0';
  aantalgewonnen[1] := 0;
  aantalgewonnen[2] := 0;
  aantalgespeeld := 0;
  beurtcount[1] := 0;
  beurtcount[2] := 0;
END;

procedure TForm1.Button4Click(Sender: TObject);  //Verwijst door naar de resetprocedure
begin
  reset;
end;

PROCEDURE TForm1.checkvaluegewonnen;
BEGIN
  CASE input[c] OF
  2,36,8,26,12,20,30,4,34,6,38,14,32,16,22,28,18,24,10,40,50 : gewonnenvalue := TRUE;
  ELSE gewonnenvalue := FALSE;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject); //Startspel
begin
  ComboBox1.Enabled := FALSE;
  ComboBox2.Enabled := FALSE;
  Button3.Enabled := FALSE;
  Button3.Caption := 'Spel gestart';
  IF ComboBox1.Text = '301' THEN
    BEGIN
      score[1] := 301;
      score[2] := 301;
      typespel := 301;
    END
    ELSE IF ComboBox1.Text = '501 (Standaard)' THEN
        BEGIN
          score[1] := 501;
          score[2] := 501;
          typespel := 501;
        END
       ELSE IF ComboBox1.Text = '701' THEN
           BEGIN
             score[1] := 701;
             score[2] := 701;
             typespel := 701;
           END
         ELSE IF ComboBox1.Text = '1001' THEN
             BEGIN
               score[1] := 1001;
               score[2] := 1001;
               typespel := 1001;
             END;
  IF ComboBox2.Text = 'Best of 1' THEN doorgaantot := 1
  ELSE IF ComboBox2.Text = 'Best of 3' THEN doorgaantot := 3
  ELSE IF ComboBox2.Text = 'Best of 5' THEN doorgaantot := 5
  ELSE IF ComboBox2.Text = 'Best of 9' THEN doorgaantot := 9
  ELSE;
  Label16.Caption := IntToStr(score[1]);
  Label17.Caption := IntToStr(score[2]);
  Shape1.Brush.Color := clAppWorkspace;
  Button1.Enabled := TRUE;
  Button1.Caption := 'Verstuur';
  Button2.Caption := 'Beurt over';
  aandebeurt := 1;
end;

PROCEDURE TForm1.checkvalue;
BEGIN
  CASE input[c] OF
  0,1,18,4,13,6,10,15,2,17,3,19,7,16,8,11,14,9,12,5,20,25,50,26,30,4,34,38,32,22,28,24,40,54,39,45,51,57,21,48,33,42,27,36,60 : allowedvalue := TRUE;
  ELSE allowedvalue := FALSE;
  end;
end;

procedure TForm1.Label25Click(Sender: TObject);
begin
  OpenURL('https://github.com/DB1999/Dartcounter');
end;

procedure TForm1.Label9Click(Sender: TObject);
begin
  OpenURL('http://darts.is-leuk.nl/spelregels.html');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  input[1] := StrToInt(Edit1.Text);
  input[2] := StrToInt(Edit2.Text);
  input[3] := StrToInt(Edit3.Text);
  beurtbepaler;
  IF allowedvalue = TRUE THEN
  BEGIN
    beurtcount[1] := beurtcount[1] + 1;
    Label12.Caption := IntToStr(beurtcount[1]);
    Button1.Enabled := FALSE;
    Button2.Enabled := TRUE;
    Shape1.Brush.Color := clBlack;
    Shape2.Brush.Color := clAppWorkspace;
    Button1.Caption := 'Beurt over';
    Button2.Caption := 'Verstuur';
    Edit1.Text := 'Score';
    Edit2.Text := 'Score';
    Edit3.Text := 'Score';
    IF score[1] - input[1] - input[2] - input[3] < 0 THEN ShowMessage('Je score is lager dan 0, je moet op 0 uitkomen.')
    ELSE IF score[1] - input[1] - input[2] - input[3] = 0 THEN
      BEGIN
        beurtbepalergewonnen;
        IF gewonnenvalue = TRUE THEN
          BEGIN
            score[1] := score[1] - input[1] - input[2] - input[3];
            ShowMessage('Je score is 0, je hebt dit potje gewonnen!');
            aantalgewonnen[1] := aantalgewonnen[1] + 1;
            aantalgespeeld := aantalgespeeld + 1;
            Label22.Caption := IntToStr(aantalgewonnen[1]);
            IF aantalgespeeld = doorgaantot THEN
              BEGIN
                IF aantalgewonnen[1] > aantalgewonnen[2] THEN
                  BEGIN
                    ShowMessage('Gefeliciteerd speler 1, je hebt de wedstrijd gewonnen met '+IntToStr(aantalgewonnen[1])+' tegen '+IntToStr(aantalgewonnen[2])+'. Het spel zal nu resetten.');
                    reset;
                  end
                ELSE
                BEGIN
                  ShowMessage('Gefeliciteerd speler 2, je hebt gewonnen met '+IntToStr(aantalgewonnen[2])+' tegen '+IntToStr(aantalgewonnen[1])+'. Het spel zal nu resetten.');
                  reset;
                end;
              END
            ELSE;
            score[1] := typespel;
            score[2] := typespel;
            beurtcount[1] := 0;
            beurtcount[2] := 0;
            Label12.Caption := IntToStr(beurtcount[1]);
            Label13.Caption := IntToStr(beurtcount[2]);
            Label16.Caption := IntToStr(score[1]);
            Label17.Caption := IntToStr(score[2]);
          END
        ELSE ShowMessage('Je laatste pijl moet dubbel of een bull''s eye zijn.');
      END
    ELSE
      BEGIN
        score[1] := score[1] - input[1] - input[2] - input[3];
        Label16.Caption := IntToStr(score[1]);
      END;
  aandebeurt := 2;
  END
  ELSE ShowMessage('1 of meerdere waarden zijn niet mogelijk volgens de officiele dartregels, voer andere waarden in.');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  input[4] := StrToInt(Edit4.Text);
  input[5] := StrToInt(Edit5.Text);
  input[6] := StrToInt(Edit6.Text);
  beurtbepaler;
  IF allowedvalue = TRUE THEN
    BEGIN
      beurtcount[2] := beurtcount[2] + 1;
      Label13.Caption := IntToStr(beurtcount[2]);
      Button2.Enabled := FALSE;
      Button1.Enabled := TRUE;
      Shape2.Brush.Color := clBlack;
      Shape1.Brush.Color := clAppWorkspace;
      Button2.Caption := 'Beurt over';
      Button1.Caption := 'Verstuur';
      Edit4.Text := 'Score';
      Edit5.Text := 'Score';
      Edit6.Text := 'Score';
      IF score[2] - input[4] - input[5] - input[6] < 0 THEN ShowMessage('Je score is lager dan 0, je moet op 0 uitkomen.')
    ELSE IF score[2] - input[4] - input[5] - input[6] = 0 THEN
      BEGIN
        beurtbepalergewonnen;
        IF gewonnenvalue = TRUE THEN
          BEGIN
            score[2] := score[2] - input[4] - input[5] - input[6];
            ShowMessage('Je score is 0, je hebt gewonnen!');
            aantalgewonnen[2] := aantalgewonnen[2] + 1;
            aantalgespeeld := aantalgespeeld + 1;
            Label21.Caption := IntToStr(aantalgewonnen[2]);
            IF aantalgespeeld = doorgaantot THEN
              BEGIN
                IF aantalgewonnen[1] > aantalgewonnen[2] THEN
                  BEGIN
                    ShowMessage('Gefeliciteerd speler 1, je hebt gewonnen met '+IntToStr(aantalgewonnen[1])+' tegen '+IntToStr(aantalgewonnen[2])+'. Het spel zal nu resetten.');
                    reset;
                  end
                ELSE
                BEGIN
                  ShowMessage('Gefeliciteerd speler 2, je hebt gewonnen met '+IntToStr(aantalgewonnen[2])+' tegen '+IntToStr(aantalgewonnen[1])+'. Het spel zal nu resetten.');
                  reset;
                END;
              END
            ELSE;
            score[1] := typespel;
            score[2] := typespel;
            beurtcount[1] := 0;
            beurtcount[2] := 0;
            Label12.Caption := IntToStr(beurtcount[1]);
            Label13.Caption := IntToStr(beurtcount[2]);
            Label16.Caption := IntToStr(score[1]);
            Label17.Caption := IntToStr(score[2]);
          END
        ELSE ShowMessage('Je laatste pijl moet dubbel of een bull''s eye zijn.');
      END
    ELSE
      BEGIN
        score[2] := score[2] - input[4] - input[5] - input[6];
        Label17.Caption := IntToStr(score[2]);
      END;
  aandebeurt := 1;
  END
  ELSE ShowMessage('1 of meerdere waarden zijn niet mogelijk volgens de officiele dartregels, voer andere waarden in.');
end;

end.

