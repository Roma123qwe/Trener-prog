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
    procedure StartNewGameClick(Sender: TObject);
    procedure EnterWordKeyPress(Sender: TObject; var Key: Char);
    procedure EnterWordChange(Sender: TObject);
    procedure ConfirmWordClick(Sender: TObject);
    procedure GameRulesInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

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

Function GetGameWordFromFile(Path: String; Var Counter: Integer): String;
Var
   InputFile: TextFile;
   Word: String;
   IsCorrect: Boolean;
   I: Integer;
Begin
    IsCorrect := True;
    AssignFile(InputFile,PATH);

    If (IsCorrect) Then
    Begin
      Try
        Try
          Reset(InputFile);
          for I := 0 to Counter - 1 do
            Readln(InputFile, Word);
        Finally
          CloseFile(InputFile);
        End;
      Except
        Application.MessageBox('Ошибка при чтении данных из файла игры!', 'Ошибка' , MB_ICONERROR);
      End;
    End;

    GetGameWordFromFile := Word;
End;

Function CompareWords(PlayerWord: String; WordCounter: Integer): Boolean;
Const
  PATH_5 = 'd:\words_5.txt';
Var
  I, J: Integer;
  GameWord, ReversedGameWord: String;
Begin
  GameWord := GetGameWordFromFile(PATH_5, WordCounter);
  J := Length(GameWord);

  For I := 1 To Length(GameWord) Do
  Begin
    ReversedGameWord[J] := GameWord[I];
    Dec(J);
  End;

  if (PlayerWord = ReversedGameWord) then
    CompareWords := True
  else
    CompareWords := False;
End;

procedure TForm2.ConfirmWordClick(Sender: TObject);
Var
  IsWordCorrect: Boolean;
begin
  ConfirmWord.Enabled := False;
end;

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
    If Not(Key In ['A'..'Z','a'..'z', #08, #45]) Then
      Key := #0;
    if (Key In ['a'..'z']) then
      Key := Char(Ord(Key) - 32);
end;

procedure TForm2.GameRulesInfoClick(Sender: TObject);
Const
  FIRST_MESSAGE = 'Данная игра предназначена для тренировки памяти игрока.' + #13#10;
  SECOND_MESSAGE = 'В процессе игры на экран буду выводиться слова и через некоторое время пропадать.' + #13#10;
  THIRD_MESSAGE = 'Задачей игрока является запоминать эти слова и вводить эти же слова,но в обратном порядке.' + #13#10;
  FOURTH_MESSAGE = 'Со временем игра начинает усложняться: слова становяться длинне.На их запоминание дается чуть больше времени.' + #13#10;
  FIFTH_MESSAGE = 'Игра заканчивается, если игрок правильно введет три перевернутых слова из 8 букв.' + #13#10;
begin
  Application.MessageBox(FIRST_MESSAGE + SECOND_MESSAGE + THIRD_MESSAGE + FOURTH_MESSAGE + FIFTH_MESSAGE, 'Правила игры');
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
begin
  BackPanel.Visible := True;
  StartNewGame.Enabled := False;

  // Обратный отсчет до начала
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
    Task2Label.Caption := '3... 2... 1... Поехали!';
    Delay(100);
    Task1Label.Font.Color := clGrayText;
    Task2Label.Font.Color := clGrayText;
  // Конец обратного отсчета, начало игры

  GameWordLabel.Visible := True;
  EnterWord.Visible := True;
  EnterWord.Enabled := True;
  ConfirmWord.Visible := True;
end;


end.
