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
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    Phase1TimerGame: TTimer;
    PageControl: TPageControl;
    MenuPhase: TTabSheet;
    FirstPhase: TTabSheet;
    SecondPhase: TTabSheet;
    ThirdPhase: TTabSheet;
    FourthPhase: TTabSheet;
    FifthPhase: TTabSheet;
    StartNewGame: TButton;
    BackPanel: TPanel;
    Task1Label: TLabel;
    ResultLabel: TLabel;
    Task2Label: TLabel;
    GameWordLabel: TLabel;
    ConfirmWord: TButton;
    EnterWord: TEdit;
=======
=======
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
    WelcomeLabel: TLabel;
    GameInfoLabel: TLabel;
    Requirement1Label: TLabel;
    OpenFromFileDialog: TOpenDialog;
    FileMenu: TMenuItem;
    OpenFromFileMenu: TMenuItem;
    Requirement2Label: TLabel;
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
=======
>>>>>>> Stashed changes
    Stage2Task1Label: TLabel;
    Stage2GameWordsLabel: TLabel;
    Stage2MemoForWords: TMemo;
    Stage2ConfirmWordsButton: TButton;
    Stage2GameTimer: TTimer;
    Stage2ResultLabel: TLabel;
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
    procedure StartNewGameClick(Sender: TObject);
    procedure EnterWordKeyPress(Sender: TObject; var Key: Char);
    procedure Stage1EnterWordChange(Sender: TObject);
    procedure Stage1ConfirmWordClick(Sender: TObject);
    procedure GameRulesInfoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    procedure Phase1TimerGameTimer(Sender: TObject);
    procedure OpenFromFileMenuClick(Sender: TObject);
=======
=======
>>>>>>> Stashed changes
    procedure Stage1GameTimerTimer(Sender: TObject);
    procedure OpenFromFileMenuClick(Sender: TObject);
    procedure Stage2GameTimerTimer(Sender: TObject);
    procedure Stage2ConfirmWordsButtonClick(Sender: TObject);
    procedure Stage2MemoForWordsChange(Sender: TObject);
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
  private
  protected
  public
  end;

var
  Form2: TForm2;
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  PhaseCounter, WordCounter: Integer;
  GameWord: String;
  Path, Path_5, Path_6, Path_7, Path_8: String;

=======
=======
>>>>>>> Stashed changes
  StageCounter, PhaseCounter, RightCounter: Integer;
  GameWord: String;
  GameWords: TArrStr;
  Path, Path_5, Path_6, Path_7, Path_8, Path_Stage2: String;
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes

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
          Read(InputFile);
          for I := 0 to Unit2.RightCounter - 1 do
          Begin
            Randomize;
            List := TStringList.Create;
            List.LoadFromFile(Path);
            N := random(List.Count);
            Word := List.Strings[N];
            Word := UTF8ToAnsi(Word);
            {
            �������� ����� ����� memo
            Form2.MemoForFileRewriting.Lines.LoadFromFile(Path);
            for J := 0 to Form2.MemoForFileRewriting.Lines.Count - 1 do
              if Form2.MemoForFileRewriting.Lines[J] = Word then
                Form2.MemoForFileRewriting.Lines.Delete(J);
            Form2.MemoForFileRewriting.Lines.SaveToFile(path);
            }
            {
            �������� ����� list
             List.Delete(N);
             List.SaveToFile(Path);
             List.Free;
            }
          End;
        Finally
          CloseFile(InputFile);
        End;
      Except
        Application.MessageBox('������ ��� ������ ������ �� ����� ����!', '������' , MB_ICONERROR);
      End;
    End;

    GetGameWordFromFile := Word;
End;

Procedure GetGameWordsFromFileStage2(Path: String);
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
      Length := 5;
    2:
      Length := 6;
    3:
      Length := 7;
  end;
  SetLength(Unit2.GameWords, Length);

  If (IsCorrect) Then
  Begin
    Try
      Try
        Read(InputFile);

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
      //Application.MessageBox('������ ��� ������ ������ �� ����� ����!', '������' , MB_ICONERROR);
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
      if PlayerWords[I] = Unit2.GameWords[I] then
        Inc(CorrectWordsCounter);
    End;
  End;

  if CorrectWordsCounter = High(Unit2.GameWords) then
    IsWordsCorrect := True
  else
    IsWordsCorrect := False;

  CompareWordsStage2 := IsWordsCorrect;
End;

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
    Stage1ResultLabel.Caption := '���������� �����!';

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
    Stage1ResultLabel.Caption := '������������ �����!';
  End;

  Delay(500);
  Stage1EnterWord.Text := '';
  Stage1ResultLabel.Caption := '';
  Stage1ResultLabel.Left := 254;

<<<<<<< Updated upstream
<<<<<<< Updated upstream
  Phase1TimerGame.Enabled := True;
=======
  Stage1GameTimer.Enabled := True;
>>>>>>> Stashed changes
=======
  Stage1GameTimer.Enabled := True;
>>>>>>> Stashed changes
end;

procedure TForm2.Stage1EnterWordChange(Sender: TObject);
begin
  If(Stage1EnterWord.Text <> '') then
  Begin
    Stage1ConfirmWord.Enabled := True;
    Stage1EnterWord.Font.Color := clCaptionText;
  End
  Else
  Begin
    Stage1ConfirmWord.Enabled := False;
    Stage1EnterWord.Font.Color := clGray;
  End;
end;

procedure TForm2.EnterWordKeyPress(Sender: TObject; var Key: Char);
var
  AnsiStr: String;
begin
    If (Length(Stage1EnterWord.Text) < 1) And (Key = '-') Then
      Key := #0;
    AnsiStr := AnsiString(Key);
    If Not(AnsiStr[1] In ['�'..'�','�'..'�', #08, #45]) Then
      Key := #0;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
Var
  WND: HWND;
  lpCaption, lpText: PChar;
  Tip: Integer;
begin
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  Phase1TimerGame.Enabled := False;
=======
=======
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
  WND := Form2.Handle;
  lpCaption := '�����';
  lpText := '�� �������, ��� ������ �����?';
  Tip := MB_YESNO + MB_ICONINFORMATION + MB_DEFBUTTON2;
  Case MessageBox(WND, lpText, lpCaption, Tip) Of
      IDYES :
        CanClose := True;
      IDNO :
      Begin
        CanClose := False;
<<<<<<< Updated upstream
<<<<<<< Updated upstream
        Phase1TimerGame.Enabled := True;
=======
=======
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
      End;
  End
end;

procedure TForm2.GameRulesInfoClick(Sender: TObject);
Const
  FIRST_MESSAGE = '������ ���� ������������� ��� ���������� ������ ������.' + #13#10;
  SECOND_MESSAGE = '� �������� ���� �� ����� ���� ���������� ����� � ����� ��������� ����� ���������.' + #13#10;
  THIRD_MESSAGE = '������� ������ �������� ���������� ��� ����� � ������� ��� �� �����, �� � �������� �������.' + #13#10;
  FOURTH_MESSAGE = '�� �������� ���� �������� �����������: ����� ����������� �������. �� �� ����������� ������ ���� ������ �������.' + #13#10;
  FIFTH_MESSAGE = '���� �������������, ���� ����� ��������� ������ ��� ������������ ����� �� 8 ����.' + #13#10;
  SIXTH_MESSAGE = '��� ����� ���������� ������� ��������!';
  SEVENTH_MESSAGE = '����� � �������!';
begin
  Application.MessageBox(FIRST_MESSAGE + SECOND_MESSAGE + THIRD_MESSAGE +
  FOURTH_MESSAGE + FIFTH_MESSAGE + SIXTH_MESSAGE + SEVENTH_MESSAGE, '������� ����');
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
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
  Unit2.Path_Stage2 := '';
>>>>>>> Stashed changes
=======
  Unit2.Path_Stage2 := '';
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
=======
>>>>>>> Stashed changes
          4:
          Begin
            Unit2.Path_Stage2 := OpenFromFileDialog.Files[I];
          End;
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
        end;
        CloseFile(InputFile);
      end;

<<<<<<< Updated upstream
<<<<<<< Updated upstream
    if (Unit2.Path_5 <> '') And (Unit2.Path_6 <> '') And (Unit2.Path_7 <> '') And (Unit2.Path_8 <> '') then
=======
    if (Unit2.Path_5 <> '') And (Unit2.Path_6 <> '') And (Unit2.Path_7 <> '') And (Unit2.Path_8 <> '') And (Unit2.Path_Stage2 <> '') then
>>>>>>> Stashed changes
=======
    if (Unit2.Path_5 <> '') And (Unit2.Path_6 <> '') And (Unit2.Path_7 <> '') And (Unit2.Path_8 <> '') And (Unit2.Path_Stage2 <> '') then
>>>>>>> Stashed changes
      StartNewGame.Enabled := True
    else
    Begin
      Application.MessageBox('������������ ����� ������, ���������� ��� ���!', '������!', MB_ICONERROR)
    End;
<<<<<<< Updated upstream
<<<<<<< Updated upstream

    OpenFromFileMenu.Enabled := False;
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
  End
  Else
    Application.MessageBox('�� ������� ����, ���������� ��� ���.', '������!', MB_ICONERROR)
end;

procedure TForm2.StartNewGameClick(Sender: TObject);
Var
  InputFile: TextFile;
  GameWord: String;
  GameStop: Boolean;
  WordCounter, PhaseCounter: Integer;
begin
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  MenuPhase.TabVisible := False;
  FirstPhase.Enabled := True;
  FirstPhase.TabVisible := True;
  MenuPhase.Enabled := False;
  BackPanel.Visible := True;
=======
=======
>>>>>>> Stashed changes
  MenuStage.TabVisible := False;
  FirstStage.Enabled := True;
  FirstStage.TabVisible := True;
  MenuStage.Enabled := False;
  Stage1BackPanel.Visible := True;
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
  StartNewGame.Enabled := False;

  // �������� ������ �� ������
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
    Stage1Task2Label.Caption := '3... 2... 1... �������!';
    Delay(100);
    Stage1Task1Label.Font.Color := clGrayText;
    Stage1Task2Label.Font.Color := clGrayText;
  // ����� ��������� �������, ������ ����

  Stage1GameWordLabel.Visible := True;
  Stage1EnterWord.Visible := True;
  Stage1EnterWord.Enabled := True;
  Stage1ConfirmWord.Visible := True;
  Unit2.StageCounter := 1;
  Unit2.PhaseCounter := 1;
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  Unit2.WordCounter := 1;
  Phase1TimerGame.Enabled := True;
  ConfirmWord.Default := True;
  Unit2.Path := Unit2.Path_5;
end;

procedure TForm2.Phase1TimerGameTimer(Sender: TObject);
begin
  Phase1TimerGame.Enabled := False;
=======
  Unit2.RightCounter := 1;
  Stage1GameTimer.Enabled := True;
  Stage1ConfirmWord.Default := True;
  Unit2.Path := Unit2.Path_5;
end;

procedure TForm2.Stage1GameTimerTimer(Sender: TObject);
begin
  Stage1GameTimer.Enabled := False;
>>>>>>> Stashed changes
=======
  Unit2.RightCounter := 1;
  Stage1GameTimer.Enabled := True;
  Stage1ConfirmWord.Default := True;
  Unit2.Path := Unit2.Path_5;
end;

procedure TForm2.Stage1GameTimerTimer(Sender: TObject);
begin
  Stage1GameTimer.Enabled := False;
>>>>>>> Stashed changes

  if Unit2.PhaseCounter = 1 then
  Begin
    Unit2.Path := Unit2.Path_5;

    Stage1GameWordLabel.Caption := '';
    Stage1GameWordLabel.Left := 254;

<<<<<<< Updated upstream
<<<<<<< Updated upstream
    GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := GameWordLabel.Caption;
=======
    Stage1GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := Stage1GameWordLabel.Caption;
>>>>>>> Stashed changes
=======
    Stage1GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := Stage1GameWordLabel.Caption;
>>>>>>> Stashed changes
    Delay(1000);
    Stage1GameWordLabel.Caption := '';
    Delay(300);
    Stage1GameWordLabel.Left := Stage1GameWordLabel.Left - 200;
    Stage1GameWordLabel.Font.Size := 10;
    Stage1GameWordLabel.Caption := '��������� ����� � ������� ��� �������� � ���� ����';
  End;

  if Unit2.PhaseCounter = 2 then
  Begin
    Unit2.Path := Unit2.Path_6;

    Stage1GameWordLabel.Caption := '';
    Stage1GameWordLabel.Left := 254;

<<<<<<< Updated upstream
<<<<<<< Updated upstream
    GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := GameWordLabel.Caption;
=======
    Stage1GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := Stage1GameWordLabel.Caption;
>>>>>>> Stashed changes
=======
    Stage1GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := Stage1GameWordLabel.Caption;
>>>>>>> Stashed changes
    Delay(1000);
    Stage1GameWordLabel.Caption := '';
    Delay(300);
    Stage1GameWordLabel.Left := Stage1GameWordLabel.Left - 200;
    Stage1GameWordLabel.Font.Size := 10;
    Stage1GameWordLabel.Caption := '��������� ����� � ������� ��� �������� � ���� ����';
  End;

  if Unit2.PhaseCounter = 3 then
  Begin
    Unit2.Path := Unit2.Path_7;

    Stage1GameWordLabel.Caption := '';
    Stage1GameWordLabel.Left := 254;

<<<<<<< Updated upstream
<<<<<<< Updated upstream
    GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := GameWordLabel.Caption;
=======
    Stage1GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := Stage1GameWordLabel.Caption;
>>>>>>> Stashed changes
=======
    Stage1GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := Stage1GameWordLabel.Caption;
>>>>>>> Stashed changes
    Delay(1000);
    Stage1GameWordLabel.Caption := '';
    Delay(300);
    Stage1GameWordLabel.Left := Stage1GameWordLabel.Left - 200;
    Stage1GameWordLabel.Font.Size := 10;
    Stage1GameWordLabel.Caption := '��������� ����� � ������� ��� �������� � ���� ����';
  End;

  if Unit2.PhaseCounter = 4 then
  Begin
    Unit2.Path := Unit2.Path_8;

    Stage1GameWordLabel.Caption := '';
    Stage1GameWordLabel.Left := 254;

<<<<<<< Updated upstream
<<<<<<< Updated upstream
    GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := GameWordLabel.Caption;
=======
    Stage1GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := Stage1GameWordLabel.Caption;
>>>>>>> Stashed changes
=======
    Stage1GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := Stage1GameWordLabel.Caption;
>>>>>>> Stashed changes
    Delay(1000);
    Stage1GameWordLabel.Caption := '';
    Delay(300);
    Stage1GameWordLabel.Left := Stage1GameWordLabel.Left - 200;
    Stage1GameWordLabel.Font.Size := 10;
    Stage1GameWordLabel.Caption := '��������� ����� � ������� ��� �������� � ���� ����';
  End;

  if Unit2.PhaseCounter = 5 then
  Begin
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    EnterWord.Enabled := False;
    Application.MessageBox('����������� � �������! �� ������ ������ ����. ��������� � ����������', '������ � ������ �����!');
=======
=======
>>>>>>> Stashed changes
    Stage1EnterWord.Enabled := False;
    Application.MessageBox('����������� � �������! �� ������ ������ ����. ��������� � ����������', '������ � ������ �����!');

    Unit2.StageCounter := 2;
    Unit2.PhaseCounter := 1;
    FirstStage.TabVisible := False;
    FirstStage.Enabled := False;
    SecondStage.TabVisible := True;
    SecondStage.Enabled := True;
    Stage2ConfirmWordsButton.Default := True;
    Stage2GameTimer.Enabled := True;
    Stage2GameWordsLabel.Visible := True;
  End;
end;

procedure TForm2.Stage2ConfirmWordsButtonClick(Sender: TObject);
Var
  IsWordsCorrect: Boolean;
  PlayerWords: TArrStr;
  I: Integer;
begin
  Stage2ConfirmWordsButton.Enabled := False;
  SetLength(PlayerWords, Length(Unit2.GameWords));
  for I := Low(Unit2.GameWords) to High(Unit2.GameWords) - 1 do
  Begin
    PlayerWords[I] := Form2.Stage2MemoForWords.Lines[I];
  End;

  IsWordsCorrect := CompareWordsStage2(PlayerWords, Path);
  if IsWordsCorrect then
  Begin
    Stage2ResultLabel.Visible := True;
    Stage2ResultLabel.Font.Color := clGreen;
    Stage2ResultLabel.Left := 358;
    Stage2ResultLabel.Caption := '���������� �����!';

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
    Stage2ResultLabel.Left := 348;
    Stage2ResultLabel.Caption := '������������ �����!';
  End;

  Delay(500);
  Form2.Stage2MemoForWords.Clear;
  Stage2ResultLabel.Caption := '';
  Stage2ResultLabel.Left := 288;

  Stage2GameTimer.Enabled := True;
end;

procedure TForm2.Stage2GameTimerTimer(Sender: TObject);
Var
  GameString: String;
  I: Integer;
begin
  Stage2GameTimer.Enabled := False;
  Unit2.Path := Unit2.Path_Stage2;

  if Unit2.PhaseCounter = 1 then
  Begin
    Stage2GameWordsLabel.Caption := '';
    Stage2GameWordsLabel.Left := 120;
    GetGameWordsFromFileStage2(Unit2.Path);

    for I := Low(Unit2.GameWords) to High(Unit2.GameWords) do
      GameString := GameString + Unit2.GameWords[I] + ' ';
    Stage2GameWordsLabel.Caption := GameString;

    Delay(1000);
    Stage2GameWordsLabel.Caption := '';
    Delay(300);
    Stage2GameWordsLabel.Left := 64;
    Stage2GameWordsLabel.Font.Size := 9;
    Stage2GameWordsLabel.Caption := '��������� ����� � ������� �� ��� � ���� ����. ������� �� �����.';
  End;
end;

procedure TForm2.Stage2MemoForWordsChange(Sender: TObject);
begin
  If(Stage2MemoForWords.Lines[0] <> '') then
  Begin
    Stage2ConfirmWordsButton.Enabled := True;
  End
  Else
  Begin
    Stage2ConfirmWordsButton.Enabled := False;
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
  End;
end;

end.
