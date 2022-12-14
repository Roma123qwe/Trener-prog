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
    TimerGame: TTimer;
    procedure StartNewGameClick(Sender: TObject);
    procedure EnterWordKeyPress(Sender: TObject; var Key: Char);
    procedure EnterWordChange(Sender: TObject);
    procedure ConfirmWordClick(Sender: TObject);
    procedure GameRulesInfoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TimerGameTimer(Sender: TObject);
  private
  protected
  public
  end;

var
  Form2: TForm2;
  PhaseCounter, WordCounter: Integer;
  AnsiStr: String;
  Path: String;

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

Function GetGameWordFromFile(Path: String): String;
Var
   InputFile: TextFile;
   Word: String;
   IsCorrect: Boolean;
   I: Integer;
Begin
    IsCorrect := True;
    AssignFile(InputFile,Path);

    If (IsCorrect) Then
    Begin
      Try
        Try
          Reset(InputFile);
          for I := 0 to Unit2.WordCounter - 1 do
          Begin
            Readln(InputFile, Word);
            Word := UTF8ToAnsi(Word);
          End;
        Finally
          CloseFile(InputFile);
        End;
      Except
        Application.MessageBox('?????? ??? ?????? ?????? ?? ????? ????!', '??????' , MB_ICONERROR);
      End;
    End;

    GetGameWordFromFile := Word;
End;

Function CompareWords(PlayerWord: String; Path:String): Boolean;
Var
  I, J: Integer;
  GameWord, ReversedGameWord: String;
Begin
  GameWord := GetGameWordFromFile(Path);
  J := Length(GameWord);
  ReversedGameWord := GameWord;

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
  WordCounter: Integer;
  IsWordCorrect: Boolean;
  GameWord, PlayerWord: String;
begin
  ConfirmWord.Enabled := False;
  WordCounter := 1;
  PlayerWord := EnterWord.Text;

  IsWordCorrect := CompareWords(PlayerWord, Path);
  if IsWordCorrect then
  Begin
    ResultLabel.Visible := True;
    ResultLabel.Font.Color := clGreen;
    ResultLabel.Left := ResultLabel.Left - 80;
    ResultLabel.Caption := '?????????? ?????!';

    Inc(Unit2.WordCounter);

    if Unit2.WordCounter > 3 then
    Begin
      Inc(Unit2.PhaseCounter);
      Unit2.WordCounter := 1;
    End;
  End
  Else
  Begin
    ResultLabel.Visible := True;
    ResultLabel.Font.Color := clRed;
    ResultLabel.Left := ResultLabel.Left - 90;
    ResultLabel.Caption := '???????????? ?????!';
  End;

  Delay(500);
  EnterWord.Text := '';
  ResultLabel.Caption := '';
  ResultLabel.Left := 254;

  TimerGame.Enabled := True;
end;

procedure TForm2.EnterWordChange(Sender: TObject);
begin
  If(EnterWord.Text <> '') then
  Begin
    ConfirmWord.Enabled := True;
    EnterWord.Font.Color := clCaptionText;
  End
  Else
  Begin
    ConfirmWord.Enabled := False;
    EnterWord.Font.Color := clGray;
  End;
end;

procedure TForm2.EnterWordKeyPress(Sender: TObject; var Key: Char);
Var
  TempKey: String;
begin
    If (Length(EnterWord.Text) < 1) And (Key = '-') Then
      Key := #0;
    AnsiStr := AnsiString(Key);
    If Not(AnsiStr[1] In ['?'..'?','?'..'?', #08, #45]) Then
      Key := #0;
    If (AnsiStr[1] In ['?'..'?']) Then
    Begin
      //
    End;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
Var
  WND: HWND;
  lpCaption, lpText: PChar;
  Tip: Integer;
begin
  TimerGame.Enabled := False;
  WND := Form2.Handle;
  lpCaption := '?????';
  lpText := '?? ???????, ??? ?????? ??????';
  Tip := MB_YESNO + MB_ICONINFORMATION + MB_DEFBUTTON2;
  Case MessageBox(WND, lpText, lpCaption, Tip) Of
      IDYES :
        CanClose := True;
      IDNO :
      Begin
        CanClose := False;
        TimerGame.Enabled := True;
      End;
  End
end;

procedure TForm2.GameRulesInfoClick(Sender: TObject);
Const
  FIRST_MESSAGE = '?????? ???? ????????????? ??? ?????????? ?????? ??????.' + #13#10;
  SECOND_MESSAGE = '? ???????? ???? ?? ????? ???? ?????????? ????? ? ????? ????????? ????? ?????????.' + #13#10;
  THIRD_MESSAGE = '??????? ?????? ???????? ?????????? ??? ????? ? ??????? ??? ?? ?????,?? ? ???????? ???????.' + #13#10;
  FOURTH_MESSAGE = '?? ???????? ???? ???????? ???????????: ????? ??????????? ??????.?? ?? ??????????? ?????? ???? ?????? ???????.' + #13#10;
  FIFTH_MESSAGE = '???? ?????????????, ???? ????? ????????? ?????? ??? ???????????? ????? ?? 8 ????.' + #13#10;
  SIXTH_MESSAGE = '??? ????? ?????????? ??????? ????????!';
  SEVENTH_MESSAGE = '????? ? ???????!';
begin
  Application.MessageBox(FIRST_MESSAGE + SECOND_MESSAGE + THIRD_MESSAGE +
  FOURTH_MESSAGE + FIFTH_MESSAGE + SIXTH_MESSAGE + SEVENTH_MESSAGE, '??????? ????');
end;

procedure TForm2.StartNewGameClick(Sender: TObject);
Const
  PATH_5 = 'd:\words_5.txt';
Var
  InputFile: TextFile;
  GameWord: String;
  GameStop: Boolean;
  WordCounter, PhaseCounter: Integer;
begin
  BackPanel.Visible := True;
  StartNewGame.Enabled := False;

  // ???????? ?????? ?? ??????
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
    Task2Label.Caption := '3... 2... 1... ???????!';
    Delay(100);
    Task1Label.Font.Color := clGrayText;
    Task2Label.Font.Color := clGrayText;
  // ????? ????????? ???????, ?????? ????

  GameWordLabel.Visible := True;
  EnterWord.Visible := True;
  EnterWord.Enabled := True;
  ConfirmWord.Visible := True;
  Unit2.PhaseCounter := 1;
  Unit2.WordCounter := 1;
  TimerGame.Enabled := True;
  ConfirmWord.Default := True;
  Unit2.Path := PATH_5;
end;

procedure TForm2.TimerGameTimer(Sender: TObject);
Const
  PATH_5 = 'd:\words_5.txt';
  PATH_6 = 'd:\words_6.txt';
  PATH_7 = 'd:\words_7.txt';
  PATH_8 = 'd:\words_8.txt';
begin
  TimerGame.Enabled := False;

  if Unit2.PhaseCounter = 1 then
  Begin
    Unit2.Path := PATH_5;

    GameWordLabel.Caption := '';
    GameWordLabel.Left := 254;

    GameWordLabel.Caption := GetGameWordFromFile(Path);
    Delay(1000);
    GameWordLabel.Caption := '';
    Delay(300);
    GameWordLabel.Left := GameWordLabel.Left - 200;
    GameWordLabel.Font.Size := 10;
    GameWordLabel.Caption := '????????? ????? ? ??????? ??? ???????? ? ???? ????';
  End;

  if Unit2.PhaseCounter = 2 then
  Begin
    Unit2.Path := PATH_6;

    GameWordLabel.Caption := '';
    GameWordLabel.Left := 254;

    GameWordLabel.Caption := GetGameWordFromFile(Path);
    Delay(1000);
    GameWordLabel.Caption := '';
    Delay(300);
    GameWordLabel.Left := GameWordLabel.Left - 200;
    GameWordLabel.Font.Size := 10;
    GameWordLabel.Caption := '????????? ????? ? ??????? ??? ???????? ? ???? ????';
  End;

  if Unit2.PhaseCounter = 3 then
  Begin
    Unit2.Path := PATH_7;

    GameWordLabel.Caption := '';
    GameWordLabel.Left := 254;

    GameWordLabel.Caption := GetGameWordFromFile(Path);
    Delay(1000);
    GameWordLabel.Caption := '';
    Delay(300);
    GameWordLabel.Left := GameWordLabel.Left - 200;
    GameWordLabel.Font.Size := 10;
    GameWordLabel.Caption := '????????? ????? ? ??????? ??? ???????? ? ???? ????';
  End;

  if Unit2.PhaseCounter = 4 then
  Begin
    Unit2.Path := PATH_8;

    GameWordLabel.Caption := '';
    GameWordLabel.Left := 254;

    GameWordLabel.Caption := GetGameWordFromFile(Path);
    Delay(1000);
    GameWordLabel.Caption := '';
    Delay(300);
    GameWordLabel.Left := GameWordLabel.Left - 200;
    GameWordLabel.Font.Size := 10;
    GameWordLabel.Caption := '????????? ????? ? ??????? ??? ???????? ? ???? ????';
  End;

  if Unit2.PhaseCounter = 5 then
  Begin
    EnterWord.Enabled := False;
    Application.MessageBox('??????????? ? ???????!?? ?????? ?????? ????.', '??????!');
  End;
end;

end.
