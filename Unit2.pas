unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus,
  Vcl.ComCtrls;

type
  TArrStr = Array Of String;
  TForm2 = class(TForm)
    MainMenu: TMainMenu;
    GameRulesInfo: TMenuItem;
    Stage1GameTimer: TTimer;
    PageControl: TPageControl;
    MenuStage: TTabSheet;
    FirstStage: TTabSheet;
    SecondStage: TTabSheet;
    ThirdStage: TTabSheet;
    FourthStage: TTabSheet;
    FifthStage: TTabSheet;
    StartNewGame: TButton;
    Stage1BackPanel: TPanel;
    Stage1Task1Label: TLabel;
    Stage1ResultLabel: TLabel;
    Stage1Task2Label: TLabel;
    Stage1GameWordLabel: TLabel;
    Stage1ConfirmWord: TButton;
    Stage1EnterWord: TEdit;
    WelcomeLabel: TLabel;
    GameInfoLabel: TLabel;
    Requirement1Label: TLabel;
    OpenFromFileDialog: TOpenDialog;
    FileMenu: TMenuItem;
    OpenFromFileMenu: TMenuItem;
    Requirement2Label: TLabel;
    Stage2Task1Label: TLabel;
    Stage2GameWordsLabel: TLabel;
    Stage2MemoForWords: TMemo;
    Stage2ConfirmWordsButton: TButton;
    Stage2GameTimer: TTimer;
    Stage2ResultLabel: TLabel;
    Stage3GameTimer: TTimer;
    Stage3ConfirmWordsButton: TButton;
    Stage3Task1Label: TLabel;
    Stage3GameWordsLabel: TLabel;
    Stage3MemoForWords: TMemo;
    Stage3ResultLabel: TLabel;
    Stage4GameTimer: TTimer;
    Stage4MemoForWords: TMemo;
    Stage4Task1Label: TLabel;
    Stage4GameWordsLabel: TLabel;
    Stage4ResultLabel: TLabel;
    Stage4ConfirmWordsButton: TButton;
    procedure StartNewGameClick(Sender: TObject);
    procedure Stage1EnterWordChange(Sender: TObject);
    procedure Stage1ConfirmWordClick(Sender: TObject);
    procedure GameRulesInfoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Stage1GameTimerTimer(Sender: TObject);
    procedure OpenFromFileMenuClick(Sender: TObject);
    procedure Stage2GameTimerTimer(Sender: TObject);
    procedure Stage2ConfirmWordsButtonClick(Sender: TObject);
    procedure Stage2MemoForWordsChange(Sender: TObject);
    procedure Stage3MemoForWordsChange(Sender: TObject);
    procedure Stage3GameTimerTimer(Sender: TObject);
    procedure Stage3ConfirmWordsButtonClick(Sender: TObject);
    procedure Stage1EnterWordKeyPress(Sender: TObject; var Key: Char);
    procedure Stage2MemoForWordsKeyPress(Sender: TObject; var Key: Char);
    procedure Stage3MemoForWordsKeyPress(Sender: TObject; var Key: Char);
    procedure Stage4MemoForWordsChange(Sender: TObject);
    procedure Stage4MemoForWordsKeyPress(Sender: TObject; var Key: Char);
    procedure Stage4ConfirmWordsButtonClick(Sender: TObject);
    procedure Stage4GameTimerTimer(Sender: TObject);
  private
  protected
  public
  end;

var
  Form2: TForm2;
  StageCounter, PhaseCounter, RightCounter: Integer;
  GameWord: String;
  GameWords: TArrStr;
  Path, Path_5, Path_6, Path_7, Path_8, Path_Stage_2_3_4_5: String;

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
   List: TStringList;
   I, N: Integer;
Begin
    IsCorrect := True;
    AssignFile(InputFile,Path);

    If (IsCorrect) Then
    Begin
      Try
        Try
          Reset(InputFile);
          for I := 0 to Unit2.RightCounter - 1 do
          Begin
            Randomize;
            List := TStringList.Create;
            List.LoadFromFile(Path);
            N := random(List.Count);
            Word := List.Strings[N];
            Word := UTF8ToAnsi(Word);
            {
            удаление слова через memo
            Form2.MemoForFileRewriting.Lines.LoadFromFile(Path);
            for J := 0 to Form2.MemoForFileRewriting.Lines.Count - 1 do
              if Form2.MemoForFileRewriting.Lines[J] = Word then
                Form2.MemoForFileRewriting.Lines.Delete(J);
            Form2.MemoForFileRewriting.Lines.SaveToFile(path);
            }
            {
            удаление через list
             List.Delete(N);
             List.SaveToFile(Path);
             List.Free;
            }
          End;
        Finally
          CloseFile(InputFile);
        End;
      Except
        Application.MessageBox('Ошибка при чтении данных из файла игры!', 'Ошибка' , MB_ICONERROR);
      End;
    End;

    GetGameWordFromFile := Word;
End;

Procedure GetGameWordsFromFileStage_2_3_4(Path: String);
Var
  InputFile: TextFile;
  IsCorrect: Boolean;
  List: TStringList;
  I, N, Length: Integer;
Begin
  IsCorrect := True;
  AssignFile(InputFile,Path);
  case Unit2.PhaseCounter of
    1:
    Begin
      Length := 5;
    End;
    2:
    Begin
      Length := 6;
    End;
    3:
    Begin
      Length := 7;
    End;
    4:
    Begin
      Length := 8;
    End;
  end;
  SetLength(Unit2.GameWords, Length);

  If (IsCorrect) Then
  Begin
    Try
      Try
        Reset(InputFile);

        for I := 0 to Length - 1 do
        Begin
          Randomize;
          List := TStringList.Create;
          List.LoadFromFile(Path);
          N := random(List.Count);
          Unit2.GameWords[I] := List.Strings[N];
          Unit2.GameWords[I] := UTF8ToAnsi(Unit2.GameWords[I]);
        End;
      Finally
        CloseFile(InputFile);
      End;
    Except
      Application.MessageBox('Ошибка при чтении данных из файла игры!', 'Ошибка' , MB_ICONERROR);
    End;
  End;
End;

Function CompareWords(PlayerWord: String; Path:String): Boolean;
Var
  I, J: Integer;
  GameWord, ReversedGameWord: String;
Begin
  GameWord := Unit2.GameWord;
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

Function CompareWordsStage2(PlayerWords: TArrStr; Path: String): Boolean;
Var
  I, J, CorrectWordsCounter: Integer;
  IsWordsCorrect: Boolean;
Begin
  CorrectWordsCounter := 0;

  for I := Low(Unit2.GameWords) to High(Unit2.GameWords) do
  Begin
    for J := Low(PlayerWords) to High(PlayerWords) do
    Begin
      if PlayerWords[J] = Unit2.GameWords[I] then
        Inc(CorrectWordsCounter);
    End;
  End;

  if CorrectWordsCounter Div High(Unit2.GameWords) = High(Unit2.GameWords) + 2 then
    IsWordsCorrect := True
  else
    IsWordsCorrect := False;

  CompareWordsStage2 := IsWordsCorrect;
End;

Function CompareWordsStage3(PlayerWords: TArrStr; Path: String): Boolean;
Var
  I: Integer;
  IsWordsCorrect: Boolean;
  GameStr, PlayerStr: String;
Begin
  GameStr := '';
  PlayerStr := '';

  for I := Low(Unit2.GameWords) to High(Unit2.GameWords) do
  Begin
    GameStr := GameStr + Unit2.GameWords[I] ;
    PlayerStr := PlayerStr + PlayerWords[I];
  End;

  if GameStr = PlayerStr then
    IsWordsCorrect := True
  else
    IsWordsCorrect := False;

  CompareWordsStage3 := IsWordsCorrect;
End;

Function CompareWordsStage4(PlayerWords: TArrStr; Path: String): Boolean;
Var
  I, J, K, CorrectWordsCounter: Integer;
  ReversedGameWords: TArrStr;
  IsWordsCorrect: Boolean;
Begin
  CorrectWordsCounter := 0;

  for I := Low(Unit2.GameWords) to High(Unit2.GameWords) do
  Begin
    J := Length(Unit2.GameWords[I]);
    ReversedGameWordS[I] := Unit2.GameWords[I];
    for K := 1 to Length(Unit2.GameWords[I]) do
    Begin
      ReversedGameWords[I, J] := Unit2.GameWords[I, K];
      Dec(J);
    End;
  End;

  for I := Low(ReversedGameWords) to High(ReversedGameWords) do
  Begin
    for J := Low(PlayerWords) to High(PlayerWords) do
    Begin
      if PlayerWords[J] = ReversedGameWords[I] then
        Inc(CorrectWordsCounter);
    End;
  End;

  if CorrectWordsCounter Div High(ReversedGameWords) = High(ReversedGameWords) + 2 then
    IsWordsCorrect := True
  else
    IsWordsCorrect := False;

  CompareWordsStage4 := IsWordsCorrect;
End;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
Var
  WND: HWND;
  lpCaption, lpText: PChar;
  Tip: Integer;
begin
  case Unit2.StageCounter of
    1:
    Begin
      Stage1GameTimer.Enabled := False;
    End;
    2:
    Begin
      Stage2GameTimer.Enabled := False;
    End;
  end;
  WND := Form2.Handle;
  lpCaption := 'Выход';
  lpText := 'Вы уверены, что хотите выйти?';
  Tip := MB_YESNO + MB_ICONINFORMATION + MB_DEFBUTTON2;
  Case MessageBox(WND, lpText, lpCaption, Tip) Of
      IDYES :
        CanClose := True;
      IDNO :
      Begin
        CanClose := False;
        case Unit2.StageCounter of
          1:
          Begin
            Stage1GameTimer.Enabled := True;
          End;
          2:
          Begin
            Stage2GameTimer.Enabled := True;
          End;
        end;
      End;
  End
end;

procedure TForm2.GameRulesInfoClick(Sender: TObject);
Const
  FIRST_MESSAGE = 'Данная игра предназначена для тренировки памяти игрока.' + #13#10;
  SECOND_MESSAGE = 'В процессе игры на экран буду выводиться слова и через некоторое время пропадать.' + #13#10;
  THIRD_MESSAGE = 'Задачей игрока является запоминать эти слова и вводить эти же слова, но в обратном порядке.' + #13#10;
  FOURTH_MESSAGE = 'Со временем игра начинает усложняться: слова становяться длиннее. На их запоминание дается чуть больше времени.' + #13#10;
  FIFTH_MESSAGE = 'Игра заканчивается, если игрок правильно введет три перевернутых слова из 8 букв.' + #13#10;
  SIXTH_MESSAGE = 'При вводе учитывайте регистр символов!';
  SEVENTH_MESSAGE = 'Удачи и успехов!';
begin
  Application.MessageBox(FIRST_MESSAGE + SECOND_MESSAGE + THIRD_MESSAGE +
  FOURTH_MESSAGE + FIFTH_MESSAGE + SIXTH_MESSAGE + SEVENTH_MESSAGE, 'Правила игры');
end;

procedure TForm2.OpenFromFileMenuClick(Sender: TObject);
Var
  I: Integer;
  InputFile: TextFile;
Begin
  Unit2.Path_5 := '';
  Unit2.Path_6 := '';
  Unit2.Path_7 := '';
  Unit2.Path_8 := '';
  Unit2.Path_Stage_2_3_4_5 := '';

  OpenFromFileDialog.Filter := 'Text files (*.txt)|*.txt|All files (*.*)|*.*';
  if OpenFromFileDialog.Execute then
  Begin
    with OpenFromFileDialog.Files do
      for I := 0 to OpenFromFileDialog.Files.Count - 1 do
      begin
        AssignFile(InputFile, OpenFromFileDialog.Files[I]);
        Reset(InputFile);
        case I of
          0:
          Begin
            Unit2.Path_5 := OpenFromFileDialog.Files[I];
          End;
          1:
          Begin
            Unit2.Path_6 := OpenFromFileDialog.Files[I];
          End;
          2:
          Begin
            Unit2.Path_7 := OpenFromFileDialog.Files[I];
          End;
          3:
          Begin
            Unit2.Path_8 := OpenFromFileDialog.Files[I];
          End;
          4:
          Begin
            Unit2.Path_Stage_2_3_4_5 := OpenFromFileDialog.Files[I];
          End;
        end;
        CloseFile(InputFile);
      end;

    if (Unit2.Path_5 <> '') And (Unit2.Path_6 <> '') And (Unit2.Path_7 <> '') And (Unit2.Path_8 <> '') And (Unit2.Path_Stage_2_3_4_5 <> '') then
      StartNewGame.Enabled := True
    else
    Begin
      Application.MessageBox('Неправильный выбор файлов, попробуйте еще раз!', 'Ошибка!', MB_ICONERROR)
    End;
  End
  Else
    Application.MessageBox('Вы закрыли окно, попробуйте ещё раз.', 'Ошибка!', MB_ICONERROR)
end;

procedure TForm2.StartNewGameClick(Sender: TObject);
Var
  InputFile: TextFile;
  GameWord: String;
  GameStop: Boolean;
  WordCounter, PhaseCounter: Integer;
begin
  MenuStage.TabVisible := False;
  FirstStage.Enabled := True;
  FirstStage.TabVisible := True;
  MenuStage.Enabled := False;
  Stage1BackPanel.Visible := True;
  StartNewGame.Enabled := False;

  // Обратный отсчет до начала
    Delay(500);
    Stage1Task2Label.Visible := True;
    Delay(300);
    Stage1Task2Label.Left := Stage1Task2Label.Left - 5;
    Stage1Task2Label.Caption := '3.';
    Delay(300);
    Stage1Task2Label.Left := Stage1Task2Label.Left - 5;
    Stage1Task2Label.Caption := '3..';
    Delay(300);
    Stage1Task2Label.Left := Stage1Task2Label.Left - 5;
    Stage1Task2Label.Caption := '3...';
    Delay(300);
    Stage1Task2Label.Left := Stage1Task2Label.Left - 5;
    Stage1Task2Label.Caption := '3... 2';
    Delay(300);
    Stage1Task2Label.Left := Stage1Task2Label.Left - 5;
    Stage1Task2Label.Caption := '3... 2.';
    Delay(300);
    Stage1Task2Label.Left := Stage1Task2Label.Left - 5;
    Stage1Task2Label.Caption := '3... 2..';
    Delay(300);
    Stage1Task2Label.Left := Stage1Task2Label.Left - 5;
    Stage1Task2Label.Caption := '3... 2...';
    Delay(300);
    Stage1Task2Label.Left := Stage1Task2Label.Left - 5;
    Stage1Task2Label.Caption := '3... 2... 1';
    Delay(300);
    Stage1Task2Label.Left := Stage1Task2Label.Left - 5;
    Stage1Task2Label.Caption := '3... 2... 1.';
    Delay(300);
    Stage1Task2Label.Left := Stage1Task2Label.Left - 5;
    Stage1Task2Label.Caption := '3... 2... 1..';
    Delay(300);
    Stage1Task2Label.Left := Stage1Task2Label.Left - 5;
    Stage1Task2Label.Caption := '3... 2... 1...';
    Delay(500);
    Stage1Task2Label.Left := Stage1Task2Label.Left - 10;
    Stage1Task2Label.Caption := '3... 2... 1... Поехали!';
    Delay(100);
    Stage1Task1Label.Font.Color := clGrayText;
    Stage1Task2Label.Font.Color := clGrayText;
  // Конец обратного отсчета, начало игры

  Stage1GameWordLabel.Visible := True;
  Stage1EnterWord.Visible := True;
  Stage1EnterWord.Enabled := True;
  Stage1ConfirmWord.Visible := True;
  Unit2.StageCounter := 1;
  Unit2.PhaseCounter := 1;
  Unit2.RightCounter := 1;
  Stage1GameTimer.Enabled := True;
  Stage1ConfirmWord.Default := True;
  Unit2.Path := Unit2.Path_5;
end;

procedure TForm2.Stage1ConfirmWordClick(Sender: TObject);
Var
  IsWordCorrect: Boolean;
  GameWord, PlayerWord: String;
begin
  Stage1ConfirmWord.Enabled := False;
  PlayerWord := Stage1EnterWord.Text;

  IsWordCorrect := CompareWords(PlayerWord, Path);
  if IsWordCorrect then
  Begin
    Stage1ResultLabel.Visible := True;
    Stage1ResultLabel.Font.Color := clGreen;
    Stage1ResultLabel.Left := Stage1ResultLabel.Left - 80;
    Stage1ResultLabel.Caption := 'Правильный ответ!';

    Inc(Unit2.RightCounter);

    if Unit2.RightCounter > 3 then
    Begin
      Inc(Unit2.PhaseCounter);
      Unit2.RightCounter := 1;
    End;
  End
  Else
  Begin
    Stage1ResultLabel.Visible := True;
    Stage1ResultLabel.Font.Color := clRed;
    Stage1ResultLabel.Left := Stage1ResultLabel.Left - 90;
    Stage1ResultLabel.Caption := 'Неправильный ответ!';
  End;

  Delay(500);
  Stage1EnterWord.Text := '';
  Stage1ResultLabel.Caption := '';
  Stage1ResultLabel.Left := 254;

  Stage1GameTimer.Enabled := True;
end;

procedure TForm2.Stage2ConfirmWordsButtonClick(Sender: TObject);
Var
  IsWordsCorrect: Boolean;
  PlayerWords: TArrStr;
  I: Integer;
begin
  Stage2ConfirmWordsButton.Enabled := False;
  SetLength(PlayerWords, Length(Unit2.GameWords));
  for I := Low(Unit2.GameWords) to High(Unit2.GameWords) do
  Begin
    PlayerWords[I] := Form2.Stage2MemoForWords.Lines[I];
  End;

  IsWordsCorrect := CompareWordsStage2(PlayerWords, Path);
  if IsWordsCorrect then
  Begin
    Stage2ResultLabel.Visible := True;
    Stage2ResultLabel.Font.Color := clGreen;
    Stage2ResultLabel.Left := 288;
    Stage2ResultLabel.Caption := 'Правильный ответ!';

    Inc(Unit2.RightCounter);

    if Unit2.RightCounter > 3 then
    Begin
      Inc(Unit2.PhaseCounter);
      Unit2.RightCounter := 1;
    End;
  End
  Else
  Begin
    Stage2ResultLabel.Visible := True;
    Stage2ResultLabel.Font.Color := clRed;
    Stage2ResultLabel.Left := 278;
    Stage2ResultLabel.Caption := 'Неправильный ответ!';
  End;

  Delay(500);
  Form2.Stage2MemoForWords.Clear;
  Stage2ResultLabel.Caption := '';
  Stage2ResultLabel.Left := 288;

  Stage2GameTimer.Enabled := True;
end;

procedure TForm2.Stage3ConfirmWordsButtonClick(Sender: TObject);
Var
  IsWordsCorrect: Boolean;
  PlayerWords: TArrStr;
  I: Integer;
begin
  Stage3ConfirmWordsButton.Enabled := False;
  SetLength(PlayerWords, Length(Unit2.GameWords));

  for I := Low(Unit2.GameWords) to High(Unit2.GameWords) do
  Begin
    PlayerWords[I] := Form2.Stage3MemoForWords.Lines[I];
  End;

  IsWordsCorrect := CompareWordsStage3(PlayerWords, Path);
  if IsWordsCorrect then
  Begin
    Stage3ResultLabel.Visible := True;
    Stage3ResultLabel.Font.Color := clGreen;
    Stage3ResultLabel.Left := 288;
    Stage3ResultLabel.Caption := 'Правильный ответ!';

    Inc(Unit2.RightCounter);

    if Unit2.RightCounter > 3 then
    Begin
      Inc(Unit2.PhaseCounter);
      Unit2.RightCounter := 1;
    End;
  End
  Else
  Begin
    Stage3ResultLabel.Visible := True;
    Stage3ResultLabel.Font.Color := clRed;
    Stage3ResultLabel.Left := 278;
    Stage3ResultLabel.Caption := 'Неправильный ответ!';
  End;

  Delay(500);
  Form2.Stage3MemoForWords.Clear;
  Stage3ResultLabel.Caption := '';
  Stage3ResultLabel.Left := 288;

  Stage3GameTimer.Enabled := True;
end;

procedure TForm2.Stage4ConfirmWordsButtonClick(Sender: TObject);
Var
  IsWordsCorrect: Boolean;
  PlayerWords: TArrStr;
  I: Integer;
begin
  Stage4ConfirmWordsButton.Enabled := False;
  SetLength(PlayerWords, Length(Unit2.GameWords));

  for I := Low(Unit2.GameWords) to High(Unit2.GameWords) do
  Begin
    PlayerWords[I] := Form2.Stage3MemoForWords.Lines[I];
  End;

  IsWordsCorrect := CompareWordsStage4(PlayerWords, Path);
  if IsWordsCorrect then
  Begin
    Stage4ResultLabel.Visible := True;
    Stage4ResultLabel.Font.Color := clGreen;
    Stage4ResultLabel.Left := 288;
    Stage4ResultLabel.Caption := 'Правильный ответ!';

    Inc(Unit2.RightCounter);

    if Unit2.RightCounter > 3 then
    Begin
      Inc(Unit2.PhaseCounter);
      Unit2.RightCounter := 1;
    End;
  End
  Else
  Begin
    Stage4ResultLabel.Visible := True;
    Stage4ResultLabel.Font.Color := clRed;
    Stage4ResultLabel.Left := 278;
    Stage4ResultLabel.Caption := 'Неправильный ответ!';
  End;

  Delay(500);
  Form2.Stage4MemoForWords.Clear;
  Stage4ResultLabel.Caption := '';
  Stage4ResultLabel.Left := 288;

  Stage4GameTimer.Enabled := True;
end;

procedure TForm2.Stage1GameTimerTimer(Sender: TObject);
begin
  Stage1GameTimer.Enabled := False;

  if Unit2.StageCounter = 1 then
  Begin
    case Unit2.PhaseCounter of
      1:
      Begin
        Unit2.Path := Unit2.Path_5;
      End;
      2:
      Begin
        Unit2.Path := Unit2.Path_6;
      End;
      3:
      Begin
        Unit2.Path := Unit2.Path_7;
      End;
      4:
      Begin
        Unit2.Path := Unit2.Path_8;
      End;
    end;

    Stage1GameWordLabel.Caption := '';
    Stage1GameWordLabel.Left := 254;

    Stage1GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := Stage1GameWordLabel.Caption;
    Delay(3000);
    Stage1GameWordLabel.Caption := '';
    Delay(300);
    Stage1GameWordLabel.Left := Stage1GameWordLabel.Left - 200;
    Stage1GameWordLabel.Font.Size := 10;
    Stage1GameWordLabel.Caption := 'Вспомните слово и введите его наоборот в поле ниже';
  End;

  if ((Unit2.StageCounter = 1) And (Unit2.PhaseCounter = 5)) Or (Unit2.StageCounter <> 1) then
  Begin
    Stage1EnterWord.Enabled := False;
    Application.MessageBox('Поздравляем с победой! Вы прошли первый этап. Переходим к следующему', 'Победа в первом этапе!');

    Unit2.StageCounter := 2;
    Unit2.PhaseCounter := 1;
    FirstStage.TabVisible := False;
    FirstStage.Enabled := False;
    SecondStage.TabVisible := True;
    SecondStage.Enabled := True;
    Stage2ConfirmWordsButton.Default := True;
    Stage2GameTimer.Enabled := True;
    Stage2GameWordsLabel.Visible := True;
    Form2.Stage2MemoForWords.Enabled := True;
  End;
end;

procedure TForm2.Stage2GameTimerTimer(Sender: TObject);
Var
  GameString: String;
  I: Integer;
begin
  Stage2GameTimer.Enabled := False;
  Unit2.Path := Unit2.Path_Stage_2_3_4_5;

  if (Unit2.StageCounter = 2) And ((Unit2.PhaseCounter > 0) And (Unit2.PhaseCounter < 5))  then
  Begin
    Stage2GameWordsLabel.Caption := '';
    Stage2GameWordsLabel.Left := 64;
    GetGameWordsFromFileStage_2_3_4(Unit2.Path);

    for I := Low(Unit2.GameWords) to High(Unit2.GameWords) do
      GameString := GameString + Unit2.GameWords[I] + ' ';
    Stage2GameWordsLabel.Caption := GameString;

    case Unit2.PhaseCounter of
      1:
      Begin
        Stage2GameWordsLabel.Font.Size := 9;
        Delay(15000);
      End;
      2:
      Begin
        Stage2GameWordsLabel.Font.Size := 9;
        Delay(15000);
      End;
      3:
      Begin
        Stage2GameWordsLabel.Font.Size := 8;
        Delay(15000);
      End;
      4:
      Begin
        Stage2GameWordsLabel.Font.Size := 8;
        Delay(15000);
      End;
    end;
    Stage2GameWordsLabel.Caption := '';
    Delay(300);
    Stage2GameWordsLabel.Left := 64;
    Stage2GameWordsLabel.Font.Size := 9;
    Stage2GameWordsLabel.Caption := 'Вспомните слова и введите их все в поле ниже. Порядок не важен.';
  End
  else
  Begin
    Form2.Stage2MemoForWords.Enabled := False;
    Application.MessageBox('Поздравляем с победой! Вы прошли второй этап. Переходим к следующему', 'Победа во втором этапе!');

    Unit2.StageCounter := 3;
    Unit2.PhaseCounter := 1;
    SecondStage.TabVisible := False;
    SecondStage.Enabled := False;
    ThirdStage.TabVisible := True;
    ThirdStage.Enabled := True;
    Stage3ConfirmWordsButton.Default := True;
    Stage3GameTimer.Enabled := True;
    Stage3GameWordsLabel.Visible := True;
    Form2.Stage2MemoForWords.Enabled := False;
    Form2.Stage3MemoForWords.Enabled := True;
  End;
end;

procedure TForm2.Stage3GameTimerTimer(Sender: TObject);
Var
  GameString: String;
  I: Integer;
begin
  Stage3GameTimer.Enabled := False;
  Unit2.Path := Unit2.Path_Stage_2_3_4_5;

  if (Unit2.StageCounter = 3) And ((Unit2.PhaseCounter > 0) And (Unit2.PhaseCounter < 5))  then
  Begin
    Stage3GameWordsLabel.Caption := '';
    Stage3GameWordsLabel.Left := 64;
    GetGameWordsFromFileStage_2_3_4(Unit2.Path);

    for I := Low(Unit2.GameWords) to High(Unit2.GameWords) do
      GameString := GameString + Unit2.GameWords[I] + ' ';
    Stage3GameWordsLabel.Caption := GameString;

    case Unit2.PhaseCounter of
      1:
      Begin
        Stage3GameWordsLabel.Font.Size := 9;
        Delay(25000);
      End;
      2:
      Begin
        Stage3GameWordsLabel.Font.Size := 9;
        Delay(25000);
      End;
      3:
      Begin
        Stage3GameWordsLabel.Font.Size := 8;
        Delay(25000);
      End;
      4:
      Begin
        Stage3GameWordsLabel.Font.Size := 8;
        Delay(25000);
      End;
    end;
    Stage3GameWordsLabel.Caption := '';
    Delay(300);
    Stage3GameWordsLabel.Left := 64;
    Stage3GameWordsLabel.Font.Size := 9;
    Stage3GameWordsLabel.Caption := 'Вспомните слова и введите их все в поле ниже. Порядок важен!';
  End
  else
  Begin
    Form2.Stage3MemoForWords.Enabled := False;
    Application.MessageBox('Поздравляем с победой! Вы прошли третий этап. Переходим к следующему', 'Победа во втором этапе!');

    Unit2.StageCounter := 4;
    Unit2.PhaseCounter := 1;
    ThirdStage.TabVisible := False;
    ThirdStage.Enabled := False;
    FourthStage.TabVisible := True;
    FourthStage.Enabled := True;

    {
    Stage3ConfirmWordsButton.Default := True;
    Stage3GameTimer.Enabled := True;
    Stage3GameWordsLabel.Visible := True;
    }

  End;
end;

procedure TForm2.Stage4GameTimerTimer(Sender: TObject);
Var
  GameString: String;
  I: Integer;
begin
  Stage4GameTimer.Enabled := False;
  Unit2.Path := Unit2.Path_Stage_2_3_4_5;

  if (Unit2.StageCounter = 4) And ((Unit2.PhaseCounter > 0) And (Unit2.PhaseCounter < 5))  then
  Begin
    Stage4GameWordsLabel.Caption := '';
    Stage4GameWordsLabel.Left := 64;
    GetGameWordsFromFileStage_2_3_4(Unit2.Path);

    for I := Low(Unit2.GameWords) to High(Unit2.GameWords) do
      GameString := GameString + Unit2.GameWords[I] + ' ';
    Stage4GameWordsLabel.Caption := GameString;

    case Unit2.PhaseCounter of
      1:
      Begin
        Stage4GameWordsLabel.Font.Size := 9;
        Delay(30000);
      End;
      2:
      Begin
        Stage4GameWordsLabel.Font.Size := 9;
        Delay(30000);
      End;
      3:
      Begin
        Stage4GameWordsLabel.Font.Size := 8;
        Delay(30000);
      End;
      4:
      Begin
        Stage4GameWordsLabel.Font.Size := 8;
        Delay(30000);
      End;
    end;
    Stage4GameWordsLabel.Caption := '';
    Delay(300);
    Stage4GameWordsLabel.Left := 64;
    Stage4GameWordsLabel.Font.Size := 8;
    Stage4GameWordsLabel.Caption := 'Вспомните слова и введите их все "наоборот" в поле ниже. Порядок не важен.';
  End
  else
  Begin
    Form2.Stage4MemoForWords.Enabled := False;
    Application.MessageBox('Поздравляем с победой! Вы прошли третий этап. Переходим к следующему', 'Победа в третьем этапе!');

    Unit2.StageCounter := 5;
    Unit2.PhaseCounter := 1;
    FourthStage.TabVisible := False;
    FourthStage.Enabled := False;
    FourthStage.TabVisible := True;
    FourthStage.Enabled := True;
    Stage4ConfirmWordsButton.Default := True;
    Stage4GameTimer.Enabled := True;
    Stage4GameWordsLabel.Visible := True;
    Form2.Stage3MemoForWords.Enabled := False;
    Form2.Stage4MemoForWords.Enabled := True;
  End;
end;

procedure TForm2.Stage1EnterWordChange(Sender: TObject);
begin
  If(Stage1EnterWord.Text <> '') then
  Begin
    Stage1ConfirmWord.Enabled := True;
    Stage1EnterWord.CharCase := ecUpperCase;
  End
  Else
  Begin
    Stage1ConfirmWord.Enabled := False;
  End;
end;

procedure TForm2.Stage2MemoForWordsChange(Sender: TObject);
begin
  If(Stage2MemoForWords.Lines[0] <> '') then
  Begin
    Stage2ConfirmWordsButton.Enabled := True;
    Stage2MemoForWords.CharCase := ecUpperCase;
  End
  Else
  Begin
    Stage2ConfirmWordsButton.Enabled := False;
  End;
end;

procedure TForm2.Stage3MemoForWordsChange(Sender: TObject);
begin
  If(Stage3MemoForWords.Lines[0] <> '') then
  Begin
    Stage3ConfirmWordsButton.Enabled := True;
    Stage3MemoForWords.CharCase := ecUpperCase;
  End
  Else
  Begin
    Stage3ConfirmWordsButton.Enabled := False;
  End;
end;

procedure TForm2.Stage4MemoForWordsChange(Sender: TObject);
begin
  If(Stage4MemoForWords.Lines[0] <> '') then
  Begin
    Stage4ConfirmWordsButton.Enabled := True;
    Stage4MemoForWords.CharCase := ecUpperCase;
  End
  Else
  Begin
    Stage4ConfirmWordsButton.Enabled := False;
  End;
end;

procedure TForm2.Stage1EnterWordKeyPress(Sender: TObject; var Key: Char);
begin
  If Not(AnsiString(Key)[1] In ['А'..'Я','а'..'я', #08, #45]) Then
    Key := #0;
end;

procedure TForm2.Stage2MemoForWordsKeyPress(Sender: TObject; var Key: Char);
begin
  If Not(AnsiString(Key)[1] In ['А'..'Я','а'..'я', #08, #45]) Then
    Key := #0;
end;

procedure TForm2.Stage3MemoForWordsKeyPress(Sender: TObject; var Key: Char);
begin
  If Not(AnsiString(Key)[1] In ['А'..'Я','а'..'я', #08, #45]) Then
    Key := #0;
end;

procedure TForm2.Stage4MemoForWordsKeyPress(Sender: TObject; var Key: Char);
begin
  If Not(AnsiString(Key)[1] In ['А'..'Я','а'..'я', #08, #45]) Then
    Key := #0;
end;

end.
