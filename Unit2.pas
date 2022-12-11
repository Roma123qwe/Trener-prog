unit Unit2;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus;
type
  TForm2 = class(TForm)
    BackPanel: TPanel;
    Task1Label: TLabel;
    ConfirmWord: TButton;
    ResultLabel: TLabel;
    Task2Label: TLabel;
    EnterWord: TEdit;
    GameWordLabel: TLabel;
    StartNewGame: TButton;
    MainMenu: TMainMenu;
    GameRulesInfo: TMenuItem;
    HintLabel: TLabel;
    Timer1: TTimer;
    RandomWordLabel: TLabel;
    procedure StartNewGameClick(Sender: TObject);
    procedure EnterWordKeyPress(Sender: TObject; var Key: Char);
    procedure EnterWordChange(Sender: TObject);
    procedure ConfirmWordClick(Sender: TObject);
    procedure GameRulesInfoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form2: TForm2;
  AnsiStr: AnsiString;
  GameWord, ReversedGameWord: String;
implementation
{$R *.dfm}
procedure Delay(Value: Cardinal);
var
  F, N: Cardinal;
begin
  N := 0;
  while N <= (Value div 10) do
  begin
    SleepEx(1, True);
    Application.ProcessMessages;
    Inc(N);
  end;
  F := GetTickCount;
  repeat
    Application.ProcessMessages;
    N := GetTickCount;
  until (N - F >= (Value mod 10)) or (N < F);
end;
Function GetGameWordFromFile: String;
Const
   Path = 'C:\Users\eugen\OneDrive\Desktop\File.txt';
Var
   InputFile: TextFile;
   Word: String;
   IsCorrect: Boolean;
   I: Integer;
   List:TStringList;
   N:integer;
Begin
    IsCorrect := True;
    If (IsCorrect) Then
    Begin
      AssignFile(InputFile,PATH);
      Reset(InputFile);
      Try
          Randomize;
          List := TStringList.Create;
          List.LoadFromFile(Path);
          N := random(List.Count);
          Word := List.Strings[N];
          Word := UTF8ToAnsi(Word);
      Except
        Application.MessageBox('Îøèáêà ïðè ÷òåíèè äàííûõ èç ôàéëà èãðû!', 'Îøèáêà' , MB_ICONERROR);
      End;
      CloseFile(InputFile);
    End;
    GetGameWordFromFile := Word;
End;
Function CompareWords(PlayerWord, ReversedGameWord: String): Boolean;
Var
  I, J: Integer;
Begin
    If((PlayerWord = ReversedGameWord) And (Length(PlayerWord) <> 0)) Then
        Application.MessageBox('Вы правильно отгадали слово!', 'Ответ', 0)
    Else
        Application.MessageBox('Вы неправильно отгадали слово!:/', 'Ответ', 0);
End;

procedure TForm2.EnterWordChange(Sender: TObject);
begin
  If(EnterWord.Text <> '') then
    ConfirmWord.Enabled := True
  Else
    ConfirmWord.Enabled := False;
end;
procedure TForm2.EnterWordKeyPress(Sender: TObject; var Key: Char);
begin
    If (Length(EnterWord.Text) < 1) And (Key = '-') Then
      Key := #0;
    AnsiStr := AnsiString(Key);
    If Not(AnsiStr[1] In ['А'..'Я','а'..'я', #08, #45]) Then
      Key := #0;
    if (Key In ['a'..'z']) then
      Key := Char(Ord(Key) - 32);
end;

procedure TForm2.GameRulesInfoClick(Sender: TObject);
Const
  FIRST_MESSAGE = 'Äàííàÿ èãðà ïðåäíàçíà÷åíà äëÿ òðåíèðîâêè ïàìÿòè èãðîêà.' + #13#10;
  SECOND_MESSAGE = 'Â ïðîöåññå èãðû íà ýêðàí áóäó âûâîäèòüñÿ ñëîâà è ÷åðåç íåêîòîðîå âðåìÿ ïðîïàäàòü.' + #13#10;
  THIRD_MESSAGE = 'Çàäà÷åé èãðîêà ÿâëÿåòñÿ çàïîìèíàòü ýòè ñëîâà è ââîäèòü ýòè æå ñëîâà,íî â îáðàòíîì ïîðÿäêå.' + #13#10;
  FOURTH_MESSAGE = 'Ñî âðåìåíåì èãðà íà÷èíàåò óñëîæíÿòüñÿ: ñëîâà ñòàíîâÿòüñÿ äëèííå.Íà èõ çàïîìèíàíèå äàåòñÿ ÷óòü áîëüøå âðåìåíè.' + #13#10;
  FIFTH_MESSAGE = 'Èãðà çàêàí÷èâàåòñÿ, åñëè èãðîê ïðàâèëüíî ââåäåò òðè ïåðåâåðíóòûõ ñëîâà èç 8 áóêâ.' + #13#10;
begin
  Application.MessageBox(FIRST_MESSAGE + SECOND_MESSAGE + THIRD_MESSAGE + FOURTH_MESSAGE + FIFTH_MESSAGE, 'Ïðàâèëà èãðû');
end;

procedure TForm2.StartNewGameClick(Sender: TObject);
Const
  PATH_6 = 'd:\words_6.txt';
  PATH_7 = 'd:\words_7.txt';
  PATH_8 = 'd:\words_8.txt';
Var
  InputFile: TextFile;
  GameWord: String;
  GameStop: Boolean;
  WordCounter, PhaseCounter: Integer;
  I, J, LengthOfWord: Integer;
begin
    RandomWordLabel.Visible := True;
    GameWord := GetGameWordFromFile;
    BackPanel.Visible := True;
    StartNewGame.Enabled := False;
    J := Length(GameWord);
    LengthOfWord := Length(GameWord);
    For I := Length(GameWord) DownTo 1 Do
        HintLabel.Caption := HintLabel.Caption + GameWord[I];
    GameWord := HintLabel.Caption;
  // Îáðàòíûé îòñ÷åò äî íà÷àëà
    Delay(500);
    Task2Label.Visible := True;
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3.';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3..';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3...';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2.';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2..';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2...';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2... 1';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2... 1.';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2... 1..';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2... 1...';
    Delay(500);
    Task2Label.Left := Task2Label.Left - 10;
    Task2Label.Caption := '3... 2... 1... Ïîåõàëè!';
    Delay(100);
    Task1Label.Font.Color := clGrayText;
    Task2Label.Font.Color := clGrayText;
    HintLabel.Visible := True;
    Timer1.Enabled := True;
  // Êîíåö îáðàòíîãî îòñ÷åòà, íà÷àëî èãðû
  GameWordLabel.Visible := True;
  EnterWord.Visible := True;
  EnterWord.Enabled := True;
  ConfirmWord.Visible := True;
end;

procedure TForm2.ConfirmWordClick(Sender: TObject);
Var
  IsWordCorrect: Boolean;
  EnteringWord: String;
  I, J, LengthOfWord: Integer;
begin
    ConfirmWord.Enabled := False;
    EnteringWord := EnterWord.Text;
    CompareWords(EnteringWord, ReversedGameWord);
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
    HintLabel.Visible := False;
end;

End.
