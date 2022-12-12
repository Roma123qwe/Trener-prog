
ï»¿unit Unit2;
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
        Application.MessageBox('ÃÃ¸Ã¨Ã¡ÃªÃ  Ã¯Ã°Ã¨ Ã·Ã²Ã¥Ã­Ã¨Ã¨ Ã¤Ã Ã­Ã­Ã»Ãµ Ã¨Ã§ Ã´Ã Ã©Ã«Ã  Ã¨Ã£Ã°Ã»!', 'ÃÃ¸Ã¨Ã¡ÃªÃ ' , MB_ICONERROR);
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
        Application.MessageBox('ÐÑ Ð¿ÑÐ°Ð²Ð¸Ð»ÑÐ½Ð¾ Ð¾ÑÐ³Ð°Ð´Ð°Ð»Ð¸ ÑÐ»Ð¾Ð²Ð¾!', 'ÐÑÐ²ÐµÑ', 0)
    Else
        Application.MessageBox('ÐÑ Ð½ÐµÐ¿ÑÐ°Ð²Ð¸Ð»ÑÐ½Ð¾ Ð¾ÑÐ³Ð°Ð´Ð°Ð»Ð¸ ÑÐ»Ð¾Ð²Ð¾!:/', 'ÐÑÐ²ÐµÑ', 0);
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
    If Not(AnsiStr[1] In ['Ð'..'Ð¯','Ð°'..'Ñ', #08, #45]) Then
      Key := #0;
    if (Key In ['a'..'z']) then
      Key := Char(Ord(Key) - 32);
end;

procedure TForm2.GameRulesInfoClick(Sender: TObject);
Const
  FIRST_MESSAGE = 'ÃÃ Ã­Ã­Ã Ã¿ Ã¨Ã£Ã°Ã  Ã¯Ã°Ã¥Ã¤Ã­Ã Ã§Ã­Ã Ã·Ã¥Ã­Ã  Ã¤Ã«Ã¿ Ã²Ã°Ã¥Ã­Ã¨Ã°Ã®Ã¢ÃªÃ¨ Ã¯Ã Ã¬Ã¿Ã²Ã¨ Ã¨Ã£Ã°Ã®ÃªÃ .' + #13#10;
  SECOND_MESSAGE = 'Ã Ã¯Ã°Ã®Ã¶Ã¥Ã±Ã±Ã¥ Ã¨Ã£Ã°Ã» Ã­Ã  Ã½ÃªÃ°Ã Ã­ Ã¡Ã³Ã¤Ã³ Ã¢Ã»Ã¢Ã®Ã¤Ã¨Ã²Ã¼Ã±Ã¿ Ã±Ã«Ã®Ã¢Ã  Ã¨ Ã·Ã¥Ã°Ã¥Ã§ Ã­Ã¥ÃªÃ®Ã²Ã®Ã°Ã®Ã¥ Ã¢Ã°Ã¥Ã¬Ã¿ Ã¯Ã°Ã®Ã¯Ã Ã¤Ã Ã²Ã¼.' + #13#10;
  THIRD_MESSAGE = 'ÃÃ Ã¤Ã Ã·Ã¥Ã© Ã¨Ã£Ã°Ã®ÃªÃ  Ã¿Ã¢Ã«Ã¿Ã¥Ã²Ã±Ã¿ Ã§Ã Ã¯Ã®Ã¬Ã¨Ã­Ã Ã²Ã¼ Ã½Ã²Ã¨ Ã±Ã«Ã®Ã¢Ã  Ã¨ Ã¢Ã¢Ã®Ã¤Ã¨Ã²Ã¼ Ã½Ã²Ã¨ Ã¦Ã¥ Ã±Ã«Ã®Ã¢Ã ,Ã­Ã® Ã¢ Ã®Ã¡Ã°Ã Ã²Ã­Ã®Ã¬ Ã¯Ã®Ã°Ã¿Ã¤ÃªÃ¥.' + #13#10;
  FOURTH_MESSAGE = 'ÃÃ® Ã¢Ã°Ã¥Ã¬Ã¥Ã­Ã¥Ã¬ Ã¨Ã£Ã°Ã  Ã­Ã Ã·Ã¨Ã­Ã Ã¥Ã² Ã³Ã±Ã«Ã®Ã¦Ã­Ã¿Ã²Ã¼Ã±Ã¿: Ã±Ã«Ã®Ã¢Ã  Ã±Ã²Ã Ã­Ã®Ã¢Ã¿Ã²Ã¼Ã±Ã¿ Ã¤Ã«Ã¨Ã­Ã­Ã¥.ÃÃ  Ã¨Ãµ Ã§Ã Ã¯Ã®Ã¬Ã¨Ã­Ã Ã­Ã¨Ã¥ Ã¤Ã Ã¥Ã²Ã±Ã¿ Ã·Ã³Ã²Ã¼ Ã¡Ã®Ã«Ã¼Ã¸Ã¥ Ã¢Ã°Ã¥Ã¬Ã¥Ã­Ã¨.' + #13#10;
  FIFTH_MESSAGE = 'ÃÃ£Ã°Ã  Ã§Ã ÃªÃ Ã­Ã·Ã¨Ã¢Ã Ã¥Ã²Ã±Ã¿, Ã¥Ã±Ã«Ã¨ Ã¨Ã£Ã°Ã®Ãª Ã¯Ã°Ã Ã¢Ã¨Ã«Ã¼Ã­Ã® Ã¢Ã¢Ã¥Ã¤Ã¥Ã² Ã²Ã°Ã¨ Ã¯Ã¥Ã°Ã¥Ã¢Ã¥Ã°Ã­Ã³Ã²Ã»Ãµ Ã±Ã«Ã®Ã¢Ã  Ã¨Ã§ 8 Ã¡Ã³ÃªÃ¢.' + #13#10;
begin
  Application.MessageBox(FIRST_MESSAGE + SECOND_MESSAGE + THIRD_MESSAGE + FOURTH_MESSAGE + FIFTH_MESSAGE, 'ÃÃ°Ã Ã¢Ã¨Ã«Ã  Ã¨Ã£Ã°Ã»');
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
  // ÃÃ¡Ã°Ã Ã²Ã­Ã»Ã© Ã®Ã²Ã±Ã·Ã¥Ã² Ã¤Ã® Ã­Ã Ã·Ã Ã«Ã 
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
    Task2Label.Caption := '3... 2... 1... ÃÃ®Ã¥ÃµÃ Ã«Ã¨!';
    Delay(100);
    Task1Label.Font.Color := clGrayText;
    Task2Label.Font.Color := clGrayText;
    HintLabel.Visible := True;
    Timer1.Enabled := True;
  // ÃÃ®Ã­Ã¥Ã¶ Ã®Ã¡Ã°Ã Ã²Ã­Ã®Ã£Ã® Ã®Ã²Ã±Ã·Ã¥Ã²Ã , Ã­Ã Ã·Ã Ã«Ã® Ã¨Ã£Ã°Ã»
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
