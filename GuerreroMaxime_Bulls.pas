unit GuerreroMaxime_Bulls;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Phys.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Intf, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    StaticText1: TStaticText;
    Mystere: TEdit;
    StaticText2: TStaticText;
    Reponse: TEdit;
    Start: TButton;
    Valider: TButton;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    Bulls: TEdit;
    Cow: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Vie: TEdit;
    FDEventAlerter1: TFDEventAlerter;
    FDEventAlerter2: TFDEventAlerter;
    FDEventAlerter3: TFDEventAlerter;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure StartClick(Sender: TObject);
    procedure ValiderClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;




procedure TForm1.StartClick(Sender: TObject);
Var
  Compteur:integer;
  Alea:integer;
  Ligne:integer;

begin
 Start.Caption:='Recommencer';
 Reponse.Enabled:=True;
 Reponse.Text:=' ';
 Valider.enabled:=True;
  Mystere.Text:=' ';
  Randomize;
  Alea:=random(6);
  Alea:=Alea+2;

        //Maintenant initialisation des vies

    if Alea=3 then
      Begin
        Vie.Text:='4';
      End;

    if Alea=4 then
      Begin
        Vie.Text:='7';
      End;


    if Alea=5 then
      Begin
        Vie.Text:='10';
      End;


    if Alea=6 then
      Begin
        Vie.Text:='16';
      End;


    if Alea=7 then
      Begin
        Vie.Text:='20';
      End;

        //Maitenant on affiche la longueur masquer
    For compteur:=1 to Alea do
      Begin
       Mystere.Text:=Mystere.Text+'.. ';
      End;

        //Maintenant on va chercher l'un des mots qui corespond
   Ligne:=random(2)+1;
    {ici la ligne}
   Ligne:=Alea+Ligne;
   {Edit1.Text:=Memo1.Text);  //Il permet d'asocier le mot a un fichier cacher}
end;

procedure TForm1.ValiderClick(Sender: TObject);

Var
 mot: string;
 lettre: char;
 compteur: integer;
 Max: integer;
 Maxbull: integer;


begin
  //Alerte en cas de mauvaise saisie
  {compteur:=Vie.text;}
  If (length(reponse.Text)>1) or (length(reponse.Text)=0) then
   Begin
    FDEventAlerter2.Active:=True;
   End

  Else
  Begin
     mot:=reponse.Text;
   //Max:=length(Edit1.Text);                 //Le max sera le nombre de caractere a trouver

    If (mot>chr(64)) and (mot<chr(91)) or (mot>chr(96)) and (mot<chr(123)) then
    Begin
     {For  length(Edit1.text):=1  to max do
      Begin
        If (lettre=reponse.Text) then
        Begin                                //Permet de savoir les bulls
         Maxbulls:=Maxbulls+1;
         Bulls.Text:=Maxbulls;
         End;}

        If (lettre=reponse.Text) then
        Begin                          //Permet de savoir le nombre de cow
         Cow.text:=Cow.text+'1';
        End;

        {Else
         compteur:=compteur-1;      //Le compteur permettra de faire baisser le nombre de vie
        End;
       End;}

       If Vie.text='0' then
       Begin
        FDEventAlerter3.active:=True;    //Si les vies sont égale à 0 la partie se termine
        Valider.enabled:=False;         //Et il seras impossible a l'utilisateur de pouvoir continuer a jouer
        Reponse.Text:='Defaite';
        Reponse.enabled:=False;
       End;

       If Max=Maxbull then                    //Si le nombre de Bulls et égale aux nombre de mots c'est la
       Begin                                 //victoire
        Valider.enabled:=False;               //Et il seras impossible a l'utilisateur de pouvoir continuer a jouer
        Reponse.Text:='Victoire';              //Maxbull sera le nombre de bull trouver
        Reponse.enabled:=False;
       End;

       end


     Else
     Begin;
      FDEventAlerter1.Active:=True;
     end;

    End;

  end;

end.
